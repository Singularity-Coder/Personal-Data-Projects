# Date Data Types
/*
MySQL Docs: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_current-date
BigQuery Docs: https://cloud.google.com/bigquery/docs/reference/standard-sql/date_functions

for storing a date or a date/time value in the database:

DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
YEAR - format YYYY or YY

Note: The date data type are set for a column when you create a new table in your database!
Two dates can easily be compared if there is no time component involved!
*/
SELECT CURRENT_DATE();
SELECT CURRENT_TIME();

SELECT EXTRACT(YEAR FROM '2008-11-11 13:23:44');
SELECT EXTRACT(DAY FROM CURRENT_DATE()); # Display the current "Day of the month"
SELECT MICROSECOND('2008-10-11 13:23:44.999999'); # 999999
SELECT SECOND('2008-10-11 13:23:44'); # 44
SELECT MINUTE('2008-10-11 13:23:44'); # 23
SELECT HOUR('2008-10-11 13:23:44'); # 13
SELECT DAY('2008-10-11 13:23:44'); # 11
SELECT WEEK('2008-10-11 13:23:44'); # 40
SELECT MONTH('2008-10-11 13:23:44'); # 10
SELECT QUARTER('2008-10-11 13:23:44'); # 4 --- since 12/3, 10th month falls in 4th quarter
SELECT YEAR('2008-10-11 13:23:44'); # 2008

# MICROSECOND, SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, YEAR
SELECT DATE_ADD("2017-06-15", INTERVAL 10 DAY); 
SELECT DATE_SUB("2017-06-15", INTERVAL 10 DAY);

SELECT DATEDIFF("2017-06-25", "2017-06-15"); # 10 (days)
SELECT TIMEDIFF("2017-06-26 13:23:44", "2017-06-25 22:19:44"); # 15:04:00

/*
%d %H are format specifiers. Below are the only accepted specifiers. Else NULL or 0

%H - Hour in 24-hour format (00-23)
%h - Hour in 12-hour format (01-12)
%i - Minutes (00-59)
%s - Seconds (00-59)
%p - AM or PM indicator for 12-hour format
*/
# Date to String
SELECT DATE_FORMAT("2020-05-31", "%d %M %Y, %W"); # Convert the date "2020-05-31" to the string "31 May 2020, Sunday"
SELECT TIME_FORMAT('2017-06-25 22:19:44', '%H hours %h hours %i minutes %s seconds %p'); # 22 hours 10 hours 19 minutes 44 seconds PM
SELECT CONVERT_TZ('2004-01-01 12:00:00','+00:00','+10:00'); # 2004-01-01 22:00:00

# String to Date/Time
SELECT STR_TO_DATE("01,5,2013", "%d,%m,%Y"); # Convert the string “01,5,2013” to the date “2013-05-01”
SELECT STR_TO_DATE('a09:30:17','a%h:%i:%s'); # 09:30:17 --- Scanning starts at the beginning of str and fails if format is found not to match. Extra characters at the end of str are ignored.
SELECT STR_TO_DATE('May 1, 2013','%M %d,%Y'); # 2013-05-01 --- Literal characters in format must match literally in str.


# Not working
SELECT CONVERT_TZ('2004-01-01 12:00:00','GMT','MET'); # CONVERT_TZ(date, from_tz, to_tz)


# Caclulate dist btw 2 lat longs: d = 2R × sin⁻¹(√[sin²((θ₂ - θ₁)/2) + cosθ₁ × cosθ₂ × sin²((φ₂ - φ₁)/2)]) wehre θ₁ is lat and φ₁ is long
# https://www.omnicalculator.com/other/latitude-longitude-distance
-- SELECT
--   6371 * 2 * ASIN(SQRT(
-- 	
--   ))












