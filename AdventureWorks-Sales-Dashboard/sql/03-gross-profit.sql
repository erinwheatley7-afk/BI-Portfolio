-- Gross Profit (Before and After Discount)
-- Matches DAX: Gross Profit = RevenueBeforeDiscount - Cost

-- Revenue Before Discount
SELECT
    SUM(sod.OrderQty * sod.UnitPrice) AS RevenueBeforeDiscount
FROM Sales.SalesOrderDetail AS sod;

-- Cost
SELECT
    SUM(sod.OrderQty * p.StandardCost) AS Cost
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID;

-- Gross Profit Before Discount
SELECT
    SUM(sod.OrderQty * sod.UnitPrice)
    - SUM(sod.OrderQty * p.StandardCost) AS GrossProfit
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID;

-- Gross Profit After Discount
SELECT
    SUM(sod.OrderQty * (sod.UnitPrice - sod.UnitPriceDiscount))
    - SUM(sod.OrderQty * p.StandardCost) AS GrossProfitAfterDiscount
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID;
