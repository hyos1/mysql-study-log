SHOW DATABASES;

SHOW TABLES;

DROP TABLE sample;

DROP DATABASE my_shop;

-- 데이터베이스 생성
CREATE DATABASE my_shop;

-- 데이터베이스 선택
USE my_shop;

-- 테이블 생성
CREATE TABLE sample (
 product_id INT PRIMARY KEY,
 name VARCHAR(100),
 price INT,
 stock_quantity INT,
 release_date DATE
);

-- 데이터 넣기
INSERT INTO sample (product_id, name, price, stock_quantity, release_date)
VALUES (1, '프리미엄 청바지', 59900, 100, '2025-06-11');

-- sample 모든 데이터 조회
SELECT * FROM sample;