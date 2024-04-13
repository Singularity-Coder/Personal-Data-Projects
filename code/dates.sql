# Date Data Types
/*
for storing a date or a date/time value in the database:

DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
YEAR - format YYYY or YY

Note: The date data type are set for a column when you create a new table in your database!
Two dates can easily be compared if there is no time component involved!

https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-add
*/
SELECT EXTRACT(YEAR FROM '2008-11-11 13:23:44')