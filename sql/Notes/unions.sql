/*
The UNION operator is used to combine the result-set of two or more SELECT statements.

Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order
*/

CREATE DATABASE db_test;
USE db_test;

CREATE TABLE tbl_unions_1(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    age INT CHECK(age < 200)
);

CREATE TABLE tbl_unions_2(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    age INT CHECK(age < 200)
);

INSERT INTO tbl_unions_1
VALUES
(1, "Hithesh", 27),
(2, "Iithesh", 38),
(3, "Jithesh", 49);

INSERT INTO tbl_unions_2
VALUES
(2, "Iithesh", 38),
(3, "Jithesh", 49),
(4, "Kithesh", 58);


# UNION ALL
# The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:
SELECT * FROM
(
	(SELECT * FROM tbl_unions_1)
	UNION ALL
	(SELECT * FROM tbl_unions_2)
) AS T;

# UNION DISTINCT
# Distinct rows in every col value. The entire record must be unique
SELECT * FROM
(
	(SELECT * FROM tbl_unions_1)
	UNION DISTINCT
	(SELECT * FROM tbl_unions_2)
) AS T;


# INTERSECT
# Get only records that are in both tables
SELECT 
	id, 
    COUNT(id) AS count
FROM
(
	(SELECT * FROM tbl_unions_1)
	UNION ALL
	(SELECT * FROM tbl_unions_2)
) AS T
GROUP BY
	id
HAVING 
	count > 1;
    
    
# Add new rows and rename that row
SELECT *
FROM
	(
		(SELECT 'ControlGroup' AS group_name)
		UNION ALL
		(SELECT 'ExperimentalGroup')
	) AS T1;
    
    
CREATE TABLE tbl_numbers(
	num INT
);
INSERT INTO tbl_numbers
VALUES
(1),
(2),
(3),
(5),
(98);

# Recursion is probably not working in this sql engine
WITH 
	cte_sequence AS (
    -- Generate a sequence of numbers from 1 to 100
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM cte_sequence
    WHERE num < 100
)
SELECT s.num
FROM cte_sequence AS s LEFT JOIN tbl_numbers AS n 
ON s.num = n.num
WHERE n.num IS NULL
ORDER BY s.num;


WITH
	cte1 as (
		SELECT a.N + b.N * 10 + 1 AS num
			FROM (
				SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
				UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
			) a,
			(
				SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
				UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
			) b # Cross product - dont confuse actual multiplication with rows - every row of a with every other row of b - stacks them vertically. - 01 02 03...10 11 12...20 21 22
    )
SELECT t1.num
FROM cte1 AS t1 LEFT JOIN tbl_numbers n 
ON t1.num = n.num
WHERE t1.num <= 100 AND n.num IS NULL # u will have all nums as usual but in tbl_numbers since its left join u will have null values on nums that dont match the on confition
ORDER BY t1.num;



SELECT 0 AS N 
UNION ALL 
SELECT 1 
UNION ALL 
SELECT 2 
UNION ALL 
SELECT 3 
UNION ALL 
SELECT 4
UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9;



SELECT a.N as n1, b.N as n2
    FROM (
        SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
        UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
    ) a,
    (
        SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
        UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
    ) b;



SELECT * FROM (
(SELECT * FROM tbl_unions_1)
INTERSECT
(SELECT * FROM tbl_unions_2)
) AS T;




CREATE TABLE STUDENTS(
   ID INT NOT NULL, 
   NAME VARCHAR(20) NOT NULL, 
   SUBJECT VARCHAR(20) NOT NULL, 
   AGE INT NOT NULL, 
   HOBBY VARCHAR(20) NOT NULL, 
   PRIMARY KEY(ID)
);
INSERT INTO STUDENTS VALUES
(1, 'Naina', 'Maths', 24, 'Cricket'),
(2, 'Varun', 'Physics', 26, 'Football'),
(3, 'Dev', 'Maths', 23, 'Cricket'),
(4, 'Priya', 'Physics', 25, 'Cricket'),
(5, 'Aditya', 'Chemistry', 21, 'Cricket'),
(6, 'Kalyan', 'Maths', 30, 'Football'),
(7, 'Aditya', 'Chemistry', 21, 'Cricket'),
(8, 'Kalyan', 'Chemistry', 32, 'Cricket');

CREATE TABLE STUDENTS_HOBBY(
   ID INT NOT NULL, 
   NAME VARCHAR(20) NOT NULL, 
   HOBBY VARCHAR(20) NOT NULL, 
   AGE INT NOT NULL, 
   PRIMARY KEY(ID)
);
INSERT INTO STUDENTS_HOBBY VALUES
(1, 'Vijay', 'Cricket', 18),
(2, 'Varun', 'Football', 26),
(3, 'Surya', 'Cricket', 19),
(4, 'Karthik', 'Cricket', 25),
(5, 'Sunny', 'Football', 26),
(6, 'Dev', 'Cricket', 23);

SELECT NAME, HOBBY, AGE FROM STUDENTS
EXCEPT 	
SELECT NAME, HOBBY, AGE FROM STUDENTS_HOBBY;
















