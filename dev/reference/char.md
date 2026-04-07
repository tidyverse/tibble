# Format a character vector

**\[experimental\]**

Constructs a character vector that can be formatted with predefined
minimum width or without width restrictions, and where the abbreviation
style can be configured.

The formatting is applied when the vector is printed or formatted, and
also in a tibble column.

`set_char_opts()` adds formatting options to an arbitrary character
vector, useful for composing with other types.

## Usage

``` r
char(
  x,
  ...,
  min_chars = NULL,
  shorten = c("back", "front", "mid", "abbreviate")
)

set_char_opts(
  x,
  ...,
  min_chars = NULL,
  shorten = c("back", "front", "mid", "abbreviate")
)
```

## Arguments

- x:

  A character vector.

- ...:

  These dots are for future extensions and must be empty.

- min_chars:

  The minimum width to allocate to this column, defaults to 15. The
  `"pillar.min_chars"`
  [option](https://pillar.r-lib.org/reference/pillar_options.html) is
  not consulted.

- shorten:

  How to abbreviate the data if necessary:

  - `"back"` (default): add an ellipsis at the end

  - `"front"`: add an ellipsis at the front

  - `"mid"`: add an ellipsis in the middle

  - `"abbreviate"`: use
    [`abbreviate()`](https://rdrr.io/r/base/abbreviate.html)

## See also

Other vector classes:
[`num()`](https://tibble.tidyverse.org/dev/reference/num.md)

## Examples

``` r
# Display as a vector:
char(letters[1:3])
#> <pillar_char[3]>
#> [1] a b c
# Space constraints:
rand_strings <- stringi::stri_rand_strings(10, seq(40, 22, by = -2))

# Plain character vectors get truncated if space is limited:
data_with_id <- function(id) {
  tibble(
    id,
    some_number_1 = 1, some_number_2 = 2, some_number_3 = 3,
    some_number_4 = 4, some_number_5 = 5, some_number_6 = 6,
    some_number_7 = 7, some_number_8 = 8, some_number_9 = 9
  )
}
data_with_id(rand_strings)
#> # A tibble: 10 × 10
#>    id           some_number_1 some_number_2 some_number_3 some_number_4
#>    <chr>                <dbl>         <dbl>         <dbl>         <dbl>
#>  1 WJSsxf5RPiD…             1             2             3             4
#>  2 HQOlqjZavre…             1             2             3             4
#>  3 GR8hYmPYrwJ…             1             2             3             4
#>  4 dO0k5CLEp9M…             1             2             3             4
#>  5 3yKhjZZbegj…             1             2             3             4
#>  6 uyWa9TGFPzG…             1             2             3             4
#>  7 UaiZMcOCjm7…             1             2             3             4
#>  8 z2qYwlo7fld…             1             2             3             4
#>  9 ek4O7hFxIud…             1             2             3             4
#> 10 YCRHBt1kj2i…             1             2             3             4
#> # ℹ 5 more variables: some_number_5 <dbl>, some_number_6 <dbl>,
#> #   some_number_7 <dbl>, some_number_8 <dbl>, some_number_9 <dbl>

# Use char() to avoid or control truncation
data_with_id(char(rand_strings, min_chars = 24))
#> # A tibble: 10 × 10
#>    id                         some_number_1 some_number_2 some_number_3
#>    <char>                             <dbl>         <dbl>         <dbl>
#>  1 WJSsxf5RPiDjFRy7iVoadHgnz…             1             2             3
#>  2 HQOlqjZavreUgr3GXLoDX6mpk…             1             2             3
#>  3 GR8hYmPYrwJG9UsJm9A47KvwL…             1             2             3
#>  4 dO0k5CLEp9McpsCkmBt5wkYOi…             1             2             3
#>  5 3yKhjZZbegjEYOJm1HIxNkWvY…             1             2             3
#>  6 uyWa9TGFPzGkVAZsJlCaIHval…             1             2             3
#>  7 UaiZMcOCjm7Lh2Gthq6NgOGsJ…             1             2             3
#>  8 z2qYwlo7fldemmrE772uCYLrI6             1             2             3
#>  9 ek4O7hFxIud6K9YsvhQTB6Oe               1             2             3
#> 10 YCRHBt1kj2i9JnNgyaa5MB                 1             2             3
#> # ℹ 6 more variables: some_number_4 <dbl>, some_number_5 <dbl>,
#> #   some_number_6 <dbl>, some_number_7 <dbl>, some_number_8 <dbl>,
#> #   some_number_9 <dbl>
data_with_id(char(rand_strings, min_chars = Inf))
#> # A tibble: 10 × 10
#>    id                                       some_number_1 some_number_2
#>    <char>                                           <dbl>         <dbl>
#>  1 WJSsxf5RPiDjFRy7iVoadHgnz4uveIpMlA7Qaqjz             1             2
#>  2 HQOlqjZavreUgr3GXLoDX6mpkxihE20qyTAB45               1             2
#>  3 GR8hYmPYrwJG9UsJm9A47KvwLTo2FQEkuqMT                 1             2
#>  4 dO0k5CLEp9McpsCkmBt5wkYOioyg9COiuR                   1             2
#>  5 3yKhjZZbegjEYOJm1HIxNkWvYx8Ozl85                     1             2
#>  6 uyWa9TGFPzGkVAZsJlCaIHvalJsvMC                       1             2
#>  7 UaiZMcOCjm7Lh2Gthq6NgOGsJbR2                         1             2
#>  8 z2qYwlo7fldemmrE772uCYLrI6                           1             2
#>  9 ek4O7hFxIud6K9YsvhQTB6Oe                             1             2
#> 10 YCRHBt1kj2i9JnNgyaa5MB                               1             2
#> # ℹ 7 more variables: some_number_3 <dbl>, some_number_4 <dbl>,
#> #   some_number_5 <dbl>, some_number_6 <dbl>, some_number_7 <dbl>,
#> #   some_number_8 <dbl>, some_number_9 <dbl>
data_with_id(char(rand_strings, min_chars = 24, shorten = "mid"))
#> # A tibble: 10 × 10
#>    id                         some_number_1 some_number_2 some_number_3
#>    <char>                             <dbl>         <dbl>         <dbl>
#>  1 WJSsxf5RPiDj…veIpMlA7Qaqjz             1             2             3
#>  2 HQOlqjZavreU…xihE20qyTAB45             1             2             3
#>  3 GR8hYmPYrwJG…wLTo2FQEkuqMT             1             2             3
#>  4 dO0k5CLEp9Mc…kYOioyg9COiuR             1             2             3
#>  5 3yKhjZZbegjE…xNkWvYx8Ozl85             1             2             3
#>  6 uyWa9TGFPzGk…lCaIHvalJsvMC             1             2             3
#>  7 UaiZMcOCjm7L…thq6NgOGsJbR2             1             2             3
#>  8 z2qYwlo7fldemmrE772uCYLrI6             1             2             3
#>  9 ek4O7hFxIud6K9YsvhQTB6Oe               1             2             3
#> 10 YCRHBt1kj2i9JnNgyaa5MB                 1             2             3
#> # ℹ 6 more variables: some_number_4 <dbl>, some_number_5 <dbl>,
#> #   some_number_6 <dbl>, some_number_7 <dbl>, some_number_8 <dbl>,
#> #   some_number_9 <dbl>

# Lorem Ipsum, one sentence per row.
lipsum <- unlist(strsplit(stringi::stri_rand_lipsum(1), "(?<=[.]) +", perl = TRUE))
tibble(
  back = char(lipsum, shorten = "back"),
  front = char(lipsum, shorten = "front"),
  mid = char(lipsum, shorten = "mid")
)
#> # A tibble: 10 × 3
#>    back                                                     front mid  
#>    <char>                                                   <cha> <cha>
#>  1 Lorem ipsum dolor sit amet, sit et auctor lacinia etiam… …iis. Lo…s.
#>  2 Laoreet in nec diam ut suspendisse adipiscing suspendis… …pis. La…s.
#>  3 Eleifend eleifend, metus nunc turpis.                    …pis. El…s.
#>  4 Augue massa lobortis faucibus velit efficitur ac faucib… …bus. Au…s.
#>  5 Elit egestas egestas sit amet ut conubia faucibus facil… …isi. El…i.
#>  6 Tempor urna nisi feugiat senectus.                       …tus. Te…s.
#>  7 Nunc in pretium dui ac.                                  … ac. Nu…c.
#>  8 Elit semper eu.                                          … eu. El…u.
#>  9 Sapien congue, dictum massa sed posuere sagittis.        …tis. Sa…s.
#> 10 Interdum ante aenean, nisi dapibus lacinia nulla laoree… …bus. In…s.
tibble(abbr = char(lipsum, shorten = "abbreviate"))
#> # A tibble: 10 × 1
#>    abbr                                                                
#>    <char>                                                              
#>  1 Loremipsumdolorsitamet,sitetauctorlacinetiamcommod!Tncdntd,nslvtscs.
#>  2 Laoreetinnecdiamutsuspendissadipiscingsuspendissconubtrtrrssdnctrps.
#>  3 Eleifend eleifend, metus nunc turpis.                               
#>  4 Augue massa lobortis faucibus velit efficitur ac faucibus.          
#>  5 Elit egestas egestas sit amet ut conubia faucibus facilisi.         
#>  6 Tempor urna nisi feugiat senectus.                                  
#>  7 Nunc in pretium dui ac.                                             
#>  8 Elit semper eu.                                                     
#>  9 Sapien congue, dictum massa sed posuere sagittis.                   
#> 10 Interdumanteaenean,nisdapibuslacinnulllaoreet,felisultriciesdapibus.
```
