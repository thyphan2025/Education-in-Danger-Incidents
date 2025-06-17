# Education In Danger Incidents in War and Conflicted Areas
This project explores attacks on schools and universities in war-affected and conflict-prone regions. It analyzes the number of students affected—injured, killed, or targeted by violence including sexual assault—across various countries and regions. The project applies natural language processing (NLP) to extract sentiment and patterns from incident descriptions. Data cleaning, analysis, and visualization are conducted using Python, SQL, and R to uncover insights and trends.

# Dataset
The dataset, titled 2020–2024 Education-in-Danger Incident Data, was sourced from the Humanitarian Data Exchange (HDX). It includes records of attacks on education categorized by country, covering regions such as Afghanistan, Algeria, Angola, Armenia, Australia, Azerbaijan, Bangladesh, Belarus, Brazil, Burkina Faso, Burundi, Cameroon, Central African Republic, Chad, Chile, and many others.

Date Range: January 1, 2020 – September 15, 2024

Data Types: Nominal, ordinal, interval, and ratio

Latest Dataset Update: May 25, 2025 (https://data.humdata.org/dataset/sind-education-in-danger-monthly-news-briefs-dataset)

# Research Questions
1. How do education-related violence events change over time, and which countries or locations have the highest frequency of incidents?
2. Which specific months or times of year have the highest number of incidents?
3. Can incidents be clustered into meaningful groups based on event descriptions?
4. Which countries report the highest numbers of students attacked, injured, or killed?

# Tools and Methods for Data Analysis
1. Python – for data cleaning, EDA, and visualization
2. R – for clustering analysis using dplyr and ggplot2
3. SQL (PostgreSQL) – for querying and aggregating event data
4. NLP (Python) – for sentiment analysis using NLTK and Pandas

# Step-by-Step Breakdown
1. Cleaned and explored the dataset using Python (pandas, matplotlib) to identify trends in student attacks.
2. Conducted K-Means clustering using R to uncover patterns by region or incident type, and visualized them with ggplot2.
3. Used PostgreSQL queries to filter, join, and summarize incident data for specific countries and months.
4. Applied NLP techniques (sentiment analysis) on event descriptions to classify emotional tone and extracted keywords for further visualization in Python.


# Results
1. The number of students attacked has increased significantly over the years.
2. Based on eight numerical features, the dataset was grouped into four clusters (1–4) using K-Means, and visualized geographically using latitude and longitude.
3. Cluster 2 had the highest number of data points, while Cluster 4 had the highest number of students attacked, killed, or kidnapped.
4. I identified the top five countries with the most school attacks and similarly analyzed the top five countries for student injuries, fatalities, and the top ten for sexual violence incidents.
5. Myanmar reported the highest number of school attacks over time. Afghanistan had the highest number of student fatalities, and Nigeria recorded the highest number of student injuries.
6. January was the month with the highest number of incidents, followed by May and June.
7. Sentiment analysis using NLP on event descriptions revealed a high level of negative emotional tone associated with the incidents.
   
# Limitations
1. Further analysis is needed to develop actionable recommendations to reduce student-targeted violence in education settings.
2. Additional geographic analysis is required to understand the clustering patterns and why certain locations appear together.
4. Further investigation is required to understand the underlying factors contributing to the high numbers of student casualties reported in Myanmar, Afghanistan, and Nigeria.
5. Qualitative analysis should be conducted to explore what occurred during peak incident months like January, May, and June.




