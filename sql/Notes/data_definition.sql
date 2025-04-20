/**************************************************************************************************/
# DDL - Data Definition Lang - Specify data type & structure of table
/**************************************************************************************************/



# Create db named "db_random_people"
CREATE DATABASE db_random_people;



# Select db named "db_random_people" to work on
USE db_random_people;



# Lists all db
SHOW DATABASES;



# Change db properties
ALTER DATABASE db_random_people 
CHARACTER SET UTF8MB4 
COLLATE utf8mb4_0900_ai_ci 
ENCRYPTION = 'Y' # enable or disable default excryption
READ ONLY = 0; # 1 is read only while 0 is read-write



# Verify characteristics of db
SHOW CREATE DATABASE db_random_people;



# Create table named "peeps"
/*
If u have an auto increment id and u insert 0 as id then it automatically converts it to 1 and throws error saying dup entry. To avoid that
SET SESSION sql_mode='NO_AUTO_VALUE_ON_ZERO'; 
OR
UPDATE source_table SET status = 0;
*/
# Format: Key, Type, Constraint
CREATE TABLE peeps(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) DEFAULT("NA"),
    age INT CHECK(age >= 18),
    gender ENUM('M', 'F'),
    phone CHAR(10), # 10 is fixed memory here. So even if u give 2 chars it still allots for 10 chars while varchar can adjust memory allocation based on data. In CHAr the extra space is padded with spaces.
    email VARCHAR(20),
    dob DATE,
    address VARCHAR(100)
);



/*
The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
Also used to add and drop various constraints on an existing table.
*/
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



# Delete all data from "tbl_people_2" but not the table - DDL command
-- TRUNCATE TABLE tbl_people_2;



# Delete table "tbl_people_2" - DDL command
-- DROP TABLE tbl_people_2;



# Delete db
-- DROP DATABASE db_random_people;



# Create Table Using Another Table - inherits all props form other table
CREATE TABLE tbl_people_3 AS
SELECT first_name, age, gender, phone FROM tbl_people_2 LIMIT 3;

SELECT * FROM tbl_people_3;



# Create Constraints
/*
Used to specify rules for data in a table.
Can be set when the table is created with the CREATE TABLE statement, or after the table is created with the ALTER TABLE statement.
Limit the type of data that can go into a table.
Constraints can be column level or table level.

NOT NULL - Ensures that a column cannot have a NULL value - This enforces a field to always contain a value, which means that you cannot insert a new record, or update a record without adding a value to this field.
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly

Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.
A PRIMARY KEY constraint automatically has a UNIQUE constraint.
However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.

A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).

https://www.w3schools.com/mysql/mysql_primarykey.asp
*/

CREATE TABLE tbl_persons_1 (
    id INT NOT NULL,
    first_name VARCHAR(255),
    age INT,
    UNIQUE (id), # id becomes PK since its NOT NULL & UNIQUE without assiging PRIMARY KEY on it
    -- UNIQUE (age),
    INDEX(age),
    -- PRIMARY KEY (id),
    CONSTRAINT UC_persons_1 UNIQUE (first_name, age), # UC is unique constraint. Naming a unique constraint and defining on multiple cols. (first_name + age) must be UNIQUE. So wither first_name or age can be unique in the combination.
    CONSTRAINT PK_persons_1 PRIMARY KEY (id, first_name) # There is only ONE PRIMARY KEY (PK_persons_1). However, the VALUE of the primary key is made up of TWO COLUMNS (id + first_name). Composite key
);
-- INSERT INTO tbl_persons_1 
-- VALUES
-- (1, "Hithesh", 16),
-- (2, "Hithesh", 17),
-- (3, "Hithesh", 18);
-- SELECT * FROM tbl_persons_1;



