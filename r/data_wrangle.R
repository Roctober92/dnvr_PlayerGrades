# Date: Oct 2020
# Author: Andrew Wolfe
# Purpose: wrangle data into usable tables

# set wd
setwd('~/github/dnvr_PlayerGrades/r')

# source data_input.R
source('data_input.R')

# create game info table
base_game <- tibble(
  game = game,
  date = date,
  gametype = gametype,
  author = author
) %>% 
  mutate(date = as_date(date))

# create grade info table
grades <- rbind(gm1, gm2, gm3, gm4, gm5, gm6, gm7, gm8, gm9, gm10, gm11, gm12, gm13, gm14, gm15,
                gm16, gm17, gm18, gm19, gm20, gm21, gm22, gm23, gm24, gm25, gm26, gm27, gm28,
                gm29, gm30, gm31, gm32) %>% 
  full_join(players, by = 'player_id') %>% 
  mutate(grade = factor(grade, levels = c('a+',
                                          'a',
                                          'a-',
                                          'b+',
                                          'b',
                                          'b-',
                                          'c+',
                                          'c',
                                          'c-',
                                          'd+',
                                          'd',
                                          'd-',
                                          'f',
                                          'inc')))
  

# join all info together
all_info <- base_game %>% inner_join(grades, by = 'game')
