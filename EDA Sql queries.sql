Exploratory Data Analysis (EDA) – SQL Queries
1. View basic dataset structure
SELECT TOP 10 * FROM BankCustomer;

2. Check for missing or null values
SELECT 
    SUM(CASE WHEN CustomerId IS NULL THEN 1 ELSE 0 END) AS Null_CustomerID,
    SUM(CASE WHEN Geography IS NULL THEN 1 ELSE 0 END) AS Null_Geography,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Null_Gender,
    SUM(CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) AS Null_CreditScore,
    SUM(CASE WHEN Exited IS NULL THEN 1 ELSE 0 END) AS Null_Exited
FROM BankCustomer;

3. Total Customers, Active, and Exited
SELECT 
    COUNT(CustomerId) AS Total_Customers,
    SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS Active_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exit_Customers
FROM BankCustomer;

4. Churn Percentage and Retention Percentage
SELECT 
    ROUND( (SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(CustomerId), 2) AS Churn_Percentage,
    ROUND( (SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) * 100.0) / COUNT(CustomerId), 2) AS Retention_Percentage
FROM BankCustomer;

5. Exit Customers by Gender
SELECT 
    Gender,
    COUNT(CustomerId) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exit_Customers,
    ROUND( (SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(CustomerId), 2) AS Churn_Percentage
FROM BankCustomer
GROUP BY Gender;

6. Exit Customers by Credit Score Category
SELECT 
    CASE 
        WHEN CreditScore < 400 THEN 'Poor'
        WHEN CreditScore BETWEEN 400 AND 599 THEN 'Fair'
        WHEN CreditScore BETWEEN 600 AND 699 THEN 'Good'
        WHEN CreditScore BETWEEN 700 AND 799 THEN 'Very Good'
        ELSE 'Excellent'
    END AS CreditScoreCategory,
    COUNT(CustomerId) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exit_Customers
FROM BankCustomer
GROUP BY 
    CASE 
        WHEN CreditScore < 400 THEN 'Poor'
        WHEN CreditScore BETWEEN 400 AND 599 THEN 'Fair'
        WHEN CreditScore BETWEEN 600 AND 699 THEN 'Good'
        WHEN CreditScore BETWEEN 700 AND 799 THEN 'Very Good'
        ELSE 'Excellent'
    END;

7. Exit Customers by Geography
SELECT 
    Geography,
    COUNT(CustomerId) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exit_Customers,
    ROUND((SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(CustomerId), 2) AS Churn_Percentage
FROM BankCustomer
GROUP BY Geography;

8. Churn by Age Group
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 35 THEN '25-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS AgeGroup,
    COUNT(CustomerId) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exit_Customers
FROM BankCustomer
GROUP BY 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 35 THEN '25-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END;

9. Yearly Churn Trend
SELECT 
    YEAR(JoiningDate) AS Year,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exit_Customers,
    COUNT(CustomerId) AS Total_Customers,
    ROUND((SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(CustomerId), 2) AS Churn_Percentage
FROM BankCustomer
GROUP BY YEAR(JoiningDate)
ORDER BY Year;

10. Monthly Churn Trend
SELECT 
    DATENAME(MONTH, JoiningDate) AS Month,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exit_Customers,
    COUNT(CustomerId) AS Total_Customers,
    ROUND((SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(CustomerId), 2) AS Churn_Percentage
FROM BankCustomer
GROUP BY DATENAME(MONTH, JoiningDate)
ORDER BY MIN(MONTH(JoiningDate));
