# 🛒FreshMart-Retail Database Management System

### 📌Project Overview
Fresh Mart is a SQL-based Retail Database Management System designed to manage products,categories and sales transactions in a supermarket environment.The system helps in tracking inventory,analyzing sales and identifying the business insights like expiring products and dead stock.

### 🎯Objectives
- Manage product and category information efficiently
- Track sales transactions
- Analyze the revenue contribution by category
- Monitor products nearing expiry

### 🗂️Database Schema
 🔹Categories Table --> stores different product categories
  - catg_id(Primary key)
  - catg_name
 🔹Products Table --> Stores product details
  - prod_id(Primary key)
  - prod_name
  - catg_id(Foreign key)
  - price
  - stock_cnt
  - expiry date
 🔹SalesTransactions Table
  - trans_id(Primary key)
  - prod_id(Foreign key)
  - quantity
  - trans_date
      
### 🔗Relationships
- One Category --> Many Products
- One Product --> Many sales Transactions
    
### 📊Sample Data
The database includes:
  - 6 Categories
  - 15+ Products
  - 15+ Transactions
    
### Sample queries
1. Total stock available
   `select sum(stock_cnt)as Total_stock from Products;`
2. Expiring soon Products
   `select prod_name,stock_cnt,expiry_date from products
   where expiry_date<=sysdate+7 and stock_cnt>50;`
3. Dead stock analysis
  `select p.prod_id,p.prod_name from products p 
  left join SalesTransactions s on p.prod_id=s.prod_id
  and s.trans_date>=sysdate-60
  where s.prod_id is null;`
      
### How to Run
1. Create table using SQL scripts
2. Insert sample data into tables
3. Run queries to analyze results
4. Modify data to test different scenarios
      
###  Author 
Raziya Mohammad

