context("repair_names")

test_that("repair column names when none are provided", {
    dat <- as_data_frame(diag(3))
    colnames(dat) <- NULL

    ## ensure we start with a "bad" state
    expect_true( is.null(colnames(dat)) )

    fixed_dat <- repair_names(dat)
    fixed_names <- colnames(fixed_dat)
    ## no empty names
    expect_false( any(sapply(fixed_names, is.null)) )
    ## no repeats
    expect_false( any(table(fixed_names) > 1) )
})

test_that("repair column names when some are provided", {
    dat <- as_data_frame(diag(3))
    colnames(dat)[2] <- NA

    ## ensure we start with a "bad" state
    expect_true( any(sapply(colnames(dat), is.na)) )

    fixed_dat <- repair_names(dat)
    fixed_names <- colnames(fixed_dat)
    ## no empty names
    expect_false(any(sapply(fixed_names, is.null)) )
    ## no repeats
    expect_false(any(table(fixed_names) > 1))

    ## ensure all valid column names are retained
    expect_equal( length(setdiff(Filter(Negate(is.na), colnames(dat)), fixed_names)), 0 )
})

test_that("repair column names with some repeats", {
    dat <- as_data_frame(diag(3))
    colnames(dat) <- c('a', 'a', 'b')

    ## ensure we start with a "bad" state
    expect_true( any(table(colnames(dat)) > 1) )

    fixed_dat <- repair_names(dat)
    fixed_names <- colnames(fixed_dat)
    ## no empty names
    expect_false(any(sapply(fixed_names, is.null)) )
    ## no repeats
    expect_false(any(table(fixed_names) > 1))

    ## ensure all valid column names are retained
    expect_equal( length(setdiff(Filter(Negate(is.na), colnames(dat)), fixed_names)), 0 )
})
