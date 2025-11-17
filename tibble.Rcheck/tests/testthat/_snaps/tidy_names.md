# unnamed input gives uniquely named output

    Code
      out <- set_tidy_names(1:3)
    Message
      New names:
       -> ..1
       -> ..2
       -> ..3

# messages by default

    Code
      set_tidy_names(set_names(1, ""))
    Message
      New names:
       -> ..1
    Output
      ..1 
        1 

# dupes

    Code
      names <- tidy_names(c("a", "b", "a", "c", "b"))
    Message
      New names:
      a -> a..1
      b -> b..2
      a -> a..3
      b -> b..5

# empty

    Code
      names <- tidy_names("")
    Message
      New names:
       -> ..1

# NA

    Code
      names <- tidy_names(NA_character_)
    Message
      New names:
       -> ..1

# corner case

    Code
      expect_equal(tidy_names(c("a..2", "a")), c("a..2", "a"))
      expect_equal(tidy_names(c("a..3", "a", "a")), c("a..1", "a..2", "a..3"))
    Message
      New names:
      a..3 -> a..1
      a -> a..2
      a -> a..3
    Code
      expect_equal(tidy_names(c("a..2", "a", "a")), c("a..1", "a..2", "a..3"))
    Message
      New names:
      a..2 -> a..1
      a -> a..2
      a -> a..3
    Code
      expect_equal(tidy_names(c("a..2", "a..2", "a..2")), c("a..1", "a..2", "a..3"))
    Message
      New names:
      a..2 -> a..1
      a..2 -> a..3

# syntactic

    Code
      names <- tidy_names(c("a b"), syntactic = TRUE)
    Message
      New names:
      a b -> a.b

# some syntactic + message (#260)

    Code
      names <- tidy_names(c("a b", "c"), syntactic = TRUE)
    Message
      New names:
      a b -> a.b

