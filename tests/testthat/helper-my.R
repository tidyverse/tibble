mychr <- function(x) {
  structure(x, class = c("mychr", "character"))
}
vec_ptype2.mychr.character <- function(x, y, ...) {
  x
}
vec_cast.character.mychr <- function(x, to, ...) {
  unclass(x)
}

# Explicit method required for R CMD check:
vctrs::s3_register("vctrs::vec_ptype2", "mychr.character", vec_ptype2.mychr.character)
vctrs::s3_register("vctrs::vec_cast", "character.mychr", vec_cast.character.mychr)

myint <- function(x) {
  structure(x, class = c("myint", "integer"))
}
vec_ptype2.myint.integer <- function(x, y, ...) {
  x
}
vec_cast.integer.myint <- function(x, to, ...) {
  as.integer(unclass(x))
}

# Explicit method required for R CMD check:
vctrs::s3_register("vctrs::vec_ptype2", "myint.integer", vec_ptype2.myint.integer)
vctrs::s3_register("vctrs::vec_cast", "integer.myint", vec_cast.integer.myint)

mylgl <- function(x) {
  structure(x, class = c("mylgl", "logical"))
}
vec_ptype2.mylgl.logical <- function(x, y, ...) {
  x
}
vec_cast.logical.mylgl <- function(x, to, ...) {
  unclass(x)
}

# Explicit method required for R CMD check:
vctrs::s3_register("vctrs::vec_ptype2", "mylgl.logical", vec_ptype2.mylgl.logical)
vctrs::s3_register("vctrs::vec_cast", "logical.mylgl", vec_cast.logical.mylgl)
