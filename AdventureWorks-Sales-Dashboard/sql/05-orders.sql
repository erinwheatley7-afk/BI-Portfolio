-- Orders
-- Matches DAX: Orders = COUNT(SalesOrderID)
-- Note: SalesOrderDetail has one row per line item, not per order.

-- Count of order lines
SELECT
    COUNT(*) AS OrderLines
FROM Sales.SalesOrderDetail AS sod;

-- Count of distinct orders
SELECT
    COUNT(DISTINCT sod.SalesOrderID) AS DistinctOrders
FROM Sales.SalesOrderDetail AS sod;
