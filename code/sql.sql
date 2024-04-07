CREATE DATABASE random_people;

USE random_people;

CREATE TABLE peeps(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) DEFAULT("NA"),
    age INT CHECK(age>=18),
    gender ENUM('M', 'F'),
    phone CHAR(10),
    email VARCHAR(20),
    dob DATE,
    address VARCHAR(100),
    is_active INT CHECK(is_active IN (1, 0))
)