#define R_NO_REMAP

#include <inttypes.h>
#include <limits.h>
#include <stdint.h>
#include <string.h>
#include "tibble.h"


/**
 * Maximum number of (base 10) digits in a non-negative R_xlen_t.
 *
 * 1 + floor(log10(2^64 - 1)) = 20
 */
#define XLEN_DIGIT_MAX 20


static SEXP pairlist_shallow_copy(SEXP p)
{
    SEXP attr, q, s;
    int nprot = 0;

    PROTECT(attr = Rf_cons(CAR(p), R_NilValue)); nprot++;
    q = attr;
    SET_TAG(q, TAG(p));
    p = CDR(p);

    while (!Rf_isNull(p)) {
        PROTECT(s = Rf_cons(CAR(p), R_NilValue)); nprot++;
        SETCDR(q, s);
        q = CDR(q);
        SET_TAG(q, TAG(p));
        p = CDR(p);
    }

    UNPROTECT(nprot);
    return attr ;
}

static void copy_attributes(SEXP out, SEXP data)
{
    SEXP att = ATTRIB(data);
    if (!Rf_isNull(att)){
        SET_ATTRIB(out, pairlist_shallow_copy(ATTRIB(data))) ;
    }
    SET_OBJECT(out, OBJECT(data));
    if (IS_S4_OBJECT(data)) {
        SET_S4_OBJECT(out);
    }
}

// same as copy_attributes but without names
static void copy_most_attributes(SEXP out, SEXP data)
{
    copy_attributes(out, data);
    Rf_setAttrib(out, R_NamesSymbol, R_NilValue);
}

static void get_dim(SEXP x, R_xlen_t *nrowptr, R_xlen_t *ncolptr)
{
    SEXP dim;
    R_xlen_t nrow = 0, ncol = 0;
    int nprot = 0;

    PROTECT(dim = Rf_getAttrib(x, R_DimSymbol)); nprot++;
    if (dim == R_NilValue || XLENGTH(dim) != 2) {
        Rf_error("`x` is not a matrix");
    }

    switch (TYPEOF(dim)) {
    case INTSXP:
        nrow = (R_xlen_t)INTEGER(dim)[0];
        ncol = (R_xlen_t)INTEGER(dim)[1];
        break;

    case REALSXP:
        nrow = (R_xlen_t)REAL(dim)[0];
        ncol = (R_xlen_t)REAL(dim)[1];
        break;

    default:
        Rf_error("`x` is not a matrix");
        break;
    }

    if (nrowptr) {
        *nrowptr = nrow;
    }
    if (ncolptr) {
        *ncolptr = ncol;
    }
    UNPROTECT(nprot);
}


static SEXP get_names(SEXP x, R_xlen_t ncol)
{
    SEXP dimnames, colnames;
    R_xlen_t i;
    char buf[XLEN_DIGIT_MAX + 2]; // V + (number) + NUL
    int nprot = 0, use_existing = 0;

    // check for column names, use them if present
    PROTECT(dimnames = Rf_getAttrib(x, R_DimNamesSymbol)); nprot++;
    if (TYPEOF(dimnames) == VECSXP && XLENGTH(dimnames) == 2) {
        colnames = VECTOR_ELT(dimnames, 1);
        if (TYPEOF(colnames) == STRSXP) {
            use_existing = 1;
        }
    }

    // otherwise, allocate new names
    if (!use_existing) {
        PROTECT(colnames = Rf_allocVector(STRSXP, ncol)); nprot++;

        for (i = 0; i < ncol; i++) {
            sprintf(buf, "V%"PRIu64, (uint64_t)(i + 1));
            SET_STRING_ELT(colnames, i, Rf_mkCharCE(buf, CE_UTF8));
        }
    }

    UNPROTECT(nprot);
    return colnames;
}

static SEXP get_rownames(SEXP x, R_xlen_t nrow)
{
    SEXP dimnames, rownames;
    int nprot = 0, use_existing = 0;

    // check for row names, use them if present
    PROTECT(dimnames = Rf_getAttrib(x, R_DimNamesSymbol)); nprot++;
    if (TYPEOF(dimnames) == VECSXP && XLENGTH(dimnames) == 2) {
        rownames = VECTOR_ELT(dimnames, 0);
        if (TYPEOF(rownames) == STRSXP) {
            use_existing = 1;
        }
    }

    // otherwise, allocate new row names attribute
    if (!use_existing) {
        if (nrow <= INT_MAX) {
            PROTECT(rownames = Rf_allocVector(INTSXP, 2)); nprot++;
            INTEGER(rownames)[0] = NA_INTEGER;
            INTEGER(rownames)[1] = -(int)nrow;
        } else {
            PROTECT(rownames = Rf_allocVector(REALSXP, 2)); nprot++;
            REAL(rownames)[0] = NA_REAL;
            REAL(rownames)[1] = -(double)nrow;
        }
    }

    UNPROTECT(nprot);
    return rownames;
}

