# Keep in sync with generics.R in dplyr
# Imported from 3de24a738243a3d07c87b3f4e4afa5f6b02ff561

tibble_row_slice <- function(data, i, ...) {
  if (!is.numeric(i) && !is.logical(i)) {
    abort("`i` must be a numeric or logical vector.")
  }

  tibble_reconstruct(vec_slice(remove_rownames(data), i), data)
}

tibble_col_modify <- function(data, cols) {
  # Must be implemented from first principles to avoiding edge cases in
  # [.data.frame and [.tibble (2.1.3 and earlier).

  # Apply tidyverse recycling rules
  cols <- vec_recycle_common(!!!cols, .size = nrow(data))

  # Transform to list to avoid stripping inner names with `[[<-`
  out <- as.list(dplyr_vec_data(data))

  nms <- as_utf8_character(names2(cols))
  names(out) <- as_utf8_character(names2(out))

  for (i in seq_along(cols)) {
    nm <- nms[[i]]
    out[[nm]] <- cols[[i]]
  }

  # Transform back to data frame before reconstruction
  row_names <- .row_names_info(data, type = 0L)
  out <- new_data_frame(out, n = nrow(data), row.names = row_names)

  tibble_reconstruct(out, data)
}

tibble_reconstruct <- function(data, template) {
  # Strip attributes before dispatch to make it easier to implement
  # methods and prevent unexpected leaking of irrelevant attributes.
  data <- dplyr_new_data_frame(data)

  attrs <- attributes(template)
  attrs$names <- names(data)
  attrs$row.names <- .row_names_info(data, type = 0L)

  attributes(data) <- attrs
  data
}

# Until fixed upstream. `vec_data()` should not return lists from data
# frames.
dplyr_vec_data <- function(x) {
  out <- vec_data(x)

  if (is.data.frame(x)) {
    new_data_frame(out, n = nrow(x))
  } else {
    out
  }
}

# Until vctrs::new_data_frame() forwards row names automatically
dplyr_new_data_frame <- function(x = data.frame(),
                                 n = NULL,
                                 ...,
                                 row.names = NULL,
                                 class = NULL) {
  row.names <- row.names %||% .row_names_info(x, type = 0L)

  new_data_frame(
    x,
    n = n,
    ...,
    row.names = row.names,
    class = class
  )
}
