USE telecom_db;

SELECT * FROM customer_churn;



-- 1. Gender based customer proportion 
SELECT 
	Gender, 
	COUNT(Gender) AS `total count`, 
	round(COUNT(Gender)*100.0/(SELECT count(*) FROM customer_churn), 2) AS `Proportion(%)`
FROM customer_churn
GROUP BY Gender;



-- 2. Contract based customer proportion
SELECT 
    Contract,
    COUNT(*) AS `total_count`,
    round(((COUNT(Contract)*100.0)/(SELECT COUNT(*) FROM customer_churn)), 2) AS `Proportion(%)`
FROM customer_churn
GROUP BY Contract
ORDER BY `Proportion(%)` DESC;



-- 3. Customer status 
SELECT 
	Customer_Status,
    COUNT(Customer_Status) AS `total count`,
    ROUND(SUM(Total_Revenue),2) AS `total revenue`,
    ROUND((SUM(Total_Revenue)*100.0)/(SELECT SUM(Total_Revenue) FROM customer_churn),2) AS `%Revenue`
FROM customer_churn
GROUP BY Customer_Status;
 
 

-- 4. state contribution proportion
SELECT
	`State`,
    COUNT(`State`) AS `Total customers`,
    ROUND((COUNT(`State`)*100.0)/(SELECT COUNT(*) FROM customer_churn),2) AS `%Customer`,
    ROUND((SUM(Total_Revenue)*100.0)/(SELECT SUM(Total_Revenue) FROM customer_churn),2) AS `%Revenue`
FROM customer_churn
GROUP BY `State`
ORDER BY `%Customer` DESC;



SELECT DISTINCT(Internet_Type) FROM customer_churn
