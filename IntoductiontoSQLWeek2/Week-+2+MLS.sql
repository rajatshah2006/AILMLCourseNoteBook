##1.  Write a SQL query to print details of the employees whose first name starts with 'a' and contains only 4 alphabets.
SELECT *
FROM employees
WHERE length(first_name) = 4
	AND first_name LIKE 'a___';


##2.	Write a SQL query to print details of the employees whose first_name ends with 'h' and contains only 6 alphabets.  
SELECT *
FROM employees
WHERE first_name LIKE '%h'
	AND length(first_name) = 6;


## 3.	Retrieve all the distinct salary values from dataset 
SELECT DISTINCT salary
FROM employees;


SELECT *
FROM employees;


## 4.	Write a SQL query to print the first name from employees table after removing white spaces from the right side. 
SELECT RTRIM(first_name) AS Name
FROM employees;


## 5.	Write a SQL query to print the first name from employees table after replacing ‘a’ with ‘A’. 
SELECT replace(first_name, 'a', 'A') AS first_name
FROM employees;

## 6.	Write a SQL query to fetch, if there are any duplicate records in the table. 
SELECT first_name
	,last_name
	,department_id
	,count(*) AS cnt
FROM employees
GROUP BY first_name
	,last_name
	,department_id
HAVING count(*) > 1;


## 7.	Find the department_ids whose average salary is greater than 8000 
SELECT department_id
	,avg(salary)
FROM employees
GROUP BY department_id
HAVING avg(salary) > 8000;

##8.	Write a sql query to fetch the details of an employee -- Generate another as commission percentage column. And wherever there are null values in this column, convert it to 0. 
SELECT employee_id
	,first_name
	,salary
	,commission_pct
	,coalesce(commission_pct, 0)
FROM employees;


## 9.	Find out how many employees are in department 80. 
SELECT count('first_name') AS Number_of_Employees
FROM employees
WHERE department_id = 80;


## 10.	Write a query to get the number of employees with the same job. 
SELECT department_id
	,COUNT(*) AS Number_of_Employees
FROM employees
GROUP BY department_id;


##11.	Write a query to get the difference between the highest and lowest salaries. 
SELECT MAX(salary) - MIN(salary) DIFFERENCE
FROM employees;


## 12.	Write a query to get the department ID and the total salary payable in each department. 
SELECT department_id
	,SUM(salary)
FROM employees
GROUP BY department_id;


## 13.	Write a query to find the manager ID and the first name, last name and salary of the lowest-paid employee for that manager. 
SELECT manager_id
	,first_name
	,last_name
	,MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY MIN(salary) DESC;


## 14.	Write a query to find the details of employees, who got hired very early and got commission percentage. 
SELECT first_name
	,last_name
	,salary
	,commission_pct
	,min(hire_date)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY hire_date
ORDER BY MIN(hire_date) ASC;


## 15.	Write a query to get the job_id and related employee's id. 
SELECT job_id
	,GROUP_CONCAT(employee_id, ' ') AS 'Employees ID'
FROM employees
GROUP BY job_id;


##16.	Write a query to find the details of employees and with eligibility criteria based on the following:
#a.	If Hire_date is less than or equal to  '1999-12-31'then eligible else not eligible
SELECT employee_id
	,last_name
	,hire_date
	,IF (  hire_date <= '1999-12-31'
		,"Eligible"
		,"Not Eligible"
		) AS scheme_eligibility FROM employees;


## 17.	Write a query to assign tax slabs based on the following criteria:
# a.	If salary less than or equal to 5000 then ‘Tax slab A’
#b.	If salary greater than 5000 and less than or equal to 10000 then ‘Tax slab B’
#c.	If salary greater than 10000 and less than or equal to 15000 then ‘Tax slab C’
#d.	Else ‘Tax slab C’
SELECT employee_id
	,last_name
	,salary
	,CASE 
		WHEN salary <= 5000
			THEN 'Tax slab A'
		WHEN salary >= 5000 and salary<= 10000
			THEN 'Tax slab B'
		WHEN salary <= 15000
			THEN 'Tax slab C'
		ELSE 'Tax slab D'
		END AS taxation
FROM employees;

# 18.	Write a query to find the hire year of each employees
SELECT employee_id
	,last_name
	,year(hire_date)
FROM employees;

