get_lang_strings <- function() {
  lang_strings <- c(
    de = "Gl\u00fcck",
    cn = "\u5e78\u798f",
    ru = "\u0441\u0447\u0430\u0441\u0442\u044c\u0435",
    ko = "\ud589\ubcf5"
  )

  native_lang_strings <- enc2native(lang_strings)

  same <- (lang_strings == native_lang_strings)

  list(
    same = lang_strings[same],
    different = lang_strings[!same]
  )
}

get_native_lang_string <- function() {
  lang_strings <- get_lang_strings()
  if (length(lang_strings$same) == 0) {
    testthat::skip("No native language string available")
  }
  lang_strings$same[[1L]]
}

get_alien_lang_string <- function() {
  lang_strings <- get_lang_strings()
  if (length(lang_strings$different) == 0) {
    testthat::skip("No alien language string available")
  }
  lang_strings$different[[1L]]
}

with_non_utf8_locale <- function(code) {
  old_locale <- set_non_utf8_locale()
  on.exit(set_locale(old_locale), add = TRUE)
  code
}

set_non_utf8_locale <- function() {
  if (.Platform$OS.type == "windows") {
    return(NULL)
  }
  tryCatch(
    locale <- set_locale("en_US.ISO88591"),
    warning = function(e) {
      testthat::skip("Cannot set latin-1 locale")
    }
  )
  locale
}

set_locale <- function(locale) {
  if (is.null(locale)) {
    return(NULL)
  }
  locale <- Sys.getlocale("LC_CTYPE")
  Sys.setlocale("LC_CTYPE", locale)
  locale
}

skip_on_non_utf8_locale <- function() {
  if (!l10n_info()$"UTF-8") {
    skip("Non-UTF-8 locale")
  }
}
