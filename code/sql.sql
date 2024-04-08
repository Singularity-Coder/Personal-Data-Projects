/**************************************************************************************************/
# DDL - Data Definition Lang - Specify data type & structure of table
/**************************************************************************************************/

# Create db named "db_random_people"
CREATE DATABASE db_random_people;

# Select db named "db_random_people" to work on
USE db_random_people;

# Change db properties
ALTER DATABASE db_random_people 
CHARACTER SET UTF8MB4 
COLLATE utf8mb4_0900_ai_ci 
ENCRYPTION = 'Y' # enable or disable default excryption
READ ONLY = 0; # 1 is read only while 0 is read-write

# Verify characteristics of db
SHOW CREATE DATABASE db_random_people;

# Create table named "peeps"
CREATE TABLE peeps(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) DEFAULT("NA"),
    age INT CHECK(age >= 18),
    gender ENUM('M', 'F'),
    phone CHAR(10),
    email VARCHAR(20),
    dob DATE,
    address VARCHAR(100)
);

# Add col with wrong data type
ALTER TABLE peeps
ADD is_active VARCHAR(10);

# Correct the wrong data type of is_active
ALTER TABLE peeps
MODIFY is_active INT;

# Constrain the values is_active takes
ALTER TABLE peeps
ADD CONSTRAINT CHECK(is_active IN (1, 0));

# Rename col
ALTER TABLE peeps
RENAME COLUMN id TO user_id;

# Delete col
ALTER TABLE peeps
DROP COLUMN address;

# Rename table
RENAME TABLE peeps TO tbl_people_1;

# Create new table named "tbl_people_2"
/*
If you try to UPDATE a table without primary key you will get this error
Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
*/
CREATE TABLE tbl_people_2(
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) DEFAULT('NA'),
    age INT CHECK(age >= 18),
    gender ENUM('M', 'F'),
    phone CHAR(10),
    email VARCHAR(20),
    dob DATE,
    is_active INT CHECK(is_active IN (1, 0))
);

# Create an index on column
# Not much use if u create index for primary key
SELECT * FROM tbl_people_1 WHERE LOWER(first_name) = "jane"; # This searches all rows and fetches rows with jane first_name. inefficient.
EXPLAIN SELECT * FROM tbl_people_1 WHERE LOWER(first_name) = "jane"; # This explains how it fetched the data 

CREATE INDEX index_first_name ON tbl_people_1 (first_name); # Creating index requires more memory as it creates new index table
SELECT * FROM tbl_people_1 WHERE LOWER(first_name) = "jane"; # This will search only 1 or as many rows as “Hit” exists
EXPLAIN SELECT * FROM tbl_people_1 WHERE LOWER(first_name) = "jane";

# Delete all data from "tbl_people_2" - DDL command
-- TRUNCATE TABLE tbl_people_2;

# Delete table "tbl_people_2" - DDL command
-- DROP TABLE tbl_people_2;

/**************************************************************************************************/
# DML - Data Manipulation Lang - INSERT, UPDATE, DELETE data
# To import csv data go to Table name -> Table data import wizard
/**************************************************************************************************/

# Insert data into table "tbl_people_1"
INSERT INTO tbl_people_1 
VALUES
(101, "John", "Doe", 25, "M", "8245639875", "John@gma11 com", "1998-05-10", 1),
(102, "Jane", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0),
(103, "David", "Doe", 39, "M", "8245639877", "David@gma11 com", "1998-05-10", 1),
(104, "Jane", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0),
(105, "Jane", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0),
(106, "Jane", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0);

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























