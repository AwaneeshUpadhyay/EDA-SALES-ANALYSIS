-- Which 5 products generate the highest revenue?

SELECT TOP 5
p.product_name,
SUM(s.sales_amount) AS Total_sales
FROM [gold.fact_sales] s
LEFT JOIN [gold.dim_products] p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY Total_sales DESC

SELECT
*
FROM (
	SELECT
	p.product_name,
	SUM(s.sales_amount) AS Total_revenue,
	ROW_NUMBER() OVER (ORDER BY SUM(s.sales_amount) DESC) AS rank_product
	FROM [gold.fact_sales] s
	LEFT JOIN [gold.dim_products] p
	ON s.product_key = p.product_key
	GROUP BY p.product_name)t
WHERE rank_product <= 5


-- What are the 5 worst-perfoming products in terms of sales?

SELECT TOP 5
p.product_name,
SUM(s.sales_amount) AS Total_sales
FROM [gold.fact_sales] s
LEFT JOIN [gold.dim_products] p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY Total_sales

-- Find the top 10 customers who have generated the highest revenue

SELECT TOP 10
c.customer_key,
c.first_name,
c.last_name,
SUM(s.sales_amount) AS Total_Revenue
FROM [gold.fact_sales] s
LEFT JOIN [gold.dim_customers] c
ON s.customer_key = c.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY Total_Revenue DESC

-- The 3 customers with the fewest order placed

SELECT TOP 3
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT s.order_number) AS Total_Revenue
FROM [gold.fact_sales] s
LEFT JOIN [gold.dim_customers] c
ON s.customer_key = c.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY Total_Revenue