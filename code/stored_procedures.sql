/**************************************************************************************************/
# Stored Procedures
# To execute precompiled collection of one or more SQL statements and not return any value.
/**************************************************************************************************/

-- CREATE PROCEDURE update_product_price (product_code VARCHAR(10), new_price DECIMAL(10, 2))
-- BEGIN
--     UPDATE products
--     SET price = new_price
--     WHERE product_code = product_code;
-- END;

USE db_test;

CREATE PROCEDURE sp_name()
BEGIN
	SELECT 
END;
