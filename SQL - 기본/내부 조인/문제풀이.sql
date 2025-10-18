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

-- 문제 2번
-- orders , customers , products 세 개의 테이블을 모두 조인해라. 
-- SHIPPED (배송) 상태인 주문에 대해 주문 ID , 고객 이름 , 상품명 , 주문 날짜 를 조회하는 SQL을 작성해라
SELECT
	o.order_id,
    c.name AS user_name,
    p.name AS product_name,
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE o.status = '주문접수';

-- 문제 3번
-- INNER JOIN 과 집계 함수를 함께 사용해서, 각 고객이 지금까지 주문한 총 구매액을 계산해라. 결과는 고객 이름
-- (user_name) 과 총 구매액(total_purchase_amount) 으로 구성되어야 하며, 총 구매액이 높은 순서대로 정렬
-- 해야 한다. ( 총 구매액 = 주문수량 * 상품가격 )
SELECT
	u.name AS user_name,
    SUM(o.quantity * p.price) AS total_purchase_amount
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN products p ON o.product_id = p.product_id
GROUP BY u.name
ORDER BY total_purchase_amount DESC;