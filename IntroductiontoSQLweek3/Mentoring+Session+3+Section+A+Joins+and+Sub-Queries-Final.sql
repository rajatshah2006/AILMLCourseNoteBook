-- Section A: Joins, Sub-Queries & Window Functions

-- •	Execute following basic commands to get started with the session

show databases;

use hr;

show tables;

#-- •	Write a query in SQL to display those employees who contain a letter z to their first name and also 
-- display their last name, department, city, and state province. (3 rows)

SELECT e.first_name
	,e.last_name
	,e.department_id
	,d.department_name
	,l.city
	,l.state_province
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
WHERE e.first_name LIKE "%z%";  

#-- •	Write a query in SQL to display the job title, department id, full name (first and last name) of employee, 
-- starting date and end date for all the jobs which started on or after 1st January, 1993 and ending with on 
-- or before 31 August, 2000. (8 rows)

SELECT j.job_id
	,e.department_id
	,CONCAT (
		e.first_name
		,' '
		,e.last_name
		) full_name
	,j.start_date
	,j.end_date
FROM employees e
JOIN job_history j ON e.employee_id = j.employee_id
WHERE j.start_date >= '1993-01-01'
	AND end_date <= '2000-08-31';		

#-- •	Display the employee number, name (first name and last name) and job title for all employees whose 
-- salary is smaller than the minimum salary of those employees whose job title is Programmer using 
-- subquery. (44 rows)

SELECT e.employee_id
	,CONCAT (
		e.first_name
		,' '
		,e.last_name
		) AS Name
	,j.job_title
FROM employees AS e
LEFT JOIN jobs AS j ON e.job_id = j.job_id
WHERE e.salary < (
		SELECT min(salary)
		FROM employees AS k
		LEFT JOIN jobs AS l ON k.job_id = l.job_id
		WHERE l.job_title = "Programmer"
		);
        
        
#-- •	Write a query in SQL to display the country name, city, and number of those departments where at least 2 
-- employees are working. (5 rows)

--WARNING! ERRORS ENCOUNTERED DURING SQL PARSING!
SELECT country_name
	,city
	,count(department_id)
FROM countries
JOIN locations using (country_id)
JOIN departments using (location_id)
WHERE department_id IN (
		SELECT department_id
		FROM employees
		GROUP BY department_id
		HAVING COUNT(employee_id) >= 2
		)
GROUP BY country_name
	,city;

#-- •	Write a query to fetch the employee ID, First Name, Last Name, Salary and Department ID of those employees 
-- who draw a salary more than the average salary of their respective department. (38 rows)

SELECT employee_id
	,CONCAT (
		first_name
		,' '
		,last_name
		) Name
	,salary
	,department_id
FROM employees o
WHERE salary > (
		SELECT avg(salary)
		FROM employees i
		WHERE o.department_id = i.department_id
		);


#-- •	Write a query in SQL to display the first and last name, salary, and department ID for those employees 
-- who earn less than the average salary, and also work at the department where the employee Laura is working 
-- as a first name holder.(41 rows)

SELECT *
FROM employees
WHERE salary < (
		SELECT avg(salary)
		FROM employees
		)
	AND department_id LIKE (
		SELECT department_id
		FROM employees
		WHERE first_name LIKE "Laura"
		);

#-- •	Using HR Schema, write a Query to find the maximum salary of the most recent job that every employee holds.

SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    j.job_title, 
    MAX(e.salary) AS max_salary
FROM 
    employees e
JOIN 
    job_history jh ON e.employee_id = jh.employee_id
JOIN 
    jobs j ON jh.job_id = j.job_id
WHERE 
    (e.employee_id, jh.start_date) IN (
        SELECT 
            employee_id, 
            MAX(start_date)
        FROM 
            job_history
        GROUP BY 
            employee_id
    )
GROUP BY 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    j.job_title;

#-- •	Using HR Schema, write a Query to List the old designation and new designation of all the employees in the 
-- company where old designation is not null. (110 rows)

SELECT DISTINCT e.employee_id
	,e.first_name
	,e.last_name
	,e.job_id AS current_job
	,j.job_id AS old_job
	,jo.job_title AS CURRENT
FROM employees AS e
INNER JOIN job_history AS j ON e.employee_id = j.employee_id
INNER JOIN jobs AS jo ON jo.job_id = e.job_id;

#--  Retrieve the employee details along with the highest salary of their department and the difference between 
-- their salary and the highest salary:
	
	SELECT employee_id
	,first_name
	,last_name
	,department_id
	,salary
	,MAX(salary) OVER (PARTITION BY department_id) AS highest_salary
	,salary - MAX(salary) OVER (PARTITION BY department_id) AS salary_difference
	FROM employees;


#-- Write an SQL query to retrieve the employee details, including their ID, first name, last name, and the 
-- average salary within a range that includes the current employee's salary and the salaries of the preceding 
-- and succeeding employees based on their hire dates.

	SELECT employee_id
	,first_name
	,last_name
	,salary
	,AVG(salary) OVER (
		ORDER BY hire_date ASC ROWS BETWEEN 1 PRECEDING
				AND 1 FOLLOWING
		) AS avg_salary_range
	FROM employees;

 
 #-- Find the average salary of employees in each department, along with the   highest-paid employee details within 
 -- that department. Additionally, you want to  display the department name, manager name, and location details 
 -- for each  department.

	SELECT d.department_name
		,e1.first_name || ' ' || e1.last_name AS manager_name
		,l.street_address || ', ' || l.city || ', ' || l.state_province || ', ' || l.country_id AS location_details
		,e2.first_name || ' ' || e2.last_name AS highest_paid_employee
		,e2.salary AS highest_salary
		,AVG(e1.salary) OVER (PARTITION BY d.department_id) AS avg_salary
FROM departments d
JOIN employees e1 ON d.manager_id = e1.employee_id
JOIN locations l ON d.location_id = l.location_id
JOIN (
	SELECT employee_id
		,first_name
		,last_name
		,salary
		,department_id
		,RANK() OVER (
			PARTITION BY department_id ORDER BY salary DESC
			) AS rank1
	FROM employees
	) e2 ON e1.department_id = e2.department_id
AND e2.rank1 = 1
ORDER BY d.department_id;


  






