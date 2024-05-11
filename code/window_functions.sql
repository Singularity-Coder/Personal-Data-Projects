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
	DENSE_RANK() OVER(ORDER BY quantity) AS dense_rank_qty # rank independent of num of items. Rank is (rank + 1). Same items get same rank.
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
	ROW_NUMBER() OVER(ORDER BY quantity) AS row_num
FROM
	tbl_customer_purchases;
    
SELECT 
	quantity,
	ROW_NUMBER() OVER(ORDER BY quantity DESC) AS row_num
FROM
	tbl_customer_purchases;

# NTILE
SELECT 
	quantity,
	NTILE(4) OVER(ORDER BY quantity) AS group_num # classifies into 4 divisions based on qty
FROM
	tbl_customer_purchases;


# ---------------------------------------------------------------------------------------------------------------------


# Analytical Value Window Functions - Moving average/Sliding window, Cumulative sum or Reverse Cumulative sum. SQL starts from top to bottom so ORDER BY matters.
# FIRST_VALUE, LAST_VALUE, LEAD, LAG, NTH_VALUE, UNBOUNDED PRECEDING, UNBOUNDED FOLLOWING, CURRENT ROW

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
    
# NTH_VALUE - always specify RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING when using ORDER BY
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






