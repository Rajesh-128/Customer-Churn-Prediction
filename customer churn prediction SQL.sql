-- create database Customer_churn_prediction;
-- use Customer_churn_prediction; 
-- alter table `customer churn prediction dataset` rename to customer_churn_prediction;

-- Q1. Total customers
SELECT COUNT(*) AS Total_Customers
FROM customer_churn_prediction;

-- Q2. Total churned customers
SELECT COUNT(*) AS Churned_Customers
FROM customer_churn_prediction
WHERE Churn = 'Yes';

-- Q3. Overall churn rate
SELECT 
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn_prediction;

-- Q4 Churn by Contract
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn_prediction
GROUP BY Contract
ORDER BY Churn_Rate DESC;

-- Q5. Churn by Internet Service
SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn_prediction
GROUP BY InternetService
ORDER BY Churn_Rate DESC;

-- Q6.Churn by Payment Method
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn_prediction
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

-- alter table customer_churn_prediction
-- rename column ï»¿customerID TO customerID;

-- Q7. High-Value Churned Customers
SELECT
   customerID,
    tenure,
    Contract,
    MonthlyCharges,
    TotalCharges,
    Churn
FROM customer_churn_prediction
WHERE Churn = 'Yes'
AND MonthlyCharges >= 70
ORDER BY MonthlyCharges DESC;

-- Q8. New Customer Churn
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS Tenure_Group,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn_prediction
GROUP BY Tenure_Group
ORDER BY Churn_Rate DESC;


select * from customer_churn_prediction;