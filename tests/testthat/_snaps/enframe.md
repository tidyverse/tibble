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
      vec_names(enframe(Titanic)$value)
    Output
      NULL
    Code
      enframe(Titanic)$value
    Output
      , , Age = Child, Survived = No
      
            Sex
      Class  Male Female
        [1,]    0      0
        [2,]    0      0
        [3,]   35     17
        [4,]    0      0
      
      , , Age = Adult, Survived = No
      
            Sex
      Class  Male Female
        [1,]  118      4
        [2,]  154     13
        [3,]  387     89
        [4,]  670      3
      
      , , Age = Child, Survived = Yes
      
            Sex
      Class  Male Female
        [1,]    5      1
        [2,]   11     13
        [3,]   13     14
        [4,]    0      0
      
      , , Age = Adult, Survived = Yes
      
            Sex
      Class  Male Female
        [1,]   57    140
        [2,]   14     80
        [3,]   75     76
        [4,]  192     20
      

