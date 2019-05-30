get_defunct_error_class <- function() {
  if (getRversion() < "3.3") {
    "simpleError"
  } else {
    "defunctError"
  }
}
