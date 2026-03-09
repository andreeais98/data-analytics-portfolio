SELECT TOP 10 *
FROM Sales.SalesOrderHeader;

SELECT TOP 10 *
FROM Sales.SalesTerritory;

--Total sales:

SELECT SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader;

--Total number of orders:

SELECT COUNT(SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader;

--Total unique customers:

SELECT COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM Sales.SalesOrderHeader;

--Sales by territory:

SELECT 
    st.Name AS Territory,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st
    ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY TotalSales DESC;

--Sales by year:

SELECT 
    YEAR(OrderDate) AS OrderYear,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

--Average order value:

SELECT 
    AVG(TotalDue) AS AvgOrderValue
FROM Sales.SalesOrderHeader;

--Top 10 customers by sales:

SELECT TOP 10
    CustomerID,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY TotalSales DESC;

--Top products by sales:

SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalSales DESC;

--Top products by sales:

SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalSales DESC;

--Sales by product category:

SELECT
    pc.Name AS CategoryName,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc
    ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY TotalSales DESC;

---

USE AdventureWorks2022;
GO

SELECT SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader;

SELECT COUNT(SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader;

SELECT COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM Sales.SalesOrderHeader;

--Sales by Territory:

SELECT 
    st.Name AS Territory,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st
    ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY TotalSales DESC;

--Sales by Year:

SELECT 
    YEAR(OrderDate) AS OrderYear,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

--Top 10 Products by Sales:

SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalSales DESC;

--Sales by Product Category:

SELECT
    pc.Name AS CategoryName,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc
    ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY TotalSales DESC;

--Key Insights

Southwest territory generated the highest sales.

Sales peaked in 2011.

The best-selling product was Mountain-200 Black, 38.

The Bikes category produced the highest revenue.