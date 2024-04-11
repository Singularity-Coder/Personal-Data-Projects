# MySQL is a relational database management system - RDBMS database program
# RDBMS is a program used to maintain a relational database.
# RDBMS uses SQL queries to access the data in the database.

# A table is a collection of related data entries, and it consists of columns and rows.
# A column holds specific information about every record in the table.
# A record (or row) is each individual entry that exists in a table.

# A relational database defines database relationships in the form of tables. The tables are related to each other - based on data common to each.

# SQL is the standard language for dealing with Relational Databases.
# SQL is used to insert, search, update, and delete database records.

# A NULL value is different from a zero value or a field that contains spaces. A field with a NULL value is one that has been left blank during record creation!
# NULL is not a value. So u cannot compare it with anything

# Import data sets - tbl_customer, tbl_customer_purchases, tbl_product
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


# IS NULL, IS NOT NULL
SELECT * FROM tbl_customer WHERE customer_last_name IS NOT NULL;
SELECT * FROM tbl_customer WHERE customer_zip IS NULL;    


# IN operator
# The IN operator allows you to specify multiple values in a WHERE clause.
# The IN operator is a shorthand for multiple OR conditions.
SELECT * FROM tbl_customer WHERE customer_zip IN (122067, 110006);
SELECT * FROM tbl_customer WHERE customer_zip NOT IN (SELECT customer_zip FROM tbl_customer WHERE customer_zip LIKE "___0_");


# BETWEEN operator
# The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
# The BETWEEN operator is inclusive: begin and end values are included.
SELECT * FROM tbl_customer WHERE customer_id BETWEEN 1 AND 10;
SELECT * FROM tbl_customer WHERE (customer_first_name BETWEEN "Jane" AND "Russell") AND (customer_last_name BETWEEN "Armenta" AND "Paulson"); # considers first chars. probably ASCII
SELECT * FROM tbl_customer_purchases WHERE market_date BETWEEN "2019-09-28" AND "2020-09-02";


# We give Aliases for table, column. Its temp name for readability. Exists in duration of query only. AS keyword.


# COMMENTS
-- single line
/*
Multi 
Line
*/
SELECT customer_id, /*customer_first_name,*/ customer_last_name FROM tbl_customer

    
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
# Window Functions
/**************************************************************************************************/


/**************************************************************************************************/
# Date and Time Functions
/**************************************************************************************************/


/**************************************************************************************************/
# Advanced concepts
/**************************************************************************************************/