# output test

    Code
      # # Bullets
      bullets("header", c("item 1", "item 2"))
    Output
      [1] "header.\nx item 1.\nx item 2."
    Code
      bullets("header", LETTERS)
    Output
      [1] "header.\nx A.\nx B.\nx C.\nx D.\nx E.\nx F.\nx G.\nx H.\nx I.\nx J.\nx K.\nx L.\nx M.\nx N.\nx O.\nx P.\nx Q.\nx R.\nx S.\nx T.\nx U.\nx V.\nx W.\nx X.\nx Y.\nx Z."
    Code
      bullets("header", 1:6)
    Output
      [1] "header.\n* 1.\n* 2.\n* 3.\n* 4.\n* 5.\n* 6."
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

