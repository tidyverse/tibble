# petrinetR

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: create_PN
    > ### Title: Create Petri Net
    > ### Aliases: create_PN
    > 
    > ### ** Examples
    > 
    > 
    > create_PN("place_1",
    + 			"transition_1",
    + 			data.frame(from = "place_1",to = "transition_1"),
    + 			marking = "place_1")
    Marking:  place_1 
    Enabled transition
                id enabled
    1 transition_1    TRUE
    Warning: Column `from`/`id` joining factor and character vector, coercing into character vector
    Warning: Column `to`/`id` joining factor and character vector, coercing into character vector
    Error: Columns 1, 2 must be named.
    Execution halted
    ```

