# MySQL is a relational database management system - RDBMS database program
# RDBMS is a program used to maintain a relational database.
# RDBMS uses SQL queries to access the data in the database.

# A table is a collection of related data entries, and it consists of columns and rows.
# A column holds specific information about every record in the table.
# A record (or row) is each individual entry that exists in a table.

# A relational database defines database relationships in the form of tables. The tables are related to each other - based on data common to each.

# SQL is the standard language for dealing with Relational Databases.
# SQL is used to insert, search, update, and delete database records.


CREATE DATABASE db_test;
USE db_test;


# The SELECT statement is used to select data from a database.
SELECT * FROM tbl_customer;
SELECT DISTINCT * FROM tbl_customer;
SELECT DISTINCT customer_zip FROM tbl_customer;
    
# The WHERE clause is used to filter records. It is used to extract only those records that fulfill a specified condition.
# The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.!
    
SELECT * FROM tbl_customer WHERE customer_zip BETWEEN 110006 AND 122067;
SELECT * FROM tbl_customer WHERE LOWER(customer_first_name) LIKE "jan_";
SELECT * FROM tbl_customer WHERE customer_zip IN (110006, 122067);
SELECT * FROM tbl_customer WHERE customer_id >= 10;
SELECT * FROM tbl_customer WHERE customer_id = 10;
SELECT * FROM tbl_customer WHERE customer_id != 10;
SELECT * FROM tbl_customer WHERE customer_id <> 10;

    
# AND, OR, NOT
SELECT * FROM tbl_customer WHERE 
(customer_id <> 10 AND customer_id < 15) OR customer_zip NOT IN (110006, 122067);


# ORDER BY - default ascending sort. If 2 rows have same value then sort those by another col
SELECT * FROM tbl_customer ORDER BY customer_zip ASC, customer_first_name ASC;



    
    
    
    
/**************************************************************************************************/
# Stored Procedures
/**************************************************************************************************/


/**************************************************************************************************/
# Custom SQL Functions
/**************************************************************************************************/


/**************************************************************************************************/
# Extracting Data
/**************************************************************************************************/


/**************************************************************************************************/
# Filtering Data
/**************************************************************************************************/


/**************************************************************************************************/
# Subqueries
/**************************************************************************************************/


/**************************************************************************************************/
# Group By and Aggregation
/**************************************************************************************************/


/**************************************************************************************************/
# Joins
/**************************************************************************************************/


/**************************************************************************************************/
# Window Functions
/**************************************************************************************************/


/**************************************************************************************************/
# Date and Time Functions
/**************************************************************************************************/


/**************************************************************************************************/
# Advanced concepts
/**************************************************************************************************/