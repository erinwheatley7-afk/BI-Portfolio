let
    Source = Sql.Database("ERINLAPTOP", "AdventureWorks2025"),
    Person_vStateProvinceCountryRegion = Source{[Schema="Person",Item="vStateProvinceCountryRegion"]}[Data],
    #"Merged Queries" = Table.NestedJoin(Person_vStateProvinceCountryRegion, {"StateProvinceID"}, #"Person Address", {"StateProvinceID"}, "Person Address", JoinKind.LeftOuter),
    #"Merged Queries1" = Table.NestedJoin(#"Merged Queries", {"StateProvinceID"}, #"Cust Temp", {"Person Address.StateProvinceID"}, "Customer", JoinKind.LeftOuter),
    #"Expanded Customer" = Table.ExpandTableColumn(#"Merged Queries1", "Customer", {"CustomerID", "Person.Person.FirstName", "Person.Person.LastName"}, {"Customer.CustomerID", "Customer.Person.Person.FirstName", "Customer.Person.Person.LastName"}),
    #"Expanded Person Address" = Table.ExpandTableColumn(#"Expanded Customer", "Person Address", {"AddressLine1", "City"}, {"Person Address.AddressLine1", "Person Address.City"}),
    #"Removed Columns" = Table.RemoveColumns(#"Expanded Person Address",{"CountryRegionCode", "TerritoryID", "IsOnlyStateProvinceFlag", "StateProvinceCode", "StateProvinceID"}),
    #"Reordered Columns" = Table.ReorderColumns(#"Removed Columns",{"Customer.CustomerID", "Customer.Person.Person.FirstName", "Customer.Person.Person.LastName", "Person Address.AddressLine1", "Person Address.City", "StateProvinceName", "CountryRegionName"}),
    #"Renamed Columns" = Table.RenameColumns(#"Reordered Columns",{{"Person Address.AddressLine1", "Address"}, {"Person Address.City", "City"}, {"StateProvinceName", "StateProvince"}, {"CountryRegionName", "Country"}, {"Customer.Person.Person.LastName", "Last Name"}, {"Customer.Person.Person.FirstName", "First Name"}, {"Customer.CustomerID", "Customer ID"}}),
    #"Removed Duplicates" = Table.Distinct(#"Renamed Columns", {"Customer ID"})
in
    #"Removed Duplicates"
