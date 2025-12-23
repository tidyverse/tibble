# Format a numeric vector

**\[experimental\]**

Constructs a numeric vector that can be formatted with predefined
significant digits, or with a maximum or fixed number of digits after
the decimal point. Scaling is supported, as well as forcing a decimal,
scientific or engineering notation. If a label is given, it is shown in
the header of a column.

The formatting is applied when the vector is printed or formatted, and
also in a tibble column. The formatting annotation and the class
survives most arithmetic transformations, the most notable exceptions
are [`var()`](https://rdrr.io/r/stats/cor.html) and
[`sd()`](https://rdrr.io/r/stats/sd.html).

`set_num_opts()` adds formatting options to an arbitrary numeric vector,
useful for composing with other types.

## Usage

``` r
num(
  x,
  ...,
  sigfig = NULL,
  digits = NULL,
  label = NULL,
  scale = NULL,
  notation = c("fit", "dec", "sci", "eng", "si"),
  fixed_exponent = NULL,
  extra_sigfig = NULL
)

set_num_opts(
  x,
  ...,
  sigfig = NULL,
  digits = NULL,
  label = NULL,
  scale = NULL,
  notation = c("fit", "dec", "sci", "eng", "si"),
  fixed_exponent = NULL,
  extra_sigfig = NULL
)
```

## Arguments

- x:

  A numeric vector.

- ...:

  These dots are for future extensions and must be empty.

- sigfig:

  Define the number of significant digits to show. Must be one or
  greater. The `"pillar.sigfig"`
  [option](https://pillar.r-lib.org/reference/pillar_options.html) is
  not consulted. Can't be combined with `digits`.

- digits:

  Number of digits after the decimal points to show. Positive numbers
  specify the exact number of digits to show. Negative numbers specify
  (after negation) the maximum number of digits to show. With
  `digits = 2`, the numbers 1.2 and 1.234 are printed as 1.20 and 1.23,
  with `digits = -2` as 1.2 and 1.23, respectively. Can't be combined
  with `sigfig`.

- label:

  A label to show instead of the type description.

- scale:

  Multiplier to apply to the data before showing. Useful for displaying
  e.g. percentages. Must be combined with `label`.

- notation:

  One of `"fit"`, `"dec"`, `"sci"`, `"eng"`, or `"si"`.

  - `"fit"`: Use decimal notation if it fits and if it consumes 13
    digits or less, otherwise use scientific notation. (The default for
    numeric pillars.)

  - `"dec"`: Use decimal notation, regardless of width.

  - `"sci"`: Use scientific notation.

  - `"eng"`: Use engineering notation, i.e. scientific notation using
    exponents that are a multiple of three.

  - `"si"`: Use SI notation, prefixes between `1e-24` and `1e24` are
    supported.

- fixed_exponent:

  Use the same exponent for all numbers in scientific, engineering or SI
  notation. `-Inf` uses the smallest, `+Inf` the largest fixed_exponent
  present in the data. The default is to use varying exponents.

- extra_sigfig:

  If `TRUE`, increase the number of significant digits if the data
  consists of numbers of the same magnitude with subtle differences.

## See also

Other vector classes:
[`char()`](https://tibble.tidyverse.org/reference/char.md)

## Examples

``` r
# Display as a vector
num(9:11 * 100 + 0.5)
#> <pillar_num[3]>
#> [1]  900. 1000. 1100.

# Significant figures
tibble(
  x3 = num(9:11 * 100 + 0.5, sigfig = 3),
  x4 = num(9:11 * 100 + 0.5, sigfig = 4),
  x5 = num(9:11 * 100 + 0.5, sigfig = 5),
)
#> # A tibble: 3 × 3
#>        x3      x4      x5
#>   <num:3> <num:4> <num:5>
#> 1    900.   900.5   900.5
#> 2   1000.  1000.   1000.5
#> 3   1100.  1100.   1100.5

# Maximum digits after the decimal points
tibble(
  x0 = num(9:11 * 100 + 0.5, digits = 0),
  x1 = num(9:11 * 100 + 0.5, digits = -1),
  x2 = num(9:11 * 100 + 0.5, digits = -2),
)
#> # A tibble: 3 × 3
#>         x0       x1       x2
#>   <num:.0> <num:.1> <num:.2>
#> 1     900.    900.5    900.5
#> 2    1000.   1000.5   1000.5
#> 3    1100.   1100.5   1100.5

# Use fixed digits and a currency label
tibble(
  usd = num(9:11 * 100 + 0.5, digits = 2, label = "USD"),
  gbp = num(9:11 * 100 + 0.5, digits = 2, label = "£"),
  chf = num(9:11 * 100 + 0.5, digits = 2, label = "SFr")
)
#> # A tibble: 3 × 3
#>       usd     gbp     chf
#>       USD       £     SFr
#> 1  900.50  900.50  900.50
#> 2 1000.50 1000.50 1000.50
#> 3 1100.50 1100.50 1100.50

# Scale
tibble(
  small  = num(9:11 / 1000 + 0.00005, label = "%", scale = 100),
  medium = num(9:11 / 100 + 0.0005, label = "%", scale = 100),
  large  = num(9:11 / 10 + 0.005, label = "%", scale = 100)
)
#> # A tibble: 3 × 3
#>   small medium large
#>       %      %     %
#> 1 0.905   9.05  90.5
#> 2 1.00   10.0  100. 
#> 3 1.10   11.0  110. 

# Notation
tibble(
  sci = num(10^(-13:6), notation = "sci"),
  eng = num(10^(-13:6), notation = "eng"),
  si  = num(10^(-13:6), notation = "si"),
  dec = num(10^(-13:6), notation = "dec")
)
#> # A tibble: 20 × 4
#>      sci     eng   si                   dec
#>    <sci>   <eng> <si>                 <dec>
#>  1 1e-13 100e-15 100f       0.0000000000001
#>  2 1e-12   1e-12   1p       0.000000000001 
#>  3 1e-11  10e-12  10p       0.00000000001  
#>  4 1e-10 100e-12 100p       0.0000000001   
#>  5 1e- 9   1e- 9   1n       0.000000001    
#>  6 1e- 8  10e- 9  10n       0.00000001     
#>  7 1e- 7 100e- 9 100n       0.0000001      
#>  8 1e- 6   1e- 6   1µ       0.000001       
#>  9 1e- 5  10e- 6  10µ       0.00001        
#> 10 1e- 4 100e- 6 100µ       0.0001         
#> 11 1e- 3   1e- 3   1m       0.001          
#> 12 1e- 2  10e- 3  10m       0.01           
#> 13 1e- 1 100e- 3 100m       0.1            
#> 14 1e+ 0   1e+ 0   1        1              
#> 15 1e+ 1  10e+ 0  10       10              
#> 16 1e+ 2 100e+ 0 100      100              
#> 17 1e+ 3   1e+ 3   1k    1000              
#> 18 1e+ 4  10e+ 3  10k   10000              
#> 19 1e+ 5 100e+ 3 100k  100000              
#> 20 1e+ 6   1e+ 6   1M 1000000              

# Fixed exponent
tibble(
  scimin = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = -Inf),
  engmin = num(10^(-7:6) * 123, notation = "eng", fixed_exponent = -Inf),
  simin  = num(10^(-7:6) * 123, notation = "si", fixed_exponent = -Inf)
)
#> # A tibble: 14 × 3
#>               scimin            engmin             simin
#>                [e-5]             [e-5]               [µ]
#>  1              1.23              12.3              12.3
#>  2             12.3              123               123  
#>  3            123               1230              1230  
#>  4           1230              12300             12300  
#>  5          12300             123000            123000  
#>  6         123000            1230000           1230000  
#>  7        1230000           12300000          12300000  
#>  8       12300000          123000000         123000000  
#>  9      123000000         1230000000        1230000000  
#> 10     1230000000        12300000000       12300000000  
#> 11    12300000000       123000000000      123000000000  
#> 12   123000000000      1230000000000     1230000000000  
#> 13  1230000000000     12300000000000    12300000000000  
#> 14 12300000000000    123000000000000   123000000000000  

tibble(
  scismall = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = -3),
  scilarge = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = 3),
  scimax   = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = Inf)
)
#> # A tibble: 14 × 3
#>             scismall          scilarge            scimax
#>                [e-3]              [e3]              [e8]
#>  1            0.0123      0.0000000123 0.000000000000123
#>  2            0.123       0.000000123  0.00000000000123 
#>  3            1.23        0.00000123   0.0000000000123  
#>  4           12.3         0.0000123    0.000000000123   
#>  5          123           0.000123     0.00000000123    
#>  6         1230           0.00123      0.0000000123     
#>  7        12300           0.0123       0.000000123      
#>  8       123000           0.123        0.00000123       
#>  9      1230000           1.23         0.0000123        
#> 10     12300000          12.3          0.000123         
#> 11    123000000         123            0.00123          
#> 12   1230000000        1230            0.0123           
#> 13  12300000000       12300            0.123            
#> 14 123000000000      123000            1.23             

#' Extra significant digits
tibble(
  default = num(100 + 1:3 * 0.001),
  extra1 = num(100 + 1:3 * 0.001, extra_sigfig = TRUE),
  extra2 = num(100 + 1:3 * 0.0001, extra_sigfig = TRUE),
  extra3 = num(10000 + 1:3 * 0.00001, extra_sigfig = TRUE)
)
#> # A tibble: 3 × 4
#>   default  extra1   extra2      extra3
#>     <num>   <num>    <num>       <num>
#> 1    100. 100.001 100.0001 10000.00001
#> 2    100. 100.002 100.0002 10000.00002
#> 3    100. 100.003 100.0003 10000.00003
```
