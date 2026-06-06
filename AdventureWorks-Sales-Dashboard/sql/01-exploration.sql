-- Basic exploration queries for understanding the data structure
-- AdventureWorks tables: Sales.SalesOrderDetail, Sales.SalesOrderHeader, Production.Product

SELECT TOP 50 * FROM Sales.SalesOrderDetail;
SELECT TOP 50 * FROM Sales.SalesOrderHeader;
SELECT TOP 50 * FROM Production.Product;

-- Row counts
SELECT COUNT(*) AS DetailRows FROM Sales.SalesOrderDetail;
SELECT COUNT(*) AS HeaderRows FROM Sales.SalesOrderHeader;
SELECT COUNT(*) AS ProductRows FROM Production.Product;

-- Distinct products sold
SELECT DISTINCT ProductID FROM Sales.SalesOrderDetail;
