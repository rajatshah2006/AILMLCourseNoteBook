-- FIRST, LET'S LOOK AT THE TABLES FOR EMPLOYEES AND DEPARTMENTS TO DETERMINE WHAT DATA WE NEED TO RETRIEVE
-- CHECK FOR ANY DUPLICATES'

select COUNT(employees.employee_id) as emp_cnt from employees group by  employee_id ;
select COUNT(department_id) as dep_cnt from departments group by  department_id having dep_cnt>1;

-- [1] FIND THE DETAILS OF EMPLOYEES WORKING IN THE IT & SHIPPING DEPARTMENT.
-- (USE EMPLOYEES & DEPARTMENTS )

select emp.* from employees emp where department_id IN (
select departments.department_id  from departments  where department_name IN ('IT','Shipping'));

select emp.*, dep.department_name
       from employees emp INNER  JOIN
           departments as dep USING (department_id)
      where department_name IN ('IT','Shipping');

-- [2] FIND THE NUMBER OF EMPLOYEES WORKING IN EACH DEPARTMENT, AS WELL AS THEIR AVERAGE SALARY.
-- (USE TABLES - EMPLOYEES, DEPARTMENTS)

select COUNT(employees.employee_id),department_id, departments.department_name,AVG(salary) as avg_salary
from employees RIGHT  JOIN departments
USING (department_id)
group by department_id, departments.department_name;



SELECT D.DEPARTMENT_ID
     ,D.DEPARTMENT_NAME
     ,COUNT(E.EMPLOYEE_ID) NUMBER_OF_EMPLOYEES
     ,AVG (E.SALARY) AVERAGE_SALARY
FROM DEPARTMENTS D
         LEFT JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME;



-- [3] WRITE A SQL QUERY TO FIND ALL DEPARTMENTS, INCLUDING THOSE WITHOUT EMPLOYEES RETURN EMPLOYEE ID,
-- FULLNAME, DEPARTMENT ID, DEPARTMENT NAME
-- (USE TABLES - EMPLOYEES, DEPARTMENTS)


select  employees.employee_id,CONCAT(employees.first_name,' ',employees.last_name) as full_name ,departments.department_id,departments.department_name
from departments left join  employees USING(department_id) where employee_id is NULL ;


SELECT E.EMPLOYEE_ID
     ,CONCAT (
        E.FIRST_NAME
    ,' '
    ,E.LAST_NAME
      ) AS FULLNAME
     ,D.DEPARTMENT_ID
     ,D.DEPARTMENT_NAME
FROM EMPLOYEES E
         RIGHT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID IS NULL;

-- [4] FIND THE DETAILS OF EMPLOYEES WITH SALARY GREATER THAN 10000 ALONG WITH THEIR MANAGER'S FULLNAME
-- (USE TABLE EMPLOYEES)

SELECT E.EMPLOYEE_ID
     ,CONCAT (
        E.FIRST_NAME
    ,' '
    ,E.LAST_NAME
      ) AS EMPLOYEE
     ,E.SALARY EMPLOYEE_SALARY
     ,CONCAT (
        M.FIRST_NAME
    ,' '
    ,M.LAST_NAME
      ) AS MANAGER
FROM EMPLOYEES E
         JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID
WHERE E.SALARY > 10000;


-- [5] FIND ALL THE COLUMNS AND ROWS FROM BOTH EMPLOYEES AND DEPARTMENTS.
-- MySQL DOES NOT SUPPORT FULL OUTER JOIN DIRECTLY INSTEAD IT IS DONE BY USING THE UNION CLAUSE


SELECT *
FROM EMPLOYEES E
         LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID

UNION

SELECT *
FROM EMPLOYEES E
         RIGHT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


SELECT * FROM LOCATIONS;

SELECT E.EMPLOYEE_ID
     ,CONCAT (
        E.FIRST_NAME
    ,' '
    ,E.LAST_NAME
      ) AS FULLNAME
     ,D.DEPARTMENT_NAME
     ,SUM(E.SALARY) AS TOTAL_SALARY
     ,E.SALARY
     ,L.CITY
     ,L.STATE_PROVINCE
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
         INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'Seattle'
GROUP BY D.DEPARTMENT_NAME
ORDER BY TOTAL_SALARY DESC;

# Get the department with more than 10 employees
select employees.* from employees where department_id in(select department_id as depid from employees group by department_id having count(employee_id)>10);

SELECT *
FROM (
         SELECT E.EMPLOYEE_ID
              ,E.FIRST_NAME
              ,D.DEPARTMENT_NAME
              ,COUNT(*) OVER (PARTITION BY E.DEPARTMENT_ID) AS TOTAL_COUNT_DEPT
         FROM EMPLOYEES E
                  INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
     ) AS TOTAL_COUNT
WHERE TOTAL_COUNT_DEPT > 10;



-- [2] FIND THE DETAILS OF EMPLOYEES AND THE THEIR DEPARTMENT NAMES WHOSE COMBINED SALARY OF THE DEPARTMENT IS LESS THAN 100000
-- (USE TABLES- EMPLOYEES AND DEPARTMENTS)

