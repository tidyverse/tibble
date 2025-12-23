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
[`num()`](https://tibble.tidyverse.org/reference/num.md)

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
#>  1 Ssxf5RPiDjF…             1             2             3             4
#>  2 OlqjZavreUg…             1             2             3             4
#>  3 8hYmPYrwJG9…             1             2             3             4
#>  4 0k5CLEp9Mcp…             1             2             3             4
#>  5 KhjZZbegjEY…             1             2             3             4
#>  6 Wa9TGFPzGkV…             1             2             3             4
#>  7 iZMcOCjm7Lh…             1             2             3             4
#>  8 qYwlo7fldem…             1             2             3             4
#>  9 4O7hFxIud6K…             1             2             3             4
#> 10 RHBt1kj2i9J…             1             2             3             4
#> # ℹ 5 more variables: some_number_5 <dbl>, some_number_6 <dbl>,
#> #   some_number_7 <dbl>, some_number_8 <dbl>, some_number_9 <dbl>

# Use char() to avoid or control truncation
data_with_id(char(rand_strings, min_chars = 24))
#> # A tibble: 10 × 10
#>    id                         some_number_1 some_number_2 some_number_3
#>    <char>                             <dbl>         <dbl>         <dbl>
#>  1 Ssxf5RPiDjFRy7iVoadHgnz4u…             1             2             3
#>  2 OlqjZavreUgr3GXLoDX6mpkxi…             1             2             3
#>  3 8hYmPYrwJG9UsJm9A47KvwLTo…             1             2             3
#>  4 0k5CLEp9McpsCkmBt5wkYOioy…             1             2             3
#>  5 KhjZZbegjEYOJm1HIxNkWvYx8…             1             2             3
#>  6 Wa9TGFPzGkVAZsJlCaIHvalJs…             1             2             3
#>  7 iZMcOCjm7Lh2Gthq6NgOGsJbR…             1             2             3
#>  8 qYwlo7fldemmrE772uCYLrI6ek             1             2             3
#>  9 4O7hFxIud6K9YsvhQTB6OeYC               1             2             3
#> 10 RHBt1kj2i9JnNgyaa5MBXV                 1             2             3
#> # ℹ 6 more variables: some_number_4 <dbl>, some_number_5 <dbl>,
#> #   some_number_6 <dbl>, some_number_7 <dbl>, some_number_8 <dbl>,
#> #   some_number_9 <dbl>
data_with_id(char(rand_strings, min_chars = Inf))
#> # A tibble: 10 × 10
#>    id                                       some_number_1 some_number_2
#>    <char>                                           <dbl>         <dbl>
#>  1 Ssxf5RPiDjFRy7iVoadHgnz4uveIpMlA7QaqjzHQ             1             2
#>  2 OlqjZavreUgr3GXLoDX6mpkxihE20qyTAB45GR               1             2
#>  3 8hYmPYrwJG9UsJm9A47KvwLTo2FQEkuqMTdO                 1             2
#>  4 0k5CLEp9McpsCkmBt5wkYOioyg9COiuR3y                   1             2
#>  5 KhjZZbegjEYOJm1HIxNkWvYx8Ozl85uy                     1             2
#>  6 Wa9TGFPzGkVAZsJlCaIHvalJsvMCUa                       1             2
#>  7 iZMcOCjm7Lh2Gthq6NgOGsJbR2z2                         1             2
#>  8 qYwlo7fldemmrE772uCYLrI6ek                           1             2
#>  9 4O7hFxIud6K9YsvhQTB6OeYC                             1             2
#> 10 RHBt1kj2i9JnNgyaa5MBXV                               1             2
#> # ℹ 7 more variables: some_number_3 <dbl>, some_number_4 <dbl>,
#> #   some_number_5 <dbl>, some_number_6 <dbl>, some_number_7 <dbl>,
#> #   some_number_8 <dbl>, some_number_9 <dbl>
data_with_id(char(rand_strings, min_chars = 24, shorten = "mid"))
#> # A tibble: 10 × 10
#>    id                         some_number_1 some_number_2 some_number_3
#>    <char>                             <dbl>         <dbl>         <dbl>
#>  1 Ssxf5RPiDjFR…IpMlA7QaqjzHQ             1             2             3
#>  2 OlqjZavreUgr…hE20qyTAB45GR             1             2             3
#>  3 8hYmPYrwJG9U…To2FQEkuqMTdO             1             2             3
#>  4 0k5CLEp9Mcps…Oioyg9COiuR3y             1             2             3
#>  5 KhjZZbegjEYO…kWvYx8Ozl85uy             1             2             3
#>  6 Wa9TGFPzGkVA…aIHvalJsvMCUa             1             2             3
#>  7 iZMcOCjm7Lh2…q6NgOGsJbR2z2             1             2             3
#>  8 qYwlo7fldemmrE772uCYLrI6ek             1             2             3
#>  9 4O7hFxIud6K9YsvhQTB6OeYC               1             2             3
#> 10 RHBt1kj2i9JnNgyaa5MBXV                 1             2             3
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
#> # A tibble: 9 × 3
#>   back                                                      front mid  
#>   <char>                                                    <cha> <cha>
#> 1 Lorem ipsum dolor sit amet, viverra sodales sit et aucto… …tor. Lo…r.
#> 2 Lacinia etiam commodo tincidunt dui nisl vitae sociis la… … ut. La…t.
#> 3 Suspendisse adipiscing suspendisse conubia tortor.        …tor. Su…r.
#> 4 Risus donec, turpis eleifend, eleifend metus nunc turpis. …pis. Ri…s.
#> 5 Augue massa lobortis faucibus velit efficitur ac faucibu… …lit. Au…t.
#> 6 Egestas egestas sit amet ut.                              … ut. Eg…t.
#> 7 Conubia faucibus facilisi tempor urna.                    …rna. Co…a.
#> 8 Nisi feugiat senectus.                                    …tus. Ni…s.
#> 9 Nunc in pretium dui ac elit semper.                       …per. Nu…r.
tibble(abbr = char(lipsum, shorten = "abbreviate"))
#> # A tibble: 9 × 1
#>   abbr                                                             
#>   <char>                                                           
#> 1 Lorem ipsum dolor sit amet, viverra sodales sit et auctor.       
#> 2 Laciniaetiamcommodotinciduntduinislvitaesociislaoreetinnecdiamut.
#> 3 Suspendisse adipiscing suspendisse conubia tortor.               
#> 4 Risus donec, turpis eleifend, eleifend metus nunc turpis.        
#> 5 Augue massa lobortis faucibus velit efficitur ac faucibus elit.  
#> 6 Egestas egestas sit amet ut.                                     
#> 7 Conubia faucibus facilisi tempor urna.                           
#> 8 Nisi feugiat senectus.                                           
#> 9 Nunc in pretium dui ac elit semper.                              
```
