# 💻 PC Sales — End-to-End Data Engineering Project

![SQL](https://img.shields.io/badge/SQL-Server-blue?style=flat&logo=microsoftsqlserver) ![Excel](https://img.shields.io/badge/Data%20Source-CSV-green?style=flat) ![DrawIO](https://img.shields.io/badge/Data%20Modelling-Draw.io-orange?style=flat) ![Status](https://img.shields.io/badge/Status-In%20Progress-yellow) ![Domain](https://img.shields.io/badge/Domain-Retail%20Sales-purple)

---

## 📌 Project Overview

This is an **end-to-end data engineering project** built around a simulated PC Sales dataset containing **10,000 sales records** from a retail business operating across multiple continents, countries, and sales channels.

The project goes beyond querying — it involves **data modelling, dimensional design, database architecture, and stored procedure development**, simulating the kind of work done in a real-world data engineering environment.

> 🔮 **Future goal:** Automate the full ingestion and transformation pipeline to eliminate manual steps.

---

## 🏗️ Pipeline Architecture

```
[ Raw Data ]       [ Data Modelling ]       [ Database Build ]        [ Automation ]
  CSV File    →    Star Schema Design   →   Dim Tables + Fact Table →  Stored Procedures
               (Draw.io)                  (SQL Server)                (EXEC + DROP Scripts)
```

---

## 📐 Data Model

The raw CSV data was analysed and separated into related subject areas, resulting in a **Star Schema** with **10 dimension tables** and **1 fact table**.

The schema was designed using **Draw.io** before any code was written — reflecting a professional data engineering approach of modelling first, building second.

### Dimension Tables

| Table | Description |
|---|---|
| `dim_location` | Continent, country/state, and province/city of each sale |
| `dim_shop` | Shop name and shop age |
| `dim_pc` | PC manufacturer and model |
| `dim_specifications` | Storage type, RAM, and storage capacity |
| `dim_customer` | Customer name, contact number, and email address |
| `dim_salesperson` | Salesperson name and department |
| `dim_payment_method` | Payment method used for the transaction |
| `dim_date` | Purchase date and ship date |
| `dim_channel` | Sales channel — Online vs Offline |
| `dim_priority` | Order fulfilment priority level |

### Fact Table

| Table | Description |
|---|---|
| `fact_pcsales` | Central fact table linking all dimensions — contains cost price, sale price, discount amount, finance amount, credit score, cost of repairs, total sales per employee, and PC market price |

> 📝 Each dimension table includes a `LoadDate` column to track when data was loaded into the table.

---

## 📁 Database Setup

```sql
CREATE DATABASE PC_Sales;
USE PC_Sales;
```

---

## 📂 Repository Structure

| File / Folder | Description |
|---|---|
| `star_schema_drawio.pdf` | Draw.io data model showing the full star schema |
| `dim_tables/` | SQL scripts to create all 10 dimension tables |
| `stored_procedures/` | Stored procedures for loading each dimension table |
| `exec_procedures.sql` | Script to execute all stored procedures |
| `drop_procedures.sql` | Script to drop all stored procedures |
---

## 🔍 Key Data Engineering Concepts Demonstrated

- **Star Schema design** — separating raw data into facts and dimensions
- **Dimensional modelling** — 10 dimension tables with surrogate primary keys
- **Data modelling with Draw.io** — designing the schema before building it
- **Stored procedures** — automating the loading of each dimension table
- **LoadDate tracking** — identifying when data was loaded into each table
- **Separation of concerns** — dedicated scripts for creating, executing, and dropping procedures

---

## 🔮 Future Enhancements

- [ ] Build and populate `fact_pcsales` table
- [ ] Automate CSV ingestion pipeline
- [ ] Scheduled data refresh
- [ ] Data cleaning and transformation layer
- [ ] Integration with a reporting or visualisation tool
---

## 🛠️ Tools Used

- **CSV** — raw data source
- **Draw.io** — star schema and data model design
- **SQL Server** — database creation, dimensional modelling, and querying
- **SSMS (SQL Server Management Studio)** — script development and testing

---

## 👤 About Me

I am a **BSc IT Graduate** with 6 years of professional experience as a **Batch Processing Administrator** at a credit bureau, where I worked extensively with large volumes of sensitive financial data in a production environment.

With a solid academic foundation in **Database Management, Mathematics for Computer Science, and Project Management**, combined with hands-on industry experience in data operations, I am now transitioning into **SQL Development and Data Engineering** — building on skills I have spent years applying professionally.

This project is part of a growing portfolio designed to demonstrate my technical capabilities in database design, querying, and data analysis.

📫 Feel free to connect with me on [LinkedIn](#) or explore my other projects here on GitHub!
