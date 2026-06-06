-- Month-over-Month Revenue Change
-- Matches DAX: MoM Change = RevenueBeforeDiscount - RevenuePreviousMonth

-- Revenue by month
WITH MonthlyRevenue AS (
    SELECT
        YEAR(soh.OrderDate) AS Yr,
        MONTH(soh.OrderDate) AS Mo,
        SUM(sod.OrderQty * sod.UnitPrice) AS RevenueBeforeDiscount
    FROM Sales.SalesOrderDetail AS sod
    JOIN Sales.SalesOrderHeader AS soh
        ON sod.SalesOrderID = soh.SalesOrderID
    GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate)
)

-- MoM Change
SELECT
    curr.Yr,
    curr.Mo,
    curr.RevenueBeforeDiscount AS CurrentMonthRevenue,
    prev.RevenueBeforeDiscount AS PreviousMonthRevenue,
    curr.RevenueBeforeDiscount - prev.RevenueBeforeDiscount AS MoMChange
FROM MonthlyRevenue curr
LEFT JOIN MonthlyRevenue prev
    ON prev.Yr = CASE WHEN curr.Mo = 1 THEN curr.Yr - 1 ELSE curr.Yr END
   AND prev.Mo = CASE WHEN curr.Mo = 1 THEN 12 ELSE curr.Mo - 1 END
ORDER BY curr.Yr, curr.Mo;
