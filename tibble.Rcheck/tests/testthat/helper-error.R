get_defunct_error_class <- function() {
  "lifecycle_error_deprecated"
}

# Dummy to remind us to keep tests and verifications in sync
verify_errors <- identity

print_error <- function(expr) {
  print(expect_error(expr), backtrace = FALSE)
}
