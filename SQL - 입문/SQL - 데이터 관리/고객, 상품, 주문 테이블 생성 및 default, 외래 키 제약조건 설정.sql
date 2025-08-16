-- 고객 테이블 생성
-- id 저장할 때마다 1씩 자동 증가
CREATE TABLE customers (
 customer_id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(50) NOT NULL,
 email VARCHAR(100) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL,
 address VARCHAR(255) NOT NULL,
 join_date DATETIME DEFAULT CURRENT_TIMESTAMP 
-- 값 안 넣으면 현재시간으로 설정
);

-- 상품 테이블 생성
CREATE TABLE products (
 product_id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 description TEXT,
 price INT NOT NULL,
 stock_quantity INT NOT NULL DEFAULT 0
);

-- 주문 테이블 생성
CREATE TABLE orders (
 order_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT NOT NULL,
 product_id INT NOT NULL,
 quantity INT NOT NULL,
 order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
 status VARCHAR(20) NOT NULL DEFAULT '주문접수',

-- orders 테이블과 customers 테이블 연결하는 외래 키 제약조건
 CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id)
 REFERENCES customers(customer_id),

-- orders 테이블과 products 테이블 연결하는 외래 키 제약조건
 CONSTRAINT fk_orders_products FOREIGN KEY (product_id)
 REFERENCES products(product_id)
);