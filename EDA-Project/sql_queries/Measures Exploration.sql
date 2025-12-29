 -- Find the Total Sales

SELECT SUM(sales_amount) AS total_sales FROM [gold.fact_sales]

-- Find how many items are sold

SELECT SUM(quantity) AS total_item_sold FROM [gold.fact_sales]

-- Find the average selling price

SELECT AVG(sales_amount) AS avg_sales FROM [gold.fact_sales]

-- Find the total number of orders

SELECT COUNT(order_number) AS total_order FROM [gold.fact_sales]
SELECT COUNT(DISTINCT order_number) AS unique_total_order FROM [gold.fact_sales]

-- Find the total number of Products

SELECT COUNT(product_name) AS total_product FROM [gold.dim_products]

-- Find the total number of Customers

SELECT COUNT(customer_key) AS total_customer FROM [gold.dim_customers]

-- find the total number of customers that has placed an order

SELECT COUNT(DISTINCT customer_key) AS total_customer FROM [gold.fact_sales]

-- Generate a Report that shows all key metrics of the business

SELECT 'Total Sales' as measure_name, SUM(sales_amount) AS measure_value FROM [gold.fact_sales]
UNION ALL
SELECT 'Total Quantity' as measure_name, SUM(quantity) AS measure_value FROM [gold.fact_sales]
UNION ALL
SELECT 'Average Sales' as measure_name, AVG(sales_amount) AS measure_value FROM [gold.fact_sales]
UNION ALL
SELECT 'Total Orders' as measure_name, COUNT(order_number) AS measure_value FROM [gold.fact_sales]
UNION ALL
SELECT 'Unique Total Orders' as measure_name, COUNT(DISTINCT order_number) AS measure_value FROM [gold.fact_sales]
UNION ALL
SELECT 'Total Products' as measure_name, COUNT(product_key) AS measure_value FROM [gold.dim_products]
UNION ALL
SELECT 'Total Customers' as measure_name, COUNT(customer_key) AS measure_value FROM [gold.dim_customers]
UNION ALL
SELECT 'Total Customers Placed Order' as measure_name, COUNT(DISTINCT customer_key) AS measure_value FROM [gold.fact_sales]