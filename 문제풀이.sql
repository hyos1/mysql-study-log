-- 문제1: 데이터베이스와 테이블 생성하기
-- 1. my_test 데이터베이스 생성
CREATE DATABASE my_test;

-- 2. my_test 데이터베이스 선택
USE my_test;

-- 3. members 테이블 생성
CREATE TABLE members (
 id INT PRIMARY KEY, -- 기본키 설정
 name VARCHAR(50) NOT NULL, 
 join_date DATE
);

-- 4. 테이블 구조 확인
DESC members;