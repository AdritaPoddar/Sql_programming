# 📄 README: Employee Management Database Script

The script demonstrates proficiency across the three main categories of SQL commands: **DDL**, **DML**, and **DQL**.

---
## 1. Database Schema and DDL

The script creates a simplified Employee Management system consisting of two tables with appropriate constraints:

* **`Departments`**: Contains `DeptID` (Primary Key), `DeptName`, and `Location`.
* **`Employees`**: Contains personnel data, including `EmployeeID` (Primary Key), `FirstName`, `LastName`, `Salary`, and a **Foreign Key** (`DeptID`) linking employees to their department. It also uses a **Self-Join** structure via the `ManagerID` column to define reporting lines.

---

## 2. Data Manipulation (DML)

The script populates both tables using `INSERT` statements and includes an example of an **`UPDATE`** command to modify an existing employee's salary.

---

## 3. Complex Queries (DQL)

The final section of the script features five analytical queries that showcase the ability to handle real-world data retrieval and analysis:

| Query Type | Purpose | SQL Feature Demonstrated |
| :--- | :--- | :--- |
| **Simple Join** | Lists employees with their corresponding department names. | `INNER JOIN` |
| **Aggregation** | Calculates the average salary for each department. | `GROUP BY` and `AVG()` with a `HAVING` clause |
| **Hierarchy** | Matches employees to their respective managers. | `LEFT JOIN` (Self-Join) |
| **Subqueries/CTEs** | Finds the highest-paid employee and identifies recently hired employees. | `Subquery` and `Common Table Expressions (CTE)` |
| **Conditional Logic** | Categorizes employees based on their salary tier. | `CASE` expression |

This script provides a comprehensive demonstration of skills necessary for managing, manipulating, and querying a relational database.
