# 🛒FreshMart-Retail Database Management System

## 📌Project Overview
Fresh Mart is a SQL-based Retail Database Management System designed to manage products,categories and sales transactions in a supermarket environment.The system helps in tracking inventory,analyzing sales and identifying the business insights like expiring products and dead stock.

## 🎯Objectives
- Manage product and category information efficiently
- Track sales transactions
- Analyze the revenue contribution by category
- Monitor products nearing expiry

## 🗂️ Database Schema

### 🔹 Categories Table

Stores different product categories:

* `catg_id` (Primary Key)
* `catg_name`

### 🔹 Products Table

Stores product details:

* `prod_id` (Primary Key)
* `prod_name`
* `catg_id` (Foreign Key)
* `price`
* `stock_cnt`
* `expiry_date`

### 🔹 SalesTransactions Table

Stores sales records:

* `trans_id` (Primary Key)
* `prod_id` (Foreign Key)
* `quantity`
* `trans_date`

---

## 🔗 Relationships

* One Category → Many Products
* One Product → Many Sales Transactions

---

## 📊 Sample Data

The database includes:

* 6 Categories
* 15+ Products
* 15+ Transactions

---

## 🔍 Sample Queries

### 1. Total Stock Available

```sql
SELECT SUM(stock_cnt) AS total_stock FROM Products;
```

### 2. Expiring Soon Products

```sql
SELECT prod_name, stock_cnt, expiry_date 
FROM Products
WHERE expiry_date <= SYSDATE + 7 
AND stock_cnt > 50;
```

### 3. Dead Stock Analysis

```sql
SELECT p.prod_id, p.prod_name 
FROM Products p
LEFT JOIN SalesTransactions s 
ON p.prod_id = s.prod_id 
AND s.trans_date >= SYSDATE - 60
WHERE s.prod_id IS NULL;
```

---

## 🚀 How to Run

1. Create tables using SQL scripts
2. Insert sample data into tables
3. Execute queries to analyze results
4. Modify data to test different scenarios
    
## Author 
Raziya Mohammad

