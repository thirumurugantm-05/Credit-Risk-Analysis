-- 1. Total records
SELECT COUNT(*) AS total_records
FROM credit_risk_sql;

-- 2. Default analysis
SELECT loan_status,
       COUNT(*) AS customers
FROM credit_risk_sql
GROUP BY loan_status;

-- 3. Analyze loan grade risk
SELECT loan_grade,
       COUNT(*) AS total_loans,
       SUM(loan_status) AS total_defaults
FROM credit_risk_sql
GROUP BY loan_grade
ORDER BY total_defaults DESC;

-- 4. Analyze loan purpose risk
SELECT loan_intent,
       COUNT(*) AS total_loans,
       SUM(loan_status) AS total_defaults
FROM credit_risk_sql
GROUP BY loan_intent
ORDER BY total_defaults DESC;

-- 5. Check whether previous defaulters default again
SELECT cb_person_default_on_file,
       COUNT(*) AS customers,
       SUM(loan_status) AS defaults
FROM credit_risk_sql
GROUP BY cb_person_default_on_file;

-- 6. Analyze risk by home ownership type
SELECT person_home_ownership,
       COUNT(*) AS customers,
       SUM(loan_status) AS defaults
FROM credit_risk_sql
GROUP BY person_home_ownership
ORDER BY defaults DESC;

-- 7. Average loan amount by loan grade
SELECT loan_grade,
       AVG(loan_amnt) AS avg_loan_amount
FROM credit_risk_sql
GROUP BY loan_grade
ORDER BY avg_loan_amount DESC;

-- 8. Show loan grades having more than 1000 customers (HAVING)
SELECT loan_grade,
       COUNT(*) AS customers
FROM credit_risk_sql
GROUP BY loan_grade
HAVING COUNT(*) > 1000;

-- 9. Categorize customers by age using CASE
SELECT person_age,
       CASE
           WHEN person_age < 30 THEN 'Young'
           WHEN person_age < 50 THEN 'Middle Age'
           ELSE 'Senior'
       END AS age_group
FROM credit_risk_sql
LIMIT 20;


SELECT
    COUNT(*) AS total_records,
    SUM(loan_status = 1) AS total_defaults,
    SUM(loan_status = 0) AS total_non_defaults
FROM credit_risk_sql;


SELECT
    SUM(person_emp_length IS NULL) AS missing_emp_length,
    SUM(loan_int_rate IS NULL) AS missing_interest_rate
FROM credit_risk_sql;
SELECT SUM(loan_amnt) AS total_loan_amount
FROM credit_risk_sql;


use thiru01;
CREATE TABLE employee_sales (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    sales DECIMAL(10,2),
    joining_date DATE
);



INSERT INTO employee_sales VALUES
(1,'Arun','Electronics','Chennai',45000,65000,'2022-01-15'),
(2,'Priya','Furniture','Bangalore',40000,28000,'2021-05-22'),
(3,'Rahul','Electronics','Hyderabad',55000,85000,'2020-03-10'),
(4,'Sneha','Furniture','Chennai',42000,35000,'2023-02-18'),
(5,'Kiran','Electronics','Mumbai',60000,95000,'2019-08-12'),
(6,'Anu','Clothing','Bangalore',38000,22000,'2022-06-25'),
(7,'Vijay','Clothing','Chennai',41000,48000,'2021-11-08'),
(8,'Meena','Furniture','Hyderabad',47000,55000,'2020-09-14'),
(9,'Ramesh','Electronics','Delhi',52000,72000,'2018-04-20'),
(10,'Divya','Clothing','Mumbai',39000,18000,'2023-01-30'),
(11,'Suresh','Electronics','Chennai',58000,88000,'2019-07-01'),
(12,'Lakshmi','Furniture','Bangalore',43000,45000,'2022-10-11'),
(13,'Ajith','Clothing','Delhi',37000,30000,'2021-08-19'),
(14,'Keerthi','Furniture','Mumbai',46000,68000,'2020-12-15'),
(15,'Manoj','Electronics','Hyderabad',61000,99000,'2018-05-09');


select * from employee_sales;


select emp_name,sales,
case
when sales >= 80000 then 'High Sales'
when sales between 50000 and 79999 then 'Medium Sales'
else 'low sales'
end as sales_category
from employee_sales;


select emp_name,sales,
case
when sales >= 90000 then sales * 0.20 'Bonus'
when sales between 50000 and 79999 then 'Medium Sales'
else 'low sales'
end as sales_category
from employee_sales;



Sales >= 90000 → 20% Bonus
Sales >= 70000 → 10% Bonus
Otherwise → No Bonus