# FOREIGN KEY Constraint
/*
The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.
A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.
The FOREIGN KEY constraint prevents invalid data from being inserted into the foreign key column, because it has to be one of the values contained in the parent table.
https://www.w3schools.com/mysql/mysql_foreignkey.asp
*/
CREATE TABLE tbl_one(
	id_one INT,
    name VARCHAR(200),
    PRIMARY KEY (id_one)
);
# FK on single col
CREATE TABLE tbl_two(
	id_two INT,
    name VARCHAR(200),
    id_one INT,
    PRIMARY KEY (id_two),
    FOREIGN KEY (id_one) REFERENCES tbl_one(id_one)
);
# FK on multiple cols
CREATE TABLE tbl_three(
	id_three INT,
    name VARCHAR(200),
    id_one INT,
    PRIMARY KEY (id_three),
    CONSTRAINT FK_three FOREIGN KEY (id_one) REFERENCES tbl_one(id_one)
);



# CHECK Constraint
/*
The CHECK constraint is used to limit the value range that can be placed in a column.
If you define a CHECK constraint on a column it will allow only certain values for this column.
If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.
https://www.w3schools.com/mysql/mysql_check.asp
*/	
# CHECK on single col
CREATE TABLE tbl_two(
	id_two INT,
    age INT,
    CHECK (age >= 18)
);
# CHECK on multiple cols
CREATE TABLE tbl_three(
	id_three INT,
	name VARCHAR(20),
    age INT,
    CONSTRAINT CHK_three CHECK (age >= 18 AND name = 'Hithesh')
);
-- INSERT INTO tbl_two
-- VALUES
-- (1, 3),
-- (2, 14);
-- INSERT INTO tbl_three
-- VALUES
-- (1, 'jaja', 2),
-- (2, 'dada',  14);



# DEFAULT Constraint
/*
The DEFAULT constraint is used to set a default value for a column.
The default value will be added to all new records, if no other value is specified.
*/
CREATE TABLE tbl_four(
	id_four INT NOT NULL,
	customer_name VARCHAR(20) NOT NULL DEFAULT 'Hithesh',
    purchase_date DATE DEFAULT '2222-2-22' # CURRENT_DATE() sys func not accepting
);



# AUTO INCREMENT Field
/*
Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.
Often this is the primary key field that we would like to be created automatically every time a new record is inserted.
By default, the starting value for AUTO_INCREMENT is 1, and it will increment by 1 for each new record.
Error Code: 1075. Incorrect table definition; there can be only one auto column and it must be defined as a key
*/
CREATE TABLE tbl_five(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20)
);

ALTER TABLE tbl_five AUTO_INCREMENT = 100;

INSERT INTO tbl_five (name)
VALUES
('Hithesh'),
('Iithesh');

SELECT * FROM tbl_five;



/*
Partitioning
1. Partition by Range
2. Partition by Hashing
3. Partition by List
*/

CREATE TABLE tbl_sales (
   cust_id INT NOT NULL, 
   name VARCHAR(40), 
   store_id CHAR(20) NOT NULL, 
   bill_no INT NOT NULL,
   bill_date DATE PRIMARY KEY NOT NULL, 
   amount DECIMAL(8,2) NOT NULL
)
PARTITION BY RANGE(extract(YEAR FROM bill_date))(
    PARTITION partition_2017 VALUES LESS THAN (2017),
    PARTITION partition_2019 VALUES LESS THAN (2019),
    PARTITION partition_others VALUES LESS THAN MAXVALUE
);

INSERT INTO tbl_sales VALUES
(1, 'Mike', 'S001', 101, '2015-01-02', 125.56), 
(2, 'Robert', 'S003', 103, '2015-01-25', 476.50), 
(3, 'Peter', 'S012', 122, '2016-02-15', 335.00), 
(4, 'Joseph', 'S345', 121, '2016-03-26', 787.00), 
(5, 'Harry', 'S234', 132, '2017-04-19', 678.00), 
(6, 'Stephen', 'S743', 111, '2017-05-31', 864.00), 
(7, 'Jacson', 'S234', 115, '2018-06-11', 762.00), 
(8, 'Smith', 'S012', 125, '2019-07-24', 300.00),
(9, 'Adam', 'S456', 119, '2019-08-02', 492.20),
(10, 'Bob', 'S206', 101, '2020-03-02', 580.50);

SELECT * FROM tbl_sales;

SELECT 
	TABLE_NAME, 
    PARTITION_NAME, 
    TABLE_ROWS
FROM 
	INFORMATION_SCHEMA.PARTITIONS
WHERE 
	TABLE_NAME = 'tbl_sales';










