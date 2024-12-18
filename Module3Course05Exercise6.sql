CREATE DATABASE demo;
USE demo;

CREATE TABLE products (
	productId INT PRIMARY KEY,
    productCode NVARCHAR(50) NOT NULL,
	productName NVARCHAR(200) NOT NULL,
	productPrice DOUBLE NOT NULL,
	productAmount INT DEFAULT(0),
	productDescription TEXT DEFAULT(''),
	productStatus BIT
);

INSERT INTO products VALUES 
(1, 'a1', 'May Tinh', 100, 5, '', 0),
(2, 'a3', 'Tu Lanh', 124, 21, '', 0),
(3, 'b1', 'Bat Dia', 87, 56, '', 1),
(6, 'a2', 'Coca Cola', 99, 590, '', 0),
(9, 'c1', 'Dao', 203, 81, '', 0);

CREATE UNIQUE INDEX productCodeIndex
ON products (productCode);

CREATE UNIQUE INDEX productNamePriceIndex
ON products (productName, productPrice);

ALTER TABLE products
DROP INDEX productCodeIndex;

EXPLAIN SELECT * 
FROM products
WHERE productName LIKE 'May Tinh'
AND productPrice = 100;

EXPLAIN SELECT *
FROM products
WHERE productCode = "a1"
OR productCode = "b1";

CREATE VIEW productInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM products;

SELECT * FROM productInfo;

DROP VIEW productInfo;


