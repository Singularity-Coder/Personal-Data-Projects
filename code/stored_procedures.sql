/**************************************************************************************************/
# Stored Procedures
# To execute precompiled collection of one or more SQL statements and not return any value.
/**************************************************************************************************/

USE db_test;

-- CREATE PROCEDURE update_product_price (product_code VARCHAR(10), new_price DECIMAL(10, 2))
-- BEGIN
--     UPDATE products
--     SET price = new_price
--     WHERE product_code = product_code;
-- END;


DELIMITER // -- Define a custom delimiter for clarity
CREATE PROCEDURE my_loop()
BEGIN
  DECLARE counter INT DEFAULT 1;

  WHILE counter <= 5 DO
    INSERT INTO my_table (value) VALUES (counter);
    SET counter = counter + 1;
  END WHILE;
END //
DELIMITER ; -- Reset the delimiter

CALL my_loop(); -- Execute the procedure

#------------------------------------------------------------------------------------------------------------------------

DELIMITER // -- Define a custom delimiter for clarity
CREATE PROCEDURE repeat_loop()
BEGIN
  DECLARE counter INT DEFAULT 5;

  REPEAT
    INSERT INTO my_table (value) VALUES (counter);
    SET counter = counter - 1;
  UNTIL counter <= 0;
END //
DELIMITER ; -- Reset the delimiter

CALL repeat_loop(); -- Execute the procedure

#------------------------------------------------------------------------------------------------------------------------

DELIMITER // -- Define a custom delimiter for clarity
CREATE PROCEDURE simple_loop()
BEGIN
  DECLARE counter INT DEFAULT 1;

loop_label:
  LOOP
    INSERT INTO my_table (value) VALUES (counter);
    SET counter = counter + 1;
    IF counter > 5 THEN
      LEAVE loop_label; -- Exit the loop
    END IF;
  END LOOP;
END //
DELIMITER ; -- Reset the delimiter

CALL simple_loop(); -- Execute the procedure









