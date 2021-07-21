# output test

    Code
      # # Problems
      writeLines(problems("header", c("item 1", "item 2")))
    Output
      header.
      x item 1.
      x item 2.
    Code
      writeLines(problems("header", LETTERS))
    Output
      header.
      x A.
      x B.
      x C.
      x D.
      x E.
      x ... and 21 more problems.
    Code
      writeLines(problems("header", 1:6))
    Output
      header.
      x 1.
      x 2.
      x 3.
      x 4.
      x 5.
      x ... and 1 more problem.
    Code
      # # Bullets
      writeLines(bullets("header", c("item 1", "item 2")))
    Output
      header.
      x item 1.
      x item 2.
    Code
      writeLines(bullets("header", LETTERS))
    Output
      header.
      x A.
      x B.
      x C.
      x D.
      x E.
      x F.
      x G.
      x H.
      x I.
      x J.
      x K.
      x L.
      x M.
      x N.
      x O.
      x P.
      x Q.
      x R.
      x S.
      x T.
      x U.
      x V.
      x W.
      x X.
      x Y.
      x Z.
    Code
      writeLines(bullets("header", 1:6))
    Output
      header.
      * 1.
      * 2.
      * 3.
      * 4.
      * 5.
      * 6.
    Code
      # # Commas
      commas("1")
    Output
      [1] "1"
    Code
      commas(letters[2:4])
    Output
      [1] "b, c, and d"
    Code
      commas(LETTERS)
    Output
      [1] "A, B, C, D, E, and 21 more"

