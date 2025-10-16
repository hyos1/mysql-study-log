SELECT 
	o.order_id,
    o.order_date,
    o.customer_id AS orders_user_id,
    c.customer_id AS users_user_id,
    c.name
FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_id;