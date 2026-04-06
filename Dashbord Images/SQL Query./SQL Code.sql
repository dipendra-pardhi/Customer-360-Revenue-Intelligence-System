CREATE TABLE retail_data (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate TIMESTAMP,
    UnitPrice FLOAT,
    CustomerID FLOAT,
    Country VARCHAR(50),
    TotalPrice FLOAT
);

COPY retail_data
FROM 'C:\Users\Dipendra\OneDrive\Desktop\cleaned_retail.csv'
DELIMITER ','
CSV HEADER;



SELECT SUM(TotalPrice) AS Total_Revenue
FROM retail_data;

SELECT COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM retail_data;

SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM retail_data;

SELECT CustomerID, SUM(TotalPrice) AS Revenue
FROM retail_data
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;

SELECT Description, SUM(Quantity) AS Total_Sold
FROM retail_data
GROUP BY Description
ORDER BY Total_Sold DESC
LIMIT 10;

SELECT 
    DATE_TRUNC('month', InvoiceDate) AS Month,
    SUM(TotalPrice) AS Revenue
FROM retail_data
GROUP BY Month
ORDER BY Month;