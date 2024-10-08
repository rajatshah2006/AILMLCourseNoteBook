/* BEFORE RUNNING THE QUERIES IN THIS FILE, MAKE SURE THE DATABASE 
   NAMED HR_DATA IS CREATED AND ALL THE TABLES ARE IMPORTED WITH THE NECESSARY DATA 
   USING THE SQL DUMP FILE GIVEN.*/
   
   USE HR_DATA;
   
-- [1] FETCH ALL THE EMPLOYEES IN DEPARTMENT ID 50
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

-- [2] FETCH ALL THE EMPLOYEES WITH 'DAVID' AS THEIR FIRST NAME
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME = 'DAVID';

-- [3] FETCH DETAILS OF EMPLOYEE WITH 'JENNIFER' AS FIRST NAME AND 'AD_ASST' AS JOB_ID
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME = 'JENNIFER'
	AND JOB_ID = 'AD_ASST';

-- [4] FETCH EMPLOYEES WITH DEPARTMENT ID 50 OR 90
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
	OR DEPARTMENT_ID = 90;
    
-- [5] FETCH THE DETAILS OF EMPLOYEES WHOSE MANAGER ID IS 100, 108 & 114
SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IN (
		100
		,108
		,114
		);

-- [6] FETCH EMPLOYEES WHOSE FIRSTNAMES ARE EITHER JOHN OR ALEXANDER
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME IN (
		'JOHN'
		,'ALEXANDER'
		);

-- [7] FETCH EMPLOYEE DETAILS WHO DO NOT BELONG TO DEPARTMENT ID 30, 50 & 80
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (
		30
		,50
		,80
		);

-- [8] FETCH THE EMPLOYEES WHOSE SALARY RANGES BETWEEN 5000 AND 10000
SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 5000
		AND 10000;

-- [9] FETCH ALL THE EMPLOYEES WHOSE FIRST_NAME STARTS WITH 'AL'
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'AL%';

-- [10] FETCH ALL THE EMPLOYEES WHOSE NAME ENDS WITH 'HA'
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%HA';

-- [11] FETCH THE EMPLOYEES WITH L AS THE SECOND LETTER IN THEIR FIRSTNAME
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_L%';