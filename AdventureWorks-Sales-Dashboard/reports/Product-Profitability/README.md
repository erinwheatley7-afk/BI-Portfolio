## 📊 **Product Profitability Analysis**

A Power BI project analyzing revenue, margin, discount impact, and month‑over‑month performance.

## 📌 **Overview**

This project analyzes product‑level profitability using sales, product, and calendar data.
It explores how pricing, discounts, and cost structure affect:

-Revenue

-Gross profit

-Margin %

-Margin erosion

-Month‑over‑month performance

The report is built in Power BI Desktop, using a star schema and a clean set of reusable DAX measures.
___________________________________________________________________________________________________________________

## 🎯 **Business Questions Answered**

(1) Which products generate the highest revenue and profit?

(2) How do discounts impact margin and profitability?

(3) What is the average order value (AOV)?

(4) How does revenue change month‑over‑month?

(5) Which products experience the most margin erosion?

(6) How many items are sold per product category?
___________________________________________________________________________________________________________________

## 🧱 **Data Model**

This project uses a star schema with the following tables:

Fact Table:

-Order Items

Dimension Tables:

-Products

-Calendar

-Customer

-Orders

Relationships follow a standard one‑to‑many pattern, with Calendar[Date] driving all time‑intelligence measures.
________________________________________________________________________________________________________________________

## 📐 **Key Metrics**

This report includes metrics such as:

-Revenue (before and after discount)

-Gross Profit

-Margin %

-Margin Erosion & Margin Erosion %

-Average Unit Price / Net Price

-AOV (Average Order Value)

-MoM Change & MoM % Change

-Items Sold

-Orders

All DAX measures are documented in the MEASURES.md file.
_______________________________________________________________________________________________________________________________

### 📅 Calendar Table (DAX)

This project includes a custom Calendar table with fiscal logic (fiscal year begins in July).  
Full DAX for the calculated columns is available in:

`/dax/calendar.dax`
_______________________________________________________________________________________________________________________________

## 📁 **Folder Structure**

Code
Project-1-Product-Profitability/
│
├── README.md                ← You are here
├── MEASURES.md              ← Full DAX documentation
│
├── dax/
│   └── measures.dax         ← Raw DAX formulas (optional)
│
├── model/
│   └── star-schema.png      ← Data model diagram
│
├── report/
│   ├── Product-Profitability.pbix   ← Power BI file (optional)
│   └── screenshots/
│       ├── overview.png
│       ├── product-details.png
│       └── margin-analysis.png
│
└── notes/
    ├── business-logic.md
    ├── metric-definitions.md
    └── data-dictionary.md
______________________________________________________________________________________________________________________________________

## 🖼️ Report Screenshots

### 📄 Product Profitability — Main Report
![Product Profitability Main](reports/screenshots/Product%20Profitability%20Main.png)

### 🔧 Product Profitability — Accessories (Top 10, 2025)
![Product Profitability Accessories 2025 Top 10](reports/screenshots/Product%20Profitability%20Accessories%202025%20Top%2010.png)

### 🚵 Product Profitability — Mountain Bikes (Top 10, 2025)
![Product Profitability Mountain Bikes 2025 Top 10](reports/screenshots/Product%20Profitability%20Mountain%20Bikes%202025%20Top%2010.png)

______________________________________________________________________________________________________________________________________


## 🔧 **How to Reproduce This Project**

Download the .pbix file (if included)

Review the data model in /model/star-schema.png

Explore the DAX measures in MEASURES.md

Open the report in Power BI Desktop

Refresh the model (if using local data)
______________________________________________________________________________________________________________________________________

## 📝 **Technologies Used**

Power BI Desktop

DAX

Power Query

Star Schema Modeling

Data Visualization & Storytelling
______________________________________________________________________________________________________________________________________

## 👤 **Author**

Erin Wheatley 

Business Intelligence Analyst

GitHub Portfolio Project
