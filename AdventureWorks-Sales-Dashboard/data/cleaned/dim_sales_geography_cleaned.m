let
    Source = Sql.Database("ERINLAPTOP", "AdventureWorks2025"),
    Sales_SalesTerritory = Source{[Schema="Sales",Item="SalesTerritory"]}[Data],
    #"Merged Queries" = Table.NestedJoin(Sales_SalesTerritory, {"TerritoryID"}, #"Person vStateProvinceCountryRegion (2)", {"TerritoryID"}, "Person vStateProvinceCountryRegion (2)", JoinKind.RightOuter),
    #"Expanded Person vStateProvinceCountryRegion (2)" = Table.ExpandTableColumn(#"Merged Queries", "Person vStateProvinceCountryRegion (2)", {"StateProvinceName", "CountryRegionName"}, {"Person vStateProvinceCountryRegion (2).StateProvinceName", "Person vStateProvinceCountryRegion (2).CountryRegionName"}),
    #"Removed Columns" = Table.RemoveColumns(#"Expanded Person vStateProvinceCountryRegion (2)",{"Sales.SalesOrderHeader", "Sales.SalesPerson", "Sales.SalesTerritoryHistory", "Sales.Customer", "Person.StateProvince", "Person.CountryRegion", "ModifiedDate", "rowguid", "CostYTD", "CostLastYear"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns",{{"Name", "Territory"}, {"Person vStateProvinceCountryRegion (2).StateProvinceName", "StateProvince"}, {"Person vStateProvinceCountryRegion (2).CountryRegionName", "CountryRegion"}}),
    #"Reordered Columns" = Table.ReorderColumns(#"Renamed Columns",{"TerritoryID", "Territory", "CountryRegionCode", "Group", "SalesYTD", "SalesLastYear", "CountryRegion", "StateProvince"}),
    #"Filtered Rows" = Table.SelectRows(#"Reordered Columns", each true)
in
    #"Filtered Rows"
