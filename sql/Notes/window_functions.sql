/*
In OVER() window function you can use 
1. PARTITION BY
2. ORDER BY
3. ROWS BETWEEN ___ AND ___  : The blanks can be: n PRECEDING, n FOLLOWING, UNBOUNDED PRECEDING, UNBOUNDED FOLLOWING, CURRENT ROW
4. RANGE BETWEEN ___ AND ___  
*/

# Aggregate Window Functions
# MIN, MAX, AVG, SUM, COUNT
SELECT 
	MIN(quantity) OVER(PARTITION BY quantity) AS min_qty, # PARTITION BY is just GROUP BY but on a window and without transforming the base table to virtual table
    MAX(quantity) OVER(PARTITION BY quantity) AS max_qty,
    AVG(DISTINCT quantity) OVER(PARTITION BY quantity) AS avg_qty,
    SUM(DISTINCT quantity) OVER(PARTITION BY quantity) AS total_qty,
    COUNT(DISTINCT customer_id) OVER(PARTITION BY customer_id) AS num_customers
FROM
	tbl_customer_purchases;
    

# ---------------------------------------------------------------------------------------------------------------------


# Analytical Ranking Window Functions
# DENSE_RANK, RANK, ROW_NUMBER, NTILE, CUME_DIST

# DENSE_RANK
SELECT 
	quantity,
	DENSE_RANK() OVER(ORDER BY quantity DESC) AS dense_rank_qty # rank independent of num of items. Rank is (rank + 1). Same items get same rank.
FROM
	tbl_customer_purchases;

# RANK
SELECT 
	quantity,
	RANK() OVER(ORDER BY quantity) AS rank_qty # rank dependent on num of items. Rank is (items + 1). Same items get same rank.
FROM
	tbl_customer_purchases;
    
# ROW_NUMBER
SELECT 
	quantity,
	ROW_NUMBER() OVER(ORDER BY quantity DESC) AS row_num
FROM
	tbl_customer_purchases;

# NTILE
SELECT 
	quantity,
	NTILE(4) OVER(ORDER BY quantity DESC) AS group_num # classifies into 4 divisions based on qty
FROM
	tbl_customer_purchases;


# ---------------------------------------------------------------------------------------------------------------------


# Analytical Value Window Functions - Moving average/Sliding window, Cumulative sum or Reverse Cumulative sum. SQL starts from top to bottom so ORDER BY matters.
# FIRST_VALUE, LAST_VALUE, LEAD, LAG, NTH_VALUE, 
# UNBOUNDED PRECEDING, UNBOUNDED FOLLOWING, CURRENT ROW

# FIRST_VALUE
SELECT 
	quantity,
	FIRST_VALUE(quantity) OVER(ORDER BY quantity) AS first_qty # gives 1st row value
FROM
	tbl_customer_purchases;

# LAST_VALUE - accepts a scaler expression - means it can be col, sub query that gives 1 value
SELECT 
	quantity,
	LAST_VALUE(quantity) OVER() AS last_qty # gives last row value - starngely with ORDER BY in window its giving weird values
FROM
	tbl_customer_purchases
ORDER BY
	quantity;

# LAG
SELECT 
	quantity,
	LAG(quantity, 1) OVER(ORDER BY quantity) AS prev_qty # gives 1 row prev from current row
FROM
	tbl_customer_purchases;
    
# LEAD
SELECT 
	quantity,
	LEAD(quantity, 1) OVER(ORDER BY quantity) AS next_qty # gives 1 row next from current row
FROM
	tbl_customer_purchases;
    
