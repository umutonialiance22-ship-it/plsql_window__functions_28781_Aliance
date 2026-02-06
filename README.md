# plsql_window__functions_28781_Aliance
window functions and sql joins
Business context: restaurant, sales and management, food and beverage
Data challenge: in the restaurant the challenge is that due to raw data there is no records of sales performance, nor customer behaviour data no top selling products data 
Expected outcomes: identifying top selling products, track sales trends over time

Step2: goals that will be provided by window functions
•	Top 5 menu items of sales in a restaurant → RANK()
•	monthly sales totals of a restaurant → SUM() OVER()
•	Month-over-month sales growth of a restaurant → LAG()
•	Customer spending quartiles of a restaurant → NTILE(4)
•	Three-month moving average of sales of a restaurant → AVG() OVER()

Step4: SQL JOINS
INNER JOIN: transactions between customers and the restaurant
LEFT JOIN: customers who never purchased
RIGHT JOIN: no sales
FULL OUTER JOIN: all customers and products
SELF JOIN: customers in the same region

Descriptive: Pizza and Burger generated the most sales.
Diagnostic: These items were popular and frequently ordered.
Prescriptive: Promote high-performing items; reconsider low-performing menu items.

referenced by kevin stratvert(how to use git and github for beginners), Amit thinks youtube channel
