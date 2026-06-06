# Cleaned Data (Power Query M Scripts)

This folder contains the cleaned, transformed datasets used to build the AdventureWorks Sales Dashboard semantic model.  
All transformations were performed using **Power Query inside Excel**, which served as the staging layer before loading the data into Power BI.

Each `.m` file in this folder represents the full Power Query M script used to clean and shape a specific table.  
These scripts document the exact ETL logic applied to the raw AdventureWorks tables.

---

## 📁 Contents

- **fact_orders_cleaned.m**  
  Power Query script used to clean and transform the SalesOrderHeader table, including:
  - Removing unused columns  
  - Standardizing data types  
  - Replacing status codes with readable labels  
  - Merging sales geography  
  - Filtering to the analysis period  
  - Preparing the table for relationship modeling  

- **fact_order_items_cleaneded.m**  
  Cleans the SalesOrderDetail table and prepares it as the line‑level fact table.

- **dim_products_cleaned.m**  
  Cleans and shapes product data for use as a dimension table.

- **dim_customers_cleaned.m**  
  Cleans customer attributes and prepares them for modeling.

- **dim_staff_cleaned.m**  
  Cleans salesperson/staff data for use as a dimension.

- **dim_sales_geography_cleaned.m**  
  Cleans geography data for use as a dimension.

*(Your actual filenames may vary — this README is designed to match whatever naming convention you choose.)*

---

## 🧠 Why These Files Matter

Including the M scripts in the repository provides:

- **Full transparency** into the data cleaning process  
- **Reproducibility** — anyone can recreate the cleaned tables  
- **Documentation** of your ETL logic  
- **Professional BI workflow** that mirrors real analytics engineering practices  

These scripts represent the transformation layer between the raw SQL extracts and the Power BI semantic model.

---

## 🔗 How They Connect to the Project

1. Raw data is extracted from the AdventureWorks SQL Server database  
2. Power Query in Excel performs all cleaning and shaping  
3. Cleaned tables are loaded into Power BI  
4. The semantic model (star schema) is built on top of these cleaned tables  
5. All reports in `/reports/` use this shared model

---
