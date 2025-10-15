# Bank Customer Churn Analysis Dashboard

This project provides an end-to-end analysis of customer churn in a banking dataset using SQL for EDA and Power BI for visualization. The goal is to identify churn drivers, understand customer behavior, and track key performance indicators (KPIs) such as Churn Rate, Retention Rate, and Active vs Inactive Customers.

**What the Project Does**

Performs Exploratory Data Analysis (EDA) using SQL to clean, aggregate, and derive customer-level insights.

Builds an interactive Power BI dashboard to monitor customer churn trends, credit score patterns, and demographic behavior.

Tracks key KPIs:

Total Customers

Active Customers

Inactive (Exit) Customers

Churn Rate (%)

Retention Rate (%)

**Why the Project Is Useful**

Helps the bank identify at-risk customers and take data-driven retention actions.

Provides an interactive dashboard with filters by Month, Year, Gender, Credit Score, and Geography.

Enables executives to monitor churn trends, credit score distribution, and customer demographics over time.

**How to Get Started**

Clone this repository.

Load the cleaned data into Power BI.

Use the included DAX formulas to calculate Churn % and Retention %.

Explore the Power BI dashboard (PBIX file).

**Key Visuals**

KPIs: Customer Count, Active, Inactive, Churn %, Retention %

**Charts:**

Active vs Exit Customers

Churn % by Year and Month

Exit Customers by Credit Score

Gender-based Exit Ratio

Retain vs Exit Customers by Age and Geography

**Key DAX Measures**

Total Customers = DISTINCTCOUNT('Customer'[CustomerID])

Active Customers = CALCULATE(DISTINCTCOUNT('Customer'[CustomerID]), 'Customer'[Status] = "Active")

Inactive Customers = CALCULATE(DISTINCTCOUNT('Customer'[CustomerID]), 'Customer'[Status] = "Exit")

Churn % = DIVIDE([Total Customers] - [Retain Customers], [Total Customers], 0) * 100

Retention Rate % = DIVIDE([Retain Customers], [Total Customers], 0) * 100


<img width="906" height="510" alt="image" src="https://github.com/user-attachments/assets/5196012e-26b6-48db-8c64-5712d751e478" />


<img width="904" height="508" alt="image" src="https://github.com/user-attachments/assets/a60be3ca-5394-4186-a07a-e64e548acd7d" />
