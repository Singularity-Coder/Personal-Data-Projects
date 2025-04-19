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

/*
Order of execution

1. FROM - find the table
2. JOIN - merge tables if necessary
3. ON - apply condition to merge tables
4. WHERE - filter above merged table based on condition

5. GROUP BY - create a new virtual table from the above table
6. HAVING - filter the above virtual table based on condition
7. SELECT - choose the result set of records from the above virtual table

8. ORDER BY - sort records based on any col(s)
9. LIMIT - limit number of records to a fixed number
*/

/*
Order of execution Advanced

1. FROM -> JOIN -> ON
2. WHERE
3. GROUP BY
4. GROUP BY aggregations
5. HAVING
6. OVER() window func
7. SELECT
8. DISTINCT
9. Set Ops - UNION/INTERSECT/EXCEPT
10. ORDER BY
11. OFFSET
12. LIMIT


1. FROM - the database gets the data from tables in FROM clause and if necessary performs the JOINs,
2. WHERE - the data are filtered with conditions specified in the WHERE clause,
● GROUP BY - the data are grouped by conditions specified in the WHERE clause,
● Aggregate functions - the aggregate functions are applied to the groups created in the GROUP BY phase,
● HAVING - the groups are filtered with the given condition,
● Window functions,
● SELECT - the database selects the given columns,
● DISTINCT - repeated values are removed,
● UNION/INTERSECT/EXCEPT - the database applies set operations,
● ORDER BY - the results are sorted,
● OFFSET - the first rows are skipped,
● LIMIT/FETCH/TOP - only the first rows are selected
*/

# All Definitons have this structure - what is it, where its used, what does it do.

/*
Primary Key: Unique and Non Null
Foreign Key: Not unique and nullable
Candidate Key: Potential PK. Multiple columns have the potential to be a PK provided they satisfy unique and non null conditons.
Composite Key: Combine multiple columns to create a PK.
*/


/*
DBMS types
Relational
NoSQL
Object oriented

BigQuery is not DBMS. Its data warehouse. Diff is not clear.
*/

/*
In MySQL u can do aggreation without GROUP BY by just using aggreate funcs. But if u introduce a col without agg func u need group by
*/


# Import data sets - tbl_customer, tbl_customer_purchases, tbl_product
CREATE DATABASE db_test;
USE db_test;


# We give Aliases for table, column. Its temp name for readability. Exists in duration of query only. AS keyword.


# COMMENTS
-- single line
/*
Multi 
Line
*/
SELECT customer_id, /*customer_first_name,*/ customer_last_name FROM tbl_customer;


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

    

# ORDER BY - default ascending sort. If 2 rows have same value then sort those by another col
SELECT * FROM tbl_customer ORDER BY customer_zip ASC, customer_first_name ASC;


# IS NULL, IS NOT NULL
SELECT * FROM tbl_customer WHERE customer_last_name IS NOT NULL;
SELECT * FROM tbl_customer WHERE customer_zip IS NULL;    


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
    
#-------------------------------------------------------------------------------------------------------------------------
    
CREATE TABLE tbl_dum_dum_1 (	
	id INT PRIMARY KEY,
    name VARCHAR(20)
);
CREATE TABLE tbl_dum_dum_2 (	
	id INT PRIMARY KEY,
    name VARCHAR(20)
);
INSERT INTO tbl_dum_dum_1 VALUES
(0, "Git"),
(1, "Hit"),
(2, "Iit"),
(3, "Jit");
INSERT INTO tbl_dum_dum_2 VALUES
(3, "Jit"),
(4, "Kit"),
(5, "Lit"),
(6, "Mit");

SELECT * FROM tbl_dum_dum_1;
SELECT * FROM tbl_dum_dum_2; 
TRUNCATE TABLE tbl_dum_dum_1;
TRUNCATE TABLE tbl_dum_dum_2;
DROP TABLE tbl_dum_dum_1;
DROP TABLE tbl_dum_dum_2;

# Sets
SELECT * FROM tbl_dum_dum_1
UNION ALL
SELECT * FROM tbl_dum_dum_2;

SELECT * FROM tbl_dum_dum_1
UNION DISTINCT
SELECT * FROM tbl_dum_dum_2;

SELECT * FROM tbl_dum_dum_1
INTERSECT
SELECT * FROM tbl_dum_dum_2;

SELECT * FROM tbl_dum_dum_1
EXCEPT
SELECT * FROM tbl_dum_dum_2;
    
#-------------------------------------------------------------------------------------------------------------------------

# Describe table structure
DESC tbl_dum_dum_1;
DESC tbl_customer;

#-------------------------------------------------------------------------------------------------------------------------

SELECT
	*
FROM
	(SELECT * FROM tbl_dum_dum_1) AS T1 
    CROSS JOIN
	(SELECT * FROM tbl_dum_dum_2) AS T2;


SELECT "Aha" LIKE "AHA"; # LIKE ignores case


SELECT EXISTS(SELECT 1 FROM tbl_customer); # faster


#-------------------------------------------------------------------------------------------------------------------------

SELECT COUNT(*) FROM tbl_customer; # counts nulls as well
SELECT COUNT(DISTINCT customer_zip) FROM tbl_customer; # counts ignoring dups
SELECT COUNT(customer_zip) FROM tbl_customer; # ignores nulls while counting
SELECT COUNT(1) FROM tbl_customer; # replaces all records with 1 including nulls n then counts


/*
Not clear:
https://www.tutorialspoint.com/sql/sql-except-clause.htm
https://www.geeksforgeeks.org/best-practices-for-sql-query-optimizations/ 
Optimise on JOINS
*/







