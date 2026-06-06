-- Items Sold
-- Matches DAX: Items Sold = SUM(OrderQty)

SELECT
    SUM(sod.OrderQty) AS ItemsSold
FROM Sales.SalesOrderDetail AS sod;
