# Data Types
/*
https://www.w3schools.com/mysql/mysql_datatypes.asp
*/
CREATE TABLE tbl_random_data(
	id INT,
    phone CHAR(10),
    name VARCHAR(50),
    description TEXT(200),
    gender ENUM('M', 'F'),
    isMarried BOOL,
    bank_balance DOUBLE,
    dob DATE
);
INSERT INTO tbl_random_data
VALUES
(1, '9583390201', 'Hithesh', 'I am that because I am this when I am that', 'M', 1, 8882.90, '1891-12-29');

SELECT * FROM tbl_random_data;