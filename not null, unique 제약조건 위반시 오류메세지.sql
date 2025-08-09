-- NOT NULL 제약조건 위반시
INSERT INTO customers (email, password, address)
VALUES ('noname@example.com', 'password123', '서울시 마포구');
-- 실행 결과
-- Error Code: 1364. Field 'name' doesn't have a default value

--UNIQUE 제약조건 위반시
-- 'kang@example.com'은 이미 '강감찬' 고객이 사용 중인 이메일이다.
INSERT INTO customers (name, email, password, address)
VALUES ('홍길동', 'kang@example.com', 'new_password_123', '서울시 송파구');
-- Error Code: 1062. Duplicate entry 'kang@example.com' for key 'customers.email'