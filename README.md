# 📊 QuickCart E-Commerce Operations Analysis
SQL | Power BI | Business & Operations Analytics | Data-Driven Insights

## 📌 Project Overview
This project analyzes the operational performance of an e-commerce business to uncover insights related to revenue generation, product performance, order cancellations, and delivery efficiency.

Using SQL for data cleaning and exploration, and Power BI for visualization, the analysis transforms raw transactional data into a structured, decision-ready dashboard.

The goal of this project is to identify operational inefficiencies, highlight key performance drivers, and provide actionable insights that support business decisions across sales, logistics, and product strategy.

---

## 🛠️ Tools & Technologies
- SQL (MySQL) – Data cleaning, transformation, and exploratory analysis  
- Power BI – Dashboard development and data visualization  
- Microsoft Excel – Initial data inspection and CSV handling  
- GitHub – Project documentation and version control  

---

## 🗂️ Data Source & Preparation
The dataset consists of e-commerce transactional data, including order records, product details, customer locations, order status, and delivery timelines.

### Data Cleaning
- Handled missing values (e.g., null delivery dates for cancelled orders)  
- Identified and reviewed duplicate order records  
- Standardized categorical fields such as product categories  
- Ensured correct data types for date and numeric fields  

### Data Transformation & Analysis
- Joined `orders` and `products` tables using `product_id`  
- Computed key metrics such as total revenue, cancellation counts, and delivery durations  
- Aggregated data for insights (monthly revenue, product performance, etc.)  

The cleaned dataset was exported as a CSV file and used in Power BI for dashboard visualization.

---

## ⚠️ Business Problem
QuickCart’s management is concerned about overall operational performance across its e-commerce platform.

There are indications of inefficiencies, including relatively high order cancellation rates, variations in product revenue performance, and inconsistencies in delivery timelines.

To support better decision-making, management needs clear visibility into revenue trends, product performance, cancellation behavior, and delivery efficiency.

---

## 🔍 Analysis Focus
The analysis was guided by the following key questions:

- How has revenue performed over time across the year?  
- Which products contribute the most to overall revenue?  
- What is the overall cancellation rate, and how does it vary across products?  
- Which products have disproportionately high cancellation rates?  
- How consistent is delivery performance across customer locations?  

---

## 📈 Key Insights
- **Revenue Performance**  
  Revenue remained relatively stable across the year, with fluctuations in certain months, indicating possible demand variation.

- **Top Performing Products**  
  A few products (Product_3, Product_22, and Product_8) contribute a significant share of total revenue.

- **Cancellation Patterns**  
  Out of 480 total orders, 73 were cancelled (~15%), which has a noticeable impact on operations.

- **High-Risk Product**  
  Product_8 shows both high order volume and a relatively high cancellation rate, suggesting potential issues.

- **Delivery Performance**  
  The average delivery time is approximately 5.5 days, with a maximum of 10 days, indicating moderate variability.

- **Data Quality Observation**  
  Missing delivery dates in some records highlighted the importance of proper data cleaning before analysis.

---

## 💡 Business Recommendations
- Investigate products with high cancellation rates (e.g., Product_8).  
- Optimize delivery processes to improve consistency across locations. 
- Focus on high-performing products for marketing and inventory planning.  
- Monitor cancellation trends regularly to detect operational issues early.  
- Improve data validation processes to ensure better data quality.  

---

## 📊 DASHBOARD PREVIEW
<p align="center">
  <img src="Dashboard/E_Commerce Dashboard.png" width="800">
</p>

---

## 📊 Dashboard
The Power BI dashboard provides a consolidated view of:

- Total Orders, Total Revenue, and Cancellation Rate (KPIs)  
- Monthly Revenue Trend  
- Revenue by Product  
- Cancellation Rate by Product  
- Delivery Performance Insights  

The dashboard is designed to communicate key insights quickly and support decision-making.

---

## 📁 Project Structure
```
├── data/
│   ├── raw_data.csv
│   ├── cleaned_data.csv
│
├── sql/
│   ├── data_cleaning.sql
│   ├── ecommerce_sql_analysis.sql
│
├── dashboard/
│   ├── ecommerce_dashboard.pbix
│   ├── dashboard_image.png
│
├── README.md
```