# NTH_VALUE - specify RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING when using ORDER BY
SELECT 
	quantity,
	NTH_VALUE(quantity, 3) OVER(ORDER BY quantity RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS third_qty # gives 3rd row value irrespective of current row
FROM
	tbl_customer_purchases;

# ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
SELECT 
	quantity,
	SUM(quantity) OVER(
		ORDER BY quantity 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	) AS sum_prev_2_rows
FROM
	tbl_customer_purchases;

# ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
SELECT 
	quantity,
	SUM(quantity) OVER(
		ORDER BY quantity 
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
	) AS sum_next_2_rows
FROM
	tbl_customer_purchases;

# ROWS BETWEEN UNBOUNDED PRECEDING (first row) AND CURRENT ROW
SELECT 
	quantity,
	COUNT(quantity) OVER(
		ORDER BY quantity 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
	) AS count_first_to_curr_row_qty
FROM
	tbl_customer_purchases;

# ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING (last row)
SELECT 
	quantity,
	COUNT(quantity) OVER(
		ORDER BY quantity 
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
	) AS count_curr_row_to_last_row_qty
FROM
	tbl_customer_purchases;


#IMPLEMENTATION-------------------------------------------------------------------------------------------------------------------------
#IMPLEMENTATION-------------------------------------------------------------------------------------------------------------------------
#IMPLEMENTATION-------------------------------------------------------------------------------------------------------------------------
#IMPLEMENTATION-------------------------------------------------------------------------------------------------------------------------
#IMPLEMENTATION-------------------------------------------------------------------------------------------------------------------------
#IMPLEMENTATION-------------------------------------------------------------------------------------------------------------------------
#IMPLEMENTATION-------------------------------------------------------------------------------------------------------------------------

USE db_test;

# customer_id,customer_first_name,customer_last_name,customer_zip
SELECT * FROM tbl_customer;
TRUNCATE tbl_customer;
INSERT INTO tbl_customer VALUES
(300,NULL,NULL,NULL),
(1,"Jane","Connor",22801),
(4,"Deanna","Washington",22801),
(5,"Abigail","Harris",22801),
(6,"Betty","Bullard",22801),
(9,"Janet","Forbes",22801),
(10,"Russell","Edwards",22801),
(11,"Richard","Paulson",22801),
(14,"William","Lopes",22801),
(15,"Darrell","Messina",22801),
(16,"Ada","Nieves",22801),
(21,"Duane","Sipp",22801),
(22,"George","Rai",22801),
(23,"Alvin","Laurie",22801),
(24,"Dawn","Nale",22801),
(25,"Bonnie","Hassan",22801),
(17,"Carlos","Diaz",22802),
(18,"Jeri","Mitchell",22802),
(19,"Iva","Kienzler",22802),
(20,"Valerie","Loftis",22802),
(2,"Manuel","Diaz",22821),
(3,"Bob","Wilson",22821),
(7,"Jessica","Armenta",22821),
(8,"Norma","Valenzuela",22821),
(12,"Jack","Wise",22821),
(13,"Jeremy","Gruber",22821),
(26,"Tracie","Goehring",22821),
(56,"Rohit","Menon",110006),
(55,"James","Oliver",122067);



# Cumulative sum for each unique window. The next value is added to the previous value. based on the "order by" key
select
	*,
	count(customer_zip) over(order by customer_zip) as count_cust_zip
from
	tbl_customer;
    

# counts grouped values alone based on the "partition by" key
select
	*,
	count(customer_zip) over(partition by customer_zip) as count_cust_zip
from
	tbl_customer;
    
# row count from current row until end
select
	*,
	count(customer_zip) over(rows between current row and unbounded following) as count_cust_zip
from
	tbl_customer;
    
# row count from first row until current row
select
	*,
	count(customer_zip) over(rows between unbounded preceding and current row) as count_cust_zip
from
	tbl_customer;
 
 # All row count
select
	*,
	count(customer_zip) over(rows between unbounded preceding and unbounded following) as count_cust_zip
from
	tbl_customer;
    
# Range is different. it considers the range of values from the current row. if the row is same as 2 rows before it then it considers them as well in the range. 
select
	*,
	count(customer_zip) over(
    order by customer_zip 
    range between current row and unbounded following
    ) as count_cust_zip
from
	tbl_customer;
    
select
	*,
	count(customer_zip) over(
    order by customer_zip 
    range between unbounded preceding and current row
    ) as count_cust_zip
from
	tbl_customer;

# in this one if the value is different in the previous row it counts all the rows with that value and sets that as range
select
	*,
	count(customer_zip) over(
    order by customer_zip 
    range between 2 preceding and current row
    ) as count_cust_zip
from
	tbl_customer;

# Useful for Cumulative stats - same here. Its range of values with that record value. So if there are 10 records with value x then even if u give 2 preceding, it includes all 10 in the range.
select
	*,
	count(customer_zip) over(
    order by customer_zip 
    range between 2 preceding and 2 following
    ) as count_cust_zip
from
	tbl_customer;


