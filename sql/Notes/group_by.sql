/*
The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

COUNT()
MAX()
MIN()
SUM()
AVG()

*/

CREATE DATABASE db_random_people;
USE db_random_people;
SELECT * FROM tbl_people_1;
# Multi col or multi dimension groupby - # The AGG_FUNC(colx) function aggregates the colx values for EACH UNIQUE COMBINATION of dim1, dim2, etc.
# find out active sessions per name for each phone number
# Q: This query will return both the total quantity sold and the average price per customer-product combination.
# Q: If you want to group by CustomerID and ProductID to find out the total quantity sold per customer for each product
SELECT
	first_name,
    phone,
    COUNT(is_active) AS 'active_count'
FROM
	tbl_people_1
GROUP BY
	first_name,
    phone
HAVING
	active_count > 1;

# Import data sets - tbl_customer, tbl_customer_purchases, tbl_product
CREATE DATABASE db_test;
USE db_test;



# The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions but WHERE can be used on base table, not the grouped table
# U can use aggregate funcs in HAVING and ORDR BY when there is GROUP BY
SELECT 
	customer_zip,
    COUNT(customer_zip) AS count
FROM 
	tbl_customer 
GROUP BY 
	customer_zip
HAVING # filter for GROUP BY
	customer_zip IS NOT NULL
ORDER BY
	COUNT(customer_zip) DESC;
    
    
    
    
    
    