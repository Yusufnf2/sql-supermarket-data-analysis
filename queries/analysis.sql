---------------------------------------------
--- Data Preparation ---
ALTER TABLE sales
ADD COLUMN date_clean DATE,
ADD COLUMN time_clean TIME;

UPDATE sales
SET 
    date_clean = "Date"::DATE,
    time_clean = "Time"::TIME;

SELECT * 
FROM sales s 
LIMIT 5;

---------------------------------------------
--- Branch Performance Analysis ---

WITH branch_summary AS (
	SELECT 
		s."Branch" ,
		SUM(s."Sales" ) AS revenue,
		SUM(s."gross income") AS profit,
		AVG(s."Rating") AS avg_rating
	FROM sales s 
	GROUP BY s."Branch" 
)
SELECT *
FROM branch_summary 
ORDER BY revenue DESC ;

---------------------------------------------
--- Product Profitability vs Sales ---

WITH product_perf AS (
	SELECT 
		s."Product line",
		SUM(s."Quantity") AS total_sold,
		SUM(s."gross income") AS total_profit
	FROM sales s 
	GROUP BY s."Product line" 
)
SELECT *,
	RANK () OVER (ORDER BY total_profit DESC) AS profit_rank,
	RANK () OVER (ORDER BY total_sold DESC) AS volume_rank
FROM product_perf;

---------------------------------------------
--- Peak Hour Analysis ----

WITH hourly_sales  AS (
	SELECT 
		EXTRACT(HOUR FROM s.time_clean) AS hour,
		SUM(s."Sales") AS revenue
	FROM sales s 
	GROUP BY EXTRACT(HOUR FROM s.time_clean)
)
SELECT *,
	CASE 
		WHEN revenue = (SELECT MAX(revenue) FROM hourly_sales) THEN 'Peak Hour'ELSE 'Normal'
	END AS category
FROM hourly_sales
ORDER BY hour;

---------------------------------------------
--- Customer Value Analysis ---

WITH customer_spend AS (
	SELECT
		s."Customer type",
		COUNT(*) AS total_transactions,
		SUM(s."Sales") AS total_spending,
		AVG(s."Sales") AS avg_transactions
	FROM sales s 
	GROUP BY s."Customer type" 
)
SELECT *
FROM customer_spend;

---------------------------------------------
--- Payment Method Contribution ---

WITH payment_stats AS (
    SELECT 
        s."Payment",
        COUNT(*) AS usage_count,
        SUM(s."Sales") AS revenue
    FROM sales s
    GROUP BY s."Payment" 
),
total_revenue AS (
    SELECT SUM(s."Sales") AS total FROM sales s
)
SELECT 
    p."Payment",
    p.usage_count,
    p.revenue,
    (p.revenue / t.total * 100) AS revenue_percentage
FROM payment_stats p, total_revenue t
ORDER BY revenue DESC;

---------------------------------------------
--- Sales Trend + Ranking ---

WITH daily_sales AS (
    SELECT 
        EXTRACT (DAY FROM s.date_clean) AS day,
        SUM(s."Sales") AS revenue
    FROM sales s
    GROUP BY EXTRACT (DAY FROM s.date_clean)
),
ranked_sales AS (
    SELECT *,
           RANK() OVER (ORDER BY revenue DESC) AS sales_rank
    FROM daily_sales
)
SELECT *
FROM ranked_sales;

---------------------------------------------
--- High Value Transactions--

WITH avg_sales AS (
    SELECT AVG(s."Sales") AS avg_value FROM sales s
),
high_transactions AS (
    SELECT *
    FROM sales s
    WHERE s."Sales" > (SELECT avg_value FROM avg_sales)
)
SELECT 
    COUNT(*) AS high_value_transactions,
    SUM("Sales") AS revenue_from_high_value
FROM high_transactions;

---------------------------------------------