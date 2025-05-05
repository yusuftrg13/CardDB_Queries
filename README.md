# CardDB_Queries
# 🗃️ CARDB SQL Query Repository

This repository contains SQL queries I developed while exploring and analyzing the **CARDB** database. It includes beginner to advanced SQL commands focusing on key tables such as `USER_`, `WEBOFFERS`, `CITY`, `DISTRICT`, and `TOWN`.

The goal is to improve my SQL skills step by step, using real-world data structures. Each query has a clear purpose and includes comments where necessary.

---

## 📁 Tables Covered

- `USER_` – Stores user information (name, email, gender, etc.)
- `WEBOFFERS` – Contains vehicle or item listings posted by users
- `CITY`, `DISTRICT`, `TOWN` – Define the geographic hierarchy for user and offer locations

---

## 📌 Topics Included

### ✅ Beginner Level
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Filtering by gender, birthdate, and city
- Sorting by creation date

### ✅ Intermediate Level
- `INNER JOIN`, `LEFT JOIN` between users and locations
- Grouping data using `GROUP BY`
- Aggregates: `COUNT()`, `AVG()`, `MAX()`
- `CASE WHEN` conditions for age groups and classifications

### ✅ Advanced Level
- Multi-table joins: `USER_` + `WEBOFFERS` + location tables
- Subqueries to find top results (e.g., max price per city)
- Common Table Expressions (CTEs)
- Window functions like `ROW_NUMBER()`
- Conditional aggregations (e.g., male/female user counts)

---

## 🧠 Example Insights

- Cities with the highest number of listings
- Users who post in cities other than where they're registered
- Average listing price per city and district
- Age group distribution of users
- Listings with categorized price levels

---

## 🚀 How to Use

You can copy-paste any query from this repo into your SQL Server Management Studio or preferred SQL IDE. Make sure to run them against a database that mirrors the `CARDB` schema.

---

## 💡 Purpose

This project helps me:
- Strengthen my SQL querying skills
- Understand data relationships through JOINs
- Prepare for roles in data analysis, business intelligence, or backend development

---

## 📧 Contact

If you'd like to collaborate or ask questions, feel free to reach out via GitHub Issues or fork the repository.

---

