-- Selects everything from the table
select * from retail_sales;

-- counts the number of rows in the table
select count(*) from retail_sales;

-- selects all the rows with null value
select * from retail_sales 
where 
	transactions_id is null 
    or 
    sale_date is null 
    or 
    sale_time is null 
    or 
    gender is null 
    or 
    category is null 
    or 
    quantiy is null 
    or 
    price_per_unit is null 
    or 
    cogs is null 
    or 
    total_sale is null;


-- Data Cleaning

-- Disable the safe mode
set SQL_SAFE_UPDATES = 0;

-- deleting the rows with null values
DELETE FROM retail_sales 
WHERE
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;
    
-- Enable the safe mode back on to prevent the unintensional deletion of data
set SQL_SAFE_UPDATES = 1;


-- data exploration

-- how many sales we have?
select count(*) as total_sales from retail_sales;

-- how many unique customers we have
select count(distinct customer_id) no_of_customers from retail_sales;

-- how many category
select distinct category from retail_sales;


