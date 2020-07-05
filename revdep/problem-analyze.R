library(tidyverse)

problems <- readLines("revdep/new-problems.md")

doc_frame <-
  problems %>%
  enframe() %>%
  mutate(is_package = grepl("^# [a-zA-Z][a-zA-Z0-9.]*[a-zA-Z0-9]$", value)) %>%
  mutate(package_id = cumsum(is_package)) %>%
  group_by(package_id) %>%
  mutate(package_name = gsub("^# ", "", value[[1]])) %>%
  ungroup() %>%
  select(package_name, text = value)

doc_frame %>%
  filter(grepl("must be named|error_column_must_be_named", text)) %>%
  count(package_name)

doc_frame_2 <-
  doc_frame %>%
  group_by(package_name) %>%
  mutate(flag = any(grepl("must be named|error_column_must_be_named", text))) %>%
  ungroup() %>%
  filter(!flag) %>%
  select(-flag)

doc_frame_2 %>%
  filter(grepl("scalar integer", text)) %>%
  count(package_name)

doc_frame_3 <-
  doc_frame_2 %>%
  group_by(package_name) %>%
  mutate(flag = any(grepl("scalar integer", text))) %>%
  ungroup() %>%
  filter(!flag) %>%
  select(-flag)

doc_frame_3 %>%
  filter(grepl("`names` must have length", text)) %>%
  count(package_name)
