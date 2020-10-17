# Date: Oct 2020
# Author: Andrew Wolfe
# Purpose: create table for input data

# set wd
setwd('~/github/dnvr_PlayerGrades/r')

# load libraries
library(pacman)
p_load(tidyverse, ggplot2)


# make lists
# game, author, player, grade, gametype, date
game <- c(1:50)

plus_minus <- c()

total_goals <- c()

date <- c('2019-10-03','2019-10-05','2019-10-10', '2019-10-12')

author <- c('Rawal','Haefele','Rawal','Rawal')

gametype <- c(rep('reg', 50))

players <- tibble(
  player = c('MacKinnon','Makar', 'Burakovsky', 'Landeskog', 'Rantenen', 'Kadri', 'Girard', 'Donskoi', 'Compher',
             'Nichuskin', 'Graves', 'Cole', 'Calvert', 'Jost', 'Bellemare', 'Nieto', 'Johnson', 'Zadorov', 'Kamenev',
             'Namestnikov', 'Wilson', 'Kaut', 'OConnor', 'Barberio', 'Rosen', 'Lindholm', 'Tynan', 'Bibeau',
             'Connauton', 'Dries', 'Francouz', 'Grubauer', 'Hutchinson', 'Megna', 'Timmins', 'Werner'),
  player_id = c(1:36)
)

gm1 <- tibble(
  game = c(rep(1, 19)),
  grade = c('c+', 'c', 'b', 'b+', 'c+', 'b-', 'c+', 'c', 'b-', 'b-', 'c-', 'b', 'b+', 'a-', 'b', 'b', 'b-', 'a', 'c'),
  player_id = c(17, 2, 13, 10, 18, 14, 35, 11, 1, 9, 15, 7, 8, 16, 6, 4, 3, 5, 32)
)

gm2 <- tibble(
  game = c(rep(2, 19)),
  grade = c('a', 'a-', 'a+', 'c+', 'b-', 'c+', 'c+', 'c', 'b-', 'c+', 'b+', 'b+', 'b+', 'b-', 'c+', 'b', 'b+', 'c-', 'b+'),
  player_id = c(4,1,5,14,6,8,16,9,3,10,15,13,7,17,18,2,11,35,32)
)

gm3 <- tibble(
  game = c(rep(3, 19)),
  grade = c('c-','c','b','d','c','b','b','b-','b-','b','b','b+','b','b-','b-','b','a-','b','a'),
  player_id = c(17,2,13,10,18,14,21,11,1,15,24,7,8,16,6,4,3,5,32)
)

gm4 <- tibble(
  game = c(rep(4,19)),
  grade = c('b','b+','d','d','d','b+','d','b-','c-','d','d','b','c+','b+','b-','c','b+','b-','b+'),
  player_id = c(17,2,13,10,18,14,21,11,1,15,24,7,8,16,6,4,3,5,31)
  
)












