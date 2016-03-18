context("repair_names")

test_that("repair missing column names", {
  dat <- data.frame(a = 1, b = 2, c = 3)
  colnames(dat)[2] <- NA

  # ensure we start with a "bad" state
  expect_true(any(is.na(colnames(dat))))

  fixed_dat <- repair_names(dat)
  fixed_names <- colnames(fixed_dat)
  # no repeats
  expect_false(any(table(fixed_names) > 1))

  # ensure all valid column names are retained
  expect_equal(length(setdiff(Filter(function(a) ! (is.na(a) | a == ''),
                                     colnames(dat)),
                              fixed_names)), 0)
})

test_that("repair various name problems", {
  combos <- list(Null = NULL,
                 Empty = c('', '', ''),
                 Spaces = c('a', 'b', ' '),
                 EmptyWithNA = c('', NA, NA),
                 Dup1 = c('a', 'a', 'b'),
                 Evil1 = c('a', 'a ', 'a1'),
                 OneNA = c('a', 'b', NA),
                 Missing2 = c('', '', 'b'),
                 Vnames1 = c('V1', '', ''),
                 Vnames2 = c('V2', ' ', ''),
                 Vnames3 = c('V1', '', 'a'),
                 VnamesDup1 = c('V1', ' V1 ', 'c'),
                 VnamesDup2 = c(' V1', 'V1', '')
                 )
  for (combo_name in names(combos)) {
    dat <- data.frame(a = 1, b = 2, c = 3)
    colnames(dat) <- combos[[ combo_name ]]

    # ensure we start with a "bad" state
    old_names <- colnames(dat)
    expect_true(is.null(old_names) ||
                  any(table(old_names) > 1) ||
                  any(old_names == '' | is.na(old_names)) ||
                  any(grepl('^ +| +$', old_names)),
                info = combo_name)

    fixed_dat <- repair_names(dat)
    fixed_names <- colnames(fixed_dat)

    # no repeats
    expect_false(any(table(fixed_names) > 1), info = combo_name)

    # ensure all valid column names are retained
    if (! is.null(old_names)) {
      valid <- ! is.na(old_names) & old_names != '' &
        ! duplicated(old_names)
      expect_equal(fixed_names[valid], old_names[valid])
    }
  }
})

test_that("check pathological cases", {
  df <- data.frame()
  expect_identical(repair_names(df), df)
  df <- data.frame(row.names = 1:3)
  expect_identical(repair_names(df), df)
  l <- list(3, 4, 5)
  expect_identical(repair_names(l), setNames(l, paste0("V", 1:3)))
  l <- list(V = 3, W = 4, 5)
  expect_identical(repair_names(l), setNames(l, c("V", "W", "V1")))
})

test_that("check object class", {
  expect_equal(class(iris), class(repair_names(iris)))
  expect_equal(class(tbl_df(iris)), class(repair_names(tbl_df(iris))))
  expect_equal(class(repair_names(1:10)), "integer")
  expect_error(repair_names(cat), "non-vector")
})
