Q1. Total amount each customer spent (JOIN): Insight:

SELECT 
    c.customer_name,
    SUM(p.price * s.quantity) AS total_spent
FROM 
   sales s
JOIN 
   customers c 
ON s.customer_id = c.customer_id
JOIN 
   products p 
ON s.product_id = p.product_id
GROUP BY 
      c.customer_name
ORDER BY 
       total_spent DESC;


Q2. Find all customers, even those without purchases (LEFT JOIN):

SELECT 
    c.customer_name,
    s.sale_id
FROM 
   customers c
LEFT JOIN 
      sales s 
ON c.customer_id = s.customer_id
ORDER BY 
      c.customer_name;


Q3. Find all products and their sales, even if not sold (RIGHT JOIN): Insight:

SELECT 
    p.product_name,
    s.quantity
FROM 
   sales s
RIGHT JOIN 
       products p 
ON s.product_id = p.product_id
ORDER BY 
      p.product_name;


Q4. Total sales revenue per category (AGGREGATION):

SELECT 
    p.category,
    SUM(p.price * s.quantity) AS total_revenue
FROM 
    sales s
JOIN 
   products p 
ON s.product_id = p.product_id
GROUP BY 
      p.category
ORDER BY 
     total_revenue DESC;


Q5. Monthly sales totals for 2025 (DATE FUNCTION):

SELECT 
    DATE_TRUNC('month', sale_date) AS month,
    SUM(p.price * s.quantity) AS monthly_revenue
FROM 
   sales s
JOIN 
   products p 
ON s.product_id = p.product_id
WHERE 
    sale_date 
	      BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY 
      month
ORDER BY 
       monthly_revenue DESC;


Q6. Use CASE STATEMENT to classify customers based on spending.

	SELECT 
    c.customer_name,
    SUM(p.price * s.quantity) AS total_spent,
    CASE
        WHEN SUM(p.price * s.quantity) > 3000 THEN 'Premium'
        WHEN SUM(p.price * s.quantity) BETWEEN 1500 AND 3000 THEN 'Regular'
        ELSE 'Low Value'
    END AS customer_segment
FROM 
   sales s
JOIN 
   customers c 
ON s.customer_id = c.customer_id
JOIN 
   products p 
ON s.product_id = p.product_id
GROUP BY 
      c.customer_name
ORDER BY 
       total_spent DESC;


Q7. Use WITH STATEMENT to find the best-performing region.

	WITH region_sales AS (
    SELECT 
        r.region_name,
        SUM(p.price * s.quantity) AS total_sales
    FROM 
	   sales s
    JOIN 
	   customers c 
	ON s.customer_id = c.customer_id
    JOIN 
	   regions r 
	ON c.region_id = r.region_id
    JOIN 
	   products p 
	ON s.product_id = p.product_id
    GROUP BY 
	     r.region_name
)
SELECT * 
FROM 
    region_sales
ORDER BY 
     total_sales DESC;


Q8. Use UNION to list both product categories and customer regions (as a combined
business domain list).

	SELECT 
    category AS name 
FROM 
   products
UNION
SELECT 
    region_name AS name 
FROM 
    regions
ORDER BY 
      name;


Q9. Use Logical Operators (AND/OR) to find sales of beverages above ₦1,000.

SELECT 
    c.customer_name,
    p.product_name,
    p.category,
    s.quantity,
    p.price * s.quantity AS total_value
FROM 
   sales s
JOIN 
  customers c 
ON s.customer_id = c.customer_id
JOIN 
   products p 
ON s.product_id = p.product_id
WHERE 
    p.category = 'Beverages' AND (p.price * s.quantity) > 1000;


