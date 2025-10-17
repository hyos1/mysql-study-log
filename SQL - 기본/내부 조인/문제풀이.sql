-- 문제 1번
-- orders와 products를 Join하여 
-- 주문 ID, 상품명, 주문 수량을 order_id 기준 오름차순으로 정렬하라 
SELECT 
	o.order_id,
    p.name,
    o.quantity
FROM orders o
JOIN products p ON o.product_id = p.product_id
ORDER BY o.order_id;