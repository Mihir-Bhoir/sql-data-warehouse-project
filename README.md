
# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---
## 🏗️ Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:
![Data Architecture](![image alt](https://github.com/Mihir-Bhoir/sql-data-warehouse-project/blob/393369e3414d30225b5f36ee74562e73f6a4db5d/docs/DATA%20ARCHITECTURE.png)

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---
## 📖 Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:
- SQL Development
- Data Architect
- Data Engineering  
- ETL Pipeline Developer  
- Data Modeling  
- Data Analytics  

---

## 🛠️ Important Links & Tools:

Everything is for Free!
- **[Datasets](datasets/):** Access to the project dataset (csv files).
- **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** Lightweight server for hosting your SQL database.
- **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16):** GUI for managing and interacting with databases.
- **[Git Repository](https://github.com/):** Set up a GitHub account and repository to manage, version, and collaborate on your code efficiently.
- **[DrawIO](https://www.drawio.com/):** Design data architecture, models, flows, and diagrams.
- **[Notion](https://www.notion.com/):** All-in-one tool for project management and organization.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.  

For more details, refer to [docs/requirements.md](docs/requirements.md).

## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
```
---

# 📊 Advanced Data Analytics Project | SQL Server

Welcome to my **Advanced Data Analytics Project** repository! 🚀

This project demonstrates how **SQL Server** can be used to transform raw sales data into meaningful business insights through **Exploratory Data Analysis (EDA), advanced SQL analytics, customer analysis, product analysis, and KPI reporting**.

The project focuses on using SQL to answer real-world business questions related to:

- 📈 Sales Performance
- 👥 Customer Behavior
- 🛍️ Product Performance
- 🏷️ Category Contribution
- 📅 Sales Trends
- 📊 Customer Segmentation
- 💰 Revenue & Spending Analysis
- 🔄 Year-over-Year Performance
- 📌 Running Totals & Moving Averages

The goal is not only to write SQL queries, but also to understand **why the analysis is performed and what business decisions can be made from the results**.

---

## 🎯 Project Objective

The main objective of this project is to perform **advanced data analysis using SQL Server** and generate business-ready insights from sales data.

The project covers the complete analytical process:

**Raw Data → Data Exploration → SQL Analysis → KPI Calculation → Customer/Product Reports → Business Insights**

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| **SQL Server** | Data analysis and querying |
| **SSMS** | SQL development and execution |
| **GitHub** | Project version control and documentation |
| **Draw.io** | Data/process visualization |
| **Excel / Power BI** | Optional visualization of analytical results |

### SQL Concepts Used

- SELECT / WHERE / GROUP BY / ORDER BY
- Aggregate Functions
- JOINs
- CASE Statements
- CTEs
- Subqueries
- Window Functions
- `LAG()`
- `AVG() OVER()`
- `SUM() OVER()`
- Running Totals
- Moving Averages
- Date Functions
- `DATEDIFF()`
- `DATETRUNC()`
- `FORMAT()`
- Customer Segmentation
- Part-to-Whole Analysis
- KPI Calculations

---

## 🧩 Project Workflow

```text
                    ┌─────────────────┐
                    │    Sales Data   │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │       EDA       │
                    │ Data Exploration│
                    └────────┬────────┘
                             │
                             ▼
              ┌──────────────────────────┐
              │      SQL Analysis        │
              ├──────────────────────────┤
              │ • Sales Trends           │
              │ • Customer Analysis      │
              │ • Product Analysis       │
              │ • Category Analysis      │
              │ • Segmentation           │
              └────────────┬─────────────┘
                           │
                           ▼
              ┌──────────────────────────┐
              │      KPI & Reports       │
              ├──────────────────────────┤
              │ • Customer Report        │
              │ • Product Report         │
              │ • Sales Performance      │
              └────────────┬─────────────┘
                           │
                           ▼
              ┌──────────────────────────┐
              │    Business Insights     │
              └──────────────────────────┘
```

---

# 🔎 1. Exploratory Data Analysis (EDA)

The first stage of the project focuses on understanding the available data before performing detailed analysis.

### EDA Includes

- Understanding the structure of the dataset
- Checking available dimensions and facts
- Exploring customers and products
- Understanding sales transactions
- Examining dates and sales periods
- Identifying important analytical fields
- Preparing the data for further analysis

### 📸 EDA SQL Code

![EDA SQL Code](images/eda/eda_code.png)

### 📊 EDA Result

![EDA Result](images/eda/eda_result.png)

---

# 📈 2. Sales Trend Analysis

The project analyzes sales performance across different time periods.

### Analysis Includes

- Monthly sales
- Yearly sales
- Total customers
- Total quantity sold
- Running total of sales
- Moving average of sales

### 💻 SQL Code

![Monthly Sales SQL](images/analysis/monthly_sales_code.png)

### 📊 Query Result

![Monthly Sales Result](images/analysis/monthly_sales_result.png)

### 💡 Business Use

This analysis helps identify:

- High-performing months
- Low-performing periods
- Changes in customer activity
- Changes in sales volume

---

# 📊 3. Running Total & Moving Average

Window functions are used to analyze sales performance over time.

The project calculates:

- Running total of sales
- Moving average of average product price

### 💻 SQL Code

![Running Total SQL](images/analysis/running_total_code.png)

### 📊 Result

![Running Total Result](images/analysis/running_total_result.png)

---

# 🛍️ 4. Product Performance Analysis

Product performance is analyzed across different years.

The analysis compares:

- Current-year sales
- Average sales of the product
- Previous-year sales
- Difference from average sales
- Difference from previous-year sales
- Increasing / decreasing performance

### Key SQL Concepts

- CTE
- `AVG() OVER()`
- `LAG()`
- `PARTITION BY`
- `CASE`

### 💻 SQL Code

![Product Analysis SQL](images/product/product_analysis_code.png)

### 📊 Result

![Product Analysis Result](images/product/product_analysis_result.png)

---

# 🏷️ 5. Part-to-Whole Category Analysis

This analysis identifies how much each product category contributes to overall sales.

### Metrics

- Category Sales
- Overall Sales
- Percentage of Total Sales

### 💻 SQL Code

![Category Analysis Code](images/analysis/category_analysis_code.png)

### 📊 Result

![Category Analysis Result](images/analysis/category_analysis_result.png)

### 💡 Business Use

This analysis helps identify the categories contributing the largest share of total sales.

---

# 👥 6. Customer Segmentation

Customers are classified according to their purchasing behavior.

### Customer Segments

| Segment | Definition |
|---|---|
| 🟢 **VIP** | Lifespan ≥ 12 months and spending > 5,000 |
| 🔵 **Regular** | Lifespan ≥ 12 months and spending ≤ 5,000 |
| 🟡 **New** | Lifespan < 12 months |

### 💻 SQL Code

![Customer Segmentation SQL](images/customer/customer_segmentation_code.png)

### 📊 Result

![Customer Segmentation Result](images/customer/customer_segmentation_result.png)

---

# 👤 7. Customer Report

A dedicated customer report is created to provide customer-level KPIs.

### Customer Information

- Customer Name
- Customer Number
- Age
- Age Group
- Customer Segment

### Customer KPIs

- Total Orders
- Total Sales
- Total Quantity
- Total Products
- Last Order Date
- Customer Lifespan
- Recency
- Average Order Value
- Average Monthly Spend

### 📸 Customer Report SQL

![Customer Report Code](images/customer/customer_report_code.png)

### 📊 Customer Report Output

![Customer Report Result](images/customer/customer_report_result.png)

---

# 🛒 8. Product Report

The product analysis focuses on understanding product-level performance.

The report can be used to analyze:

- Product sales
- Product quantity
- Product performance
- Product categories
- Product cost ranges
- Yearly product performance
- Product growth / decline

### Product Cost Segmentation

| Cost Range |
|---|
| Below 100 |
| 100–500 |
| 500–1000 |
| Above 1000 |

### 📸 Product Report SQL

![Product Report Code](images/product/product_report_code.png)

### 📊 Product Report Output

![Product Report Result](images/product/product_report_result.png)

---

# 📌 9. Key Analytical Areas

The project covers several important areas of data analytics.

### 📅 Time-Based Analysis

- Monthly sales
- Yearly sales
- Sales trends
- Running totals
- Moving averages

### 👥 Customer Analysis

- Customer segmentation
- Customer spending
- Customer lifespan
- Recency
- Average order value
- Average monthly spending

### 🛍️ Product Analysis

- Product sales
- Product performance
- Year-over-year comparison
- Average product performance
- Product growth / decline

### 🏷️ Category Analysis

- Category sales
- Overall sales
- Percentage contribution

### 📦 Product Segmentation

- Cost-based product segmentation
- Product grouping

---

# 📸 Project Screenshots

A key goal of this repository is to make the analysis easy for recruiters to understand.

Each major analysis follows this structure:

**Business Question → SQL Code → Query Result → Business Insight**

```text
┌──────────────────────────────┐
│       SQL QUERY / CODE       │
│                              │
│ SELECT ...                   │
│ FROM ...                     │
│ GROUP BY ...                 │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│        QUERY RESULT          │
│                              │
│ Sales | Customers | Quantity │
│  ...  |    ...    |   ...   │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│      BUSINESS INSIGHT        │
│                              │
│ What does this result mean?  │
└──────────────────────────────┘
```

This allows recruiters to quickly evaluate both **technical SQL skills and analytical thinking**.

---

# 📂 Repository Structure

```text
Advanced-Data-Analytics-Project/
│
├── datasets/
│   └── source_data.csv
│
├── sql/
│   ├── 01_eda.sql
│   ├── 02_sales_analysis.sql
│   ├── 03_customer_analysis.sql
│   ├── 04_customer_report.sql
│   └── 05_product_report.sql
│
├── images/
│   ├── eda/
│   │   ├── eda_code.png
│   │   └── eda_result.png
│   │
│   ├── analysis/
│   │   ├── monthly_sales_code.png
│   │   ├── monthly_sales_result.png
│   │   ├── running_total_code.png
│   │   ├── running_total_result.png
│   │   ├── category_analysis_code.png
│   │   └── category_analysis_result.png
│   │
│   ├── customer/
│   │   ├── customer_segmentation_code.png
│   │   ├── customer_segmentation_result.png
│   │   ├── customer_report_code.png
│   │   └── customer_report_result.png
│   │
│   └── product/
│       ├── product_analysis_code.png
│       ├── product_analysis_result.png
│       ├── product_report_code.png
│       └── product_report_result.png
│
├── README.md
└── LICENSE
```

---

# 🧠 What I Learned

Through this project, I strengthened my understanding of:

- Advanced SQL querying
- Data exploration
- Data aggregation
- CTEs
- Window functions
- `LAG()` and analytical functions
- Running totals
- Moving averages
- Customer segmentation
- Product performance analysis
- Part-to-whole analysis
- KPI creation
- Business-oriented data analysis
- Writing SQL for real-world analytical problems

---

# 💼 Skills Demonstrated

### SQL

**Advanced SQL | SQL Server | CTEs | Window Functions | Joins | Aggregations | Subqueries | CASE Statements | Date Functions**

### Data Analytics

**EDA | KPI Analysis | Customer Analysis | Product Analysis | Sales Analysis | Segmentation | Trend Analysis**

### Business Analysis

**Customer Behavior | Product Performance | Sales Trends | Category Contribution | Performance Comparison**

---

# 🚀 Future Improvements

I plan to further improve this project by adding:

- 📊 Power BI dashboard
- 📈 Interactive visualizations
- 🤖 Python-based analysis
- 🔄 Automated ETL pipelines
- 📋 Additional business KPIs
- 📑 More advanced customer/product segmentation

---

# 👨‍💻 About Me

Hi, I'm **Mihir Bhoir**, a Computer Science graduate interested in **Data Analytics and Data Engineering**.

I enjoy working with data, writing SQL queries, exploring datasets, and turning raw data into meaningful business insights.

### Technical Skills

- SQL — SQL Server, MySQL
- Microsoft Excel
- Power BI
- Python — Learning
- Data Analytics
- Data Warehousing & ETL Concepts

### Currently Improving

- Advanced SQL
- Data Analysis
- Data Modeling
- Power BI
- Python
- Data Engineering Concepts

I'm continuously building hands-on projects to improve my technical and analytical skills.

---

# ⭐ Project Highlights

```text
🔹 Advanced SQL Analysis
🔹 Customer & Product Analytics
🔹 Sales Trend Analysis
🔹 Customer Segmentation
🔹 Window Functions
🔹 CTEs
🔹 KPI Reporting
🔹 Business-Oriented Insights
🔹 SQL Server
```

---

## 📬 Let's Connect

I'm always interested in learning, collaborating, and discussing opportunities in **Data Analytics, SQL, and Data Engineering**.

⭐ If you find this project useful, feel free to explore the repository and check out the SQL analysis and results.

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

##  👨‍💻 About Me

Hi, I'm **Mihir Bhoir**, a Computer Science graduate interested in Data Engineering and Data Analytics.

I enjoy working with data, exploring datasets, and building projects that turn raw data into meaningful insights.

**Technical Skills:**
- SQL (SQL Server, MySQL)
- Microsoft Excel
- Power BI
- Python (Learning)
- Data Warehousing and ETL Concepts

**Currently Working On:**
- Building SQL-based Data Warehouse projects.
- Improving my SQL and data analysis skills.
- Learning data modeling, ETL pipelines, and data engineering concepts.

I'm always eager to learn new technologies and improve my technical skills through hands-on projects.

**Let's Connect and Learn Together!** 🚀
.
