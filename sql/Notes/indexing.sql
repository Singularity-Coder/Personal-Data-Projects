# Create an index on column
# They speed up queries by allowing the database to quickly find specific rows of data without having to scan the entire table.
# Creates indexes in table for faster retrieval. Like list search. Not much use if u create index for primary key
# Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.

# Import data sets - tbl_customer, tbl_customer_purchases, tbl_product
CREATE DATABASE db_test;
USE db_test;

SELECT * FROM tbl_customer;

# Before indexing, This searches all rows and fetches rows with jane first_name. inefficient.
# After indexing, This will search only 1 or as many rows as “Hit” exists
EXPLAIN SELECT * FROM tbl_customer WHERE customer_first_name = "Rohit"; # This explains how it fetched the data 

CREATE INDEX index_full_name ON tbl_customer(customer_first_name, customer_last_name); # Creating index requires more memory as it creates new index table

ALTER TABLE tbl_customer DROP INDEX index_full_name;

# Indexing seems to only work on filters without transformations. With LOWER it still searches all 28 rows.
EXPLAIN SELECT * FROM tbl_customer WHERE LOWER(customer_first_name) = LOWER("Rohit"); 

# Tests -----------------------------------------------------------------------------------------------

CREATE TABLE tbl_rand_names (
	id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
	last_name VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
	PRIMARY KEY (id)
);

INSERT INTO tbl_rand_names VALUES 
    (1, 'Steve', 'Smith'),
    (2, 'Adam', 'Gilchrist'),
    (3, 'Adam', 'Zampa'),
    (4, 'Matthew', 'Hayden'),
    (5, 'Matthew', 'Wade'), 
    (6, 'Shane', 'Warne'),
    (7, 'Shane', 'Lee'),
    (8, 'Brett', 'Lee'),
    (9, 'Mark', 'Waugh'),
    (10, 'Steve', 'Waugh');

EXPLAIN SELECT * FROM tbl_rand_names WHERE first_name = "Mark"; # first it touches all 10 rows. After index it should touch just 1 row.

CREATE INDEX f_n_index ON tbl_rand_names(first_name);


