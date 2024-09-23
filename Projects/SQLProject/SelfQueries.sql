use vehdb;
##Question 1:
#Find the total number of customers who have placed orders. What is the distribution of the customers across states? [4 marks]
#Hint: For each state, count the number of customers
#Total number of customer who placed order
select count(distinct(customer_id))  as customer_cnt from order_t ;
#the distribution of the customers across states?
select state,count(distinct(customer_id)) as customer_cnt from customer_t group by state;

#Which are the top 5 vehicle makers preferred by the customers?
SELECT p.VEHICLE_MAKER, COUNT(o.ORDER_ID) AS order_count
FROM product_t p
JOIN order_t o ON p.PRODUCT_ID = o.PRODUCT_ID
GROUP BY p.VEHICLE_MAKER
ORDER BY order_count DESC
Limit 5;
