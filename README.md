# Employee Management System

<div align="center">

## SQL & MySQL Database Management Project

A practical relational database project for managing and analyzing **employees, departments, salaries, bonuses, qualifications, leaves, and payroll** using SQL.

<br>

![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Analysis-CC2927?style=for-the-badge)
![Database](https://img.shields.io/badge/Relational-Database-6DB33F?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-Completed-2EA44F?style=for-the-badge)

</div>

---

## 📌 Project Overview

The **Employee Management System** is a MySQL-based relational database project designed to store, manage, and analyze employee-related information in a structured way.

The project covers employee records, departments, job roles, salary and bonus details, qualifications, leave records, and payroll information. SQL queries are used to extract meaningful information and generate business-oriented insights from the database.

This project demonstrates the practical application of **SQL, relational database design, table relationships, constraints, joins, aggregation, filtering, and data analysis**.

---

## 🎯 Objectives

- Design and implement a structured relational database.
- Manage employee and department information.
- Establish relationships between related entities.
- Manage salary, bonus, qualification, leave, and payroll data.
- Perform data analysis using SQL queries.
- Generate useful business insights from employee data.
- Demonstrate practical knowledge of MySQL and SQL.

---

## 🗄️ Database Structure

The database contains **six main tables**:

| Table | Description |
|---|---|
| `JobDepartment` | Stores department and job-role information |
| `Employee` | Stores employee personal and employment details |
| `SalaryBonus` | Stores salary and bonus information |
| `Qualification` | Stores employee qualification records |
| `Leaves` | Stores employee leave information |
| `Payroll` | Stores payroll and compensation records |

---

## 🧩 Entity Relationship Diagram

The ER diagram below represents the structure of the Employee Management System and the relationships between its major entities.

<div align="center">

<img width="1538" height="887" alt="image" src="https://github.com/user-attachments/assets/66a67bd9-5509-45e2-9521-5c49cabc2fb7" />


</div>

---

## ✨ Key Features

### 👤 Employee Management
- Employee record management
- Gender-wise employee analysis
- Department-wise employee distribution
- Job-role analysis
- Location-based analysis

### 🏢 Department & Job Role Analysis
- Department-wise employee count
- Job-role distribution
- Department-level workforce analysis
- Salary comparison across departments

### 💰 Salary & Bonus Analysis
- Total salary expenditure
- Average salary
- Highest and lowest salary
- Bonus analysis
- Salary and bonus comparison

### 🎓 Qualification Analysis
- Employee qualification records
- Degree-wise analysis
- Qualification distribution

### 🏖️ Leave Analysis
- Leave records
- Leave types
- Leave duration
- Employee leave patterns

### 💳 Payroll Analysis
- Employee-wise payroll
- Net pay
- Deductions
- Compensation analysis
- Payroll expenditure

---

## 🛠️ SQL Concepts Used

### Database Operations

```text
CREATE DATABASE
CREATE TABLE
ALTER TABLE
DROP TABLE
DROP DATABASE
```

### Data Manipulation

```text
INSERT
UPDATE
DELETE
```

### Data Retrieval & Filtering

```text
SELECT
WHERE
DISTINCT
LIKE
IN
BETWEEN
IS NULL
ORDER BY
```

### Aggregation & Grouping

```text
COUNT()
SUM()
AVG()
MIN()
MAX()
GROUP BY
HAVING
```

### Relationships

```text
PRIMARY KEY
FOREIGN KEY
INNER JOIN
LEFT JOIN
```

### Constraints

```text
NOT NULL
UNIQUE
CHECK
DEFAULT
```

---

## 📊 Analysis Performed

The project uses SQL queries to analyze multiple areas of the organization.

### Employee Analysis

- Total employee count
- Gender-wise distribution
- Department-wise distribution
- Job-role distribution
- Location-based employee analysis
- Salary-based employee filtering

### Department Analysis

- Employee count by department
- Department-wise salary expenditure
- Average salary by department
- Job roles within departments

### Salary & Bonus Analysis

- Total salary expenditure
- Average salary
- Highest and lowest salary
- Employee bonus analysis
- Salary and bonus comparison

### Qualification Analysis

- Employee educational qualifications
- Degree distribution
- Qualification-wise employee analysis

### Leave Analysis

- Employee leave records
- Leave types
- Leave duration
- Leave utilization patterns

### Payroll Analysis

- Employee-wise payroll
- Net pay
- Deductions
- Compensation analysis
- Payroll expenditure

---

## 💡 Business Insights

The SQL analysis can help management understand:

- **Workforce Distribution** — employee concentration across departments and job roles.
- **Compensation Patterns** — salary, bonus, and payroll distribution.
- **Workforce Planning** — department-level workforce requirements.
- **Employee Qualifications** — educational background of employees.
- **Leave Patterns** — employee leave utilization.
- **Payroll Management** — salary, deductions, bonuses, and net pay.

These insights can support better decisions related to **workforce planning, compensation management, payroll management, and employee administration**.

---

## 🔍 Sample SQL Queries

### Department-wise Employee Count

```sql
SELECT
    jd.dept_name,
    COUNT(e.emp_id) AS employee_count
FROM Employee e
JOIN JobDepartment jd
    ON e.dept_id = jd.dept_id
GROUP BY jd.dept_name
ORDER BY employee_count DESC;
```

### Average Salary by Department

```sql
SELECT
    jd.dept_name,
    AVG(sb.salary) AS average_salary
FROM Employee e
JOIN JobDepartment jd
    ON e.dept_id = jd.dept_id
JOIN SalaryBonus sb
    ON e.salary_bonus_id = sb.salary_bonus_id
GROUP BY jd.dept_name
ORDER BY average_salary DESC;
```

### Total Salary Expenditure

```sql
SELECT
    SUM(salary) AS total_salary_expenditure
FROM SalaryBonus;
```

---

## 📁 Repository Structure

```text
employee-management-system-sql/
│
├── dataset/
│   └── [dataset file(s)]
│
├── sql/
│   └── employee_management_project.sql
│
├── presentation/
│   └── employee_management_innomatics.pptx
│
├── video/
│   └── employee_management_project.mp4
│
├── assets/
│   └── ER_Diagram.png
│
└── README.md
```

---

## 🚀 How to Run

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/employee-management-system-sql.git
```

### 2. Open MySQL Workbench

Open **MySQL Workbench** or another MySQL-compatible SQL environment.

### 3. Open the SQL File

Navigate to:

```text
sql/employee_management_project.sql
```

### 4. Execute the Script

Run the SQL script to create the database, tables, relationships, insert data, and execute the available analysis queries.

### 5. Select the Database

```sql
USE EmployeeManagementDB;
```

### 6. Explore the Analysis

Run the included SQL queries to analyze employee, department, salary, qualification, leave, and payroll information.

---

## 📦 Project Resources

| Resource | Location |
|---|---|
| 🗃️ Dataset | `dataset/` |
| 💻 SQL Code | `sql/employee_management_project.sql` |
| 🧩 ER Diagram | `assets/ER_Diagram.png` |
| 📊 Presentation | `presentation/employee_management_innomatics.pptx` |
| 🎥 Project Video | `video/employee_management_project.mp4` |

---

## 📚 Learning Outcomes

Through this project, I developed practical understanding of:

- Relational database design
- MySQL
- SQL query writing
- Primary and foreign keys
- Table relationships
- SQL joins
- Aggregate functions
- Data filtering
- Grouping and sorting
- Database constraints
- Business-oriented data analysis

---

## 👩‍💻 Author

### Anwesha Panda

**SQL | MySQL | Database Management | Data Analysis**

This project was developed as a practical implementation of **SQL and relational database concepts** for an Employee Management System.

---

## 📌 Project Snapshot

| Category | Details |
|---|---|
| **Project Type** | Database Management System |
| **Domain** | Employee Management |
| **Database** | MySQL |
| **Language** | SQL |
| **Database Type** | Relational |
| **Main Tables** | 6 |
| **Analysis Areas** | Employee, Department, Salary, Qualification, Leave & Payroll |
| **Resources** | Dataset, SQL Code, ER Diagram, PPT & Video |
| **Author** | Anwesha Panda |

---

<div align="center">

### ⭐ If you found this project useful, consider giving the repository a star!

**Built with SQL & MySQL**

**© 2026 Anwesha Panda**

</div>
