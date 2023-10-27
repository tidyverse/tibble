# beadplexr

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/beadplexr
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "beadplexr")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# bistablehistory

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/bistablehistory
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "bistablehistory")` for more info

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

* Version: 3.9.0
* GitHub: https://github.com/cdriveraus/ctsem
* Source code: https://github.com/cran/ctsem
* Date/Publication: 2023-09-14 09:50:02 UTC
* Number of recursive dependencies: 138

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
Info: Found int division at 'string', line 88, column 10 to column 17:
  (d * d - d) / 2
Values will be rounded towards zero. If rounding is not desired you can write
the division as
  (d * d - d) / 2.0
If rounding is intended please use the integer division operator %/%.
Info: Found int division at 'string', line 88, column 10 to column 17:
...
/opt/R/4.2.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/opt/R/4.2.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:132:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::Scalar = double]’
/opt/R/4.2.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:56:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_ctsm_namespace::model_ctsm; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/opt/R/4.2.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:10:   required from here
/opt/R/4.2.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:55:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__vector(2) double’} [-Wignored-attributes]
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.2.1/lib/R/etc/Makeconf:175: stanExports_ctsm.o] Error 1
ERROR: compilation failed for package ‘ctsem’
* removing ‘/tmp/workdir/ctsem/new/ctsem.Rcheck/ctsem’


```
### CRAN

```
* installing *source* package ‘ctsem’ ...
** package ‘ctsem’ successfully unpacked and MD5 sums checked
** using staged installation
Info: Found int division at 'string', line 88, column 10 to column 17:
  (d * d - d) / 2
Values will be rounded towards zero. If rounding is not desired you can write
the division as
  (d * d - d) / 2.0
If rounding is intended please use the integer division operator %/%.
Info: Found int division at 'string', line 88, column 10 to column 17:
...
/opt/R/4.2.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/opt/R/4.2.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:132:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::Scalar = double]’
/opt/R/4.2.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:56:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_ctsm_namespace::model_ctsm; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/opt/R/4.2.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:10:   required from here
/opt/R/4.2.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:55:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__vector(2) double’} [-Wignored-attributes]
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.2.1/lib/R/etc/Makeconf:175: stanExports_ctsm.o] Error 1
ERROR: compilation failed for package ‘ctsem’
* removing ‘/tmp/workdir/ctsem/old/ctsem.Rcheck/ctsem’


```
# loon.ggplot

<details>

* Version: 1.3.3
* GitHub: https://github.com/great-northern-diver/loon.ggplot
* Source code: https://github.com/cran/loon.ggplot
* Date/Publication: 2022-11-12 22:30:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "loon.ggplot")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/loon.ggplot/new/loon.ggplot.Rcheck’
* using R version 4.2.1 (2022-06-23)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.ggplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.ggplot’ version ‘1.3.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘loon’

Package suggested but not available for checking: ‘zenplots’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/loon.ggplot/old/loon.ggplot.Rcheck’
* using R version 4.2.1 (2022-06-23)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.ggplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.ggplot’ version ‘1.3.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘loon’

Package suggested but not available for checking: ‘zenplots’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# loon.tourr

<details>

* Version: 0.1.3
* GitHub: https://github.com/z267xu/loon.tourr
* Source code: https://github.com/cran/loon.tourr
* Date/Publication: 2021-10-27 14:10:05 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "loon.tourr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/loon.tourr/new/loon.tourr.Rcheck’
* using R version 4.2.1 (2022-06-23)
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
* using R version 4.2.1 (2022-06-23)
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
# profoc

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/profoc
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "profoc")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# staRdom

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/staRdom
* Number of recursive dependencies: 157

