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

문제2: 데이터 추가 및 조회하기 (INSERT, SELECT)
-- 1. 첫 번째 회원 데이터 추가
INSERT INTO members (id, name, join_date)
VALUES (1, '션', '2025-01-10');

-- 2. 두 번째 회원 데이터 추가
INSERT INTO members (id, name, join_date)
VALUES (2, '네이트', '2025-02-15');

-- 3. 전체 데이터 조회
SELECT * FROM members;

문제3: 데이터 수정 및 삭제하기 (UPDATE, DELETE)
-- 1. 이름 변경 (UPDATE)
UPDATE members
SET name = '네이트2'
WHERE id = 2;

-- 2. 회원 정보 삭제 (DELETE)
DELETE FROM members
WHERE id = 1;

-- 3. 최종 데이터 조회
SELECT * FROM members;
