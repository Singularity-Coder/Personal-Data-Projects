/**************************************************************************************************/
# Custom Functions
/**************************************************************************************************/

-- CREATE FUNCTION calculate_sum (num1 INT, num2 INT) RETURNS INT  
-- BEGIN  
--     DECLARE result INT;  
--     SET result = num1 + num2;  
--     RETURN result;  
-- END;

#apply_disc(market_date, qty, price_per_qty)
#returns bill value AFTER discount, if applicable
CREATE TEMP FUNCTION apply_disc(d date, q float64, p float64)
RETURNS float64
AS(
IF(
  ( extract(month from d) in (4,5,6,11,12) ) AND (q >= 4),
  round((p*0.8) * q, 1),
  round(p * q, 1)
)
);




#days_elapsed_since(market_date)
#returns the number of days elapsed between transaction date and TODAY
CREATE TEMP FUNCTION days_elapsed_since(d date)
RETURNS int64
AS(
date_diff(current_date(), d, day)
);




#DISCOUNT OFFER!
#20% seasonal discount in Apr-Jun and Nov-Dec
#upon buying at least 4 items
SELECT
market_date as `date_of_transaction`,
quantity as `qty`,
round((quantity*cost_to_customer_per_qty),1) as `bill_value_without_discount`,
apply_disc(market_date,quantity,cost_to_customer_per_qty) as `bill_value_after_discount_IF_ANY`,
days_elapsed_since(market_date) as `days_elapsed_since_transaction`
FROM `farmers_market.customer_purchases`;