vignette_path <- function(name) {
  path <- system.file("vignettes", name, package = utils::packageName())
  if (path != "") {
    return(path)
  }
  path <- system.file("doc", name, package = utils::packageName())
  if (path != "") {
    return(path)
  }

  abort(paste0("Can't find vignette `", name, "`."))
}

local_methods <- function(..., .frame = rlang::caller_env()) {
  rlang::local_bindings(..., .env = rlang::global_env(), .frame = .frame)
}

render_galley <- function(name) {
  path <- tempfile(fileext = ".md")

  out <- evaluate::evaluate(quote(
    rmarkdown::render(
      vignette_path(name),
      output_file = path,
      output_format = rmarkdown::md_document(preserve_yaml = TRUE)
    )
  ))

  if (!file.exists(path)) {
    my_replay <- function(x) UseMethod("my_replay")

    my_replay_message <- function(x) evaluate::replay(conditionMessage(x))

    local_methods(
      my_replay.default = function(x) evaluate::replay(x),
      my_replay.message = my_replay_message,
      my_replay.warning = my_replay_message,
      my_replay.error = my_replay_message
    )
    writeLines("")
    lapply(out, my_replay)
    writeLines("")
    rlang::abort(paste0("Error rendering ", name))
  }

  path
}

test_galley <- function(name) {
  rmd_name <- paste0(name, ".Rmd")
  md_name <- paste0(name, ".md")

  path <- render_galley(rmd_name)
  expect_snapshot_file(path, name = md_name, compare = compare_file_text)
}
