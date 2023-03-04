# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# beadplexr

<details>

* Version: 0.4.1
* GitHub: NA
* Source code: https://github.com/cran/beadplexr
* Date/Publication: 2022-03-05 13:50:02 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "beadplexr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/beadplexr/new/beadplexr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘beadplexr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘beadplexr’ version ‘0.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘cba_macsplex_example.Rmd’ using ‘UTF-8’... OK
  ‘legendplex_analysis.Rmd’ using ‘UTF-8’... OK
  ‘preparing_flow_data.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/beadplexr/old/beadplexr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘beadplexr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘beadplexr’ version ‘0.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘cba_macsplex_example.Rmd’ using ‘UTF-8’... OK
  ‘legendplex_analysis.Rmd’ using ‘UTF-8’... OK
  ‘preparing_flow_data.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# cinaR

<details>

* Version: 0.2.3
* GitHub: https://github.com/eonurk/cinaR
* Source code: https://github.com/cran/cinaR
* Date/Publication: 2022-05-18 14:00:09 UTC
* Number of recursive dependencies: 179

Run `revdepcheck::cloud_details(, "cinaR")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/cinaR/new/cinaR.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘cinaR/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘cinaR’ version ‘0.2.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ChIPseeker’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/cinaR/old/cinaR.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘cinaR/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘cinaR’ version ‘0.2.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ChIPseeker’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# ctsem

<details>

* Version: 3.7.2
* GitHub: https://github.com/cdriveraus/ctsem
* Source code: https://github.com/cran/ctsem
* Date/Publication: 2022-11-06 05:10:11 UTC
* Number of recursive dependencies: 135

Run `revdepcheck::cloud_details(, "ctsem")` for more info

</details>

## In both

*   checking whether package ‘ctsem’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ctsem/new/ctsem.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ctsem’ ...
** package ‘ctsem’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
"/opt/R/4.1.1/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/ctsm.stan
DIAGNOSTIC(S) FROM PARSER:
Info: integer division implicitly rounds to integer. Found int division: d * d - d / 2
 Positive values rounded down, negative values rounded up or down in platform-dependent way.

Wrote C++ file "stan_files/ctsm.cc"
...
 2340 |     T__ log_prob(std::vector<T__>& params_r__,
      |         ^~~~~~~~
stan_files/ctsm.hpp: In member function ‘T__ model_ctsm_namespace::model_ctsm::log_prob(std::vector<T_l>&, std::vector<int>&, std::ostream*) const [with bool propto__ = false; bool jacobian__ = false; T__ = double]’:
stan_files/ctsm.hpp:2340:9: note: variable tracking size limit exceeded with ‘-fvar-tracking-assignments’, retrying without
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.1.1/lib/R/etc/Makeconf:175: stan_files/ctsm.o] Error 1
rm stan_files/ctsm.cc
ERROR: compilation failed for package ‘ctsem’
* removing ‘/tmp/workdir/ctsem/new/ctsem.Rcheck/ctsem’


```
### CRAN

```
* installing *source* package ‘ctsem’ ...
** package ‘ctsem’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
"/opt/R/4.1.1/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/ctsm.stan
DIAGNOSTIC(S) FROM PARSER:
Info: integer division implicitly rounds to integer. Found int division: d * d - d / 2
 Positive values rounded down, negative values rounded up or down in platform-dependent way.

Wrote C++ file "stan_files/ctsm.cc"
...
 2340 |     T__ log_prob(std::vector<T__>& params_r__,
      |         ^~~~~~~~
stan_files/ctsm.hpp: In member function ‘T__ model_ctsm_namespace::model_ctsm::log_prob(std::vector<T_l>&, std::vector<int>&, std::ostream*) const [with bool propto__ = false; bool jacobian__ = false; T__ = double]’:
stan_files/ctsm.hpp:2340:9: note: variable tracking size limit exceeded with ‘-fvar-tracking-assignments’, retrying without
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.1.1/lib/R/etc/Makeconf:175: stan_files/ctsm.o] Error 1
rm stan_files/ctsm.cc
ERROR: compilation failed for package ‘ctsem’
* removing ‘/tmp/workdir/ctsem/old/ctsem.Rcheck/ctsem’


```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# FAMetA

<details>

