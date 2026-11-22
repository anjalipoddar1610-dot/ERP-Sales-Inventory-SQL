# ERP-Sales-Inventory-SQL
# ERP Sales & Inventory Management System (SQL)

## Project Overview
This project focuses on designing and managing a relational database for an **ERP Sales and Inventory System** using SQL Server. It demonstrates end-to-end database architecture, table relationships, data integrity constraints, sample data population, and business analysis queries.

## Database Schema & Tables
The database consists of the following interconnected tables:
* **Customers:** Stores customer details and contact information.
* **Categories:** Organizes products into distinct categories.
* **Suppliers:** Tracks vendor and supplier details.
* **Products:** Manages product pricing, stock quantity, and category/supplier links.
* **Orders & OrderDetails:** Tracks customer orders and itemized product quantities.
* **Inventory:** Monitors stock levels across products.
* **Payments:** Records transaction statuses (Paid, Pending, Refunded) and payment modes (UPI, Credit Card, Debit Card, Cash).

## Key SQL Concepts Applied
* **Data Definition Language (DDL):** `CREATE TABLE`, `ALTER TABLE`, `sp_rename`
* **Constraints & Data Integrity:** `PRIMARY KEY` and `FOREIGN KEY` relationships across tables
* **Data Manipulation Language (DML):** Bulk data insertion (`INSERT INTO`) and data retrieval (`SELECT`)
* **Business Analysis:** Analytical queries using Joins, Aggregations, and Filtering

## Project Files
* `SQL TABLE CREATE.sql` – SQL script for creating database tables and applying Primary/Foreign Key constraints.
* `Insert data.sql` – SQL script for inserting sample records into all tables.
* `analysis_queries.sql` – SQL queries written to extract business and sales insights.
* `ERP-Sales-Inventory SQL Project.sql` – Complete merged SQL script combining schema creation, data insertion, and queries.
* `ERP Sales Inventory.pdf` – Project presentation summarizing the database design, ER structure, and key findings.
