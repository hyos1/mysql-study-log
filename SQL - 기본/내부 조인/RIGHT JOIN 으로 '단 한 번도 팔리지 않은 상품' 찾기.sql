-- RIGHT JOIN으로 '단 한 번도 팔리지 않은 상품' 찾기 
SELECT
	p.product_id,
    p.name,
    p.price,
    o.product_id,
    o.order_id
FROM orders AS o
RIGHT JOIN products AS p ON o.product_id = p.product_id;