// don't use DATAPTR, it's not part of the public API
static void *get_data(SEXP x, size_t *widthptr)
{
    size_t width = 0;
    void *ptr = NULL;

    switch (TYPEOF(x)) {
    case LGLSXP:
        ptr = LOGICAL(x);
        width = sizeof(int);
        break;

    case INTSXP:
        ptr = INTEGER(x);
        width = sizeof(int);
        break;

    case REALSXP:
        ptr = REAL(x);
        width = sizeof(double);
        break;

    case CPLXSXP:
        ptr = COMPLEX(x);
        width = sizeof(Rcomplex);
        break;

    default:
        Rf_error("`x` has non-atomic type");
        break;
    }

    if (widthptr) {
        *widthptr = width;
    }
    return ptr;
}

static void copy_columns_atomic(SEXP out, SEXP x, R_xlen_t nrow, R_xlen_t ncol)
{
    SEXP col;
    SEXPTYPE type;
    R_xlen_t j;
    size_t colsize, eltsize;
    const char *src;
    char *dst;

    type = TYPEOF(x);
    src = get_data(x, &eltsize);
    colsize = nrow * eltsize;

    for (j = 0; j < ncol; j++) {
        SET_VECTOR_ELT(out, j, (col = Rf_allocVector(type, nrow)));
        dst = get_data(col, NULL);
        memcpy(dst, src, colsize);
        src += colsize;
    }
}

static void copy_columns_str(SEXP out, SEXP x, R_xlen_t nrow, R_xlen_t ncol)
{
    SEXP col, elt;
    R_xlen_t i, j, src;
        
    src = 0;
    for (j = 0; j < ncol; j++) {
        SET_VECTOR_ELT(out, j, (col = Rf_allocVector(STRSXP, nrow)));
        for (i = 0; i < nrow; i++) {
            elt = STRING_ELT(x, src);
            SET_STRING_ELT(col, i, elt);
            src++;
        }
    }
}

static void copy_columns_vec(SEXP out, SEXP x, R_xlen_t nrow, R_xlen_t ncol)
{
    SEXP col, elt;
    R_xlen_t i, j, src;
        
    src = 0;
    for (j = 0; j < ncol; j++) {
        SET_VECTOR_ELT(out, j, (col = Rf_allocVector(VECSXP, nrow)));
        for (i = 0; i < nrow; i++) {
            elt = VECTOR_ELT(x, src);
            SET_VECTOR_ELT(col, i, elt);
            src++;
        }
    }
}

static void copy_column_attributes(SEXP out, SEXP x, R_xlen_t ncol)
{
    SEXP col;
    R_xlen_t j;

    for (j = 0; j < ncol; j++) {
        col = VECTOR_ELT(out, j);
        copy_most_attributes(col, x);
        Rf_setAttrib(col, R_DimSymbol, R_NilValue);
    }
}

static SEXP get_class(void)
{
    SEXP cls;

    PROTECT(cls = Rf_allocVector(STRSXP, 3));
    SET_STRING_ELT(cls, 0, Rf_mkChar("tbl_df"));
    SET_STRING_ELT(cls, 1, Rf_mkChar("tbl"));
    SET_STRING_ELT(cls, 2, Rf_mkChar("data.frame"));
    UNPROTECT(1);

    return cls;
}

SEXP tibble_matrixToDataFrame(SEXP x)
{
    SEXP out;
    R_xlen_t nrow = 0, ncol = 0;
    int nprot = 0;

    get_dim(x, &nrow, &ncol);
    PROTECT(out = Rf_allocVector(VECSXP, ncol)); nprot++;

    switch (TYPEOF(x)) {
    case LGLSXP:
    case INTSXP:
    case REALSXP:
    case CPLXSXP:
        copy_columns_atomic(out, x, nrow, ncol);
        break;

    case STRSXP:
        copy_columns_str(out, x, nrow, ncol);
        break;

    case VECSXP:
        copy_columns_vec(out, x, nrow, ncol);
        break;

    default:
        Rf_error("data type not handled") ;
        break;
    }

    copy_column_attributes(out, x, ncol);

    Rf_setAttrib(out, R_NamesSymbol, get_names(x, ncol));
    Rf_setAttrib(out, R_RowNamesSymbol, get_rownames(x, nrow));
    Rf_setAttrib(out, R_ClassSymbol, get_class());

    UNPROTECT(nprot);
    return out;
}
