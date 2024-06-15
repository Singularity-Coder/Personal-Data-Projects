# Import data sets - tbl_customer, tbl_customer_purchases, tbl_product
CREATE DATABASE db_test;
USE db_test;

SELECT * FROM tbl_customer;

WITH
	cte_1 AS (
		SELECT * FROM tbl_customer WHERE LOWER(customer_first_name) LIKE "j%"
    ),
    cte_2 AS (
		SELECT * FROM tbl_customer WHERE LOWER(customer_first_name) LIKE "a%"
    )
SELECT * FROM cte_1 CROSS JOIN cte_2;





# Views are like SQL variables. Temporarily store data in Views db.
/*
Virtual table based on the result-set of an SQL statement.
You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.
A view always shows up-to-date data! The database engine recreates the view, every time a user queries it.	
*/
CREATE VIEW
	view_1 AS (
		SELECT * FROM tbl_customer WHERE LOWER(customer_first_name) LIKE "j%"
    );
SELECT * FROM view_1;

CREATE VIEW
	view_2 AS (
		SELECT * FROM tbl_customer WHERE LOWER(customer_first_name) LIKE "a%"
    );
SELECT * FROM view_2;

# Updating a View
CREATE OR REPLACE VIEW 
	view_2 AS (
		SELECT 2
    );
SELECT * FROM view_2;

# Delete View
DROP VIEW view_2;