Run `revdepcheck::cloud_details(, "staRdom")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# tidyfit

<details>

* Version: 0.6.4
* GitHub: https://github.com/jpfitzinger/tidyfit
* Source code: https://github.com/cran/tidyfit
* Date/Publication: 2023-05-20 15:40:02 UTC
* Number of recursive dependencies: 167

Run `revdepcheck::cloud_details(, "tidyfit")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidyfit/new/tidyfit.Rcheck’
* using R version 4.2.1 (2022-06-23)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidyfit/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tidyfit’ version ‘0.6.4’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  ‘Flowchart.Rmd’ using ‘UTF-8’... OK
  ‘Predicting_Boston_House_Prices.Rmd’ using ‘UTF-8’... OK
  ‘Bootstrapping_Confidence_Intervals.Rmd’ using ‘UTF-8’... OK
  ‘Feature_Selection.Rmd’ using ‘UTF-8’... OK
  ‘Multinomial_Classification.Rmd’ using ‘UTF-8’... OK
  ‘Rolling_Window_Time_Series_Regression.Rmd’ using ‘UTF-8’... OK
  ‘Time-varying_parameters_vs_rolling_windows.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 ERRORs, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidyfit/old/tidyfit.Rcheck’
* using R version 4.2.1 (2022-06-23)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidyfit/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tidyfit’ version ‘0.6.4’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  ‘Flowchart.Rmd’ using ‘UTF-8’... OK
  ‘Predicting_Boston_House_Prices.Rmd’ using ‘UTF-8’... OK
  ‘Bootstrapping_Confidence_Intervals.Rmd’ using ‘UTF-8’... OK
  ‘Feature_Selection.Rmd’ using ‘UTF-8’... OK
  ‘Multinomial_Classification.Rmd’ using ‘UTF-8’... OK
  ‘Rolling_Window_Time_Series_Regression.Rmd’ using ‘UTF-8’... OK
  ‘Time-varying_parameters_vs_rolling_windows.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 ERRORs, 1 NOTE





```
# triptych

<details>

* Version: 0.1.2
* GitHub: https://github.com/aijordan/triptych
* Source code: https://github.com/cran/triptych
* Date/Publication: 2023-10-03 16:30:02 UTC
* Number of recursive dependencies: 66

Run `revdepcheck::cloud_details(, "triptych")` for more info

</details>

## In both

*   checking whether package ‘triptych’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/triptych/new/triptych.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘triptych’ ...
** package ‘triptych’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++2a -I"/opt/R/4.2.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.2.1/lib/R/site-library/cpp11/include' -I/usr/local/include   -fpic  -g -O2  -c cpp11.cpp -o cpp11.o
g++ -std=gnu++2a -I"/opt/R/4.2.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.2.1/lib/R/site-library/cpp11/include' -I/usr/local/include   -fpic  -g -O2  -c md.cpp -o md.o
In file included from md.cpp:2:
mdiag.h:4:10: fatal error: ranges: No such file or directory
    4 | #include <ranges>
      |          ^~~~~~~~
compilation terminated.
make: *** [/opt/R/4.2.1/lib/R/etc/Makeconf:177: md.o] Error 1
ERROR: compilation failed for package ‘triptych’
* removing ‘/tmp/workdir/triptych/new/triptych.Rcheck/triptych’


```
### CRAN

```
* installing *source* package ‘triptych’ ...
** package ‘triptych’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++2a -I"/opt/R/4.2.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.2.1/lib/R/site-library/cpp11/include' -I/usr/local/include   -fpic  -g -O2  -c cpp11.cpp -o cpp11.o
g++ -std=gnu++2a -I"/opt/R/4.2.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.2.1/lib/R/site-library/cpp11/include' -I/usr/local/include   -fpic  -g -O2  -c md.cpp -o md.o
In file included from md.cpp:2:
mdiag.h:4:10: fatal error: ranges: No such file or directory
    4 | #include <ranges>
      |          ^~~~~~~~
compilation terminated.
make: *** [/opt/R/4.2.1/lib/R/etc/Makeconf:177: md.o] Error 1
ERROR: compilation failed for package ‘triptych’
* removing ‘/tmp/workdir/triptych/old/triptych.Rcheck/triptych’


```
