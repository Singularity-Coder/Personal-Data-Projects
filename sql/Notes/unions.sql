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
# Get only dups that are in both tables
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
	count > 1





