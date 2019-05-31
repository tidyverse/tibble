get_defunct_error_class <- function() {
  if (getRversion() < "3.6") {
    "simpleError"
  } else {
    "defunctError"
  }
}
