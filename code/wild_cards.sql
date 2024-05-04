# LIKE operator
# The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
# There are two wildcards often used in conjunction with the LIKE operator:
# The percent sign (%) represents zero, one, or multiple characters
# The underscore sign (_) represents one, single character

# Import data sets - tbl_customer, tbl_customer_purchases, tbl_product
CREATE DATABASE db_test;
USE db_test;

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



