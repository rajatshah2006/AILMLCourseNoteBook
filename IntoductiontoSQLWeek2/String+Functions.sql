-- -------------------------------------
-- STRING FUNCTIONS
-- -------------------------------------

-- LENGTH(string)
SELECT LENGTH ('GREAT LEARNING') AS LENGTH_OF_WORD;

-- CONCAT(expression1, expression2, expression3,...)	
    SELECT CONCAT ('GREAT ', 'LEARNING') AS LABEL;
    
 -- UPPER(text) & LOWER(text)   
	SELECT UPPER('great learning') AS U_NAME;
	SELECT LOWER('gReAT LeaRnINg') AS L_NAME; 
    
-- SUBSTRING(string, start, length)

SELECT SUBSTR("Great Learning", 1, 5) AS EXTRACTEDSTRING;
SELECT SUBSTR("Great Learning", -1, 1) AS EXTRACTEDSTRING;
   
-- REPLACE(string, from_string, new_string)
SELECT REPLACE("Great Lakes", "Lakes", "Learning") AS REPLACED;   

-- TRIM(string), LTRIM(string) & RTRIM(string)

SELECT TRIM( 'GREAT' from 'GREAT LEARNING') AS TRIMMEDSTRING;    
SELECT LTRIM('  GREAT LAKES') AS TRIMMEDSTRING;
SELECT RTRIM('  GREAT LAKES    ') AS TRIMMEDSTRING;

