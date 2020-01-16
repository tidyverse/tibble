get_defunct_error_class <- function() {
  if (getRversion() < "3.6") {
    "simpleError"
  } else {
    "defunctError"
  }
}

# Dummy to remind us to keep tests and verifications in sync
verify_errors <- identity
