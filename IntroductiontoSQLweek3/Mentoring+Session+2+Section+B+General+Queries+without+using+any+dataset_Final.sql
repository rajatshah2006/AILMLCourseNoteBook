-- Section B: General Queries without using any dataset

-- •	Write a Query to display the word 'Great Learning' by removing the vowels.

select regexp_replace ("Great Learning","[a,e,i,o,u]","");

-- •	Write a Query to remove all the leading and trailing exclamatory marks from the string '!!!!!Great Learning!!!!!!'.

select replace('!!!!!Great Learning!!!!!!',"!","");

-- •	Write a Query to divide the number 100 by 3 and print the remainder after division.

select 100 mod 3;

-- •	Display 'Great Learnings' in capital letter

select upper('Great Learnings');

-- •	-Display the difference between '2020-01-21' and '2020-01-21'

select datediff('2020-01-21', '2020-01-01') as Difference_Between_Dates;

-- •	Display the age if the date of birth is '1999-09-08'

select datediff(curdate(), '1999-09-08')/365 as Age;

-- •	Display '1' if 2<>0 condition is true otherwise display '0' 

select if (2<>0,1,0);

-- •	Display the user name in MySQL

select current_user();

-- •	-Display the square of 9

select power(9,2);
