library(corrplot)

data("ToothGrowth")
head(ToothGrowth)

tooth_numeric <- ToothGrowth
tooth_numeric$supp <- as.numeric(tooth_numeric$supp)  


cor_matrix <- round(cor(tooth_numeric), 3)
print("Correlation Matrix:")
print(cor_matrix)




corrplot(cor_matrix, 
         method = "color", 
         type = "upper",
         order = "hclust",
         addCoef.col = "black",
         tl.col = "black",
         tl.srt = 45,
         title = "ToothGrowth Correlation Heatmap",
         mar = c(0, 0, 2, 0))

