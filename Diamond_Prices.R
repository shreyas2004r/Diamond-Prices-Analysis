diamonds_sample <- read.csv("C:\\Users\\gohse\\NTU\\AY24-25 Sem2\\MH3511 Data Analysis with Com\\Grp Project\\diamonds_sample.csv")

str(diamonds_sample)

price <- diamonds_sample$price
hist(price,main="Histogram of price")
logprice <- log(diamonds_sample$price)
hist(logprice,main="Histogram of log(price)")

Q1 <- quantile(logprice, 0.25)
Q3 <- quantile(logprice, 0.75)
IQR_val <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR_val

# Convert lower_bound back to price scale for explanation
exp_lower_bound <- exp(lower_bound)

# Remove diamonds with price < exp(lower_bound)
filtered_data <- diamonds_sample[logprice >= lower_bound, ]

# Report % removed
percent_removed <- (1 - nrow(filtered_data) / nrow(diamonds_sample)) * 100
cat("Removed", round(percent_removed, 2), "% of data below approx. $", round(exp_lower_bound, 2), "\n")

# Optional: Plot cleaned data
filtered_data$logprice <- log(filtered_data$price)
hist(filtered_data$logprice, main = "Histogram after removing lower outliers")
boxplot(filtered_data$logprice, main = "Boxplot after removing lower outliers", col = "lightgray")
filtered_data

summary(filtered_data$logprice)

hist(filtered_data$carat,main="histogram of carat")
boxplot(filtered_data$carat)

# Extract carat column
carat <- filtered_data$carat

# Compute IQR for carat
Q1_carat <- quantile(carat, 0.25)
Q3_carat <- quantile(carat, 0.75)
IQR_carat <- Q3_carat - Q1_carat

# Define upper bound only (keep lower values, remove upper outliers)
upper_bound <- Q3_carat + 1.5 * IQR_carat

# Filter the data to keep only carat values below or equal to upper bound
filtered_data <- filtered_data[filtered_data$carat <= upper_bound, ]

hist(filtered_data$carat)
# Optional: Boxplot to confirm outliers are removed
boxplot(filtered_data$carat,
        main = "Carat (After Removing Upper Outliers)",
        col = "lightgray")

barplot(table(filtered_data$cut),
        main = "Barplot of Diamond Cut",
        xlab = "Cut",
        ylab = "Count",
        col = "lightblue")

barplot(table(filtered_data$color),
        main = "Barplot of Diamond Color",
        xlab = "Color",
        ylab = "Count",
        col = "lightblue")

barplot(table(filtered_data$clarity),
        main = "Barplot of Diamond Clarity",
        xlab = "Clarity",
        ylab = "Count",
        col = "lightblue")

hist(filtered_data$depth)
boxplot(filtered_data$depth)

# Extract depth
depth <- filtered_data$depth

# Compute IQR and bounds
Q1 <- quantile(depth, 0.25)
Q3 <- quantile(depth, 0.75)
IQR_val <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR_val
upper_bound <- Q3 + 1.5 * IQR_val

# Filter the data: keep only rows within the bounds
filtered_data <- filtered_data[depth >= lower_bound & depth <= upper_bound, ]

# Optional: Check boxplot after removing outliers
boxplot(filtered_data$depth,
        main = "Depth (After Removing Outliers)",
        col = "lightgray")

hist(filtered_data$table)
boxplot(filtered_data$table)

# Extract the 'table' column
table <- filtered_data$table

# Calculate IQR and upper bound
Q1 <- quantile(table, 0.25)
Q3 <- quantile(table, 0.75)
IQR_val <- Q3 - Q1
upper_bound <- Q3 + 1.5 * IQR_val

# Filter to remove upper outliers
filtered_data <- filtered_data[table <= upper_bound, ]

# Optional: Confirm with a new boxplot
boxplot(filtered_data$table,
        main = "Table (After Removing Upper Outliers)",
        col = "lightgray")

hist(filtered_data$x)
boxplot(filtered_data$x)
hist(filtered_data$y)


# Extract x values
x_vals <- filtered_data$x

# Calculate IQR and bounds
Q1 <- quantile(x_vals, 0.25)
Q3 <- quantile(x_vals, 0.75)
IQR_val <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR_val
upper_bound <- Q3 + 1.5 * IQR_val

# Filter the data to keep values within bounds
filtered_data <- filtered_data[x_vals >= lower_bound & x_vals <= upper_bound, ]

# Optional: Boxplot to confirm outliers are removed
boxplot(filtered_data$x,
        main = "X (After Removing Outliers)",
        col = "lightgray")

