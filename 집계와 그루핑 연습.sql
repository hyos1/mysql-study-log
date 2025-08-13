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
    
-- 고객별로 총 주문 횟수, 총 구매 수량, 그리고 총 구매 금액을 함께 계산
SELECT
	customer_name,
    COUNT(*) AS `총 주문 횟수`,
    SUM(quantity) AS `총 구매 수량`,
    SUM(price * quantity) AS `총 구매 금액`
FROM
	order_stat
GROUP BY
	customer_name
ORDER BY
	`총 구매 금액` DESC;

--  여러 컬럼 기준 그룹화
-- 고객이 어떤 카테고리에서 얼마를 사용했는가?
SELECT
	customer_name,
	category,
	SUM(price * quantity) AS `카테고리별 구매 금액`
FROM
	order_stat
GROUP BY
	customer_name, category
ORDER BY
	customer_name, `카테고리별 구매 금액` DESC;
    
-- 여러 컬럼 기준 그룹화
-- 예제 시나리오: 고객이 어떤 카테고리에서 얼마를 사용했는가?
SELECT
	customer_name,
	category,
	SUM(price * quantity) AS `카테고리별 구매 금액`
FROM
	order_stat
GROUP BY
	customer_name, category
ORDER BY
	customer_name, `카테고리별 구매 금액` DESC;
    
-- 카테고리별로 묶어서 상품 개수
SELECT
	category,
	COUNT(*)
FROM
	order_stat
GROUP BY
	category;
    
-- GROUP으로 묶은 결과에 대해서 필터링하는 HAVING
-- "총 매출액이 50만 원 이상인 핵심 카테고리
-- 1단계: 먼저 카테고리별로 그룹화하여 총 매출액 집계하기
SELECT
	category,
	SUM(price * quantity) AS total_sales
FROM
	order_stat
GROUP BY
	category;
-- 2단계: HAVING 절로 2차 필터링
SELECT
	category,
	SUM(price * quantity) AS total_sales
FROM 
	order_stat
GROUP BY
	category
HAVING
	SUM(price * quantity) >= 500000;

-- '3회 이상 주문한' 충성 고객
-- 1단계: 고객별 총 주문 횟수 집계하기
SELECT
	customer_name,
	COUNT(*) AS order_count
FROM
	order_stat
GROUP BY
	customer_name;
-- 2단계: HAVING 절을 추가하여 주문 횟수 3회 이상인 그룹 필터링하기
SELECT
	customer_name,
	COUNT(*) AS order_count
FROM
	order_stat
GROUP BY
	customer_name
HAVING
	COUNT(*) >= 3;