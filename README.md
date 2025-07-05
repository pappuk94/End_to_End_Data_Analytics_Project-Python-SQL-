# End to End Data Analytics Project (Python + SQL)

[Click Here to get Dataset](https://www.kaggle.com/datasets/ankitbansal06/retail-orders)

![Orders Logo](https://github.com/pappuk94/End_to_End_Data_Analytics_Project-Python-SQL-/blob/main/orders.jpg)

## Overview
This project showcases a complete data analytics workflow—from data acquisition to insight generation. The dataset was programmatically downloaded using the Kaggle API, followed by comprehensive data cleaning and preprocessing in Python. After transforming the data into a structured format, it was loaded into a MySQL database for efficient querying. Finally, SQL was used to perform in-depth data analysis, uncovering key trends and actionable insights.

## Project Steps

### 1. Data Exploration
The dataset contains attributes such as:
- `Order ID`: Attribute which uniquely identifies the order.
- `Order Date`: The date on which order has been placed.
- `Category`: The category under which order falls into.
- `Country`: 
- Various metrics such as `cost price`, `list price`, `quantity`, `discount percent`, and more.

### 2. EDA and Data Cleaning
After the data is inserted, EDA has been performed and tried to explore various aspects of the data like null values, duplicates. The data has been cleaned based on the EDA performed like adding new columns, changing data-type of order date column, replacing certain string values to new one and many more.

### 3. Loading the data to MYSQL Database
- The cleaned data then loaded to MYSQL database uning SQLAlchemy in python.
  
### 4. Data Analysis in SQL
- After the data has been loaded to MYSQL a thourough analysis has been performed and intended to generate various actionable insights from the data using **SQL**.
  
## 6 Practice Questions
1. Find top 10 highest revenue generating products.
2. Find top 5 highest selling product in each region.
3. Find month over month growth comparision for 2020 and 2023 sales, e.g. jan 2022 vs jan 2023.
4. Find which month has highest sales for each category.
5. Which sub-category has highest growth by profit in 2023 compare to 2022.
6. Find what percent of total quantity is contributed by each sub-category within each category.
