# MeSH.Vvi.eg.db

Version: 1.10.0

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmpMVP4ky/Rd2pdf352b43f77844'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 376.7Mb
      sub-directories of 1Mb or more:
        extdata  376.6Mb
    ```

## Installation

### Devel

```
* installing *source* package ‘MeSH.Vvi.eg.db’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (MeSH.Vvi.eg.db)

```
### CRAN

```
* installing *source* package ‘MeSH.Vvi.eg.db’ ...
** R
** inst
Warning in file.append(to[okay], from[okay]) :
  write error during file append
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
Warning in close.connection(file) :
  Problem closing connection:  No space left on device
Warning in file(file.path(outman, "00Index.html"), "wt") :
  cannot open file '/tmp/RtmpcwuZam/filefdc67f7b3b37/MeSH.Vvi.eg.db.Rcheck/MeSH.Vvi.eg.db/html/00Index.html': No such file or directory
Error in file(file.path(outman, "00Index.html"), "wt") : 
  cannot open the connection
6: traceback(1)
5: file(file.path(outman, "00Index.html"), "wt")
4: .writePkgIndices(pkg_dir, instdir)
3: do_install_source(pkg_name, instdir, pkg, desc)
2: do_install(pkg)
1: tools:::.install_packages()

```
