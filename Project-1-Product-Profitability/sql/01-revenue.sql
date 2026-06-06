-- Revenue (After Discount)
-- Matches DAX: Revenue = SUMX(Order Items, OrderQty * NetPrice)

SELECT
    SUM(sod.OrderQty * (sod.UnitPrice - sod.UnitPriceDiscount)) AS Revenue
FROM Sales.SalesOrderDetail AS sod;
