/*
The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

COUNT()
MAX()
MIN()
SUM()
AVG()

*/

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
    
    
    
    
    
    