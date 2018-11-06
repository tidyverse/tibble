# PCpheno

Version: 1.42.0

## Newly broken

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Fatal error: cannot create 'R_TempDir'
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    Fatal error: cannot create 'R_TempDir'
    ```

*   checking loading without being on the library search path ... WARNING
    ```
    Error: package ‘Category’ required by ‘PCpheno’ could not be found
    Execution halted
    
    It looks like this package has a loading problem when not on .libPaths:
    see the messages for details.
    ```

