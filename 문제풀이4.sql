-- 문제풀이
-- 문제1: order_stat 테이블을 사용하여 쇼핑몰의 전체 주문 건수와, 카테고리 정보가 누락되지 않은(NULL이 아닌) 주문 건
-- 수를 각각 조회해라.
SELECT
	COUNT(*) AS `총 주문 건수`,
	COUNT(category) AS `카테고리 보유 건수`
FROM
	order_stat;
    
-- 문제2: order_stat 테이블을 사용하여 우리 쇼핑몰의 총 매출액, 평균 주문 금액(주문 1건당 매출액), 판매된 상품들의 최
-- 고 단가와 최저 단가를 한 번에 조회해라.
SELECT
	SUM(price * quantity) AS `총 매출액`,
    AVG(price * quantity) AS `평균 주문 금액`,
    MAX(price) AS `최고 단가`,
    MIN(price) AS `최저 단가`
FROM
	order_stat;

-- 문제3: order_stat 테이블을 category 별로 그룹화하여, 각 카테고리별로 총 판매된 상품 수량( quantity 의 합계)과
-- 총 매출액( price * quantity 의 합계)을 계산해라.
SELECT
	category,
	SUM(quantity) AS `카테고리별 총 판매 수량`,
	SUM(price * quantity) AS `카테고리별 총 매출액`
FROM
	order_stat
GROUP BY
	category
ORDER BY
	`카테고리별 총 매출액` DESC; -- ORDER BY에서 SELECT 절의 별칭 컬럼을 선택할 때는 백틱(`)을 사용해야 한다.
    
-- 문제4: order_stat 테이블을 사용하여 고객별로 총 주문 횟수와 총 구매한 상품의 수량( quantity )을 계산해라. 결과는
-- 주문 횟수가 많은 순으로, 주문 횟수가 같다면 총 구매 수량이 많은 순으로 정렬해라
SELECT
	customer_name,
	COUNT(*) AS `총 주문 횟수`,
	SUM(quantity) AS `총 구매 수량`
FROM
	order_stat
GROUP BY 
	customer_name
ORDER BY
	`총 주문 횟수` DESC, `총 구매 수량` DESC;
    
-- 문제5: order_stat 테이블에서 고객별 총 구매 금액을 계산하고, 총 구매 금액이 40만 원 이상인 'VIP 고객' 목록만 조회
-- 결과에는 고객 이름과 총 구매 금액이 포함되어야 하며, 총 구매 금액이 높은 순으로 정렬되어야 한다.
SELECT
	customer_name,
	SUM(price * quantity) AS `총 구매 금액`
FROM
	order_stat
GROUP BY
	customer_name
HAVING
	SUM(price * quantity) >= 400000
ORDER BY
	`총 구매 금액` DESC;
    
-- 문제6: order_stat 테이블에서 '도서' 카테고리를 제외한( WHERE ) 주문들 중에서, 2회 이상 주문한 고객들을 찾아( GROUP 
-- BY , HAVING ), 그 고객들의 이름, 주문 횟수, 총 사용 금액을 조회해라. 결과는 총 사용 금액이 높은 순으로 정렬되어야
-- 한다.
SELECT
	customer_name,
	COUNT(*) AS `주문 횟수`,
	SUM(price * quantity) AS `총 사용 금액`
FROM
	order_stat
WHERE
	category != '도서' OR category IS NULL -- '도서' 카테고리가 아닌 주문, NULL도 포함
GROUP BY
	customer_name
HAVING
	COUNT(*) >= 2
ORDER BY
	`총 사용 금액` DESC;