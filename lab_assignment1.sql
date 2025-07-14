Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

create database customer_details;
show databases;
+--------------------+
| Database           |
+--------------------+
| customer_details   |
| emp                |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| workers_details    |
| world              |
+--------------------+
9 rows in set (0.06 sec)

 
use customer_details;//USES CUSTOMER_DETAILS DATABASE
CREATE TABLE CUSTOMER (id int  not null primary key, name VARCHAR(50) not null, email VARCHAR(50) not  null, address VARCHAR(50) not null, city VARCHAR(20) not null ,Phone_no varchar(10) not null ,Pin_code int not null );//CREATED A CUSTOMER TABLE
Query OK, 0 rows affected (0.01 sec)

desc CUSTOMER;//TABLE DESCRIPTION
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int          | NO   | PRI | NULL    |       |
| name      | varchar(50)  | NO   |     | NULL    |       |
| email     | varchar(50)  | NO   |     | NULL    |       |
| address   | varchar(50)  | NO   |     | NULL    |       |
| city      | varchar(20)  | NO   |     | NULL    |       |
| Phone_no  | varchar(10)  | NO   |     | NULL    |       |
| Pin_code  | int          | NO   |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


INSERT INTO CUSTOMER VALUES(1, 'Amit Sharma', 'amit@gmail.com', '123 Park St', 'Delhi', '9876543210', 110001),(2, 'Riya Mehta', 'riya@gmail.com', '22 Rose Ave', 'Mumbai', '9876512345', 400001),(3, 'Vikram Rao', 'vikram@gmail.com', '77 Hill Rd', 'Pune', '9123456780', 411001),(4, 'Neha Singh', 'neha@gmail.com', '9 Lakeview', 'Lucknow', '9988776655', 226001),(5, 'Sohan Verma', 'sohan@gmail.com', '44 MG Road', 'Bangalore', '9665544332', 560001),(6, 'Divya Patel', 'divya@gmail.com', '10 Central Rd', 'Ahmedabad', '9876654321', 380001); //INSERTION

mysql> SELECT * FROM CUSTOMER;
+----+--------------+------------------+----------------+------------+-------------+----------+
| id | name         | email            | address        | city       | Phone_no    | Pin_code |
+----+--------------+------------------+----------------+------------+-------------+----------+
|  1 | Amit Sharma  | amit@gmail.com   | 123 Park St    | Delhi      | 9876543210  |   110001 |
|  2 | Riya Mehta   | riya@gmail.com   | 22 Rose Ave    | Mumbai     | 9876512345  |   400001 |
|  3 | Vikram Rao   | vikram@gmail.com | 77 Hill Rd     | Pune       | 9123456780  |   411001 |
|  4 | Neha Singh   | neha@gmail.com   | 9 Lakeview     | Lucknow    | 9988776655  |   226001 |
|  5 | Sohan Verma  | sohan@gmail.com  | 44 MG Road     | Bangalore  | 9665544332  |   560001 |
|  6 | Divya Patel  | divya@gmail.com  | 10 Central Rd  | Ahmedabad  | 9876654321  |   380001 |
+----+--------------+------------------+----------------+------------+-------------+----------+
6 rows in set (0.00 sec)



CREATE TABLE PRODUCT (Product_id INT not null PRIMARY KEY, Product_name VARCHAR(50) not null, category VARCHAR(30) not null,  Sub_category VARCHAR(30) not null, Original_price int not null, selling_price int not null , stock INT not null);//PRODUCT TABLE CREATION
Query OK, 0 rows affected (0.01 sec)

desc PRODUCT;//TABLE DESCRIPTION
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| Product_id     | int          | NO   | PRI | NULL    |       |
| Product_name   | varchar(50)  | NO   |     | NULL    |       |
| category       | varchar(30)  | NO   |     | NULL    |       |
| Sub_category   | varchar(30)  | NO   |     | NULL    |       |
| Original_price | int          | NO   |     | NULL    |       |
| selling_price  | int          | NO   |     | NULL    |       |
| stock          | int          | NO   |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


