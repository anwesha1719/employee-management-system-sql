# 👩‍💼 Employee Management System — SQL & MySQL

> **A complete SQL-based Employee Management System designed to manage, organize, and analyze employee data using a relational database.**

This project demonstrates the practical implementation of **MySQL and SQL** for managing employee records, departments, job roles, salaries, bonuses, qualifications, leaves, and payroll information.

It also includes multiple SQL queries to generate meaningful **business insights** from the employee database.

---

## 🏷️ Project Overview

The **Employee Management System** is a relational database project developed using **MySQL**.

The system is designed to maintain structured employee information and perform analysis across different areas of an organization.

### The project covers:

* 👤 Employee Information
* 🏢 Department & Job Roles
* 💰 Salary & Bonus Management
* 🎓 Employee Qualifications
* 🏖️ Leave Management
* 💳 Payroll Management
* 📊 SQL-based Business Analysis

---

## 🎯 Project Objectives

The main objectives of this project are to:

* Design a structured relational database for employee management.
* Store employee and organizational information efficiently.
* Establish relationships between different database entities.
* Manage salary, bonus, leave, qualification, and payroll information.
* Perform analytical queries using SQL.
* Extract meaningful insights from employee data.
* Demonstrate practical knowledge of MySQL and relational database concepts.

---

## 🗄️ Database Architecture

The database contains **six major tables** that work together to manage employee-related information.

| Table           | Purpose                                             |
| --------------- | --------------------------------------------------- |
| `JobDepartment` | Stores department and job-role information          |
| `SalaryBonus`   | Stores employee salary and bonus details            |
| `Employee`      | Stores employee personal and employment information |
| `Qualification` | Stores employee educational qualifications          |
| `Leaves`        | Stores employee leave records                       |
| `Payroll`       | Stores payroll and compensation information         |

### 🔗 Relationship Overview

```text
                    ┌─────────────────────┐
                    │   JobDepartment     │
                    │─────────────────────│
                    │ dept_id             │
                    │ dept_name           │
                    │ job_role            │
                    └──────────┬──────────┘
                               │
                               │
                    ┌──────────▼──────────┐
                    │      Employee       │
                    │─────────────────────│
                    │ emp_id              │
                    │ emp_name            │
                    │ dept_id             │
                    │ salary_bonus_id     │
                    └──────┬─────┬────────┘
                           │     │
             ┌─────────────┘     └──────────────┐
             │                                  │
   ┌─────────▼──────────┐             ┌────────▼─────────┐
   │    Qualification   │             │    SalaryBonus    │
   │────────────────────│             │───────────────────│
   │ qualification_id   │             │ salary_bonus_id   │
   │ emp_id             │             │ salary            │
   │ degree             │             │ bonus             │
   └────────────────────┘             └───────────────────┘

             │
             │
   ┌─────────▼──────────┐             ┌───────────────────┐
   │       Leaves      │             │      Payroll       │
   │───────────────────│             │───────────────────│
   │ leave_id          │             │ payroll_id        │
   │ emp_id            │             │ emp_id            │
   │ leave_type        │             │ net_pay           │
   │ leave_days        │             │ deductions        │
   └───────────────────┘             └───────────────────┘
```

---

## 🛠️ Technology Stack

| Technology          | Usage                                      |
| ------------------- | ------------------------------------------ |
| **MySQL**           | Database Management System                 |
| **SQL**             | Database creation, manipulation & analysis |
| **MySQL Workbench** | Query execution & database management      |
| **GitHub**          | Project version control & documentation    |

---

## 🧠 SQL Concepts Demonstrated

This project covers important SQL concepts used in real-world database development and analysis.

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

### Data Retrieval

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

### Aggregate Functions

```text
COUNT()
SUM()
AVG()
MIN()
MAX()
```

### Data Grouping

```text
GROUP BY
HAVING
```

### Relationships & Joins

```text
INNER JOIN
LEFT JOIN
PRIMARY KEY
FOREIGN KEY
```

### Constraints

```text
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
CHECK
DEFAULT
```

---

# 📊 Data Analysis

The project goes beyond database creation and uses SQL queries to analyze different aspects of employee data.

## 👥 Employee Analysis

The employee analysis focuses on:

* Total number of employees
* Gender-wise employee distribution
* Department-wise employee distribution
* Job-role distribution
* Location-wise employee analysis
* Salary-based employee filtering

---

## 🏢 Department Analysis

Department-level analysis includes:

* Number of employees in each department
* Department-wise salary expenditure
* Average salary by department
* Job roles within departments
* Workforce distribution

---

## 💰 Salary & Bonus Analysis

Salary-related analysis includes:

* Total salary expenditure
* Average employee salary
* Highest salary
* Lowest salary
* Salary distribution
* Employee bonus analysis
* Employees receiving bonuses
* Salary and bonus comparison

