#include <assert.h>
#include <inttypes.h>
#include <limits.h>
#include <stdint.h>
#include <string.h>
#include "tibble.h"

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

    PROTECT(dim = getAttrib(x, R_DimSymbol)); nprot++;
    if (dim == R_NilValue || XLENGTH(dim) != 2) {
        error("`x` is not a matrix");
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
        error("`x` is not a matrix");
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
    char *buf;
    int nprot = 0, ndigit;

    // check for column names, use them if present
    PROTECT(dimnames = getAttrib(x, R_DimNamesSymbol)); nprot++;
    if (TYPEOF(dimnames) == VECSXP && XLENGTH(dimnames) > 1) {
        colnames = VECTOR_ELT(dimnames, 1);
        if (TYPEOF(colnames) == STRSXP) {
            goto Return;
        }
    }

    // otherwise, allocate new names
    PROTECT(colnames = allocVector(STRSXP, ncol)); nprot++;

    // if we really wanted to save a few bytes:
    //
    //  ndigit = (ncol == 0) ? 1 : 1 + floor(log10((double)ncol));
    //
    // but there's no need to get fancy since log10(2^64) = 19.266
    ndigit = 20;
    buf = R_alloc(1 + ndigit + 1, 1); // V + (number) + NUL

    for (i = 0; i < ncol; i++) {
        sprintf(buf, "V%"PRIu64, (uint64_t)(i + 1));
        SET_STRING_ELT(colnames, i, mkCharCE(buf, CE_UTF8));
    }

Return:
    UNPROTECT(nprot);
    return colnames;
}

// don't use DATAPTR, it's not part of the public API
static void *get_data(SEXP x, SEXPTYPE type, size_t *widthptr)
{
    size_t width = 0;
    void *ptr = NULL;

    // use the cached value of the type rather than re-computing
    // (this might be an unnecessary optimization)
    assert(TYPEOF(x) == type);

    switch (type) {
    case LGLSXP:
        ptr = LOGICAL(x);
        width = sizeof(int);

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
        error("`x` has non-atomic type");
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
    src = get_data(x, type, &eltsize);
    colsize = nrow * eltsize;

    for (j = 0; j < ncol; j++) {
        SET_VECTOR_ELT(out, j, (col = allocVector(type, nrow)));
        dst = get_data(col, type, NULL);
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
        SET_VECTOR_ELT(out, j, (col = allocVector(STRSXP, nrow)));
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
        SET_VECTOR_ELT(out, j, (col = allocVector(VECSXP, nrow)));
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

SEXP tibble_matrixToDataFrame(SEXP x)
{
    SEXP out, names, cls, rn;
    R_xlen_t nrow = 0, ncol = 0;
    int nprot = 0;

    get_dim(x, &nrow, &ncol);
    PROTECT(out = allocVector(VECSXP, ncol)); nprot++;

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
        error("data type not handled") ;
        break;
    }

    copy_column_attributes(out, x, ncol);

    PROTECT(names = get_names(x, ncol)); nprot++;
    setAttrib(out, R_NamesSymbol, names);

    PROTECT(cls = allocVector(STRSXP, 3)); nprot++;
    SET_STRING_ELT(cls, 0, mkChar("tbl_df"));
    SET_STRING_ELT(cls, 1, mkChar("tbl"));
    SET_STRING_ELT(cls, 2, mkChar("data.frame"));
    setAttrib(out, R_ClassSymbol, cls);

    if (nrow <= INT_MAX) {
        PROTECT(rn = allocVector(INTSXP, 2)); nprot++;
        INTEGER(rn)[0] = NA_INTEGER;
        INTEGER(rn)[1] = -(int)nrow;
    } else {
        PROTECT(rn = allocVector(REALSXP, 2)); nprot++;
        REAL(rn)[0] = NA_REAL;
        REAL(rn)[1] = -(double)nrow;
    }
    setAttrib(out, R_RowNamesSymbol, rn);

    UNPROTECT(nprot);
    return out;
}
