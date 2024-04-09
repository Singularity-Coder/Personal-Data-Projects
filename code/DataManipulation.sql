# DML - Data Manipulation Lang - INSERT, UPDATE, DELETE data
# To import csv data go to Table name -> Table data import wizard


CREATE DATABASE db_random_people;
USE db_random_people;

# Insert data into table "tbl_people_1"
INSERT INTO tbl_people_1 
VALUES
(101, "John", "Doe", 25, "M", "8245639875", "John@gma11 com", "1998-05-10", 1),
(102, "Jane", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0),
(103, "David", "Doe", 39, "M", "8245639877", "David@gma11 com", "1998-05-10", 1),
(104, "Jane", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0),
(105, "Jane", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0),
(106, "Jamine", "Doe", 28, "F", "8245639876", "Jane@gma11 com", "1998-05-10", 0);

# View data from table "tbl_people_1"
SELECT * FROM tbl_people_1;

# Insert "is_active = 1" people from "tbl_people_1" into "tbl_people_2"
INSERT INTO tbl_people_2
(SELECT * FROM tbl_people_1 WHERE is_active = 1);

# View data from table "tbl_people_2"
SELECT * FROM tbl_people_2;

# Update "phone" in "tbl_people_2" with "user_id=101"
UPDATE tbl_people_2
SET phone = "9535508177"
WHERE user_id = 101;

# Delete row with user_id = 103
DELETE
FROM tbl_people_2
WHERE user_id = 103;

# Insert data into specific cols
INSERT INTO tbl_people_1 (user_id, first_name, age)
VALUES
(1011, "Aron", 25),
(1021, "Bhagat", 28),
(1031, "Catty", 39);

# Update multiple cols
# If you omit the WHERE clause, all records in the table will be updated!
UPDATE 
	tbl_people_1 
SET 
	first_name = "Hithesh",
	last_name = "V",
	phone = "9999999999",
	email = "hithesh@mail.in"
WHERE 
	user_id = 101;

# Update multiple records
UPDATE
	tbl_people_1
SET
	is_active = 0,
    email = "NA",
    phone = "NA",
    gender = "F"
WHERE
	is_active IS NULL OR
    email IS NULL OR
    phone IS NULL OR
    gender IS NULL;

# DELETE record




