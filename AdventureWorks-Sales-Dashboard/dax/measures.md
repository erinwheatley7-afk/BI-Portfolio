Avg UnitPrice =
    AVERAGE('Order Items'[UnitPrice])

Cost =
    SUMX(
        'Order Items',
        'Order Items'[Order Quantity] * RELATED('Products'[StandardCost])
    )

Gross Profit =
    [Revenue before Discount] - [Cost]

Gross Profit after Discount =
    [Revenue] - [Cost]

Items Sold =
    SUM('Order Items'[Order Quantity])

Margin % =
    DIVIDE([Gross Profit], [Revenue])

Margin Erosion =
    [Gross Profit] - [Gross Profit after Discount]

Margin Erosion % =
    DIVIDE([Margin Erosion], [Gross Profit])

MoM % Change =
    DIVIDE([MoM Change], [Revenue Previous Month], 0)

MoM Change =
    [Revenue before Discount] - [Revenue Previous Month]

Orders =
    COUNT('Order Items'[SalesOrderID])

Revenue =
    SUMX(
        'Order Items',
        'Order Items'[Order Quantity] * 'Order Items'[Net Price]
    )

Revenue before Discount =
    SUMX(
        'Order Items',
        'Order Items'[Order Quantity] * 'Order Items'[UnitPrice]
    )

Revenue Previous Month =
    CALCULATE(
        [Revenue],
        PREVIOUSMONTH('Calendar'[Date])
    )