* Version: 0.1.5
* GitHub: NA
* Source code: https://github.com/cran/FAMetA
* Date/Publication: 2023-01-11 09:33:11 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "FAMetA")` for more info

</details>

## In both

*   checking whether package ‘FAMetA’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/FAMetA/new/FAMetA.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘FAMetA’ ...
** package ‘FAMetA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘LipidMS’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘readMzXmlData’
Execution halted
ERROR: lazy loading failed for package ‘FAMetA’
* removing ‘/tmp/workdir/FAMetA/new/FAMetA.Rcheck/FAMetA’


```
### CRAN

```
* installing *source* package ‘FAMetA’ ...
** package ‘FAMetA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘LipidMS’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘readMzXmlData’
Execution halted
ERROR: lazy loading failed for package ‘FAMetA’
* removing ‘/tmp/workdir/FAMetA/old/FAMetA.Rcheck/FAMetA’


```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# genekitr

<details>

* Version: 1.1.0
* GitHub: https://github.com/GangLiLab/genekitr
* Source code: https://github.com/cran/genekitr
* Date/Publication: 2023-01-20 03:30:02 UTC
* Number of recursive dependencies: 200

Run `revdepcheck::cloud_details(, "genekitr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/genekitr/new/genekitr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘genekitr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘genekitr’ version ‘1.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/genekitr/old/genekitr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘genekitr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘genekitr’ version ‘1.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# ggPMX

<details>

* Version: 1.2.8
* GitHub: https://github.com/ggPMXdevelopment/ggPMX
* Source code: https://github.com/cran/ggPMX
* Date/Publication: 2022-06-17 23:10:02 UTC
* Number of recursive dependencies: 177

Run `revdepcheck::cloud_details(, "ggPMX")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ggPMX/new/ggPMX.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggPMX/DESCRIPTION’ ... OK
* this is package ‘ggPMX’ version ‘1.2.8’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  [ FAIL 1 | WARN 14 | SKIP 8 | PASS 327 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘ggPMX-guide.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/ggPMX/old/ggPMX.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggPMX/DESCRIPTION’ ... OK
* this is package ‘ggPMX’ version ‘1.2.8’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  [ FAIL 1 | WARN 14 | SKIP 8 | PASS 327 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘ggPMX-guide.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 2 NOTEs





```
# immcp

<details>

* Version: 1.0.3
* GitHub: https://github.com/YuanlongHu/immcp
* Source code: https://github.com/cran/immcp
* Date/Publication: 2022-05-12 05:50:02 UTC
* Number of recursive dependencies: 194

Run `revdepcheck::cloud_details(, "immcp")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/immcp/new/immcp.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘immcp/DESCRIPTION’ ... OK
* this is package ‘immcp’ version ‘1.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/immcp/old/immcp.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘immcp/DESCRIPTION’ ... OK
* this is package ‘immcp’ version ‘1.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# loon.tourr

<details>

* Version: 0.1.3
* GitHub: https://github.com/z267xu/loon.tourr
* Source code: https://github.com/cran/loon.tourr
* Date/Publication: 2021-10-27 14:10:05 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "loon.tourr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/loon.tourr/new/loon.tourr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.tourr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.tourr’ version ‘0.1.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'loon', 'loon.ggplot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/loon.tourr/old/loon.tourr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.tourr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.tourr’ version ‘0.1.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'loon', 'loon.ggplot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# nlmixr2rpt

<details>

* Version: 0.1.0
* GitHub: https://github.com/nlmixr2/nlmixr2rpt
* Source code: https://github.com/cran/nlmixr2rpt
* Date/Publication: 2022-12-05 10:40:02 UTC
* Number of recursive dependencies: 219

Run `revdepcheck::cloud_details(, "nlmixr2rpt")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/nlmixr2rpt/new/nlmixr2rpt.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘nlmixr2rpt/DESCRIPTION’ ... OK
* this is package ‘nlmixr2rpt’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'nlmixr2extra', 'xpose.nlmixr2'

Package suggested but not available for checking: ‘nlmixr2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/nlmixr2rpt/old/nlmixr2rpt.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘nlmixr2rpt/DESCRIPTION’ ... OK
* this is package ‘nlmixr2rpt’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'nlmixr2extra', 'xpose.nlmixr2'

Package suggested but not available for checking: ‘nlmixr2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# numbat

<details>

* Version: 1.2.2
* GitHub: https://github.com/kharchenkolab/numbat
* Source code: https://github.com/cran/numbat
* Date/Publication: 2023-02-14 18:20:02 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::cloud_details(, "numbat")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/numbat/new/numbat.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘numbat/DESCRIPTION’ ... OK
* this is package ‘numbat’ version ‘1.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'ggtree', 'scistreer'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/numbat/old/numbat.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘numbat/DESCRIPTION’ ... OK
* this is package ‘numbat’ version ‘1.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'ggtree', 'scistreer'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# OlinkAnalyze

<details>

* Version: 3.3.0
* GitHub: NA
* Source code: https://github.com/cran/OlinkAnalyze
* Date/Publication: 2023-01-24 21:50:02 UTC
* Number of recursive dependencies: 202

Run `revdepcheck::cloud_details(, "OlinkAnalyze")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/OlinkAnalyze/new/OlinkAnalyze.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘OlinkAnalyze/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘OlinkAnalyze’ version ‘3.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘Vignett.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/OlinkAnalyze/old/OlinkAnalyze.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘OlinkAnalyze/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘OlinkAnalyze’ version ‘3.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘Vignett.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# Platypus

<details>

* Version: 3.4.1
* GitHub: NA
* Source code: https://github.com/cran/Platypus
* Date/Publication: 2022-08-15 07:20:20 UTC
* Number of recursive dependencies: 356

Run `revdepcheck::cloud_details(, "Platypus")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Platypus/new/Platypus.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Platypus/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Platypus’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking package dependencies ... ERROR
Package required but not available: ‘ggtree’

Packages suggested but not available for checking:
  'Matrix.utils', 'monocle3', 'ProjecTILs', 'SeuratWrappers'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/Platypus/old/Platypus.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Platypus/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Platypus’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking package dependencies ... ERROR
Package required but not available: ‘ggtree’

Packages suggested but not available for checking:
  'Matrix.utils', 'monocle3', 'ProjecTILs', 'SeuratWrappers'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# RVA

<details>

* Version: 0.0.5
* GitHub: https://github.com/THERMOSTATS/RVA
* Source code: https://github.com/cran/RVA
* Date/Publication: 2021-11-01 21:40:02 UTC
* Number of recursive dependencies: 208

Run `revdepcheck::cloud_details(, "RVA")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/RVA/new/RVA.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RVA/DESCRIPTION’ ... OK
* this is package ‘RVA’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/RVA/old/RVA.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RVA/DESCRIPTION’ ... OK
* this is package ‘RVA’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# tinyarray

<details>

* Version: 2.2.7
* GitHub: https://github.com/xjsun1221/tinyarray
* Source code: https://github.com/cran/tinyarray
* Date/Publication: 2021-11-08 10:00:02 UTC
* Number of recursive dependencies: 228

Run `revdepcheck::cloud_details(, "tinyarray")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tinyarray/new/tinyarray.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tinyarray/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tinyarray’ version ‘2.2.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/tinyarray/old/tinyarray.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tinyarray/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tinyarray’ version ‘2.2.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# vivid

<details>

* Version: 0.2.5
* GitHub: NA
* Source code: https://github.com/cran/vivid
* Date/Publication: 2023-02-13 16:40:02 UTC
* Number of recursive dependencies: 206

Run `revdepcheck::cloud_details(, "vivid")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/vivid/new/vivid.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘vivid/DESCRIPTION’ ... OK
* this is package ‘vivid’ version ‘0.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘vivid.Rmd’ using ‘UTF-8’... OK
  ‘vividQStart.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/vivid/old/vivid.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘vivid/DESCRIPTION’ ... OK
* this is package ‘vivid’ version ‘0.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘vivid.Rmd’ using ‘UTF-8’... OK
  ‘vividQStart.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# xpose.nlmixr2

<details>

* Version: 0.4.0
* GitHub: NA
* Source code: https://github.com/cran/xpose.nlmixr2
* Date/Publication: 2022-06-08 09:10:02 UTC
* Number of recursive dependencies: 161

Run `revdepcheck::cloud_details(, "xpose.nlmixr2")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/xpose.nlmixr2/new/xpose.nlmixr2.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘xpose.nlmixr2/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘xpose.nlmixr2’ version ‘0.4.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘nlmixr2est’

Package suggested but not available for checking: ‘nlmixr2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/xpose.nlmixr2/old/xpose.nlmixr2.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘xpose.nlmixr2/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘xpose.nlmixr2’ version ‘0.4.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘nlmixr2est’

Package suggested but not available for checking: ‘nlmixr2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
