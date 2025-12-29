-- Find the date of the first and last order
-- How many years of sales are available

SELECT 
MIN(order_date) first_order_date,
MAX(order_date) last_order_date,
DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_years,
DATEDIFF(month, MIN(order_date), MAX(order_date)) AS order_range_months
FROM [gold.fact_sales]

-- Find the youngest and the oldest customer
SELECT 
MIN(birthdate) AS oldest_birthdate,
DATEDIFF(YEAR, MIN(birthdate),GETDATE()) AS oldest_age,
MAX(birthdate) AS youngest_borthdate,
DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS yongest_age
FROM [gold.dim_customers]