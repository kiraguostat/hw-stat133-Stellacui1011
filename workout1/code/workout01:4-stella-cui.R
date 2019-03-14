###4.1 Shot Charts
###################################################################################################
#title: Make Shots Charts Script
#description: visualize the cleaned and well prepared data for players
#input: nba-court.jpg, shots-data.csv
#output: andre-iguodala-shot-chart.pdf, draymond-green-shot-chart.pdf, kevin-durant-shot-chart.pdf, klay-thompson-shot-chart.pdf, stephen-curry-shot-chart.pdf, stephen-curry-shot-chart.pdf,gsw-shot-charts.pdf, gsw-shot-charts.png
###################################################################################################
library(ggplot2)
install.packages("jpeg")
library(jpeg)
library(dplyr)
library(grid)

data_types = c("team_name"="character", "game_date"="character", "season" = "integer", "period"="integer",
               "minutes_remaining"="integer", "seconds_remaining"="integer", "shot_made_flag"="character",
               "action_type"="factor", "shot_type"="factor", "shot_distance"="integer", "opponent"="character",
               "x"="integer", "y"="integer")

Court_File = '../images/nba-court.jpg'
Court_Image = rasterGrob(readJPEG(Court_File), width=unit(1,'npc'),height=unit(1,'npc'))
Player_Shots = read.csv('../data/Player_Shots-data.csv', stringsAsFactors = FALSE, colClasses = data_types)

andre = Player_Shots[Player_Shots$name == 'Andre Iguodala', ]
draymond = Player_Shots[Player_Shots$name == 'Draymond Green', ]
kevin = Player_Shots[Player_Shots$name == 'Kevin Durant',]
klay = Player_Shots[shots$name == 'Klay Thompson', ]
stephen = shots[shots$name == 'Stephen Curry', ]

andre_shot_chart = ggplot(data = andre)+annotation_custom(Court_Image, -250, 250, -50, 420)+ geom_point(aes(x=x, y=y, color=shot_made_flag))+
  ggtitle('Shot Chart: Andre Iguodala (2016 season)')+theme_minimal()

pdf("../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
andre_shot_chart
dev.off()

draymond_shot_chart = ggplot(data = draymond)+annotation_custom(Court_Image, -250, 250, -50, 420)+ geom_point(aes(x=x, y=y, color=shot_made_flag))+
  ggtitle('Shot Chart: Draymond Green (2016 season)')+theme_minimal()

pdf("../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
draymond_shot_chart
dev.off()

kevin_shot_chart = ggplot(data = kevin)+annotation_custom(Court_Image, -250, 250, -50, 420)+ geom_point(aes(x=x, y=y, color=shot_made_flag))+
  ggtitle('Shot Chart: Kevin Durant (2016 season)')+theme_minimal()

pdf("../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
kevin_shot_chart
dev.off()

klay_shot_chart = ggplot(data = klay)+annotation_custom(Court_Image, -250, 250, -50, 420)+ geom_point(aes(x=x, y=y, color=shot_made_flag))+
  ggtitle('Shot Chart: Klay Thompson (2016 season)')+theme_minimal()

pdf("../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
klay_shot_chart
dev.off()

stephen_shot_chart = ggplot(data = stephen)+annotation_custom(Court_Image, -250, 250, -50, 420)+ geom_point(aes(x=x, y=y, color=shot_made_flag))+
  ggtitle('Shot Chart: Stephen Curry (2016 season)')+theme_minimal()

pdf("../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
stephen_shot_chart
dev.off()

gsw_shot_charts = ggplot(data=shots)+annotation_custom(Court_Image, -250, 250, -50, 420)+ geom_point(aes(x=x, y=y, color=shot_made_flag))+
  ggtitle('Shot Chart: GSW (2016 season)')+theme_minimal()+facet_wrap(~name, ncol=3)

pdf('../images/gsw-shot-charts.pdf', width=8,height=7)
gsw_shot_charts
dev.off()

png('../images/gsw-shot-charts.png', width=8,height=7, units="in", res = 72)
gsw_shot_charts
dev.off()


####5.1 Report
###################################################################################################
#title: Make Shots Data Script
#description: aggregate player data
#input: stephen-curry.csv, klay-thompson.csv, kevin-durant.csv, draymond-green.csv, andre-iguodala.csv
#output: aggregated csv data file of player data 
###################################################################################################
Here is my Report on GSW in their 2016-2017 season. They won the Champion in 2016 with dominating stats and games. Worth to mention, this is Kevin Durant's first season at GSW, and it is also his first Championship throughout his NBA Career. Also He is the FMVP of this Championship. With all the blames and hatred on Kevin Durant's decision to come join GSW, he has shown the world that he needed this Championship ring and now he gets it and he deserves it.

Excitement, Cheer, Madness roam across bay area. We have shown every other states how GSW fights and how GSW wins. After the excitement, let's settle down and dig deeper into the stats and find out why exactly is GSW so unstoppable on its offensive end. And most importantly, what has Kevin Durant bring to the table.

It is well known that GSW is the strongest shooting team in NBA right now. I will focus on five main scorer: KD, Andre, Klay, Curry, Green. Four of them is from the starting line up, and Andre Iguodala is the 6th man/sub. GSW has broken several 3 points record, lets first look at the second chart - 3PT Effective Shooting % by Player. Klay with the highest percentage 42% stands at the top of the table; Along with Klay is our Curry - 40%. Curry and Klay are the main 3 point shooters on the team, and GSW had won so many games where they are far behind on the score board, making a huge comeback by putting 3s in the bucket. Curry and Klay has made 600+ three points attempt in the season, and this is an insane ammount of threes. This shows how GSW values their offensive strategies' on shooting three points. Curry is always the leading 3 point shooter in the league, and Klay has been stable with his three point shots for a period now. What is shocking in this table is Kevin Durant. KD can defintely shoot threes, but not like this 38%! Now we can see all three superstar player, Klay, Curry, KD all has a three point average around 40%. This is an overwhelming effectiveness along the three point line. This stats is telling every opponents that you cannot slack off in your defense, because if you do, I am going to score a three point in your face. This was how much pressure GSW is forcing their opponents on the defensive side.

After talking about 3 points, lets go back to 2 points, and look at the first table - 2PT Effective Shooting % by Player. 5 player has 2 pt shooting percentage from 50-60%. Andre Iguodala, the 6th man, owns a 63% 2 pt effective shooting. He also has a 36% in 3p shooting as well. This is another important factor on why GSW is unstoppable on its offensive end. Iguodala can steadly put buckets in(scoring) while 1 or 2 starting lineup take a rest on the bench. This means GSW has no gap in its offensive rythm. Unlike other teams may have an offensive break or weakness when their starting line up is off the court, GSW rotates KD, Curry, Klay, and Andre to make sure there are always two best scorer on the court to maintain the offensive pressure on the opponents.