---

## 🎓 Qualification Analysis

The qualification section analyzes:

* Employee educational qualifications
* Qualification-wise employee count
* Degree distribution
* Employees based on educational background

---

## 🏖️ Leave Analysis

Leave-related queries analyze:

* Employee leave records
* Leave types
* Leave duration
* Leave utilization
* Employees with higher leave usage

---

## 💳 Payroll Analysis

Payroll analysis includes:

* Employee-wise payroll
* Net salary
* Gross salary
* Deductions
* Bonus and compensation
* Total payroll expenditure

---

# 📈 Business Insights

The analysis performed using SQL can help organizations understand:

> **Workforce Distribution**
> Identify how employees are distributed across departments and job roles.

> **Compensation Patterns**
> Understand salary, bonus, and payroll distribution.

> **Department Performance**
> Compare workforce size and salary expenditure across departments.

> **Employee Qualifications**
> Analyze the educational background of employees.

> **Leave Patterns**
> Understand employee leave utilization and patterns.

> **Payroll Management**
> Analyze salary, deductions, bonuses, and overall payroll expenditure.

These insights can support better decisions related to **workforce planning, compensation management, payroll management, and employee administration**.

---

# 🧪 Sample SQL Queries

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

# 📁 Project Structure

```text
employee-management-system-sql/
│
├── 📂 dataset/
│   └── Employee Management Dataset
│
├── 📂 sql/
│   └── employee_management_project.sql
│
├── 📂 presentation/
│   └── employee_management_innomatics.pptx
│
├── 📂 video/
│   └── EMPLOYEE MANAGEMENT PROJECT.mp4
│
└── 📄 README.md
```

---

# 🚀 How to Run the Project

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/employee-management-system-sql.git
```

### 2️⃣ Open MySQL Workbench

Open **MySQL Workbench** or any compatible MySQL environment.

### 3️⃣ Open the SQL File

Navigate to:

```text
sql/employee_management_project.sql
```

### 4️⃣ Execute the SQL Script

Run the complete script to:

* Create the database
* Create tables
* Add constraints
* Insert data
* Execute analysis queries

### 5️⃣ Select the Database

```sql
USE EmployeeManagementDB;
```

### 6️⃣ Explore the Queries

Run the analysis queries included in the SQL file to explore employee, salary, department, leave, qualification, and payroll insights.

---

# 📚 Project Resources

### 📄 SQL Code

The complete database creation, data insertion, and analysis queries are available inside:

```text
/sql/employee_management_project.sql
```

### 📊 Project Presentation

The complete project presentation is available inside:

```text
/presentation/employee_management_innomatics.pptx
```

### 🎥 Project Video

A project demonstration video is available inside:

```text
/video/EMPLOYEE MANAGEMENT PROJECT.mp4
```

### 🗃️ Dataset

The project dataset is available inside:

```text
/dataset/
```

---

# ✨ Key Features

```text
✓ Relational Database Design
✓ Employee Data Management
✓ Department & Job Role Management
✓ Salary & Bonus Analysis
✓ Qualification Management
✓ Leave Management
✓ Payroll Analysis
✓ Primary & Foreign Key Relationships
✓ SQL Joins
✓ Aggregate Functions
✓ Business-Oriented Data Analysis
```

---

# 🎓 Learning Outcomes

Through this project, I developed practical understanding of:

* Relational Database Management Systems
* MySQL
* SQL Query Writing
* Database Design
* Entity Relationships
* Primary & Foreign Keys
* Constraints
* SQL Joins
* Aggregate Functions
* Data Filtering & Sorting
* Grouping & Aggregation
* Business Data Analysis

---

# 👩‍💻 Author

## Anwesha Panda

**SQL & Database Project**

This project was developed as part of practical learning and implementation of **SQL, MySQL, and Database Management concepts**.

---

# ⭐ Project Highlights

| Category          | Details                                                      |
| ----------------- | ------------------------------------------------------------ |
| **Project Type**  | Database Management System                                   |
| **Domain**        | Employee Management                                          |
| **Database**      | MySQL                                                        |
| **Language**      | SQL                                                          |
| **Tables**        | 6                                                            |
| **Analysis**      | Employee, Department, Salary, Qualification, Leave & Payroll |
| **Documentation** | SQL + PPT + Video                                            |
| **Author**        | Anwesha Panda                                                |

---

# 📌 Conclusion

The **Employee Management System** demonstrates how a relational database can be designed and used to manage employee information efficiently.

By combining **database design, SQL queries, table relationships, joins, aggregation, and business analysis**, the project provides a practical implementation of SQL for an employee management use case.

---

<div align="center">

### ⭐ If you found this project useful, consider giving the repository a star!

**Built with SQL & MySQL**

**© 2026 Anwesha Panda**

</div>
