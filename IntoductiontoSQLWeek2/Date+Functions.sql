-- DATE FUNCTIONS
-- -------------------------------------
-- [1] FIND CURRENT DATE AND TIME
SELECT NOW();

-- [2] FIND CURRENT DATE
SELECT CURDATE();

-- [3] FIND CURRENT TIME
SELECT CURTIME();

-- [4] FIND THE NUMBER OF DAYS BETWEEN TWO DATE VALUES:

-- DATEDIFF(date1, date2)
SELECT DATEDIFF(CURDATE(), '2022-01-01');

-- [5] ADD A TIME/DATE INTERVAL TO A DATE

-- DATE_ADD(date, INTERVAL value addunit)
SELECT DATE_ADD( CURDATE(), INTERVAL 10 DAY);
SELECT DATE_ADD( CURDATE(), INTERVAL 1 MONTH);

-- [6] FIND DAY, MONTH & YEAR OF A DATE

SELECT DAY(CURDATE()), MONTH(CURDATE()), YEAR(CURDATE());

-- [7] FIND DAY NAME OF A DATE
SELECT DAYNAME(CURDATE());

-- [8] FIND DAY OF THE YEAR FOR A DATE
SELECT DAYOFYEAR(CURDATE());

-- [7] FIND DAY OF THE WEEK FOR A DATE
SELECT DAYOFWEEK(CURDATE());

-- [8] FIND THE LAST DAY OF THE MONTH FOR A DATE
SELECT LAST_DAY(CURDATE()) ;

-- [9]  Date formatting

-- DATE_FORMAT(date, format)
SELECT DATE_FORMAT(CURDATE(), '%d-%b-%Y') AS NEW_DATE;
SELECT DATE_FORMAT(CURDATE(), '%D-%m-%y') AS NEW_DATE;
SELECT DATE_FORMAT(CURDATE(), '%D, %b, %Y') AS NEW_DATE;

-- [10] CONVERT STRING TO DATE FORMAT
SELECT STR_TO_DATE('12,10,2022','%d,%m,%Y');