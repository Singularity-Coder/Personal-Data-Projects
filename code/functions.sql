/*
https://www.w3schools.com/mysql/mysql_ref_functions.asp

missing
INITCAP - title case
FIRST()
LAST()
*/

# String func
SELECT CONCAT('Hitheh', ' ', 'Vadar');
SELECT CONCAT("Hello", NULL); # NULL
SELECT INSERT('Hih', 3, 1, 'thesh'); # 3 is the position to insert "thesh", 1 is the chars to replace after 3rd pos
SELECT LENGTH('Hithesh');
SELECT LOWER('HITHESH');
SELECT UPPER('Hitheh');
SELECT POSITION('Gundam' IN 'Anime Gundam 00'); # returns 7th pos
SELECT REPEAT('Hit ', 3);
SELECT REPLACE('Hello world, my name is Hithesh. I live on world World.', 'world', 'earth'); # replaces all occurrances. Is case sensi
SELECT REVERSE('Hithesh'); # hsehtiH
SELECT SUBSTR('Hithesh', 1, 3); # Hit - 1 is start pos, 3 is num of chars from start pos
SELECT TRIM('  hahaha    ');
-- SELECT TRIM('a') FROM tbl_customer WHERE customer_id = 1;
SELECT GROUP_CONCAT(customer_first_name) FROM tbl_customer; # default adds commas without space, wihout ORDER BY the value is randomly arranged
SELECT GROUP_CONCAT(DISTINCT customer_first_name ORDER BY customer_id SEPARATOR ", ") FROM tbl_customer; # https://www.jooq.org/doc/latest/manual/sql-building/column-expressions/aggregate-functions/group-concat-function/
SELECT 
	customer_zip, 
	GROUP_CONCAT(customer_first_name SEPARATOR ', ') AS first_names 
FROM 
	tbl_customer
GROUP BY 
	customer_zip 
HAVING 
	COUNT(*) > 3;
    

# Numeric func
SELECT ABS(-34);
SELECT AVG(quantity) FROM tbl_customer_purchases;
SELECT CEIL(2.1);
SELECT COUNT(customer_id) FROM tbl_customer_purchases;
SELECT 8.2 DIV 2.0; # returns 4. Does int div
SELECT FLOOR(2.9);
SELECT MAX(quantity) FROM tbl_customer_purchases;
SELECT MIN(quantity) FROM tbl_customer_purchases;
SELECT POW(3, 2); # 3 ^ 2 = 9
SELECT FLOOR(RAND()*(10-5+1)+5); # random number >= 5 and <=10. returns random decimal num without seed.
SELECT ROUND(13.22121, 2);
SELECT SQRT(4);
SELECT SUM(quantity) FROM tbl_customer_purchases;

# Date func
SELECT CURRENT_DATE();
SELECT CURRENT_TIME();
SELECT DATEDIFF("2017-06-25", "2017-06-15"); # 10 days
SELECT DATE_ADD("2017-06-15", INTERVAL 10 DAY); # MICROSECOND, SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, YEAR
SELECT DATE_FORMAT("2017-06-15", "%W %M %d %Y");
SELECT DATE_SUB("2017-06-15", INTERVAL 10 DAY);
SELECT EXTRACT(YEAR FROM "2017-06-15");
SELECT NOW(); # returns current date and time

# Advanced func
SELECT 
	CASE 
    WHEN 3 < 4 THEN "3 is small"
    WHEN 4 > 3 THEN "Impossible"
    ELSE "Both are same"
    END;
SELECT CAST(150 AS CHAR);
SELECT CAST("14:06:10" AS TIME);
SELECT CAST("2017-08-29" AS DATE);
SELECT COALESCE(NULL, NULL, "Hithesh"); # retruns first non null value in a list
SELECT 
	IF(
    5 > 4, 
    "great", 
    IF(6 < 7, "unfortunate", "small")
    );
SELECT ISNULL(NULL); # retruns 1 which is true. 0 is false.

# IFNULL() func
/*
SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder) FROM Products;
if any of the "UnitsOnOrder" values are NULL, the result will be NULL. Hence we handle NULL values with IFNULL
The MySQL IFNULL() function lets you return an alternative value if an expression is NULL.
*/
SELECT IFNULL(NULL, "Hello");
SELECT 5 * customer_zip AS customer_zip FROM tbl_customer WHERE customer_id = 300; # NULL
SELECT 5 * IFNULL(customer_zip, 22821) AS customer_zip FROM tbl_customer WHERE customer_id = 300; # 114105


    
