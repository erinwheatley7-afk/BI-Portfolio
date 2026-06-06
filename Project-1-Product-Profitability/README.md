# 📦 Product Profitability Report

This report analyzes product‑level revenue, gross profit, and margin performance across the AdventureWorks product catalog.  
It is designed to help business stakeholders identify top‑performing products, understand profitability drivers, and highlight opportunities for margin improvement.

This report is built on the shared semantic model and cleaned Power Query datasets located in the `/data/cleaned` folder.

---

## 🎯 Purpose of the Report

The Product Profitability report answers key business questions:

- Which products generate the highest revenue?
- Which products contribute the most gross profit?
- How do product categories compare in margin percentage?
- What portion of total gross profit comes from each category?
- Which products should be prioritized for sales, marketing, or inventory planning?

---

## 🧱 Data Sources

This report uses the following cleaned tables from the semantic model:

- **fact_order_items** — line‑level sales transactions  
- **dim_products** — product attributes  
- **dim_sales_header** — order‑level details  
- **dim_calendar** — fiscal calendar (FY starts in July)  
- **dim_geography** — sales territory attributes  

All transformations are documented in `/data/cleaned/*.m`.

---

## 📊 Visuals Included

### **1. Top 10 Products by Revenue**
A horizontal bar chart ranking the highest‑earning products.  
This helps identify which SKUs drive the majority of sales volume.

### **2. Gross Profit by Product Category**
A column chart comparing total gross profit across major categories:
- Bikes  
- Accessories  
- Components  
- Clothing  

### **3. Margin % by Product Category**
A bar chart showing profitability efficiency by category.  
Accessories and Clothing typically show higher margin percentages.

### **4. % of Total Gross Profit (Treemap)**
A treemap illustrating each category’s contribution to total gross profit.  
Bikes dominate overall profitability despite lower margin %.

---

## 🧮 Key Metrics Used

- **Revenue**  
- **Gross Profit**  
- **Margin %**  
- **Items Sold**  
- **% of Total Gross Profit**  
- **Top‑N Product Ranking**  

All DAX measures are defined in `/dax/measures.dax`.

---

## 🗂️ Folder Contents

Product-Profitability/
│
├── Product-Profitability.pbix
├── README.md
└── screenshots/
└── product_profitability_main.png

Code

---

## 📝 How to Use This Report

1. Open the PBIX file in Power BI Desktop  
2. Ensure the semantic model tables are connected  
3. Use the Fiscal Year & Month slicer to filter the analysis period  
4. Explore product‑level performance across revenue, margin, and profitability  

---

## 👤 Author

Created by **Erin Wheatley**  
Business Intelligence Analyst — Data Modeling • DAX • SQL • Power BI
