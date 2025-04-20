# JOINS
# A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
# The relationship between the two tables above is the "CustomerID" column.

# Horizontal JOIN - CROSS, INNER, LEFT, RIGHT
# Vertical JOIN - UNION ALL, UNION DISTINCT, INTERSECT, 

-- comment
/*
INNER JOIN: Returns records that have matching values in both tables
LEFT JOIN: Returns all records from the left table, and the matched records (if any) from the right table
RIGHT JOIN: Returns all records from the right table, and the matched records (if any) from the left table
CROSS JOIN: Returns all records from both tables

The CROSS JOIN keyword returns all matching records from both tables whether the other table matches or not. 
If you add a WHERE clause (if table1 and table2 has a relationship), the CROSS JOIN will produce the same result as the INNER JOIN clause:

SELF JOIN: Join table with itself with INNER, LEFT, RIGHT, CROSS
*/

CREATE DATABASE db_test;
USE db_test;

CREATE TABLE tbl_joins_1(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    age INT CHECK(age < 200)
);

CREATE TABLE tbl_joins_2(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    age INT CHECK(age < 200)
);

INSERT INTO tbl_joins_1
VALUES
(1, "Hithesh", 27),
(2, "Iithesh", 38),
(3, "Jithesh", 49),
(35, "Kitesh", 50), 
(36, "Litesh", 70);

INSERT INTO tbl_joins_2
VALUES
(3, "Kithesh", 57),
(4, "Lithesh", 68),
(5, "Mithesh", 79),
(35, "Kitesh", 50), 
(36, "Litesh", 70);

SELECT * FROM tbl_joins_1;


# INNER JOIN - records from both tables that strictly satisfy the condition
SELECT * FROM tbl_joins_1 AS T1 INNER JOIN tbl_joins_2; # INNER JOIN without ON condition seems to be CROSS JOIN
SELECT * FROM tbl_joins_1 AS T1 INNER JOIN tbl_joins_2 AS T2 ON T1.id = T2.id;



# LEFT JOIN - all records from the left table and records from the right table that satisfy the condition
SELECT * FROM tbl_joins_1 AS T1 LEFT JOIN tbl_joins_2 AS T2 ON T1.id = T2.id;



# RIGHT JOIN - all records from the right table and records from the left table that satisfy the condition
SELECT * FROM tbl_joins_1 AS T1 RIGHT JOIN tbl_joins_2 AS T2 ON T1.id = T2.id;



# CROSS JOIN
/*
cross product of all rows - n rows * n rows
CROSS JOIN creates a virtual table only in memory and not in the DB
each record on left tbl joins with every other record in the right table
*/
SELECT * FROM tbl_joins_1 AS T1 CROSS JOIN tbl_joins_2 AS T2;
SELECT * FROM tbl_joins_1 AS T1 CROSS JOIN tbl_joins_2 AS T2 WHERE T1.id = T2.id; # CROSS JOIN with filter is INNER JOIN



# FULL JOIN - returns all records from both tables. Its like CROSS JOIN
SELECT
	*
FROM
	tbl_joins_1 FULL JOIN tbl_joins_2;



# Join 2 cols without primary key - i think both cols should have same num of rows for it to show results
SELECT
	*
FROM
	(SELECT name FROM tbl_joins_1) AS T1,
    (SELECT age FROM tbl_joins_2) AS T2;


# Natural JOIN -  seems to be like MINUS/EXCEPT in Sets
SELECT
	*
FROM
	(SELECT * FROM tbl_joins_1) AS T1 
    NATURAL JOIN
	(SELECT * FROM tbl_joins_2) AS T2;


# INTERSECT - get common records from both tables - below gives ids 35 & 36
(SELECT * FROM tbl_joins_1)
INTERSECT
(SELECT * FROM tbl_joins_2);


# EXCEPT
/* called MINUS in MySQL and Oracle. Returns only values obtained by first query but not the second one 
It removes all dups from both tables and ignores all values in 2nd table. 
tbl1 has values a, b, c and tbl2 has values b, c, d then result would be a alone. Since b, c are dups they are removed and all vals in tbl2 are ignored.
*/
(SELECT * FROM tbl_joins_1)
EXCEPT
(SELECT * FROM tbl_joins_2);

# TESTS-------------------------------------------------------------------------------------------------------------------

CREATE TABLE tbl_washing_machines(
	name VARCHAR(20),
    capacity FLOAT
);
INSERT INTO tbl_washing_machines
VALUES
("Samsung", 7),
("LG", 7),
("IFB", 6),
("Croma", 8),
("Samsung", 6);

CREATE TABLE tbl_dryer(
	name VARCHAR(20),
    capacity FLOAT
);
INSERT INTO tbl_dryer
VALUES
("Bosch", 6),
("Seimens", 7),
("Samsung", 7.5);

SELECT 
	*
FROM 
	tbl_joins_1 AS T1 INNER JOIN tbl_joins_2 AS T2
	ON T1.id <= T2.id
ORDER BY
	T1.name;
    

SELECT 
	*
FROM 
	tbl_joins_1 AS T1 RIGHT JOIN tbl_joins_2 AS T2
	ON T1.id < T2.id
ORDER BY
	T1.name;    


SELECT 
	*
FROM 
	tbl_joins_1 AS T1 CROSS JOIN tbl_joins_2 AS T2
ORDER BY
	T1.name;


SELECT 1;


SELECT 1 FROM tbl_joins_1;


SELECT 1, name FROM tbl_joins_1;


SELECT 1 FROM tbl_joins_1 WHERE id > 100;


SELECT * FROM tbl_joins_1

