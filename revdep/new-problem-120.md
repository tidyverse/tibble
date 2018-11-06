# protViz

Version: 0.3.1

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmppnDRAH/Rd2pdf90002c27fb0d'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        data   2.1Mb
        libs   3.4Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘XML’
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error in re-building vignettes:
      ...
    code for methods in class "Rcpp_Fasta" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_Fasta" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    Warning in system2(command, args, env = env, stdout = outfile, stderr = errfile,  :
      error in running command
    Warning in system2(command, args, env = env, stdout = outfile, stderr = errfile,  :
      error in running command
    Error in texi2dvi(file = file, pdf = TRUE, clean = clean, quiet = quiet,  : 
      Running 'texi2dvi' on 'PTM_MarkerFinder.tex' failed.
    Messages:
    sh: 1: /usr/bin/texi2dvi: not found
    Calls: buildVignettes -> texi2pdf -> texi2dvi
    Execution halted
    ```

## Installation

### Devel

```
* installing *source* package ‘protViz’ ...
** package ‘protViz’ successfully unpacked and MD5 sums checked
** libs
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdfc2052fdf9/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c findNN.c -o findNN.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdfc2052fdf9/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c protViz_init.c -o protViz_init.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdfc2052fdf9/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c computeFragmentIons.c -o computeFragmentIons.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdfc2052fdf9/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c computeParentIonMass.c -o computeParentIonMass.o
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdfc2052fdf9/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c findNN_.cpp -o findNN_.o
Compiling with: 

