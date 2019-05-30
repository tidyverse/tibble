get_defunct_error_class <- function() {
  if (getRversion() <= "3.2") {
    "simpleError"
  } else {
    "defunctError"
  }
}
