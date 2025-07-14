Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| customer_details   |
| emp                |
| information_schema |
| joins              |
| mypractjoins       |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| workers_details    |
| world              |
+--------------------+
11 rows in set (0.11 sec)

mysql> create database student_management_system;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+---------------------------+
| Database                  |
+---------------------------+
| customer_details          |
| emp                       |
| information_schema        |
| joins                     |
| mypractjoins              |
| mysql                     |
| performance_schema        |
| sakila                    |
| student_management_system |
| sys                       |
| workers_details           |
| world                     |
+---------------------------+
12 rows in set (0.00 sec)

mysql> use  student_management_system;
Database changed
mysql> create table Student(StudentID INT PRIMARY KEY not null, FirstName VARCHAR(50) not null, LastName VARCHAR(50) not null,Age INT not null, Gender VARCHAR(10) not null);
Query OK, 0 rows affected (0.06 sec)

mysql> desc student;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| StudentID | int         | NO   | PRI | NULL    |       |
| FirstName | varchar(50) | NO   |     | NULL    |       |
| LastName  | varchar(50) | NO   |     | NULL    |       |
| Age       | int         | NO   |     | NULL    |       |
| Gender    | varchar(10) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.03 sec)

mysql> CREATE TABLE Enrollment(EnrollmentID INT PRIMARY KEY not null, StudentID INT, CourseID VARCHAR(20) not null,EnrollmentDate varchar(20) not null,  FOREIGN KEY (StudentID) REFERENCES Student(StudentID));
Query OK, 0 rows affected (0.03 sec)

mysql> desc Enrollment;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| EnrollmentID   | int         | NO   | PRI | NULL    |       |
| StudentID      | int         | YES  | MUL | NULL    |       |
| CourseID       | varchar(20) | NO   |     | NULL    |       |
| EnrollmentDate | varchar(20) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> INSERT INTO Student(StudentID, FirstName, LastName, Age, Gender) VALUES(1, 'Alice', 'Sharma', 20, 'Female'),(2, 'Rahul', 'Verma', 22, 'Male'),(3, 'Priya', 'Kumar', 21, 'Female');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select*from Student;
+-----------+-----------+----------+-----+--------+
| StudentID | FirstName | LastName | Age | Gender |
+-----------+-----------+----------+-----+--------+
|         1 | Alice     | Sharma   |  20 | Female |
|         2 | Rahul     | Verma    |  22 | Male   |
|         3 | Priya     | Kumar    |  21 | Female |
+-----------+-----------+----------+-----+--------+
3 rows in set (0.00 sec)

mysql> INSERT INTO Enrollment(EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES(101, 1, 'CS101', '2024-06-01'),(102, 2, 'CS102', '2024-06-05'),(103, 3, 'CS103', '2024-06-10'),(104, 1, 'CS104', '2024-06-15');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select*from  Enrollment;
+--------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|          101 |         1 | CS101    | 2024-06-01     |
|          102 |         2 | CS102    | 2024-06-05     |
|          103 |         3 | CS103    | 2024-06-10     |
|          104 |         1 | CS104    | 2024-06-15     |
+--------------+-----------+----------+----------------+
4 rows in set (0.00 sec)

mysql> SELECT s.StudentID,s.FirstName, s.LastName, e.EnrollmentID, e.CourseID FROM  Student s INNER JOIN Enrollment e ON s.StudentID = e.StudentID;//INNER JOIN
+-----------+-----------+----------+--------------+----------+
| StudentID | FirstName | LastName | EnrollmentID | CourseID |
+-----------+-----------+----------+--------------+----------+
|         1 | Alice     | Sharma   |          101 | CS101    |
|         1 | Alice     | Sharma   |          104 | CS104    |
|         2 | Rahul     | Verma    |          102 | CS102    |
|         3 | Priya     | Kumar    |          103 | CS103    |
+-----------+-----------+----------+--------------+----------+
4 rows in set (0.00 sec)
