
-- INNER JOIN: transactions with valid customers and products
SELECT t.transaction_id, c.customer_name, p.product_name, t.quantity, t.total_amount
FROM transactions t
INNER JOIN customers c ON t.customer_id = c.customer_id
INNER JOIN products p ON t.product_id = p.product_id;

-- LEFT JOIN: customers with no transactions
SELECT c.customer_name, t.transaction_id
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
WHERE t.transaction_id IS NULL;

-- RIGHT JOIN: products with no sales
SELECT p.product_name, t.transaction_id
FROM transactions t
RIGHT JOIN products p ON t.product_id = p.product_id
WHERE t.transaction_id IS NULL;

-- FULL OUTER JOIN simulation
SELECT c.customer_name, t.transaction_id
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
UNION
SELECT c.customer_name, t.transaction_id
FROM customers c
RIGHT JOIN transactions t ON c.customer_id = t.customer_id;

-- SELF JOIN: compare customers within the same region
SELECT c1.customer_name AS customer1, c2.customer_name AS customer2, c1.region
FROM customers c1
JOIN customers c2
ON c1.region = c2.region
AND c1.customer_id <> c2.customer_id;

-- RANK(): top products by total sales
SELECT product_id, SUM(total_amount) AS total_sales,
RANK() OVER (ORDER BY SUM(total_amount) DESC) AS sales_rank
FROM transactions
GROUP BY product_id;

-- SUM() OVER(): running total of sales by date
SELECT transaction_date, SUM(total_amount) OVER (ORDER BY transaction_date) AS running_total
FROM transactions;

-- LAG(): compare current day sales with previous
SELECT transaction_date, total_amount,
total_amount - LAG(total_amount, 1) OVER (ORDER BY transaction_date) AS growth
FROM transactions;

-- NTILE(4): segment customers by total spending
SELECT customer_id, SUM(total_amount) AS total_spent,
NTILE(4) OVER (ORDER BY SUM(total_amount) DESC) AS spending_quartile
FROM transactions
GROUP BY customer_id;

-- AVG() OVER(): 3-transaction moving average of total_amount
SELECT transaction_id, total_amount,
AVG(total_amount) OVER (ORDER BY transaction_id ROWS 2 PRECEDING) AS moving_avg_3
FROM transactions;

