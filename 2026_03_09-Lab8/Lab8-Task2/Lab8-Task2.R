data(women)
head(women)

summary(women)

plot(women$height, women$weight,
     main ="Heigh and Weight of Women",
     xlab = "Height (inches)",
     ylab = "Weight (lbs)"
)

women$height_category <- cut(women$height, breaks = seq(55,75, by =2))

mean_weight <- aggregate(weight ~ height_category,
                         data = women,
                         FUN = mean
)

barplot(mean_weight$weight,
        names.arg = mean_weight$height_category,
        main = "Mean Weight by Height",
        xlab = "Height (inches)",
        ylab = "Mean Weight (lbs)")
