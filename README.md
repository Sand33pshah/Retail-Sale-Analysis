# Retail Sale Analysis

This repository contains a complete SQL-based analysis pipeline for retail sales data, from raw CSV ingestion and data cleaning, to business-focused exploration and insights.

## What You Can Learn

- **Data Cleaning:** How to preprocess and sanitize raw retail sales data for analysis.
- **Exploratory Data Analysis:** Techniques to explore trends, missing values, and key metrics in sales data.
- **Business Insights:** SQL queries to extract valuable information such as top-selling products, trends over time, and performance by location or category.

## Repository Contents

- **data.csv**  
  The raw dataset containing transaction-level retail sales data.

- **Create Database.sql**  
  Script to create the database and tables for loading the data.

- **Cleaning and Exploration.sql**  
  SQL queries for data cleaning, handling nulls, and basic exploration.

- **Business Analysis.sql**  
  Advanced SQL analysis for uncovering business trends and generating actionable insights.

## Quick Start: Loading & Exploring the Data

Below is a sample workflow for getting started with this dataset and extracting key information:

```sql
-- 1. Load the CSV into your SQL database (example for MySQL)
LOAD DATA INFILE 'path/to/data.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 2. Select all records from the sales table
SELECT * FROM sales;

-- 3. Count the number of entries with NULL values in each column
SELECT
  SUM(CASE WHEN column1 IS NULL THEN 1 ELSE 0 END) AS null_count_column1,
  SUM(CASE WHEN column2 IS NULL THEN 1 ELSE 0 END) AS null_count_column2,
  -- Add more columns as needed
  COUNT(*) AS total_rows
FROM sales;
```

## How to Use This Repo

1. **Set up your database:** Use `Create Database.sql` to create the necessary schema.
2. **Import the data:** Load `data.csv` into your SQL database.
3. **Clean & explore:** Run queries from `Cleaning and Exploration.sql` to clean and understand your data.
4. **Analyze:** Use `Business Analysis.sql` to generate actionable business insights.

---

Explore this repo to learn practical SQL skills for retail data analysis and unlock insights into sales performance!
