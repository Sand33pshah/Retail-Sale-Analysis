
-- Data analysis | Bussiness key problem and answers

SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date = '2022-11-05';

-- Q2 retrieve all transactions where the category is 'clothing' ans the quantity sold is more 
-- than 4 in the month of Nov -2022

SELECT 
    *
FROM
    retail_sales
WHERE
    category = 'clothing'
        AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
        AND quantiy >= 4;

-- Q3 calculate the total_sales (total_sale) for each category

SELECT 
    category, SUM(total_sale) net_sale, COUNT(*) total_orders
FROM
    retail_sales
GROUP BY category;

-- Q4 find the average age of customers who purchased items from 'Beauty' category.

SELECT 
    category, ROUND(AVG(age), 2) avg_age
FROM
    retail_sales
WHERE
    category = 'Beauty';

-- Q5 find all transactions where the total_sale is greater than 1000.

SELECT 
    *
FROM
    retail_sales
WHERE
    total_sale > 1000;

-- Q6 find the total number of transaction (transaction_id) made by each gender in each category.

SELECT 
    category, gender, COUNT(transactions_id) total_transaction
FROM
    retail_sales
GROUP BY category , gender
ORDER BY category;

-- Q7 calculate avg sale for each month. Find out best selling month in each year
select year, month, avg_sale from 
(
	select year(sale_date) year, month(sale_date) month, round(avg(total_sale),2) avg_sale,
	rank() over(partition by year(sale_date) order by avg(total_sale) desc) ranks
	from retail_sales
	group by year, month
) as t1
where ranks = 1;

-- Q8 find the top 5 customers based on the highest total sales

SELECT 
    customer_id, SUM(total_sale) total_sale
FROM
    retail_sales
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5;

-- Q9 find the number of unique customers who purchased items from each category

SELECT 
    category, COUNT(DISTINCT customer_id) total_unique_customer
FROM
    retail_sales
GROUP BY 1;

-- Q10 create each shift and number of orders (example morning <= 12 afternoon between 12 and 17 evening > 17)

SELECT 
    shifts, COUNT(transactions_id) total_orders
FROM
    (SELECT 
        HOUR(sale_time),
            transactions_id,
            CASE
                WHEN HOUR(sale_time) <= 12 THEN 'morning'
                WHEN HOUR(sale_time) <= 17 THEN 'afternoon'
                WHEN HOUR(sale_time) > 17 THEN 'evening'
            END AS shifts
    FROM
        retail_sales) AS t1
GROUP BY shifts;