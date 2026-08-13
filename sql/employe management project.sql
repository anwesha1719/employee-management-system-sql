CREATE DATABASE EMPLOYEE_MANAGEMENT_PROJECT_DB1;

USE EMPLOYEE_MANAGEMENT_PROJECT_DB1;

CREATE TABLE JobDepartment (
    Job_ID INT PRIMARY KEY,
    jobdept VARCHAR(50),
    name VARCHAR(100),
    description TEXT,
    salaryrange VARCHAR(50)
);
-- Table 2: Salary/Bonus
CREATE TABLE SalaryBonus (
    salary_ID INT PRIMARY KEY,
    Job_ID INT,
    amount DECIMAL(10,2),
    annual DECIMAL(10,2),
    bonus DECIMAL(10,2),
    CONSTRAINT fk_salary_job FOREIGN KEY (job_ID) REFERENCES JobDepartment(Job_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
-- Table 3: Employee
CREATE TABLE Employee(
    emp_ID INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    contact_add VARCHAR(100),
    emp_email VARCHAR(100) UNIQUE,
    emp_pass VARCHAR(50),
    Job_ID INT,
    CONSTRAINT fk_employee_job FOREIGN KEY (Job_ID)
        REFERENCES JobDepartment(Job_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Table 4: Qualification
CREATE TABLE Qualification (
    QualID INT PRIMARY KEY,
    Emp_ID INT,
    Position VARCHAR(50),
    Requirements VARCHAR(255),
    Date_In DATE,
    CONSTRAINT fk_qualification_emp FOREIGN KEY (Emp_ID)
        REFERENCES Employee(emp_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table 5: Leaves
CREATE TABLE Leaves (
    leave_ID INT PRIMARY KEY,
    emp_ID INT,
    date DATE,
    reason TEXT,
    CONSTRAINT fk_leave_emp FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table 6: Payroll
CREATE TABLE Payroll (
    payroll_ID INT PRIMARY KEY,
    emp_ID INT,
    job_ID INT,
    salary_ID INT,
    leave_ID INT,
    date DATE,
    report TEXT,
    total_amount DECIMAL(10,2),
    CONSTRAINT fk_payroll_emp FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_payroll_job FOREIGN KEY (job_ID) REFERENCES JobDepartment(job_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_payroll_salary FOREIGN KEY (salary_ID) REFERENCES SalaryBonus(salary_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_payroll_leave FOREIGN KEY (leave_ID) REFERENCES Leaves(leave_ID)
        ON DELETE SET NULL ON UPDATE CASCADE
);

SELECT * FROM employee;
SELECT * FROM jobdepartment;
SELECT * FROM leaves;
select * from Payroll;
select * from salarybonus;
SELECT * FROM qualification;
/*1. EMPLOYEE INSIGHTS*/
/*How many unique employees are currently in the system?*/
SELECT COUNT(DISTINCT emp_ID) AS total_unique_employees
FROM Employee;
/*Which departments have the highest number of employees?*/
SELECT j.jobdept AS department, COUNT(e.emp_ID) AS employee_count
FROM Employee e
JOIN JobDepartment j ON e.Job_ID = j.Job_ID
GROUP BY j.jobdept
ORDER BY employee_count DESC;
/*What is the average salary per department?*/
SELECT j.jobdept AS department, AVG(s.amount) AS average_salary
FROM Employee e
JOIN JobDepartment j ON e.Job_ID = j.Job_ID
JOIN SalaryBonus s ON j.Job_ID = s.Job_ID
GROUP BY j.jobdept
ORDER BY average_salary DESC;
/*Who are the top 5 highest-paid employees?*/
SELECT e.emp_ID, e.firstname, e.lastname, j.jobdept, s.amount AS salary
FROM Employee e
JOIN JobDepartment j ON e.Job_ID = j.Job_ID
JOIN SalaryBonus s ON j.Job_ID = s.Job_ID
ORDER BY s.amount DESC
LIMIT 5;
/*What is the total salary expenditure across the company?*/
SELECT SUM(s.amount) AS total_salary_expenditure
FROM Employee e
JOIN SalaryBonus s ON e.Job_ID = s.Job_ID;
/*2.JOB ROLE AND DEPARTMENT ANALYSIS*/
/*How many different job roles exist in each department?*/
SELECT jobdept AS department, COUNT(DISTINCT name) AS total_job_roles
FROM JobDepartment
GROUP BY jobdept
ORDER BY total_job_roles DESC;
/*What is the average salary range per department?*/
SELECT j.jobdept AS department, AVG(s.amount) AS avg_salary
FROM JobDepartment j
JOIN SalaryBonus s ON j.Job_ID = s.Job_ID
GROUP BY j.jobdept;
/*Which job roles offer the highest salary?*/
SELECT j.name AS job_role, j.jobdept AS department, s.amount AS salary
FROM JobDepartment j
JOIN SalaryBonus s ON j.Job_ID = s.Job_ID
ORDER BY s.amount DESC;
/*Which departments have the highest total salary allocation?*/
SELECT j.jobdept AS department, SUM(s.amount) AS total_salary_allocation
FROM Employee e
JOIN JobDepartment j ON e.Job_ID = j.Job_ID
JOIN SalaryBonus s ON j.Job_ID = s.Job_ID
GROUP BY j.jobdept
ORDER BY total_salary_allocation DESC;
/*3. QUALIFICATION AND SKILLS ANALYSIS*/
/*How many employees have at least one qualification listed?*/
SELECT COUNT(DISTINCT Emp_ID) AS employees_with_qualifications
FROM Qualification;
/*Which positions require the most qualifications?*/
SELECT Position, COUNT(*) AS qualification_count
FROM Qualification
GROUP BY Position
ORDER BY qualification_count DESC;
/*Which employees have the highest number of qualifications?*/
SELECT e.emp_ID, e.firstname, e.lastname, COUNT(q.QualID) AS total_qualifications
FROM Employee e
JOIN Qualification q ON e.emp_ID = q.Emp_ID
GROUP BY e.emp_ID, e.firstname, e.lastname
ORDER BY total_qualifications DESC;
/*4. LEAVE AND ABSENCE PATTERNS*/
/*Which year had the most employees taking leaves?*/
SELECT EXTRACT(YEAR FROM date) AS leave_year, COUNT(DISTINCT emp_ID) AS unique_employees
FROM Leaves
GROUP BY leave_year
ORDER BY unique_employees DESC
LIMIT 1;
/*What is the average number of leave days taken by its employees per department?*/
SELECT j.jobdept AS department, 
       CAST(COUNT(l.leave_ID) AS FLOAT) / COUNT(DISTINCT e.emp_ID) AS avg_leaves_per_employee
FROM Employee e
JOIN JobDepartment j ON e.Job_ID = j.Job_ID
LEFT JOIN Leaves l ON e.emp_ID = l.emp_ID
GROUP BY j.jobdept
ORDER BY avg_leaves_per_employee DESC;
/*Which employees have taken the most leaves?*/
SELECT e.emp_ID, e.firstname, e.lastname, COUNT(l.leave_ID) AS total_leaves_taken
FROM Employee e
JOIN Leaves l ON e.emp_ID = l.emp_ID
GROUP BY e.emp_ID, e.firstname, e.lastname
ORDER BY total_leaves_taken DESC;
/*What is the total number of leave days taken company-wide?*/
SELECT COUNT(leave_ID) AS total_leave_days
FROM Leaves;
/* How do leave days correlate with payroll amounts?*/
SELECT e.emp_ID, 
       e.firstname, 
       e.lastname, 
       COUNT(DISTINCT l.leave_ID) AS total_leaves, 
       SUM(p.total_amount) AS total_payroll_amount
FROM Employee e
LEFT JOIN Leaves l ON e.emp_ID = l.emp_ID
LEFT JOIN Payroll p ON e.emp_ID = p.emp_ID
GROUP BY e.emp_ID, e.firstname, e.lastname
ORDER BY total_leaves DESC;
/*5. PAYROLL AND COMPENSATION ANALYSIS*/
/*What is the total monthly payroll processed?*/
SELECT DATE_FORMAT(date, '%Y-%m') AS payroll_month, 
       SUM(total_amount) AS total_monthly_payroll
FROM Payroll
GROUP BY payroll_month
ORDER BY payroll_month DESC;

/*What is the average bonus given per department?*/
SELECT j.jobdept AS department, 
       AVG(sb.bonus) AS avg_bonus
FROM Employee e
JOIN JobDepartment j ON e.Job_ID = j.Job_ID
JOIN SalaryBonus sb ON j.Job_ID = sb.Job_ID
GROUP BY j.jobdept
ORDER BY avg_bonus DESC;
/*Which department receives the highest total bonuses?*/
SELECT j.jobdept AS department, 
       SUM(sb.bonus) AS total_bonus_amount
FROM Employee e
JOIN JobDepartment j ON e.Job_ID = j.Job_ID
JOIN SalaryBonus sb ON j.Job_ID = sb.Job_ID
GROUP BY j.jobdept
ORDER BY total_bonus_amount DESC
LIMIT 1;
/*What is the average value of total_amount after considering leave deductions?*/
SELECT AVG(total_amount) AS avg_net_payroll_amount
FROM Payroll;




