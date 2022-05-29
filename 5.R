GTL <- read.csv("GTL.csv")
head(GTL)

str(GTL)

#A
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

#B
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

#C
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

#D
tukey <- TukeyHSD(anova)
print(tukey)

#E
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)