# Set the working directory to Desktop
setwd("~/Desktop")

# Verify the working directory
getwd()

# Set working directory to Desktop on Windows
setwd("/Users/tampham/Desktop/AIT 580")

# load the dataset to R
install.packages("readxl")
library(readxl)
data <- read_excel("cleaned_education_in_danger.xlsx")
str(data)  # Displays column names, data types, and a preview of values
summary(data)  # Provides a summary for each column (mean, median, etc. for numeric data)
head(data)
# Load necessary libaries
library(readxl)
library(ggplot2)

# Mapping ordinal geo precsion levels to a range of number in order of location exactness
geo_precision_mapping <- c(
  "censored" = 7,
  "censored by HDX" = 7,  # Handle both types of censored entries
  "(2) 25 km Precision" = 2,
  "(3) District, Communicipality or Commune" = 3,
  "(4) Province, State, Governorate" = 4,
  "(5) Linear Feature e.g. Along Road/River" = 5,
  "(6) Country" = 6
)

# print updated data
print(geo_precision_mapping)

# Very data has been mapping correctly and clean data
unique(data$`Geo Precision`)
data$`Geo Precision` <- trimws(data$`Geo Precision`) # remove leading/trailing space
data$`Geo Precision`[data$`Geo Precision` == "censored by HDX"] <- "censored" 
unique(data$`Geo Precision`)
# Convert the ordinal data to numeric
data$Geo_Precision_Ordinal <- as.numeric(geo_precision_mapping[data$`Geo Precision`])
print(data$Geo_Precision_Ordinal)

# Analyze the frequency and percentage distributions
geo_precision_freq <- table(data$Geo_Precision_Ordinal)
geo_precision_percent <- prop.table(geo_precision_freq) * 100

# Combine frequency and percentage into a data frame
geo_precision_analysis <- data.frame(
  Geo_Precision_Level = as.numeric(names(geo_precision_freq)),
  Frequency = as.vector(geo_precision_freq),
  Percentage = as.vector(geo_precision_percent)
)

# Print the analysis
print(geo_precision_analysis)

# Plot
ggplot(geo_precision_analysis, aes(x = Geo_Precision_Level, y = Frequency, fill = as.factor(Geo_Precision_Level))) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Frequency), vjust = -0.5) +  # Add data values above the bars
  scale_fill_manual(values = c("purple", "red", "yellow", "blue", "green","pink")) +
  labs(
    title = "Distribution of Geo Precision Levels",
    x = "Geo Precision Level",
    y = "Frequency",
    fill = "Precision Level"
  ) +
  theme_minimal()

# select numerical data for clustering
install.packages("dplyr")
library(dplyr)
numerical_columns <- data %>% select(
  Latitude, Longitude, `Students Attacked in School`, `Students Killed`, 
  `Students Injured`, `Students Kidnapped`, `Students Arrested`, 
  `Sexual Violence Affecting School Age Children`
)
# View the selected numerical data
head(numerical_columns)
summary(numerical_columns)
# Keep 0 in students attacked in school, students killed, student injured, kidnapped, arrested, Sexual Violence
# Not keep 0 in Latitude and Longtitude => I will replace them with their mean respectively
numerical_columns <- numerical_columns %>%
  mutate(
    Latitude = ifelse(Latitude == 0, mean(Latitude, na.rm = TRUE), Latitude),
    Longitude = ifelse(Longitude == 0, mean(Longitude, na.rm = TRUE), Longitude)
  )

# Standardize the data
scaled_data <- scale(numerical_columns)
# Inspect the standardized data
summary(scaled_data)

# Perform k-means clustering with 4 clusters
set.seed(44) # For reproducibility
kmeans_result <- kmeans(scaled_data, centers = 4)

# Add the cluster labels to the numerical data
numerical_data_with_clusters <- numerical_columns %>%
mutate(Cluster = as.factor(kmeans_result$cluster))
# View the updated numerical data with clusters
print(numerical_data_with_clusters)

# Visualization: Geographical Distribution of Clusters
ggplot(numerical_data_with_clusters, aes(x = Longitude, y = Latitude, color = Cluster)) +
  geom_point(size = 2, alpha = 0.7) +
  theme_minimal() +
  labs(title = "Geographical Distribution of Clusters",
       x = "Longitude", y = "Latitude", color = "Cluster")

# Summarize the data by cluster
summary_by_cluster <- numerical_data_with_clusters %>%
  group_by(Cluster) %>%
  summarise(
    Count = n(),  # Number of data points in each cluster
    Avg_Latitude = mean(Latitude, na.rm = TRUE),
    Avg_Longitude = mean(Longitude, na.rm = TRUE),
  Max_Students_Attacked = max(`Students Attacked in School`, na.rm = TRUE),
    Max_Students_Killed = max(`Students Killed`, na.rm = TRUE),
    Max_Students_Injured = max(`Students Injured`, na.rm = TRUE),
    Max_Students_Kidnapped = max(`Students Kidnapped`, na.rm = TRUE),
    Max_Students_Arrested = max(`Students Arrested`, na.rm = TRUE),
    Max_Sexual_Violence = max(`Sexual Violence Affecting School Age Children`, na.rm = TRUE)
  )
# Display the summary
print(summary_by_cluster)
›# summary statistic for numerica; data with cluster
summary(numerical_data_with_clusters)
