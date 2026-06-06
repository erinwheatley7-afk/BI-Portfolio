let
    Source = Sql.Database("ERINLAPTOP", "AdventureWorks2025"),
    Sales_SalesPerson = Source{[Schema="Sales",Item="SalesPerson"]}[Data],
    #"Merged Queries" = Table.NestedJoin(Sales_SalesPerson, {"BusinessEntityID"}, #"Person Person", {"BusinessEntityID"}, "Person Person", JoinKind.LeftOuter),
    #"Expanded Person Person" = Table.ExpandTableColumn(#"Merged Queries", "Person Person", {"FirstName", "LastName"}, {"Person Person.FirstName", "Person Person.LastName"}),
    #"Merged Queries1" = Table.NestedJoin(#"Expanded Person Person", {"BusinessEntityID"}, #"HumanResources vEmployee", {"BusinessEntityID"}, "HumanResources vEmployee", JoinKind.LeftOuter),
    #"Expanded HumanResources vEmployee" = Table.ExpandTableColumn(#"Merged Queries1", "HumanResources vEmployee", {"JobTitle", "EmailAddress", "AddressLine1", "City", "StateProvinceName", "CountryRegionName"}, {"HumanResources vEmployee.JobTitle", "HumanResources vEmployee.EmailAddress", "HumanResources vEmployee.AddressLine1", "HumanResources vEmployee.City", "HumanResources vEmployee.StateProvinceName", "HumanResources vEmployee.CountryRegionName"}),
    #"Expanded Sales.SalesTerritory" = Table.ExpandRecordColumn(#"Expanded HumanResources vEmployee", "Sales.SalesTerritory", {"Name", "Group"}, {"Sales.SalesTerritory.Name", "Sales.SalesTerritory.Group"}),
    #"Removed Columns" = Table.RemoveColumns(#"Expanded Sales.SalesTerritory",{"TerritoryID", "rowguid"}),
    #"Expanded HumanResources.Employee" = Table.ExpandRecordColumn(#"Removed Columns", "HumanResources.Employee", {"OrganizationLevel", "JobTitle"}, {"HumanResources.Employee.OrganizationLevel", "HumanResources.Employee.JobTitle"}),
    #"Removed Columns1" = Table.RemoveColumns(#"Expanded HumanResources.Employee",{"HumanResources.Employee.OrganizationLevel", "ModifiedDate", "Sales.SalesOrderHeader"}),
    #"Expanded Sales.SalesPersonQuotaHistory" = Table.ExpandTableColumn(#"Removed Columns1", "Sales.SalesPersonQuotaHistory", {"QuotaDate", "SalesQuota"}, {"Sales.SalesPersonQuotaHistory.QuotaDate", "Sales.SalesPersonQuotaHistory.SalesQuota"}),
    #"Renamed Columns" = Table.RenameColumns(#"Expanded Sales.SalesPersonQuotaHistory",{{"Sales.SalesTerritory.Name", "Territory"}, {"Sales.SalesTerritory.Group", "Territory Group"}}),
    #"Removed Columns2" = Table.RemoveColumns(#"Renamed Columns",{"Sales.SalesTerritoryHistory", "Sales.Store"}),
    #"Renamed Columns1" = Table.RenameColumns(#"Removed Columns2",{{"HumanResources vEmployee.JobTitle", "Job Title"}}),
    #"Removed Columns3" = Table.RemoveColumns(#"Renamed Columns1",{"HumanResources vEmployee.EmailAddress"}),
    #"Renamed Columns2" = Table.RenameColumns(#"Removed Columns3",{{"HumanResources vEmployee.AddressLine1", "Address"}, {"HumanResources vEmployee.City", "City"}, {"HumanResources vEmployee.StateProvinceName", "StateProvince"}, {"HumanResources vEmployee.CountryRegionName", "CountryRegion"}}),
    #"Extracted Date" = Table.TransformColumns(#"Renamed Columns2",{{"Sales.SalesPersonQuotaHistory.QuotaDate", DateTime.Date, type date}})
in
    #"Extracted Date"
