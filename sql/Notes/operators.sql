/*
Operators - https://www.w3schools.com/mysql/mysql_operators.asp

AND - allows to combine conditions where RECORD must match both conditions
OR - allows to combine conditions where RECORD can match either of the conditions
NOT - negates a condition and fetches RECORDS that dont match the condition
BETWEEN - fetches RECORDS that are between the range of values
ALL - the records in this table must match all records in a different result set / table
ANY - any records in this table that can match any records in diff table 
LIKE - matches a pattern
Wildcards % : used in LIKE operator statement to match 0 or more UNSPECIFIED chars in a record 
Wildcards _ : used in LIKE operator statement to match single UNSPECIFIED char in a record
AS - alias used for column or table to reduce code size or for readablity
IN - filters records that are present in a diff set
EXISTS - checks if a record is present in a table

*/


# Import data sets - tbl_customer, tbl_customer_purchases, tbl_product
CREATE DATABASE db_test;
USE db_test;



# AND, OR, NOT
SELECT * FROM tbl_customer WHERE 
(customer_id <> 10 AND customer_id < 15) OR customer_zip NOT IN (110006, 122067);


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


# LIKE operator
# The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
# There are two wildcards often used in conjunction with the LIKE operator:
# The percent sign (%) represents zero, one, or multiple characters
# The underscore sign (_) represents one, single character
# starts with char a - a%
SELECT * FROM tbl_customer WHERE customer_first_name LIKE "a%";
# ends with char a - %a
SELECT * FROM tbl_customer WHERE customer_first_name LIKE "%a";
# has chars ja in any pos - %ja%
SELECT * FROM tbl_customer WHERE customer_first_name LIKE "%ja%";
# starts with char j ends with char e - j%e
SELECT * FROM tbl_customer WHERE customer_first_name LIKE "j%e";
# has char a in second pos - _a%
SELECT * FROM tbl_customer WHERE customer_first_name LIKE "_a%";
# starts with char a and is at least 2 chars len - a_%
SELECT * FROM tbl_customer WHERE customer_first_name LIKE "a_%";
# starts with char a and is at least 3 chars len - a__%
SELECT * FROM tbl_customer WHERE customer_first_name LIKE "a__%";
# starts with char a and is at least 3 chars len and has g at 4th pos and ends with char l - a__g%
SELECT * FROM tbl_customer WHERE customer_first_name LIKE "a__g%l";
# Finds any values that starts with "a" and are at least 3 characters in length
SELECT * FROM tbl_customer WHERE customer_first_name LIKE "a_%_%";

# % and _ are wilcard chars
# % means 0 or more chars. Note that it can be 0 chars
# _ means exactly 1 char
# A wildcard character is used to substitute one or more characters in a string.
# Wildcard characters are used with the LIKE operator. The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.


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
SELECT * FROM tbl_customer WHERE customer_id > ANY (SELECT customer_id FROM tbl_customer WHERE customer_id < 5);


/*
ALL --- returns TRUE if ALL of the subquery values meet the condition
is used with SELECT, WHERE and HAVING statements
ALL means that the condition will be true only if the operation is true for all values in the range.
*/
SELECT * FROM tbl_customer WHERE customer_id > ALL (SELECT customer_id FROM tbl_customer WHERE customer_id < 5);


# EXISTS operator
/*
The EXISTS operator is used to test for the existence of any RECORD in a subquery.
The EXISTS operator returns TRUE if the subquery returns one or more records.

The SQL EXISTS operator is used to test for the existence of any rows in a subquery. 
It returns TRUE if the subquery returns at least one row, and FALSE if the subquery returns no rows.
Subquery Execution: The subquery runs for each row of the outer query.
You get the result of outer query.
*/
SELECT * FROM tbl_customer AS C WHERE 
EXISTS (SELECT 1);

# Ex: List all customers who have placed at least one order.
SELECT * FROM tbl_customer_purchases;
SELECT * FROM tbl_customer AS C WHERE 
EXISTS (SELECT * FROM tbl_customer_purchases AS P WHERE P.customer_id = C.customer_id);




















