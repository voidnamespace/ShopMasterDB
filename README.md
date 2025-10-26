# 🛍️ ShopMasterDB

**ShopMasterDB** is a sample SQL project that simulates a small online store database.  
It demonstrates creating tables, inserting sample data, and running queries for analytics and reporting.

## 📂 Project Structure

- `schema.sql` — creates all database tables  
- `data.sql` — inserts sample data into the tables  
- `queries.sql` — example queries (SELECT, JOIN, GROUP BY, aggregation, etc.)  
- `.gitignore` — ignores local SQLite database and temporary files  
- `README.md` — project description and usage instructions  

> **Note:** The SQLite database file (`shopmaster.db`) is **not included**. You can generate it locally by executing `schema.sql` and `data.sql`.

---

## ⚙️ How to Use

1. Create a new SQLite database (e.g., `shopmaster.db`).  
2. Open it in **DBeaver** (or another SQLite client).  
3. Run `schema.sql` to create tables.  
4. Run `data.sql` to insert sample data.  
5. Open `queries.sql` to run example queries and explore the data.

---

## 🔍 Example Queries

Here are some examples of what you can do:

```sql
-- 1) List all products with their category
SELECT p.id, p.name, p.price, c.name AS category, p.stock
FROM Products p
LEFT JOIN Categories c ON p.categoryId = c.id;

-- 2) Top 5 best-selling products
SELECT p.id, p.name, SUM(oi.quantity) AS total_sold
FROM OrderItems oi
JOIN Products p ON oi.productId = p.id
GROUP BY p.id, p.name
ORDER BY total_sold DESC
LIMIT 5;

-- 3) Average price per category
SELECT c.name AS category, ROUND(AVG(p.price),2) AS avg_price
FROM Products p
LEFT JOIN Categories c ON p.categoryId = c.id
GROUP BY c.name;

Full query list is in queries.sql.

🎯 Purpose

This project is intended for demonstration purposes, showing skills in:

Designing relational database schema

Writing SQL queries (JOINs, aggregation, filters)

Preparing a project ready for GitHub portfolio

💡 Notes

You can extend this project by adding more tables (e.g., suppliers, reviews) or more complex queries.

Keep shopmaster.db local — only .sql files are needed on GitHub.