# Date: Oct 2020
# Author: Andrew Wolfe
# Purpose: wrangle data into usable tables

# set wd
setwd('~/github/dnvr_PlayerGrades/r')

# source data_input.R
source('data_input.R')

# create table of plus/minus, goals
goals <- tibble(
  plus_minus = plus_minus,
  num_goals = total_goals
) %>% 
  mutate(game = 1:nrow(.))

# create game info table
base_game <- tibble(
  game = game,
  date = date,
  gametype = gametype,
  author = author
) %>% 
  mutate(date = as_date(date)) %>% 
  inner_join(goals)

# create grade info table
grades <- rbind(gm1, gm2, gm3, gm4, gm5, gm6, gm7, gm8, gm9, gm10, gm11, gm12, gm13, gm14, gm15,
                gm16, gm17, gm18, gm19, gm20, gm21, gm22, gm23, gm24, gm25, gm26, gm27, gm28,
                gm29, gm30, gm31, gm32, gm33, gm34, gm35, gm36, gm37, gm38, gm39, gm40, gm41,
                gm42, gm43, gm44, gm45, gm47, gm48, gm49, gm50, gm51, gm52, gm53, gm54, gm55, 
                gm56, gm58, gm59, gm60, gm61, gm62, gm63, gm64, gm65, gm66, gm67, gm68, gm69, 
                gm70, gm71, gm72, gm73, gm74, gm75, gm76, gm77, gm79, gm80, gm81, gm82, gm83,
                gm84) %>% 
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
                                          'f+',
                                          'f',
                                          'inc')))
  

# join all info together
all_info <- base_game %>% inner_join(grades, by = 'game') %>% inner_join(gpa)
