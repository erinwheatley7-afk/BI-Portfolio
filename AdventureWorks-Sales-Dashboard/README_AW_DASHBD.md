# 📊 **AdventureWorks Sales Dashboard**

A complete end‑to‑end Business Intelligence solution built using the AdventureWorks dataset.

This project includes a shared semantic model, reusable DAX measures, SQL validation logic, and five Power BI report pages designed to answer key sales, product, and profitability questions.

---

## 🚀 **Solution Overview**

This repository contains a unified BI solution built on a single star schema and shared DAX model.

All report pages use the same:

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

📌 *See `/model/AdventureWorks-star-schema.png` for the full diagram.*

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

/dax/measures.md

/dax/calendar.dax

---

## 🧠 **Reports Included**

Each report page is built on the shared model and focuses on a different analytical lens.

### 1️⃣ **Sales Main Report**  
High‑level KPIs, revenue trends, and sales performance overview.  
📸 Screenshots:  
`/report/screenshots/sales-report/`

---

### 2️⃣ **Sales Trends (MoM)**  
Month‑over‑month revenue, growth patterns, and seasonal behavior.  
📸 Screenshots:  
`/report/screenshots/sales-trends/`

---

### 3️⃣ **Product Profitability**  
Top‑performing products, gross profit, and margin insights.  
📸 Screenshots:  
`/report/screenshots/product-profitability/`

---

### 4️⃣ **Product Margin Analysis**  
Margin erosion, discount impact, and cost‑to‑revenue relationships.  
📸 Screenshots:  
`/report/screenshots/product-margin-analysis/`

---

### 5️⃣ **Sales Channel Analysis**  
Performance by online, reseller, and in‑store channels.  
📸 Screenshots:  
`/report/screenshots/sales-channel-analysis/`

---

## 📁 **Folder Structure**

AdventureWorks-Dashboard/
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
├── report/
│   ├── AdventureWorks-Dashboard.pbix
│   └── screenshots/
│       ├── sales-report/
│       ├── sales-trends/
│       ├── product-profitability/
│       ├── product-margin-analysis/
│       └── sales-channel-analysis/
│
└── notes/
├── business-logic.md
├── metric-definitions.md
└── project-architecture.md


---

## 🖼️ **Screenshots**

Each report page includes a `screenshots/` directory with:

- `1-default.png`  
- `2-slicer-applied.png`  
- `3-drilldown.png`  

This demonstrates slicer behavior, drill‑downs, and interactive report logic.

---

## 🔧 **How to Reproduce This Project**

1. Download the PBIX file from `/report/AdventureWorks-Dashboard.pbix`  
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

- **GitHub:** https://github.com/erinwheatley7-afk/BI-Portfolio/
- **LinkedIn:** https://www.linkedin.com/in/erinwheatley/
- **Email:** erinwheatley7@gmail.com
  