hist(filtered_data$y)
boxplot(filtered_data$y,main="boxplot for Y")

hist(filtered_data$z)
boxplot(filtered_data$z)

# Extract z values
z_vals <- filtered_data$z

# Compute IQR and bounds
Q1 <- quantile(z_vals, 0.25)
Q3 <- quantile(z_vals, 0.75)
IQR_val <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR_val
upper_bound <- Q3 + 1.5 * IQR_val

# Filter to keep values within the acceptable IQR range
filtered_data <- filtered_data[z_vals >= lower_bound & z_vals <= upper_bound, ]

# Optional: Confirm removal with a new boxplot
boxplot(filtered_data$z,
        main = "Z (After Removing Outliers)",
        col = "lightgray")

filtered_data




#------------------------------------------------------------------------------------------------------------------------

data<-filtered_data

#q-test
install.packages("outliers")
library(outliers)

q_outliers <- scores(data$logprice, type = "t")
print(q_outliers)

boxplot(q_outliers)






#Analysis of categorical attributes ----------------------------------------------------------------------------------------------------------
install.packages("car")
library(car)

leveneTest(logprice ~ cut, data = data)
leveneTest(logprice ~ clarity, data = data)
leveneTest(logprice ~ color, data = data)




#Welch's anova
oneway.test(logprice ~ cut, data = data)
oneway.test(logprice ~ color, data = data)
oneway.test(logprice ~ clarity, data = data)




#chi-sq test
chisq.test(table(data$cut, data$color))
chisq.test(table(data$cut, data$clarity))
chisq.test(table(data$color, data$clarity))

#post-hoc

install.packages("rstatix")
install.packages("ggpubr")

library(rstatix)
library(ggpubr)
library(dplyr) 

cut_posthoc <- data %>%
  games_howell_test(logprice ~ cut)
print(cut_posthoc)

color_posthoc <- data %>%
  games_howell_test(logprice ~ color)
print(color_posthoc, n = 22)

clarity_posthoc <- data %>%
  games_howell_test(logprice ~ clarity)
print(clarity_posthoc, n = 29)

#---------------------------------------------------------------------------------------------------------------------------------


#Analysis of Numerical attributes

#Pearson corelation coefficient 
cor_matrix <- cor(data[, c("price", "carat", "depth", "table", "x", "y", "z")], use = "complete.obs")
print(cor_matrix)

cor.test(data$price, data$carat)
cor.test(data$price, data$depth)
cor.test(data$price, data$table)
cor.test(data$price, data$x)
cor.test(data$price, data$y)
cor.test(data$price, data$z)


install.packages("ggcorrplot")
library(ggcorrplot)

# Compute correlation matrix
cor_matrix <- cor(data[, c("price", "carat", "depth", "table","x","y","z")], use = "complete.obs")

# Plot heatmap
ggcorrplot(cor_matrix, method = "circle", type = "lower",
           lab = TRUE, title = "Correlation Heatmap",
           colors = c("red", "yellow", "green"))



#multiple linear reg
model <- lm(price ~ carat + depth + table + x + y + z, data = data)
summary(model)

#-------------------------------------------------------------
# Single-variable Linear regression for "Carat"
model_carat <- lm(log(price) ~ carat, data = data)
model_carat
summary(model_carat)

#Scatter plot "Carat"
ggplot(data, aes(carat, log(price))) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE)

# QQ Plot for "Carat"
residuals_carat <- residuals(model_carat)
qqnorm(residuals_carat, main = "QQ-Plot of Residuals")
qqline(residuals_carat, col='red')
#-------------------------------------------------------------
# Single-variable Linear regression for "Depth"
model_depth <- lm(log(price) ~ depth, data = data)
model_depth
summary(model_depth)

#Scatter plot "Depth"
ggplot(data, aes(depth, log(price))) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE)

# QQ Plot for "Depth"
residuals_depth <- residuals(model_depth)
qqnorm(residuals_depth, main = "QQ-Plot of Residuals")
qqline(residuals_depth, col='red')
#--------------------------------------------------------------
# Single-variable Linear regression for "Table"
model_table <- lm(log(price) ~ table, data = data)
model_table
summary(model_table)

#Scatter plot "Table"
ggplot(data, aes(table, log(price))) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE)

# QQ Plot for "Table"
residuals_table <- residuals(model_table)
qqnorm(residuals_table, main = "QQ-Plot of Residuals")
qqline(residuals_table, col='red')


