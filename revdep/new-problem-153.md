# rGADEM

Version: 2.28.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    7f13a0063000-7f13a035d000 r-xp 00000000 08:01 1282095                    /usr/lib/R/lib/libR.so
    7f13a035d000-7f13a055d000 ---p 002fa000 08:01 1282095                    /usr/lib/R/lib/libR.so
    7f13a055d000-7f13a057a000 r--p 002fa000 08:01 1282095                    /usr/lib/R/lib/libR.so
    7f13a057a000-7f13a0585000 rw-p 00317000 08:01 1282095                    /usr/lib/R/lib/libR.so
    7f13a0585000-7f13a06d7000 rw-p 00000000 00:00 0 
    7f13a06d7000-7f13a06fd000 r-xp 00000000 08:01 1965                       /lib/x86_64-linux-gnu/ld-2.23.so
    7f13a0786000-7f13a0796000 rwxp 00000000 00:00 0 
    7f13a0796000-7f13a07f7000 rw-p 00000000 00:00 0 
    7f13a0878000-7f13a08e4000 rw-p 00000000 00:00 0 
    7f13a08f2000-7f13a08f3000 rw-p 00000000 00:00 0 
    7f13a08f3000-7f13a08f4000 r--p 00000000 08:01 1283632                    /usr/lib/R/library/translations/en/LC_MESSAGES/R.mo
    7f13a08f4000-7f13a08fb000 r--s 00000000 08:01 24720                      /usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache
    7f13a08fb000-7f13a08fc000 rw-p 00000000 00:00 0 
    7f13a08fc000-7f13a08fd000 r--p 00025000 08:01 1965                       /lib/x86_64-linux-gnu/ld-2.23.so
    7f13a08fd000-7f13a08fe000 rw-p 00026000 08:01 1965                       /lib/x86_64-linux-gnu/ld-2.23.so
    7f13a08fe000-7f13a08ff000 rw-p 00000000 00:00 0 
    7ffcc8f0c000-7ffcc8f55000 rw-p 00000000 00:00 0                          [stack]
    7ffcc8ff2000-7ffcc8ff5000 r--p 00000000 00:00 0                          [vvar]
    7ffcc8ff5000-7ffcc8ff7000 r-xp 00000000 00:00 0                          [vdso]
    ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]
    Aborted (core dumped)
    ```

