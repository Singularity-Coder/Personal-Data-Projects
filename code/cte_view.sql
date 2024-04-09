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