INSERT INTO PRODUCT VALUES(101, 'Laptop', 'Electronics', 'Computers', 50000, 47000, 15),(102, 'Smartphone', 'Electronics', 'Mobiles', 20000, 18500, 30),(103, 'Desk Chair', 'Furniture', 'Chairs', 5000, 4500, 20),(104, 'Bluetooth Speaker', 'Electronics', 'Audio', 3000, 2800, 25),(105, 'Wrist Watch', 'Accessories', 'Men', 1500, 1300, 10),(106, 'Notebook', 'Stationery', 'Paper', 100, 90, 100); //INSERTION 

mysql> SELECT * FROM PRODUCT;
+------------+-------------------+--------------+---------------+----------------+----------------+-------+
| Product_id | Product_name      | category     | Sub_category  | Original_price | selling_price  | stock |
+------------+-------------------+--------------+---------------+----------------+----------------+-------+
|        101 | Laptop            | Electronics  | Computers     |          50000 |          47000 |    15 |
|        102 | Smartphone        | Electronics  | Mobiles       |          20000 |          18500 |    30 |
|        103 | Desk Chair        | Furniture    | Chairs        |           5000 |           4500 |    20 |
|        104 | Bluetooth Speaker | Electronics  | Audio         |           3000 |           2800 |    25 |
|        105 | Wrist Watch       | Accessories  | Men           |           1500 |           1300 |    10 |
|        106 | Notebook          | Stationery   | Paper         |            100 |             90 |   100 |
+------------+-------------------+--------------+---------------+----------------+----------------+-------+
6 rows in set (0.00 sec)


mysql> CREATE TABLE Order_Table(Order_ID INT PRIMARY KEY NOT NULL,customer_id varchar(5) NOT NULL, product_id varchar(5) NOT NULL,Quantity INT NOT NULL,Total_Price INT NOT NULL,Order_Date varchar(15) NOT NULL,FOREIGN KEY (customer_id) REFERENCES customer(customer_id),FOREIGN KEY (product_id) REFERENCES product(product_id));//ORDER TABLE CREATION
Query OK, 0 rows affected (0.13 sec)

mysql> DESC Order_Table;//DESCRIPTION OF ORDER_TABLE
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Order_ID    | int         | NO   | PRI | NULL    |       |
| customer_id | varchar(5)  | NO   | MUL | NULL    |       |
| product_id  | varchar(5)  | NO   | MUL | NULL    |       |
| Quantity    | int         | NO   |     | NULL    |       |
| Total_Price | int         | NO   |     | NULL    |       |
| Order_Date  | varchar(15) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
6 rows in set (0.02 sec)


INSERT INTO ORDER_TABLE VALUES(201, 1, 101, 1, 47000, 'Delivered', '2025-07-01', 'Online'),(202, 2, 102, 2, 37000, 'Pending', '2025-07-03', 'Cash'),(203, 3, 103, 1, 4500, 'Shipped', '2025-07-05', 'Card'),(204, 4, 104, 3, 8400, 'Delivered', '2025-07-06', 'Online'),(205, 5, 105, 2, 2600, 'Delivered', '2025-07-07', 'Cash'),(206, 6, 106, 5, 450, 'Pending', '2025-07-08', 'UPI');//INSERTION

mysql> SELECT * FROM ORDER_TABLE;
+----------+-------------+------------+----------+-------------+---------------+------------+--------------+
| Order_id | Customer_id | Product_id | quantity | Total_price | Order_status  | Order_date | Payment_mode |
+----------+-------------+------------+----------+-------------+---------------+------------+--------------+
|      201 |           1 |        101 |        1 |       47000 | Delivered     | 2025-07-01 | Online       |
|      202 |           2 |        102 |        2 |       37000 | Pending       | 2025-07-03 | Cash         |
|      203 |           3 |        103 |        1 |        4500 | Shipped       | 2025-07-05 | Card         |
|      204 |           4 |        104 |        3 |        8400 | Delivered     | 2025-07-06 | Online       |
|      205 |           5 |        105 |        2 |        2600 | Delivered     | 2025-07-07 | Cash         |
|      206 |           6 |        106 |        5 |         450 | Pending       | 2025-07-08 | UPI          |
+----------+-------------+------------+----------+-------------+---------------+------------+--------------+
6 rows in set (0.00 sec)

mysql> show tables;
+----------------------------+
| Tables_in_customer_details |
+----------------------------+
| customer                   |
| order_table                |                     |
| product                    |
+----------------------------+
