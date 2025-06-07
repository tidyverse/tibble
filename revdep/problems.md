# opendataformat

<details>

* Version: 2.2.0
* GitHub: https://github.com/opendataformat/r-package-opendataformat
* Source code: https://github.com/cran/opendataformat
* Date/Publication: 2025-03-11 15:30:02 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "opendataformat")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ISLR)
      > library(opendataformat)
      > 
      > test_check("opendataformat")
      [1] "No metadata in en available. Active language is 'NA'."
      [1] "No metadata in en available. Active language is 'NA'."
      [1] "No metadata in 'fr' available. Active language is 'en'."
      [4m[1mDataset:[0m[0m  soep-core v38.1: bap
      [1mLabel:[0m
      [en]Data from individual questionnaires 2010
      [de]Daten vom Personenfragebogen 2010
      [1mDescription:[0m
      [en]The data were collected as part of the SOEP-Core study using the questionnaire "Living in Germany - Survey 2010 on the social situation - Personal questionnaire for all. This questionnaire is addressed to the individual persons in the household. A view of the survey instrument can be found here: https://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.369781.de/soepfrabo_personen_2010.pdf
      [de]Die Daten wurden im Rahmen der Studie SOEP-Core mittels des Fragebogens „Leben in Deutschland – Befragung 2010 zur sozialen Lage - Personenfragebogen für alle“ erhoben. Dieser Fragebogen richtet sich an die einzelnen Personen im Haushalt. Eine Ansicht des Erhebungsinstrumentes finden Sie hier: https://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.369781.de/soepfrabo_personen_2010.pdf
      [1mlanguages:[0m
          en de (active: en)
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap
      [1mVariables:[0m
        Variable                          Label en                          Label de
      1    bap87                    Current Health    Gesundheitszustand gegenwärtig
      2  bap9201    hours of sleep, normal workday  Stunden Schlaf, normaler Werktag
      3  bap9001     Pressed For Time Last 4 Weeks  Eile, Zeitdruck letzten 4 Wochen
      4  bap9002 Run-down, Melancholy Last 4 Weeks Niedergeschlagen letzten 4 Wochen
      5  bap9003        Well-balanced Last 4 Weeks     Ausgeglichen letzten 4 Wochen
      6    bap96                            Height                       Körpergröße
      7     name                         Firstname                           Vorname
      [4m[1mDataset:[0m[0m  soep-core v38.1: bap
      [1mLabel:[0m
      [en]Data from individual questionnaires 2010
      [de]Daten vom Personenfragebogen 2010
      [1mDescription:[0m
      [en]The data were collected as part of the SOEP-Core study using the questionnaire "Living in Germany - Survey 2010 on the social situation - Personal questionnaire for all. This questionnaire is addressed to the individual persons in the household. A view of the survey instrument can be found here: https://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.369781.de/soepfrabo_personen_2010.pdf
      [de]Die Daten wurden im Rahmen der Studie SOEP-Core mittels des Fragebogens „Leben in Deutschland – Befragung 2010 zur sozialen Lage - Personenfragebogen für alle“ erhoben. Dieser Fragebogen richtet sich an die einzelnen Personen im Haushalt. Eine Ansicht des Erhebungsinstrumentes finden Sie hier: https://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.369781.de/soepfrabo_personen_2010.pdf
      [1mlanguages:[0m
          en de (active: en)
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap
      [1mVariables:[0m
        Variable                          Label en                          Label de
      1    bap87                    Current Health    Gesundheitszustand gegenwärtig
      2  bap9201    hours of sleep, normal workday  Stunden Schlaf, normaler Werktag
      3  bap9001     Pressed For Time Last 4 Weeks  Eile, Zeitdruck letzten 4 Wochen
      4  bap9002 Run-down, Melancholy Last 4 Weeks Niedergeschlagen letzten 4 Wochen
      5  bap9003        Well-balanced Last 4 Weeks     Ausgeglichen letzten 4 Wochen
      6    bap96                            Height                       Körpergröße
      7     name                         Firstname                           Vorname
      [4m[1mDataset:[0m[0m  soep-core v38.1: bap
      [1mLabel:[0m
      [en]Data from individual questionnaires 2010
      [1mDescription:[0m
      [en]The data were collected as part of the SOEP-Core study using the questionnaire "Living in Germany - Survey 2010 on the social situation - Personal questionnaire for all. This questionnaire is addressed to the individual persons in the household. A view of the survey instrument can be found here: https://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.369781.de/soepfrabo_personen_2010.pdf
      [1mlanguages:[0m
          en de (active: en)
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap
      [1mVariables:[0m
        Variable                          Label en
      1    bap87                    Current Health
      2  bap9201    hours of sleep, normal workday
      3  bap9001     Pressed For Time Last 4 Weeks
      4  bap9002 Run-down, Melancholy Last 4 Weeks
      5  bap9003        Well-balanced Last 4 Weeks
      6    bap96                            Height
      7     name                         Firstname
      [4m[1mDataset:[0m[0m  soep-core v38.1: bap
      [1mLabel:[0m
      [en]Data from individual questionnaires 2010
      [1mDescription:[0m
      [en]The data were collected as part of the SOEP-Core study using the questionnaire "Living in Germany - Survey 2010 on the social situation - Personal questionnaire for all. This questionnaire is addressed to the individual persons in the household. A view of the survey instrument can be found here: https://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.369781.de/soepfrabo_personen_2010.pdf
      [1mlanguages:[0m
          en de (active: en)
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap
      [1mVariables:[0m
        Variable                          Label en
      1    bap87                    Current Health
      2  bap9201    hours of sleep, normal workday
      3  bap9001     Pressed For Time Last 4 Weeks
      4  bap9002 Run-down, Melancholy Last 4 Weeks
      5  bap9003        Well-balanced Last 4 Weeks
      6    bap96                            Height
      7     name                         Firstname
      [4m[1mDataset:[0m[0m  soep-core v38.1: bap
      [1mLabel:[0m
      [de]Daten vom Personenfragebogen 2010
      [1mDescription:[0m
      [de]Die Daten wurden im Rahmen der Studie SOEP-Core mittels des Fragebogens „Leben in Deutschland – Befragung 2010 zur sozialen Lage - Personenfragebogen für alle“ erhoben. Dieser Fragebogen richtet sich an die einzelnen Personen im Haushalt. Eine Ansicht des Erhebungsinstrumentes finden Sie hier: https://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.369781.de/soepfrabo_personen_2010.pdf
      [1mlanguages:[0m
          en de (active: en)
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap
      [1mVariables:[0m
        Variable                          Label de
      1    bap87    Gesundheitszustand gegenwärtig
      2  bap9201  Stunden Schlaf, normaler Werktag
      3  bap9001  Eile, Zeitdruck letzten 4 Wochen
      4  bap9002 Niedergeschlagen letzten 4 Wochen
      5  bap9003     Ausgeglichen letzten 4 Wochen
      6    bap96                       Körpergröße
      7     name                           Vorname
      [4m[1mDataset:[0m[0m  soep-core v38.1: bap
      [1mLabel:[0m
      [de]Daten vom Personenfragebogen 2010
      [1mDescription:[0m
      [de]Die Daten wurden im Rahmen der Studie SOEP-Core mittels des Fragebogens „Leben in Deutschland – Befragung 2010 zur sozialen Lage - Personenfragebogen für alle“ erhoben. Dieser Fragebogen richtet sich an die einzelnen Personen im Haushalt. Eine Ansicht des Erhebungsinstrumentes finden Sie hier: https://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.369781.de/soepfrabo_personen_2010.pdf
      [1mlanguages:[0m
          en de (active: en)
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap
      [1mVariables:[0m
        Variable                          Label de
      1    bap87    Gesundheitszustand gegenwärtig
      2  bap9201  Stunden Schlaf, normaler Werktag
      3  bap9001  Eile, Zeitdruck letzten 4 Wochen
      4  bap9002 Niedergeschlagen letzten 4 Wochen
      5  bap9003     Ausgeglichen letzten 4 Wochen
      6    bap96                       Körpergröße
      7     name                           Vorname
      [4m[1mVariable:[0m[0m  bap87
      [1mLabel:[0m
      [en]Current Health
      [de]Gesundheitszustand gegenwärtig
      [1mDescription:[0m
      [en]Question: How would you describe your current health?
      [de]Frage: Wie würden Sie Ihren gegenwärtigen Gesundheitszustand beschreiben?
      [1mType:[0m
          numeric
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap/bap87
      [1mValue Labels:[0m
       Value             en                de
          -2 Does not apply   trifft nicht zu
          -1      No Answer      keine Angabe
           1      Very good          Sehr gut
           2           Good               Gut
           3   Satisfactory Zufriedenstellend
           4           Poor       Weniger gut
           5            Bad          Schlecht
      [4m[1mVariable:[0m[0m  bap87
      [1mLabel:[0m
      [en]Current Health
      [de]Gesundheitszustand gegenwärtig
      [1mDescription:[0m
      [en]Question: How would you describe your current health?
      [de]Frage: Wie würden Sie Ihren gegenwärtigen Gesundheitszustand beschreiben?
      [1mType:[0m
          numeric
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap/bap87
      [1mValue Labels:[0m
       Value             en                de
          -2 Does not apply   trifft nicht zu
          -1      No Answer      keine Angabe
           1      Very good          Sehr gut
           2           Good               Gut
           3   Satisfactory Zufriedenstellend
           4           Poor       Weniger gut
           5            Bad          Schlecht
      [4m[1mVariable:[0m[0m  bap87
      [1mLabel:[0m
      [en]Current Health
      [1mDescription:[0m
      [en]Question: How would you describe your current health?
      [1mType:[0m
          numeric
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap/bap87
      [1mValue Labels:[0m
       Value             en
          -2 Does not apply
          -1      No Answer
           1      Very good
           2           Good
           3   Satisfactory
           4           Poor
           5            Bad
      [4m[1mVariable:[0m[0m  bap87
      [1mLabel:[0m
      [en]Current Health
      [1mDescription:[0m
      [en]Question: How would you describe your current health?
      [1mType:[0m
          numeric
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap/bap87
      [1mValue Labels:[0m
       Value             en
          -2 Does not apply
          -1      No Answer
           1      Very good
           2           Good
           3   Satisfactory
           4           Poor
           5            Bad
      [4m[1mVariable:[0m[0m  bap87
      [1mLabel:[0m
      [de]Gesundheitszustand gegenwärtig
      [1mDescription:[0m
      [de]Frage: Wie würden Sie Ihren gegenwärtigen Gesundheitszustand beschreiben?
      [1mType:[0m
          numeric
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap/bap87
      [1mValue Labels:[0m
       Value                de
          -2   trifft nicht zu
          -1      keine Angabe
           1          Sehr gut
           2               Gut
           3 Zufriedenstellend
           4       Weniger gut
           5          Schlecht
      [4m[1mVariable:[0m[0m  bap87
      [1mLabel:[0m
      [de]Gesundheitszustand gegenwärtig
      [1mDescription:[0m
      [de]Frage: Wie würden Sie Ihren gegenwärtigen Gesundheitszustand beschreiben?
      [1mType:[0m
          numeric
      [1mURL:[0m
          https://paneldata.org/soep-core/data/bap/bap87
      [1mValue Labels:[0m
       Value                de
          -2   trifft nicht zu
          -1      keine Angabe
           1          Sehr gut
           2               Gut
           3 Zufriedenstellend
           4       Weniger gut
           5          Schlecht
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/df_with_extrem_values.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML2.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.odf.zip'"
      [1] "Dataset successfully written to '/tmp/RtmpZHVCPc/MY_XML.odf.zip'"
      [ FAIL 17 | WARN 0 | SKIP 0 | PASS 680 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-as_odf_tbl.R:69:3'): as_odf_tbl ──────────────────────────────
      names(attributes(df_out)) not equal to c(...).
      Lengths differ: 13 is not 14
      ── Failure ('test-as_odf_tbl.R:143:3'): as_odf_tbl ─────────────────────────────
      names(attributes(df_out)) not equal to c(...).
      Lengths differ: 15 is not 16
      ── Failure ('test-read_odf.R:8:3'): read_odf_all ───────────────────────────────
      names(attributes(df)) not equal to c(...).
      Lengths differ: 13 is not 14
      ── Failure ('test-read_odf.R:80:3'): read_odf_all ──────────────────────────────
      names(attributes(df)) not equal to c(...).
      Lengths differ: 13 is not 14
      ── Failure ('test-read_odf.R:154:3'): read_odf_variables ───────────────────────
      names(attributes(df)) not equal to c(...).
      Lengths differ: 15 is not 16
      ── Failure ('test-read_odf.R:210:3'): read_odf_de ──────────────────────────────
      names(attributes(df)) not equal to c(...).
      Lengths differ: 11 is not 12
      ── Failure ('test-read_odf.R:267:3'): read_odf_specific_rows ───────────────────
      names(attributes(df)) not equal to c(...).
      Lengths differ: 13 is not 14
      ── Failure ('test-read_odf.R:346:3'): read_odf_specific_rows2 ──────────────────
      names(attributes(df)) not equal to c(...).
      Lengths differ: 13 is not 14
      ── Failure ('test-read_odf.R:425:3'): read_odf_specific_variables ──────────────
      names(attributes(df)) not equal to c(...).
      Lengths differ: 13 is not 14
      ── Failure ('test-read_odf.R:488:3'): read_odf_specific_variables ──────────────
      names(attributes(df)) not equal to c(...).
      Lengths differ: 13 is not 14
      ── Failure ('test-read_odf.R:570:3'): read_odf_specific_rows_and_cols ──────────
      names(attributes(df)) not equal to c(...).
      Lengths differ: 13 is not 14
      ── Failure ('test-read_odf.R:657:3'): read_odf_specific_rows_and_cols2 ─────────
      names(attributes(df)) not equal to c(...).
      Lengths differ: 13 is not 14
      ── Failure ('test-read_odf.R:745:3'): read_odf_specific_language_rows_and_cols ──
      names(attributes(df)) not equal to c(...).
      Lengths differ: 11 is not 12
      ── Failure ('test_merge.R:35:3'): merge.odf ────────────────────────────────────
      names(attributes(df_out)) not equal to c(...).
      Lengths differ: 6 is not 8
      ── Failure ('test_merge.R:78:3'): merge.odf ────────────────────────────────────
      names(attributes(df_out2)) not equal to c(...).
      Lengths differ: 6 is not 8
      ── Failure ('test_merge.R:122:3'): merge.odf ───────────────────────────────────
      names(attributes(df_out2)) not equal to c(...).
      Lengths differ: 6 is not 8
      ── Failure ('test_merge.R:168:3'): merge.odf ───────────────────────────────────
      names(attributes(df_out2)) not equal to c(...).
      Lengths differ: 6 is not 8
      
      [ FAIL 17 | WARN 0 | SKIP 0 | PASS 680 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 8 marked UTF-8 strings
    ```

# oppr

<details>

* Version: 1.0.4
* GitHub: https://github.com/prioritizr/oppr
* Source code: https://github.com/cran/oppr
* Date/Publication: 2022-09-08 11:00:24 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "oppr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘oppr.Rmd’ using rmarkdown_notangle
    
    Quitting from oppr.Rmd:18-71 [unnamed-chunk-1]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [1m[34m<error/rlang_error>[39m[22m
    [1m[33mError[39m in [1m[94m`loadNamespace()`[39m[1m:[22m
    [33m![39m there is no package called 'fansi'
    ---
    [1mBacktrace:[22m
    [90m    [39m▆
    [90m 1. [39m└─[1mbase[22m::loadNamespace(x)
    [90m 2. [39m  └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
    [90m 3. [39m    └─base (local) withOneRestart(expr, restarts[[1L]])
    [90m 4. [39m      └─base (local) doWithOneRestart(return(expr), restart)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'oppr.Rmd' failed with diagnostics:
    there is no package called 'fansi'
    --- failed re-building ‘oppr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘oppr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘gurobi’
    ```

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.8Mb
      sub-directories of 1Mb or more:
        R      1.5Mb
        libs  11.3Mb
    ```

