# Create an index on column
# They speed up queries by allowing the database to quickly find specific rows of data without having to scan the entire table.
# Creates indexes in table for faster retrieval. Like list search. Not much use if u create index for primary key
# Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.

# Import data sets - tbl_customer, tbl_customer_purchases, tbl_product
CREATE DATABASE db_test;
USE db_test;

SELECT * FROM tbl_customer;

SELECT * FROM tbl_customer WHERE LOWER(customer_first_name) = LOWER("Rohit"); # This searches all rows and fetches rows with jane first_name. inefficient.
EXPLAIN SELECT * FROM tbl_customer WHERE LOWER(customer_first_name) = LOWER("Rohit"); # This explains how it fetched the data 

CREATE INDEX index_full_name ON tbl_customer (customer_first_name, customer_last_name); # Creating index requires more memory as it creates new index table
SELECT * FROM tbl_customer WHERE LOWER(customer_first_name) = LOWER("Rohit"); # This will search only 1 or as many rows as “Hit” exists
EXPLAIN SELECT * FROM tbl_customer WHERE LOWER(customer_first_name) = LOWER("Rohit");

ALTER TABLE tbl_customer
DROP INDEX index_full_name;




