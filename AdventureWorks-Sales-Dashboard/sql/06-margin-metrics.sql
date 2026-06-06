-- Margin %
-- Matches DAX: Margin % = DIVIDE(Gross Profit, Revenue)

SELECT
    (SUM(sod.OrderQty * sod.UnitPrice) - SUM(sod.OrderQty * p.StandardCost))
        / NULLIF(SUM(sod.OrderQty * sod.UnitPrice), 0) AS MarginPercent
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID;


-- Margin Erosion
-- Matches DAX: Margin Erosion = Gross Profit - Gross Profit after Discount

SELECT
    (SUM(sod.OrderQty * sod.UnitPrice) - SUM(sod.OrderQty * p.StandardCost))
    -
    (SUM(sod.OrderQty * (sod.UnitPrice - sod.UnitPriceDiscount)) - SUM(sod.OrderQty * p.StandardCost))
        AS MarginErosion
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID;


-- Margin Erosion %
-- Matches DAX: Margin Erosion % = DIVIDE(Margin Erosion, Gross Profit)

SELECT
    (
        (SUM(sod.OrderQty * sod.UnitPrice) - SUM(sod.OrderQty * p.StandardCost))
        -
        (SUM(sod.OrderQty * (sod.UnitPrice - sod.UnitPriceDiscount)) - SUM(sod.OrderQty * p.StandardCost))
    )
    /
    NULLIF((SUM(sod.OrderQty * sod.UnitPrice) - SUM(sod.OrderQty * p.StandardCost)), 0)
        AS MarginErosionPercent
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID;
