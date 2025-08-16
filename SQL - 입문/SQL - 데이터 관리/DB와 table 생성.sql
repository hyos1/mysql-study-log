CREATE DATABASE my_shop;
USE my_shop;

CREATE TABLE sample (
 product_id INT PRIMARY KEY,
 name VARCHAR(100),
 price INT,
 stock_quantity INT,
 release_date DATE
);