-- 문제1: products 테이블의 모든 상품에 대해 15% 할인된 가격을 계산하고, sale_price 라는 별칭으로 출력하라. 상품의
-- 이름, 원래 가격( price ), 그리고 할인가( sale_price )를 함께 조회해야 한다.
SELECT 
	name,
    price,
    (price * 0.85) AS self_price 
FROM products;

-- 문제2: customers 테이블을 사용하여, 각 고객의 이름과 주소를 CONCAT_WS() 함수를 이용해 ' - ' 로 연결하라. 결과
-- 컬럼의 별칭은 customer_info 로 지정한다.
SELECT
	CONCAT_WS(' - ', name, address) AS customer_info
FROM customers;

-- 문제3: products 테이블에서 상품 설명( description )이 없는( NULL ) 상품은, 상품 이름( name )을 대신 설명으로 사용
-- 하도록 조회하라. COALESCE() 함수를 사용하고, 결과 컬럼의 별칭은 product_display_info 로 지정한다. 상
-- 품의 원래 이름과 최종적으로 표시될 정보를 함께 출력하라.
SELECT
	name,
	COALESCE(description, name) AS product_display_info
FROM products;