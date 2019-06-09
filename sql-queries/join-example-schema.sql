CREATE DATABASE join_example;
USE join_example;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name NVARCHAR(50) NOT NULL,
    last_Name NVARCHAR(50) NOT NULL
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2),
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (first_name, last_name) VALUES
("Tiger", "Woods"),
("Donald", "Trumpt"),
("Kim", "Kardashian"),
("Queen", "Elizabeth"),
("Thom", "Yorke");

INSERT INTO orders (order_date, amount, customer_id) VALUES
("2019-06-05", 142.23, 1),
("2018-01-04", 4502.54, 1),
("2019-06-22", 1042.43, 1),
("2017-05-14", 5502.13, 2),
("2019-09-05", 102.11, 2),
("2019-06-05", 1062.86, 3),
("2016-11-15", 992.23, 3),
("2017-05-14", 172.42, 4),
("2019-09-05", 32.32, 4),
("2019-06-05", 92.03, 4);