#19.	Write a query to find the count of employees hired in each year and sort them.
SELECT year(hire_date)
	,Count(employee_id)
FROM employees
GROUP BY year(hire_date)
ORDER BY year(hire_date) DESC;


#******************Additional Content**************************
### IFNULL, IF and CASE

# IFNULL
SELECT employee_id, last_name,  IFNULL(department_id, "To Be Assigned") AS department
FROM employees 
WHERE employee_id > 170;


# IF
SELECT employee_id, last_name,  hire_date, 
		IF(hire_date <= '1999-12-31', "Eligible", "Not Eligible") AS scheme_eligibility
FROM employees;

SELECT employee_id
	,last_name
	,hire_date
	,IF (
		hire_date <= '1999-12-31'
		,"Eligible"
		,"Not Eligible"
		) AS scheme_eligibility FROM employees;

SELECT employee_id, last_name, IF(job_id LIKE '%MGR%' OR  job_id LIKE "%MAN%", "Yes",'No') AS Manager
FROM employees;


# CASE
SELECT employee_id, last_name, salary,
	CASE
        WHEN salary <= 5000 THEN 'Tax slab A'
        WHEN salary <= 10000 THEN 'Tax slab B'
        WHEN salary <= 15000 THEN 'Tax slab C'
        ELSE  'Tax slab D'
	END AS taxation
FROM employees;


SELECT employee_id, last_name, job_id, salary,
	CASE
        WHEN job_id = 'SA_REP' THEN salary * 1.25
        WHEN job_id = 'IT_PROG' THEN salary * 1.2
        ELSE  salary * 1.05
	END AS proposed_salary
FROM employees;

###
### ORDER BY
###

SELECT employee_id, first_name, last_name
FROM Employees
ORDER BY employee_id;

SELECT employee_id, first_name, last_name, hire_date
FROM Employees
ORDER BY hire_date DESC;

SELECT first_name, last_name, department_id, salary
FROM Employees
ORDER BY department_id, salary DESC;

# Sort using column position number (in the SELECT clause)
SELECT first_name, last_name, department_id, salary
FROM Employees
ORDER BY 3, 4 DESC;

# check sorting for NULL
SELECT employee_id, first_name, last_name, hire_date, manager_id
FROM Employees
ORDER BY manager_id DESC;

###
### Aggregate functions
###

SELECT count(*)
FROM Employees;

SELECT count(*)
FROM Employees
WHERE department_id = 80;

SELECT COUNT(commission_pct)
FROM Employees;

SELECT COUNT(DISTINCT job_id)
FROM Employees;

SELECT MIN(salary), MAX(salary), AVG(salary), SUM(salary)
FROM Employees
WHERE department_id = 80;

SELECT MIN(salary), MAX(salary), ROUND(AVG(salary),2), SUM(salary)
FROM Employees
WHERE department_id = 80;




###
### Group By
###

SELECT department_id, count(*) as 'No of Employees'
FROM employees 
GROUP BY department_id;

SELECT department_id, AVG(salary), MIN(SALARY), MAX(SALARY)
FROM employees 
GROUP BY department_id;

SELECT department_id, job_id, count(*), AVG(salary) 
FROM employees 
GROUP BY department_id, job_id;

# GROUP BY with ORDER BY
SELECT department_id, job_id, count(*), AVG(salary) 
FROM employees 
GROUP BY department_id, job_id 
ORDER BY department_id, job_id;

# GROUP BY with WHERE
SELECT department_id, COUNT(department_id), AVG(salary)
FROM employees 
WHERE job_id LIKE '%CLERK%'
GROUP BY department_id;

# Is following query correct?
SELECT department_id, last_name, AVG(salary)
FROM employees 
GROUP BY department_id;

# is following query correct?
SELECT department_id, AVG(salary)
FROM employees 
WHERE AVG(salary) > 6000
GROUP BY department_id;

# *** HAVING clause

SELECT department_id, AVG(salary)
FROM employees 
GROUP BY department_id
HAVING AVG(salary) > 6000;

# HAVING clause with WHERE and ORDER BY
SELECT department_id, job_id, AVG(salary)
FROM Employees
WHERE department_id IN (50, 80)
GROUP BY department_id, job_id
HAVING AVG(salary) > 5000
ORDER BY department_id, job_id;