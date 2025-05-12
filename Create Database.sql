-- creating data base
create database retail_sale_analysis;

-- creating table and specifying various columns of the table
create table retail_sales(
	transactions_id	int primary key,
    sale_date date,
    sale_time time,
    customer_id	int,
    gender varchar(15),
    age int,
    category varchar(15),
    quantiy	int,
    price_per_unit float,
	cogs float,	
    total_sale float
);



















