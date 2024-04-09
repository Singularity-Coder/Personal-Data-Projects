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

# Change col name and type and default value - MySQLWorkbench has GUI for this operation & provides query as well
-- ALTER TABLE `db_random_people`.`tbl_people_1` 
-- CHANGE COLUMN `first_name` `first_name` VARCHAR(20) NULL DEFAULT NULL,
-- CHANGE COLUMN `last_name` `last_name` VARCHAR(20) NULL DEFAULT NULL ;

# Delete all data from "tbl_people_2" - DDL command
-- TRUNCATE TABLE tbl_people_2;

# Delete table "tbl_people_2" - DDL command
-- DROP TABLE tbl_people_2;























