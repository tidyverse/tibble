# output test

    Code
      enframe(1:3, value = NULL)
    Error <tibble_error_enframe_value_null>
      `value` can't be NULL.
    Code
      nrow(enframe(Titanic))
    Output
      [1] 4
    Code
      enframe(Titanic)$value
    Output
      , , Age = Child, Survived = No
      
            Sex
      Class  Male Female
        1st     0      0
        2nd     0      0
        3rd    35     17
        Crew    0      0
      
      , , Age = Adult, Survived = No
      
            Sex
      Class  Male Female
        1st   118      4
        2nd   154     13
        3rd   387     89
        Crew  670      3
      
      , , Age = Child, Survived = Yes
      
            Sex
      Class  Male Female
        1st     5      1
        2nd    11     13
        3rd    13     14
        Crew    0      0
      
      , , Age = Adult, Survived = Yes
      
            Sex
      Class  Male Female
        1st    57    140
        2nd    14     80
        3rd    75     76
        Crew  192     20
      

