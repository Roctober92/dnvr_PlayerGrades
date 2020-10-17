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

date <- c('2019-10-03', '2019-10-05')

author <- c('Rawal', 'Haefele'))

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



