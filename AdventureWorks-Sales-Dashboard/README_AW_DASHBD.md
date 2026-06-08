# 📊 **AdventureWorks Sales Dashboard**
A complete end‑to‑end Business Intelligence solution built using the AdventureWorks dataset.  
This project includes a shared semantic model, reusable DAX measures, SQL validation logic, and multiple Power BI reports designed to answer key sales, product, and profitability questions.

---

## 🚀 **Solution Overview**
This repository contains a unified BI solution built on a single star schema and shared DAX model.  
All reports use the same:

- Data model  
- Calendar table  
- DAX measures  
- SQL validation queries  
- Business logic  

This mirrors how real analytics teams build scalable, maintainable BI environments.

---

## 🧱 **Data Model**
The solution uses a clean star schema centered on **Order Items** as the fact table, with dimensions for:

- Products  
- Customers  
- Staff  
- Orders (header table)  
- Calendar  

A custom Calendar table supports fiscal reporting (Fiscal Year begins in July).

📌 *See `/model/star-schema.png` for the full diagram.*

---

## 📐 **Key Metrics**
All metrics are defined once and reused across all reports:

- **Revenue** (before & after discount)  
- **Gross Profit**  
- **Margin %**  
- **Margin Erosion**  
- **Items Sold**  
- **Orders**  
- **MoM Revenue Change**  
- **Top‑N Product Performance**  
- **Sales Channel Performance**  

Full DAX definitions are available in:

/dax/measures.dax
/dax/calendar.dax

Code

---

## 🧠 **Reports Included**
Each report is built on the shared model and focuses on a different analytical lens.

### 📄 **Sales Main Report**
High‑level KPIs, revenue trends, and sales performance overview.

### 📈 **Sales Trends (MoM)**
Month‑over‑month revenue, growth patterns, and seasonal behavior.

### 📦 **Product Profitability**
Top‑performing products, gross profit, and margin insights.

### 📉 **Product Margin Analysis**
Margin erosion, discount impact, and cost‑to‑revenue relationships.

### 🛒 **Sales Channel Analysis**
Performance by online, reseller, and in‑store channels.

Each report has its own folder under `/reports/` with PBIX files and screenshots.

---

## 📁 **Folder Structure**

AdventureWorks-Sales-Dashboard/
│
├── README.md
│
├── model/
│   ├── star-schema.png
│   └── data-dictionary.md
│
├── dax/
│   ├── measures.dax
│   └── calendar.dax
│
├── sql/
│   ├── 01-exploration.sql
│   ├── 02-revenue.sql
│   ├── 03-gross-profit.sql
│   ├── 04-items-sold.sql
│   ├── 05-orders.sql
│   ├── 06-margin-metrics.sql
│   └── 07-mom-change.sql
│
├── reports/
│   ├── Sales-Main/
│   ├── Sales-Trends-MoM/
│   ├── Product-Profitability/
│   ├── Product-Margin-Analysis/
│   └── Sales-Channel-Analysis/
│
└── notes/
├── business-logic.md
├── metric-definitions.md
└── project-architecture.md

Code

---

## 🖼️ **Screenshots**
Each report folder includes a `screenshots/` directory with visuals demonstrating the dashboards.

---

## 🔧 **How to Reproduce This Project**
1. Download any PBIX file from `/reports/`
2. Ensure the AdventureWorks database is available (DW or OLTP version)
3. Update the data source connection in Power BI Desktop
4. Refresh the model

---

## 📝 **Technologies Used**
- **Power BI Desktop**  
- **DAX**  
- **SQL Server / T‑SQL**  
- **Power Query (M)**  
- **GitHub**  
- **AdventureWorks Sample Database**

---

## 👤 **About the Author**
**Erin Wheatley**  
Business Intelligence Analyst specializing in:

- Data modeling  
- DAX & semantic modeling  
- SQL analytics  
- Dashboard design  
- End‑to‑end BI solutions  

---

## 📬 **Contact**
- **GitHub:** https://github.com/erinwheatley7-afk/
- **LinkedIn:** https://www.linkedin.com/in/erinwheatley/  
- **Email:** erinwheatley7@gmail.com
