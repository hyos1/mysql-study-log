SELECT 
	c.customer_id,
    c.name,
    o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;