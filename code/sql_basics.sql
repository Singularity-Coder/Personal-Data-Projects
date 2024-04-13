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
SELECT customer_id, /*customer_first_name,*/ customer_last_name FROM tbl_customer;


# EXISTS operator
/*
The EXISTS operator is used to test for the existence of any record in a subquery.
The EXISTS operator returns TRUE if the subquery returns one or more records.
*/
SELECT * FROM tbl_customer AS C WHERE 
EXISTS (SELECT * FROM tbl_customer_purchases AS P WHERE P.customer_id = C.customer_id AND cost_to_customer_per_qty < 2);



# ANY, ALL
/*
The ANY and ALL operators allow you to perform a comparison between a single column value and a range of other values.
comparisons such as =, !=, >, <, >=, <=
*/
# This should be greater than AT LEAST one value in the list 
# This should be greater than the MIN value in the list
# SELECT 17 > ANY (13, 25, 3, 4, 1, -8); #TRUE 
# ALL should be greater than the MAX value in the list
# SELECT 17 > ALL (13, 25, 3, 4, 1, -8) ; #FALSE
/*
ANY --- returns TRUE if ANY of the subquery values meet the condition
ANY means that the condition will be true if the operation is true for any of the values in the range.
*/
SELECT * FROM tbl_customer WHERE customer_id > ANY (SELECT * FROM tbl_customer WHERE customer_id > 5);
/*
ALL --- returns TRUE if ALL of the subquery values meet the condition
is used with SELECT, WHERE and HAVING statements
ALL means that the condition will be true only if the operation is true for all values in the range.
*/
SELECT * FROM tbl_customer WHERE customer_id > ALL (SELECT * FROM tbl_customer WHERE customer_id > 5);


# CASE
/*
once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.
CASE can be used on ORDER BY as well
*/
SELECT 
	customer_first_name,
    (
		CASE
        WHEN customer_zip > 110006 THEN customer_zip + 1
        WHEN customer_zip < 110006 THEN customer_zip - 1
        ELSE customer_zip
        END
    ) AS customer_zip
FROM 
	tbl_customer;



# IFNULL() func
/*
SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder) FROM Products;
if any of the "UnitsOnOrder" values are NULL, the result will be NULL. Hence we handle NULL values with IFNULL
The MySQL IFNULL() function lets you return an alternative value if an expression is NULL.
*/
SELECT 5 * customer_zip AS customer_zip FROM tbl_customer WHERE customer_id = 300; # NULL
SELECT 5 * IFNULL(customer_zip, 22821) AS customer_zip FROM tbl_customer WHERE customer_id = 300; # 114105


# COALESCE() func
/*
returns first non null value in list
*/
SELECT COALESCE(NULL, NULL); # NULL
SELECT COALESCE(1, 2, 3, 4, NULL, 15); # 1
SELECT COALESCE(NULL, NULL, "Banshee", "00"); # Banshee



# GROUP_CONCAT
SELECT 
	customer_zip, 
	GROUP_CONCAT(customer_first_name SEPARATOR ', ') AS first_names 
FROM 
	tbl_customer
GROUP BY 
	customer_zip 
HAVING 
	COUNT(*) > 3;
    
    
    
    
# Operators - https://www.w3schools.com/mysql/mysql_operators.asp





/**************************************************************************************************/
# Stored Procedures
/**************************************************************************************************/


/**************************************************************************************************/
# Window Functions
/**************************************************************************************************/


/**************************************************************************************************/
# Date and Time Functions
/**************************************************************************************************/
