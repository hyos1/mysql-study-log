-- CONCAT() 함수로 고객 이름과 이메일 합치기
SELECT concat(name, ' (', email, ')') FROM customers;

-- CONCAT_WS 함수로 고객 이름과 이메일 합치기
SELECT CONCAT_WS(' - ', name, email) FROM customers;

-- IFNULL함수로 DEFAULT값 확인해보기
SELECT
    name,
    IFNULL(description, '상품 설명 없음') AS description
FROM products;