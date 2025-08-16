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

-- 문제4: products 테이블에 description (상품 설명) 컬럼과 name (상품명) 컬럼이 있다. 상품 정보를 표시할 때, 
-- description 값이 존재하면 그 값을 사용하고, description 이 NULL 이면 name 값을 사용하고, 만약 name
-- 값도 NULL 이라면(그런 경우는 없지만 가정) '정보 없음'이라는 문구를 출력하고 싶다. 이 로직을 COALESCE() 함수
-- 를 사용하여 display_text 라는 별칭으로 출력하라.
SELECT
	name,
    description,
    COALESCE(description, name, '정보 없음') AS display_text
FROM products;

-- 문제5: customers 테이블의 email 컬럼에서 아이디 부분만 추출하고, 아이디의 글자 수를 계산하라. 아이디는 @ 앞부분
-- 의 문자열이다. SUBSTRING_INDEX() 와 CHAR_LENGTH() 함수를 활용하여 user_id 와 id_length 라는 별칭
-- 으로 결과를 출력하라
SELECT
	email,
	SUBSTRING_INDEX(email, '@', 1) AS user_id,
	CHAR_LENGTH(SUBSTRING_INDEX(email, '@', 1)) AS id_length
FROM
 customers;