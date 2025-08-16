-- point 열 추가
ALTER TABLE customers
ADD COLUMN point INT NOT NULL DEFAULT 0;

-- point 열 삭제
ALTER TABLE customers
DROP COLUMN point;

-- 외래 키 제약조건 임시로 무시
SET FOREIGN_KEY_CHECKS = 0; -- 비활성화
TRUNCATE TABLE products;
SET FOREIGN_KEY_CHECKS = 1; -- 활성화

-- insert 모든 열 추가하기
INSERT INTO customers VALUES (NULL, '강감찬', 'kang@example.com', 
'hashed_password_123', '서울시 관악구', '2025-06-11 10:30:00');
INSERT INTO customers VALUES (NULL, '이순신', 'lee@example.com', 
'hashed_password_123', '서울시 관악구', '2025-06-12 10:30:00');

-- 원하는 열에 데이터 추가하기
INSERT INTO customers (name, email, password, address)
VALUES ('세종대왕', 'sejong@example.com', 'hashed_password_456', '서울시 종로구');