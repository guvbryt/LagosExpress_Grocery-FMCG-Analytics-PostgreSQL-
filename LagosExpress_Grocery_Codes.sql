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



