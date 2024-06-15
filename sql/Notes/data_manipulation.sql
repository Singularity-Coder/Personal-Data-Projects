# DML - Data Manipulation Lang - INSERT, UPDATE, DELETE data
# To import csv data go to Table name -> Table data import wizard


CREATE DATABASE db_random_people;
USE db_random_people;

# Insert data into table "tbl_people_1"
INSERT INTO tbl_people_1 
VALUES
(101, "John", "Doe", 25, "M", "8245639875", "John@gma11 com", "1998-05-10", 1),
(102, "Jane", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0),
(103, "David", "Doe", 39, "M", "8245639877", "David@gma11 com", "1998-05-10", 1),
(104, "Jane", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0),
(105, "Jane", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0),
(106, "Jamine", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0);

# View data from table "tbl_people_1"
SELECT * FROM tbl_people_1;

# Insert "is_active = 1" people from "tbl_people_1" into "tbl_people_2"
INSERT INTO tbl_people_2
(SELECT * FROM tbl_people_1 WHERE is_active = 1);

# View data from table "tbl_people_2"
SELECT * FROM tbl_people_2;

# Update "phone" in "tbl_people_2" with "user_id=101"
UPDATE tbl_people_2
SET phone = "9535508177"
WHERE user_id = 101;

# Delete row with user_id = 103
DELETE
FROM tbl_people_2
WHERE user_id = 103;

# Insert data into specific cols
INSERT INTO tbl_people_1 (user_id, first_name, age)
VALUES
(1011, "Aron", 25),
(1021, "Bhagat", 28),
(1031, "Catty", 39);

# Update multiple cols
# If you omit the WHERE clause, all records in the table will be updated!
UPDATE 
	tbl_people_1 
SET 
	first_name = "Hithesh",
	last_name = "V",
	phone = "9999999999",
	email = "hithesh@mail.in"
WHERE 
	user_id = 101;

# Update multiple records
UPDATE
	tbl_people_1
SET
	is_active = 0,
    email = "NA",
    phone = "NA",
    gender = "F"
WHERE
	is_active IS NULL OR
    email IS NULL OR
    phone IS NULL OR
    gender IS NULL;

# DELETE record - If you omit the WHERE clause, all records in the table will be deleted!
DELETE FROM tbl_people_1 WHERE phone = "9999999999";

# get 1 record. LIMIT clause is used to specify the number of records to return.
# The LIMIT clause is useful on large tables with thousands of records. Returning a large number of records can impact performance.
SELECT * FROM tbl_people_1 LIMIT 1; 

# get 4 to 6 records. The SQL query below says "return only 3 records, start on record 4 (OFFSET 3)":
SELECT * FROM tbl_people_1 LIMIT 3 OFFSET 3;


# MIN() returns smallest value of selected col
# MAX() returns largest value of selected col
# Aggregate functions work only in SELECT clause
SELECT MIN(age) FROM tbl_people_1; # 1d output - 1 row 1 col
SELECT MAX(age) FROM tbl_people_1; # 1d output

SELECT 
	MIN(age) AS min_age,
    MAX(age) AS max_age
FROM 
	tbl_people_1; # 2d output - 1 row 2 cols

SELECT 
	is_active,
	MIN(age) AS min_age,
    MAX(age) AS max_age
FROM 
	tbl_people_1
GROUP BY
	is_active; # 3d output - n rows, n cols

# COUNT() - The COUNT() function returns the number of rows that matches a specified criterion.
# AVG() - The AVG() function returns the average value of a numeric column. 
# SUM() - The SUM() function returns the total sum of a numeric column. 
SELECT COUNT(age) FROM tbl_people_1;
SELECT AVG(age) FROM tbl_people_1;
SELECT SUM(age) FROM tbl_people_1;


# INSERT INTO SELECT
/*
the columns that are not filled with data, will contain NULL
The INSERT INTO SELECT statement copies data from one table and inserts it into another table.
The INSERT INTO SELECT statement requires that the data types in source and target tables matches.
Note: The existing records in the target table are unaffected.
Copy all columns from one table to another table:
*/
INSERT INTO tbl_people_1 (first_name, last_name, age) 
SELECT first_name, last_name, age FROM tbl_people_1 WHERE gender = 'F';
