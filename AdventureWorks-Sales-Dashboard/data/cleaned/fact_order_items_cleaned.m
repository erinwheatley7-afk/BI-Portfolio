let
    Source = Sql.Database("ERINLAPTOP", "AdventureWorks2025"),
    Sales_SalesOrderDetail = Source{[Schema="Sales",Item="SalesOrderDetail"]}[Data],
    #"Merged Queries" = Table.NestedJoin(Sales_SalesOrderDetail, {"ProductID"}, Products, {"ProductID"}, "Production Product", JoinKind.LeftOuter),
    #"Expanded Production Product" = Table.ExpandTableColumn(#"Merged Queries", "Production Product", {"StandardCost"}, {"Production Product.StandardCost"}),
    #"Removed Columns" = Table.RemoveColumns(#"Expanded Production Product",{"CarrierTrackingNumber", "SpecialOfferID", "rowguid", "ModifiedDate", "Sales.SalesOrderHeader"}),
    #"Expanded Sales.SpecialOfferProduct" = Table.ExpandRecordColumn(#"Removed Columns", "Sales.SpecialOfferProduct", {"Sales.SpecialOffer"}, {"Sales.SpecialOfferProduct.Sales.SpecialOffer"}),
    #"Expanded Sales.SpecialOfferProduct.Sales.SpecialOffer" = Table.ExpandRecordColumn(#"Expanded Sales.SpecialOfferProduct", "Sales.SpecialOfferProduct.Sales.SpecialOffer", {"Description", "DiscountPct", "Type", "Category"}, {"Sales.SpecialOfferProduct.Sales.SpecialOffer.Description", "Sales.SpecialOfferProduct.Sales.SpecialOffer.DiscountPct", "Sales.SpecialOfferProduct.Sales.SpecialOffer.Type", "Sales.SpecialOfferProduct.Sales.SpecialOffer.Category"}),
    #"Renamed Columns" = Table.RenameColumns(#"Expanded Sales.SpecialOfferProduct.Sales.SpecialOffer",{{"Sales.SpecialOfferProduct.Sales.SpecialOffer.Description", "Special Offer Description"}, {"Sales.SpecialOfferProduct.Sales.SpecialOffer.DiscountPct", "Special Offer Discount Price"}, {"Sales.SpecialOfferProduct.Sales.SpecialOffer.Type", "Special Offer Type"}}),
    #"Reordered Columns" = Table.ReorderColumns(#"Renamed Columns",{"SalesOrderID", "SalesOrderDetailID", "OrderQty", "ProductID", "UnitPrice", "UnitPriceDiscount", "LineTotal", "Special Offer Type", "Special Offer Description", "Special Offer Discount Price", "Sales.SpecialOfferProduct.Sales.SpecialOffer.Category", "Production Product.StandardCost"}),
    #"Renamed Columns1" = Table.RenameColumns(#"Reordered Columns",{{"Sales.SpecialOfferProduct.Sales.SpecialOffer.Category", "Special Offer Category"}}),
    #"Reordered Columns1" = Table.ReorderColumns(#"Renamed Columns1",{"SalesOrderID", "SalesOrderDetailID", "OrderQty", "ProductID", "UnitPrice", "UnitPriceDiscount", "LineTotal", "Special Offer Category", "Special Offer Type", "Special Offer Description", "Special Offer Discount Price", "Production Product.StandardCost"}),
    #"Renamed Columns2" = Table.RenameColumns(#"Reordered Columns1",{{"Production Product.StandardCost", "Product Standard Cost"}, {"OrderQty", "Order Quantity"}}),
    #"Changed Type" = Table.TransformColumnTypes(#"Renamed Columns2",{{"LineTotal", Currency.Type}}),
    #"Added Custom" = Table.AddColumn(#"Changed Type", "Net Price", each [UnitPrice] * (1-[UnitPriceDiscount])),
    #"Reordered Columns2" = Table.ReorderColumns(#"Added Custom",{"SalesOrderID", "SalesOrderDetailID", "Order Quantity", "ProductID", "UnitPrice", "UnitPriceDiscount", "Net Price", "LineTotal", "Special Offer Category", "Special Offer Type", "Special Offer Description", "Special Offer Discount Price", "Product Standard Cost"}),
    #"Filtered Rows1" = Table.SelectRows(#"Reordered Columns2", each true),
    #"Changed Type1" = Table.TransformColumnTypes(#"Filtered Rows1",{{"Net Price", Currency.Type}})
in
    #"Changed Type1"
