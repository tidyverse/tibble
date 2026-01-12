# AI Agent Development Guidelines for tibble

> **Note**: For GitHub Copilot-specific instructions, see
> [`.github/copilot-instructions.md`](https://tibble.tidyverse.org/dev/copilot-instructions.md).

## Project Overview

tibble is an R package that provides a modern reimagining of the
data.frame. It offers the `tbl_df` class with stricter checking and
better formatting than traditional data frames. Tibbles are lazy and
surly: they do less (don’t change variable names or types, don’t do
partial matching) and complain more (when a variable does not exist),
helping you confront problems earlier and write cleaner code.

## Key Technologies

- **Language**: R with a few C functions
- **Testing**: testthat framework
- **Documentation**: roxygen2 with Markdown syntax
- **Code Formatting**: air (R formatting tool)
- **Build System**: R CMD, devtools

## Development Setup

### Installation and Dependencies

``` r
# Install all development dependencies
pak::pak()
```

### Install and run R

- When run on GitHub Actions, assume that R, the package in its current
  state and all dependencies are installed.
- Only install new packages when needed for implementing new features or
  tests.
- Run `devtools::check()` to execute all checks as a final step.

### Building and Testing

- Load package for development:
  [`pkgload::load_all()`](https://pkgload.r-lib.org/reference/load_all.html)
- Run tests: `testthat::test_local(reporter = "check")`
- Run tests for a single file `test-foo.R`:
  `testthat::test_local(filter = "foo", reporter = "check")`
- Build package: `devtools::build()`
- Check package: `devtools::check()`
- Update `.Rd` documentation: `devtools::document()`
- Format code: `air format .`

## Code Style and Documentation

### PR and Commit Style

- PR titles should be descriptive and follow conventional commit style
  when appropriate
- Use backticks for code references such as `function_call()`
- PRs are generally squashed, a clean history within a PR is not
  necessary
- Before resuming work on a PR, always merge the current base branch
  (typically `main`)
- Do not edit `NEWS.md` directly - it is managed by maintainers

### Comment Style

- Prefer expressive code over comments where possible
- Add comments to utility functions that cannot be made immediately
  obvious
- Focus comments on explaining the “why” and “how”, the “what” should be
  clear from the code itself
- Use line breaks after each sentence

### R Code Conventions

- Follow the [tidyverse style guide](https://style.tidyverse.org) and
  the [tidyverse design guide](https://design.tidyverse.org)
- Use `snake_case` for new functions and all arguments
- Use explicit package prefixes (e.g.,
  [`withr::local_options()`](https://withr.r-lib.org/reference/with_options.html))
  for clarity
- Maintain consistent indentation (2 spaces) and spacing patterns
- Use meaningful variable names that reflect context
- Run `styler::style_pkg()` before committing changes to ensure
  consistent formatting
- Do not restyle code that has nothing to do with your changes
- Never change deprecated functions

### Documentation

- Use roxygen2 with Markdown syntax for all function documentation
- Use explicit `@description` and `@details` sections when needed
- Keep each sentence on its own line in roxygen2 comments for better
  readability
- Document all arguments and return values
- Always run `devtools::document()` after updating documentation

### New functions

All new functions must include:

- Examples
- Tests
- Proper documentation, including arguments and return values
- All arguments in `snake_case`, with documentation and suitable
  defaults
- An ellipsis guarded with
  [`rlang::check_dots_empty()`](https://rlang.r-lib.org/reference/check_dots_empty.html)
  or similar separating mandatory and optional arguments when
  appropriate
- Argument validation using appropriate checking functions

## File Structure and Organization

### Test Files

- Test files should align with source files
- `R/name.R` → `tests/testthat/test-name.R`

### Build Artifacts

Do not commit: `*.o`, `*.so`, `*.dll` files in `src/`, and
`tests/testthat/testthat-problems.rds`. These are build artifacts that
are regenerated automatically.

## Testing

- Add test cases for all new functionality
- Test file naming should mirror source file naming
- Implement structured tests with clear expectations
- Run tests frequently during development and at the end:
  `testthat::test_local(reporter = "check")`
- Run `devtools::check()` as a final step to ensure all checks pass
- Use `expect_snapshot()` for testing printed output and error messages
