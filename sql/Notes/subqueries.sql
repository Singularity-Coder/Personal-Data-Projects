# Correlataed Subquery - only in select clause, 1d value. Not accurate
# Subquery - 1d, 2d, 3d

CREATE DATABASE db_temp;
USE db_temp;
CREATE TABLE tbl_temp(
	id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    salary INT(10) NOT NULL
);
INSERT INTO tbl_temp VALUES
(1, "Hithesh", 100000),
(2, "Iithesh", 200000),
(3, "Jithesh", 300000),
(4, "Kithesh", 400000),
(5, "Lithesh", 500000),
(6, "Mithesh", 600000);

SELECT EXISTS(SELECT 1 FROM tbl_temp);
SELECT EXISTS(SELECT name FROM tbl_temp WHERE name LIKE "Nit*");