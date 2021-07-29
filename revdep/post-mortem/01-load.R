library(tidyverse)

new_error <- "BAwiR CGPfunctions DMwR2 INDperform MIMSunit OpenLand REDCapR RSDA RmarineHeatWaves SWMPrExtension SanzCircos SortedEffects anchoredDistr apa basket beadplexr biscale brazilmaps casen cdcfluview collateral concaveman concurve convergEU cutpointr cvms dscore epikit estatapi evaluator fable forestmangr germanpolls graphicalVAR heemod highlightHTML ijtiff ipfr jstor mcp metacoder micropan modeltests nationwider nhdplusTools nosoi openair padr pointblank portalr psychonetrics readroper rematch2 riskclustr rsample rubias simrel sjmisc ssdtools statsr taxa tidybayes tidytext tidytransit tradestatistics trialr ushr viafr vip vpc weathercan"
new_warning <- "RNeXML Rdrools analysisPipelines broom.mixed cdcfluview coveffectsplot dexter dialr dodgr highlightHTML metan naniar ozmaps photobiologyInOut poio raceland sigmajs tbrf tidydice tidytree"

input <- tribble(
  ~type,     ~pkg,
  "error", new_error,
  "warning", new_warning
)

long_pkg <-
  input %>%
  mutate(pkg = strsplit(pkg, " ")) %>%
  unnest(pkg) %>%
  distinct(pkg, .keep_all = TRUE) %>%
  filter(!(pkg %in% c("cutpointr", "tidytransit")))

long_pkg %>%
  count(pkg) %>%
  count(n)

fog <- foghorn::cran_details(long_pkg$pkg, src = "crandb")

saveRDS(fog, "fog.rds")
