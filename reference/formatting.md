# Printing tibbles

One of the main features of the `tbl_df` class is the printing:

- Tibbles only print as many rows and columns as fit on one screen,
  supplemented by a summary of the remaining rows and columns.

- Tibble reveals the type of each column, which keeps the user informed
  about whether a variable is, e.g., `<chr>` or `<fct>` (character
  versus factor). See
  [`vignette("types")`](https://tibble.tidyverse.org/articles/types.md)
  for an overview of common type abbreviations.

Printing can be tweaked for a one-off call by calling
[`print()`](https://rdrr.io/r/base/print.html) explicitly and setting
arguments like `n` and `width`. More persistent control is available by
setting the options described in
[pillar::pillar_options](https://pillar.r-lib.org/reference/pillar_options.html).
See also
[`vignette("digits")`](https://tibble.tidyverse.org/articles/digits.md)
for a comparison to base options, and
[`vignette("numbers")`](https://tibble.tidyverse.org/articles/numbers.md)
that showcases [`num()`](https://tibble.tidyverse.org/reference/num.md)
and [`char()`](https://tibble.tidyverse.org/reference/char.md) for
creating columns with custom formatting options.

As of tibble 3.1.0, printing is handled entirely by the pillar package.
If you implement a package that extends tibble, the printed output can
be customized in various ways. See
[`vignette("extending", package = "pillar")`](https://pillar.r-lib.org/articles/extending.html)
for details, and
[pillar::pillar_options](https://pillar.r-lib.org/reference/pillar_options.html)
for options that control the display in the console.

## Usage

``` r
# S3 method for class 'tbl_df'
print(
  x,
  width = NULL,
  ...,
  n = NULL,
  max_extra_cols = NULL,
  max_footer_lines = NULL
)

# S3 method for class 'tbl_df'
format(
  x,
  width = NULL,
  ...,
  n = NULL,
  max_extra_cols = NULL,
  max_footer_lines = NULL
)
```

## Arguments

- x:

  Object to format or print.

- width:

  Width of text output to generate. This defaults to `NULL`, which means
  use the `width`
  [option](https://pillar.r-lib.org/reference/pillar_options.html).

- ...:

  These dots are for future extensions and must be empty.

- n:

  Number of rows to show. If `NULL`, the default, will print all rows if
  less than the `print_max`
  [option](https://pillar.r-lib.org/reference/pillar_options.html).
  Otherwise, will print as many rows as specified by the `print_min`
  [option](https://pillar.r-lib.org/reference/pillar_options.html).

- max_extra_cols:

  Number of extra columns to print abbreviated information for, if the
  width is too small for the entire tibble. If `NULL`, the
  `max_extra_cols`
  [option](https://pillar.r-lib.org/reference/pillar_options.html) is
  used. The previously defined `n_extra` argument is soft-deprecated.

- max_footer_lines:

  Maximum number of footer lines. If `NULL`, the `max_footer_lines`
  [option](https://pillar.r-lib.org/reference/pillar_options.html) is
  used.

## Examples

``` r
print(as_tibble(mtcars))
#> # A tibble: 32 × 11
#>      mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1  21       6  160    110  3.9   2.62  16.5     0     1     4     4
#>  2  21       6  160    110  3.9   2.88  17.0     0     1     4     4
#>  3  22.8     4  108     93  3.85  2.32  18.6     1     1     4     1
#>  4  21.4     6  258    110  3.08  3.22  19.4     1     0     3     1
#>  5  18.7     8  360    175  3.15  3.44  17.0     0     0     3     2
#>  6  18.1     6  225    105  2.76  3.46  20.2     1     0     3     1
#>  7  14.3     8  360    245  3.21  3.57  15.8     0     0     3     4
#>  8  24.4     4  147.    62  3.69  3.19  20       1     0     4     2
#>  9  22.8     4  141.    95  3.92  3.15  22.9     1     0     4     2
#> 10  19.2     6  168.   123  3.92  3.44  18.3     1     0     4     4
#> # ℹ 22 more rows
print(as_tibble(mtcars), n = 1)
#> # A tibble: 32 × 11
#>     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1    21     6   160   110   3.9  2.62  16.5     0     1     4     4
#> # ℹ 31 more rows
print(as_tibble(mtcars), n = 3)
#> # A tibble: 32 × 11
#>     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1  21       6   160   110  3.9   2.62  16.5     0     1     4     4
#> 2  21       6   160   110  3.9   2.88  17.0     0     1     4     4
#> 3  22.8     4   108    93  3.85  2.32  18.6     1     1     4     1
#> # ℹ 29 more rows

print(as_tibble(trees), n = 100)
#> # A tibble: 31 × 3
#>    Girth Height Volume
#>    <dbl>  <dbl>  <dbl>
#>  1   8.3     70   10.3
#>  2   8.6     65   10.3
#>  3   8.8     63   10.2
#>  4  10.5     72   16.4
#>  5  10.7     81   18.8
#>  6  10.8     83   19.7
#>  7  11       66   15.6
#>  8  11       75   18.2
#>  9  11.1     80   22.6
#> 10  11.2     75   19.9
#> 11  11.3     79   24.2
#> 12  11.4     76   21  
#> 13  11.4     76   21.4
#> 14  11.7     69   21.3
#> 15  12       75   19.1
#> 16  12.9     74   22.2
#> 17  12.9     85   33.8
#> 18  13.3     86   27.4
#> 19  13.7     71   25.7
#> 20  13.8     64   24.9
#> 21  14       78   34.5
#> 22  14.2     80   31.7
#> 23  14.5     74   36.3
#> 24  16       72   38.3
#> 25  16.3     77   42.6
#> 26  17.3     81   55.4
#> 27  17.5     82   55.7
#> 28  17.9     80   58.3
#> 29  18       80   51.5
#> 30  18       80   51  
#> 31  20.6     87   77  

print(mtcars, width = 10)
#>                      mpg
#> Mazda RX4           21.0
#> Mazda RX4 Wag       21.0
#> Datsun 710          22.8
#> Hornet 4 Drive      21.4
#> Hornet Sportabout   18.7
#> Valiant             18.1
#> Duster 360          14.3
#> Merc 240D           24.4
#> Merc 230            22.8
#> Merc 280            19.2
#> Merc 280C           17.8
#> Merc 450SE          16.4
#> Merc 450SL          17.3
#> Merc 450SLC         15.2
#> Cadillac Fleetwood  10.4
#> Lincoln Continental 10.4
#> Chrysler Imperial   14.7
#> Fiat 128            32.4
#> Honda Civic         30.4
#> Toyota Corolla      33.9
#> Toyota Corona       21.5
#> Dodge Challenger    15.5
#> AMC Javelin         15.2
#> Camaro Z28          13.3
#> Pontiac Firebird    19.2
#> Fiat X1-9           27.3
#> Porsche 914-2       26.0
#> Lotus Europa        30.4
#> Ford Pantera L      15.8
#> Ferrari Dino        19.7
#> Maserati Bora       15.0
#> Volvo 142E          21.4
#>                     cyl
#> Mazda RX4             6
#> Mazda RX4 Wag         6
#> Datsun 710            4
#> Hornet 4 Drive        6
#> Hornet Sportabout     8
#> Valiant               6
#> Duster 360            8
#> Merc 240D             4
#> Merc 230              4
#> Merc 280              6
#> Merc 280C             6
#> Merc 450SE            8
#> Merc 450SL            8
#> Merc 450SLC           8
#> Cadillac Fleetwood    8
#> Lincoln Continental   8
#> Chrysler Imperial     8
#> Fiat 128              4
#> Honda Civic           4
#> Toyota Corolla        4
#> Toyota Corona         4
#> Dodge Challenger      8
#> AMC Javelin           8
#> Camaro Z28            8
#> Pontiac Firebird      8
#> Fiat X1-9             4
#> Porsche 914-2         4
#> Lotus Europa          4
#> Ford Pantera L        8
#> Ferrari Dino          6
#> Maserati Bora         8
#> Volvo 142E            4
#>                      disp
#> Mazda RX4           160.0
#> Mazda RX4 Wag       160.0
#> Datsun 710          108.0
#> Hornet 4 Drive      258.0
#> Hornet Sportabout   360.0
#> Valiant             225.0
#> Duster 360          360.0
#> Merc 240D           146.7
#> Merc 230            140.8
#> Merc 280            167.6
#> Merc 280C           167.6
#> Merc 450SE          275.8
#> Merc 450SL          275.8
#> Merc 450SLC         275.8
#> Cadillac Fleetwood  472.0
#> Lincoln Continental 460.0
#> Chrysler Imperial   440.0
#> Fiat 128             78.7
#> Honda Civic          75.7
#> Toyota Corolla       71.1
#> Toyota Corona       120.1
#> Dodge Challenger    318.0
#> AMC Javelin         304.0
#> Camaro Z28          350.0
#> Pontiac Firebird    400.0
#> Fiat X1-9            79.0
#> Porsche 914-2       120.3
#> Lotus Europa         95.1
#> Ford Pantera L      351.0
#> Ferrari Dino        145.0
#> Maserati Bora       301.0
#> Volvo 142E          121.0
#>                      hp
#> Mazda RX4           110
#> Mazda RX4 Wag       110
#> Datsun 710           93
#> Hornet 4 Drive      110
#> Hornet Sportabout   175
#> Valiant             105
#> Duster 360          245
#> Merc 240D            62
#> Merc 230             95
#> Merc 280            123
#> Merc 280C           123
#> Merc 450SE          180
#> Merc 450SL          180
#> Merc 450SLC         180
#> Cadillac Fleetwood  205
#> Lincoln Continental 215
#> Chrysler Imperial   230
#> Fiat 128             66
#> Honda Civic          52
#> Toyota Corolla       65
#> Toyota Corona        97
#> Dodge Challenger    150
#> AMC Javelin         150
#> Camaro Z28          245
#> Pontiac Firebird    175
#> Fiat X1-9            66
#> Porsche 914-2        91
#> Lotus Europa        113
#> Ford Pantera L      264
#> Ferrari Dino        175
#> Maserati Bora       335
#> Volvo 142E          109
#>                     drat
#> Mazda RX4           3.90
#> Mazda RX4 Wag       3.90
#> Datsun 710          3.85
#> Hornet 4 Drive      3.08
#> Hornet Sportabout   3.15
#> Valiant             2.76
#> Duster 360          3.21
#> Merc 240D           3.69
#> Merc 230            3.92
#> Merc 280            3.92
#> Merc 280C           3.92
#> Merc 450SE          3.07
#> Merc 450SL          3.07
#> Merc 450SLC         3.07
#> Cadillac Fleetwood  2.93
#> Lincoln Continental 3.00
#> Chrysler Imperial   3.23
#> Fiat 128            4.08
#> Honda Civic         4.93
#> Toyota Corolla      4.22
#> Toyota Corona       3.70
#> Dodge Challenger    2.76
#> AMC Javelin         3.15
#> Camaro Z28          3.73
#> Pontiac Firebird    3.08
#> Fiat X1-9           4.08
#> Porsche 914-2       4.43
#> Lotus Europa        3.77
#> Ford Pantera L      4.22
#> Ferrari Dino        3.62
#> Maserati Bora       3.54
#> Volvo 142E          4.11
#>                        wt
#> Mazda RX4           2.620
#> Mazda RX4 Wag       2.875
#> Datsun 710          2.320
#> Hornet 4 Drive      3.215
#> Hornet Sportabout   3.440
#> Valiant             3.460
#> Duster 360          3.570
#> Merc 240D           3.190
#> Merc 230            3.150
#> Merc 280            3.440
#> Merc 280C           3.440
#> Merc 450SE          4.070
#> Merc 450SL          3.730
#> Merc 450SLC         3.780
#> Cadillac Fleetwood  5.250
#> Lincoln Continental 5.424
#> Chrysler Imperial   5.345
#> Fiat 128            2.200
#> Honda Civic         1.615
#> Toyota Corolla      1.835
#> Toyota Corona       2.465
#> Dodge Challenger    3.520
#> AMC Javelin         3.435
#> Camaro Z28          3.840
#> Pontiac Firebird    3.845
#> Fiat X1-9           1.935
#> Porsche 914-2       2.140
#> Lotus Europa        1.513
#> Ford Pantera L      3.170
#> Ferrari Dino        2.770
#> Maserati Bora       3.570
#> Volvo 142E          2.780
#>                      qsec
#> Mazda RX4           16.46
#> Mazda RX4 Wag       17.02
#> Datsun 710          18.61
#> Hornet 4 Drive      19.44
#> Hornet Sportabout   17.02
#> Valiant             20.22
#> Duster 360          15.84
#> Merc 240D           20.00
#> Merc 230            22.90
#> Merc 280            18.30
#> Merc 280C           18.90
#> Merc 450SE          17.40
#> Merc 450SL          17.60
#> Merc 450SLC         18.00
#> Cadillac Fleetwood  17.98
#> Lincoln Continental 17.82
#> Chrysler Imperial   17.42
#> Fiat 128            19.47
#> Honda Civic         18.52
#> Toyota Corolla      19.90
#> Toyota Corona       20.01
#> Dodge Challenger    16.87
#> AMC Javelin         17.30
#> Camaro Z28          15.41
#> Pontiac Firebird    17.05
#> Fiat X1-9           18.90
#> Porsche 914-2       16.70
#> Lotus Europa        16.90
#> Ford Pantera L      14.50
#> Ferrari Dino        15.50
#> Maserati Bora       14.60
#> Volvo 142E          18.60
#>                     vs
#> Mazda RX4            0
#> Mazda RX4 Wag        0
#> Datsun 710           1
#> Hornet 4 Drive       1
#> Hornet Sportabout    0
#> Valiant              1
#> Duster 360           0
#> Merc 240D            1
#> Merc 230             1
#> Merc 280             1
#> Merc 280C            1
#> Merc 450SE           0
#> Merc 450SL           0
#> Merc 450SLC          0
#> Cadillac Fleetwood   0
#> Lincoln Continental  0
#> Chrysler Imperial    0
#> Fiat 128             1
#> Honda Civic          1
#> Toyota Corolla       1
#> Toyota Corona        1
#> Dodge Challenger     0
#> AMC Javelin          0
#> Camaro Z28           0
#> Pontiac Firebird     0
#> Fiat X1-9            1
#> Porsche 914-2        0
#> Lotus Europa         1
#> Ford Pantera L       0
#> Ferrari Dino         0
#> Maserati Bora        0
#> Volvo 142E           1
#>                     am
#> Mazda RX4            1
#> Mazda RX4 Wag        1
#> Datsun 710           1
#> Hornet 4 Drive       0
#> Hornet Sportabout    0
#> Valiant              0
#> Duster 360           0
#> Merc 240D            0
#> Merc 230             0
#> Merc 280             0
#> Merc 280C            0
#> Merc 450SE           0
#> Merc 450SL           0
#> Merc 450SLC          0
#> Cadillac Fleetwood   0
#> Lincoln Continental  0
#> Chrysler Imperial    0
#> Fiat 128             1
#> Honda Civic          1
#> Toyota Corolla       1
#> Toyota Corona        0
#> Dodge Challenger     0
#> AMC Javelin          0
#> Camaro Z28           0
#> Pontiac Firebird     0
#> Fiat X1-9            1
#> Porsche 914-2        1
#> Lotus Europa         1
#> Ford Pantera L       1
#> Ferrari Dino         1
#> Maserati Bora        1
#> Volvo 142E           1
#>                     gear
#> Mazda RX4              4
#> Mazda RX4 Wag          4
#> Datsun 710             4
#> Hornet 4 Drive         3
#> Hornet Sportabout      3
#> Valiant                3
#> Duster 360             3
#> Merc 240D              4
#> Merc 230               4
#> Merc 280               4
#> Merc 280C              4
#> Merc 450SE             3
#> Merc 450SL             3
#> Merc 450SLC            3
#> Cadillac Fleetwood     3
#> Lincoln Continental    3
#> Chrysler Imperial      3
#> Fiat 128               4
#> Honda Civic            4
#> Toyota Corolla         4
#> Toyota Corona          3
#> Dodge Challenger       3
#> AMC Javelin            3
#> Camaro Z28             3
#> Pontiac Firebird       3
#> Fiat X1-9              4
#> Porsche 914-2          5
#> Lotus Europa           5
#> Ford Pantera L         5
#> Ferrari Dino           5
#> Maserati Bora          5
#> Volvo 142E             4
#>                     carb
#> Mazda RX4              4
#> Mazda RX4 Wag          4
#> Datsun 710             1
#> Hornet 4 Drive         1
#> Hornet Sportabout      2
#> Valiant                1
#> Duster 360             4
#> Merc 240D              2
#> Merc 230               2
#> Merc 280               4
#> Merc 280C              4
#> Merc 450SE             3
#> Merc 450SL             3
#> Merc 450SLC            3
#> Cadillac Fleetwood     4
#> Lincoln Continental    4
#> Chrysler Imperial      4
#> Fiat 128               1
#> Honda Civic            2
#> Toyota Corolla         1
#> Toyota Corona          1
#> Dodge Challenger       2
#> AMC Javelin            2
#> Camaro Z28             4
#> Pontiac Firebird       2
#> Fiat X1-9              1
#> Porsche 914-2          2
#> Lotus Europa           2
#> Ford Pantera L         4
#> Ferrari Dino           6
#> Maserati Bora          8
#> Volvo 142E             2

mtcars2 <- as_tibble(cbind(mtcars, mtcars), .name_repair = "unique")
#> New names:
#> • `mpg` -> `mpg...1`
#> • `cyl` -> `cyl...2`
#> • `disp` -> `disp...3`
#> • `hp` -> `hp...4`
#> • `drat` -> `drat...5`
#> • `wt` -> `wt...6`
#> • `qsec` -> `qsec...7`
#> • `vs` -> `vs...8`
#> • `am` -> `am...9`
#> • `gear` -> `gear...10`
#> • `carb` -> `carb...11`
#> • `mpg` -> `mpg...12`
#> • `cyl` -> `cyl...13`
#> • `disp` -> `disp...14`
#> • `hp` -> `hp...15`
#> • `drat` -> `drat...16`
#> • `wt` -> `wt...17`
#> • `qsec` -> `qsec...18`
#> • `vs` -> `vs...19`
#> • `am` -> `am...20`
#> • `gear` -> `gear...21`
#> • `carb` -> `carb...22`
print(mtcars2, n = 25, max_extra_cols = 3)
#> # A tibble: 32 × 22
#>    mpg...1 cyl...2 disp...3 hp...4 drat...5 wt...6 qsec...7 vs...8
#>      <dbl>   <dbl>    <dbl>  <dbl>    <dbl>  <dbl>    <dbl>  <dbl>
#>  1    21         6    160      110     3.9    2.62     16.5      0
#>  2    21         6    160      110     3.9    2.88     17.0      0
#>  3    22.8       4    108       93     3.85   2.32     18.6      1
#>  4    21.4       6    258      110     3.08   3.22     19.4      1
#>  5    18.7       8    360      175     3.15   3.44     17.0      0
#>  6    18.1       6    225      105     2.76   3.46     20.2      1
#>  7    14.3       8    360      245     3.21   3.57     15.8      0
#>  8    24.4       4    147.      62     3.69   3.19     20        1
#>  9    22.8       4    141.      95     3.92   3.15     22.9      1
#> 10    19.2       6    168.     123     3.92   3.44     18.3      1
#> 11    17.8       6    168.     123     3.92   3.44     18.9      1
#> 12    16.4       8    276.     180     3.07   4.07     17.4      0
#> 13    17.3       8    276.     180     3.07   3.73     17.6      0
#> 14    15.2       8    276.     180     3.07   3.78     18        0
#> 15    10.4       8    472      205     2.93   5.25     18.0      0
#> 16    10.4       8    460      215     3      5.42     17.8      0
#> 17    14.7       8    440      230     3.23   5.34     17.4      0
#> 18    32.4       4     78.7     66     4.08   2.2      19.5      1
#> 19    30.4       4     75.7     52     4.93   1.62     18.5      1
#> 20    33.9       4     71.1     65     4.22   1.84     19.9      1
#> 21    21.5       4    120.      97     3.7    2.46     20.0      1
#> 22    15.5       8    318      150     2.76   3.52     16.9      0
#> 23    15.2       8    304      150     3.15   3.44     17.3      0
#> 24    13.3       8    350      245     3.73   3.84     15.4      0
#> 25    19.2       8    400      175     3.08   3.84     17.0      0
#> # ℹ 7 more rows
#> # ℹ 14 more variables: am...9 <dbl>, gear...10 <dbl>, carb...11 <dbl>,
#> #   …

print(nycflights13::flights, max_footer_lines = 1)
#> # A tibble: 336,776 × 19
#>     year month   day dep_time sched_dep_time dep_delay arr_time
#>    <int> <int> <int>    <int>          <int>     <dbl>    <int>
#>  1  2013     1     1      517            515         2      830
#>  2  2013     1     1      533            529         4      850
#>  3  2013     1     1      542            540         2      923
#>  4  2013     1     1      544            545        -1     1004
#>  5  2013     1     1      554            600        -6      812
#>  6  2013     1     1      554            558        -4      740
#>  7  2013     1     1      555            600        -5      913
#>  8  2013     1     1      557            600        -3      709
#>  9  2013     1     1      557            600        -3      838
#> 10  2013     1     1      558            600        -2      753
#> # ℹ 336,766 more rows
print(nycflights13::flights, width = Inf)
#> # A tibble: 336,776 × 19
#>     year month   day dep_time sched_dep_time dep_delay arr_time
#>    <int> <int> <int>    <int>          <int>     <dbl>    <int>
#>  1  2013     1     1      517            515         2      830
#>  2  2013     1     1      533            529         4      850
#>  3  2013     1     1      542            540         2      923
#>  4  2013     1     1      544            545        -1     1004
#>  5  2013     1     1      554            600        -6      812
#>  6  2013     1     1      554            558        -4      740
#>  7  2013     1     1      555            600        -5      913
#>  8  2013     1     1      557            600        -3      709
#>  9  2013     1     1      557            600        -3      838
#> 10  2013     1     1      558            600        -2      753
#>    sched_arr_time arr_delay carrier flight tailnum origin dest 
#>             <int>     <dbl> <chr>    <int> <chr>   <chr>  <chr>
#>  1            819        11 UA        1545 N14228  EWR    IAH  
#>  2            830        20 UA        1714 N24211  LGA    IAH  
#>  3            850        33 AA        1141 N619AA  JFK    MIA  
#>  4           1022       -18 B6         725 N804JB  JFK    BQN  
#>  5            837       -25 DL         461 N668DN  LGA    ATL  
#>  6            728        12 UA        1696 N39463  EWR    ORD  
#>  7            854        19 B6         507 N516JB  EWR    FLL  
#>  8            723       -14 EV        5708 N829AS  LGA    IAD  
#>  9            846        -8 B6          79 N593JB  JFK    MCO  
#> 10            745         8 AA         301 N3ALAA  LGA    ORD  
#>    air_time distance  hour minute time_hour          
#>       <dbl>    <dbl> <dbl>  <dbl> <dttm>             
#>  1      227     1400     5     15 2013-01-01 05:00:00
#>  2      227     1416     5     29 2013-01-01 05:00:00
#>  3      160     1089     5     40 2013-01-01 05:00:00
#>  4      183     1576     5     45 2013-01-01 05:00:00
#>  5      116      762     6      0 2013-01-01 06:00:00
#>  6      150      719     5     58 2013-01-01 05:00:00
#>  7      158     1065     6      0 2013-01-01 06:00:00
#>  8       53      229     6      0 2013-01-01 06:00:00
#>  9      140      944     6      0 2013-01-01 06:00:00
#> 10      138      733     6      0 2013-01-01 06:00:00
#> # ℹ 336,766 more rows
```
