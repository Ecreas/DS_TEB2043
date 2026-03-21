library(caret)

data("mtcars")



mpg_data <- mtcars$mpg
print("Original mpg data:")
print(head(mpg_data))


log_scaled <- log(mpg_data)
print("\nLog Transformed Data (first 6 values):")
print(head(log_scaled))


standard_scaled <- scale(mpg_data)
print("\nStandard Scaled Data (first 6 values):")
print(head(standard_scaled))



minmax_scaled <- preProcess(as.data.frame(mpg_data), method = c("range"))
minmax_result <- predict(minmax_scaled, as.data.frame(mpg_data))
print("\nMin-Max Scaled Data (first 6 values):")
print(head(minmax_result))


comparison_df <- data.frame(
  Original = mpg_data,
  Log_Transformed = log_scaled,
  Standard_Scaled = as.vector(standard_scaled),
  MinMax_Scaled = minmax_result$mpg_data
)

print("\nComparison of normalization methods:")
print(head(comparison_df))

print("\nSummary Statistics - Original Data:")
print(summary(mpg_data))

print("\nSummary Statistics - Log Transformation:")
print(summary(log_scaled))

print("\nSummary Statistics - Standard Scaling:")
print(summary(standard_scaled))

print("\nSummary Statistics - Min-Max Scaling:")
print(summary(minmax_result$mpg_data))


par(mfrow = c(2, 2))
hist(mpg_data, main = "Original Data", col = "lightblue", xlab = "mpg")
hist(log_scaled, main = "Log Transformation", col = "lightgreen", xlab = "log(mpg)")
hist(standard_scaled, main = "Standard Scaling", col = "lightyellow", xlab = "Z-score")
hist(minmax_result$mpg_data, main = "Min-Max Scaling", col = "lightpink", xlab = "Scaled value")
