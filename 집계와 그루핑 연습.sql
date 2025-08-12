-- 집계와 그루핑 연습

-- COUNT(*)
--  총 주문 건수 파악하기
SELECT COUNT(*) FROM order_stat;

-- NULL과 특정 컬럼의 개수: COUNT(컬럼) vs COUNT(*)
SELECT
	COUNT(*) AS `전체 주문 건수`,
	COUNT(category) AS `카테고리 등록 건수`
FROM
	order_stat;
-- 전체 주문 건수는 11건인데 한 상품의 category가 null이여서 결과는 10개가 나옴

-- 합계와 평균 계산: SUM(), AVG() NULL값은 자동으로 제외하고 계산한다.
-- 예제 1: 총 매출액과 평균 주문 금액 분석하기
SELECT
	SUM(price * quantity) AS `총 매출액`,
	AVG(price * quantity) AS `평균 주문 금액`
FROM
	order_stat;

-- 예제 2: 총 판매 상품 수량과 주문당 평균 수량 분석하기
SELECT
	SUM(quantity) AS `총 판매 수량`, 
	AVG(quantity) AS `주문당 평균 수량`
FROM
	order_stat;
    
-- 최대값과 최소값 구하기: MIN(), MAX()
-- 예제 1: 최고가, 최저가 상품 가격 찾기
SELECT
	MAX(price) AS 최고가, 
	MIN(price) AS 최저가
FROM
	order_stat;
    
-- 예제 2: 최초 주문일과 최근 주문일 찾기
SELECT
	MIN(order_date) AS `최초 주문일`, 
	MAX(order_date) AS `최근 주문일` 
FROM
	order_stat;