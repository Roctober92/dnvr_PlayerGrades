source('data_wrangle.R')

#### data overview
# overall grade distribution?
all_info %>% 
  count(grade) %>% 
  ggplot(aes(grade, n, fill = grade)) + 
  geom_histogram(stat = 'identity') +
  labs(y = 'Frequency',
       x = 'Grade',
       title = 'Frequency of Use per Grade',
       subtitle = 'Grades by DNVR Avs',
       caption = 'Wolfe') +
  theme(legend.position = "none",
        plot.title = element_text(size = rel(1.5), hjust = .5),
        axis.title.x = element_text(size = rel(1.5)),
        axis.title.y = element_text(size = rel(1.5)),
        axis.text.x = element_text(size = rel(1.5)),
        axis.text.y = element_text(size = rel(1.5)))

#### Plus-Minus
# grade distribution over time?
all_info %>% 
  mutate(month = month(date, label = TRUE)) %>% 
  count(grade, month) %>% 
  inner_join(record) %>% 
  mutate(record = factor(record, levels = c('Oct 8-4',
                                          'Nov 8-6',
                                          'Dec 7-6',
                                          'Jan 5-4',
                                          'Feb 11-3',
                                          'Mar 3-3',
                                          'Aug 6-5',
                                          'Sep 2-0'))) %>% 
  ggplot(aes(grade, n, fill = grade)) + geom_histogram(stat = 'identity') + facet_wrap(~record)

# grade distribution per +/-?
all_info %>% count(grade, plus_minus) %>% ggplot(aes(grade, n, fill = grade)) + geom_histogram(stat = 'identity') + facet_wrap(~plus_minus)

# gpa per +/-
all_info %>% 
  group_by(plus_minus) %>% 
  summarise(gpa = mean(gpa, na.rm = TRUE),
            count = n()) %>% 
  ggplot(aes(plus_minus,gpa, fill = count)) + geom_bar(stat = 'identity')

# game plus-minus by players
all_info %>% 
  group_by(player) %>% 
  summarise(plus_minusgame = sum(plus_minus),
            games = n()) %>% 
  ungroup() %>% 
  mutate(value = plus_minusgame/games) %>% 
  ggplot(aes(reorder(player, value), value)) +
  geom_bar(stat = 'identity') + 
  theme(axis.text.x = element_text(angle = 90))

# plus-minus, num_goals
goals %>% ggplot(aes(num_goals, plus_minus)) + geom_point(size = 3)



#### Per player

# grade distribution per player?
all_info %>% count(grade, player) %>% ggplot(aes(grade, n, fill = grade)) + geom_histogram(stat = 'identity') + facet_wrap(~player)

# grade distribution per position
all_info %>% count(grade, position) %>% ggplot(aes(grade, n, fill = grade)) + geom_histogram(stat = 'identity') + facet_wrap(~position)

# GPA per player
all_info %>% 
  group_by(player) %>% 
  summarise(gpa = mean(gpa, na.rm = TRUE),
            games_played = n()) %>% 
  ggplot(aes(reorder(player, gpa), gpa, fill=games_played)) + 
  geom_bar(stat = 'identity') + 
  theme(axis.text.x = element_text(angle = 90))


#### half grades
# who tended to have more half-grades?
all_info %>% 
  mutate(positive = str_detect(grade, '\\+'),
         negative = str_detect(grade, '\\-'),
         half_grade = ifelse(positive == TRUE | negative == TRUE, 'yes', 'no')) %>% 
  count(player, half_grade, position) %>% 
  ggplot(aes(player, n, fill = half_grade)) + 
  geom_bar(position = 'dodge', stat = 'identity') + 
  facet_wrap(~position, nrow = 3) + 
  theme(axis.text.x = element_text(angle = 90))

# what are half/whole grade trends as season goes on?
all_info %>% 
  mutate(positive = str_detect(grade, '\\+'),
         negative = str_detect(grade, '\\-'),
         half_grade = ifelse(positive == TRUE | negative == TRUE, 'yes', 'no'),
         month = month(date, label = TRUE),
         month = factor(month, levels = c('Oct',
                                          'Nov',
                                          'Dec',
                                          'Jan',
                                          'Feb',
                                          'Mar',
                                          'Aug',
                                          'Sep'))) %>%
  count(month, half_grade) %>% 
  ggplot(aes(month, n, fill = half_grade)) + geom_bar(position = 'dodge', stat = 'identity')



#### goals scored

# grade distribution ~ goals scored?
all_info %>% count(grade, num_goals) %>% ggplot(aes(grade, n, fill = grade)) + geom_histogram(stat = 'identity') + facet_wrap(~num_goals)

# GPA per goals scored
all_info %>% 
  group_by(num_goals) %>% 
  summarise(gpa = mean(gpa, na.rm = TRUE),
            games_played = n()) %>% 
  ggplot(aes(num_goals, gpa, fill=games_played)) + 
  geom_bar(stat = 'identity') + 
  theme(axis.text.x = element_text(angle = 45))

