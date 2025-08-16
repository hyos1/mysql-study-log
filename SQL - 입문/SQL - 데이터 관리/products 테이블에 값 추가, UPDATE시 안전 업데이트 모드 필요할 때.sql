-- products 테이블에 상품 등록
INSERT INTO products (name, price, stock_quantity)
VALUES ('베이직 반팔 티셔츠', 19900, 200);
INSERT INTO products (name, price, stock_quantity)
VALUES ('초록색 긴팔 티셔츠', 30000, 50);

-- product_id가 1인 상품의 가격, 수량 변경
UPDATE products
SET price = 9800, stock_quantity = 500
WHERE product_id = 1;

-- id가 아닌 해당하는 컬럼의 모든변경 전 좋은 습관
-- 1단계: 변경할 대상을 먼저 확인
SELECT * FROM products
WHERE name = '베이직 반팔 티셔츠';

-- 2단계 확인된 대상에 대해서만 UPDATE 실행한다.
SET SQL_SAFE_UPDATES = 0;

UPDATE products
SET price = 19800
WHERE name = '베이직 반팔 티셔츠'

SET SQL_SAFE_UPDATES = 1;