use orders;
select * from product;
select Address_id,city,state,pincode from address;
select distinct city from address;
select * from product where product_id=99999;
delete from product where product_id=99999;
select * from product where product_id=99999;
select distinct city,state from address;

update product set product_price=product_price-(product_price*0.25);

use orders;
select count(*) as cnt from product;
select product_class_code ,sum(product_price) as sumofprice,avg(product_price) as averageproductprice from product group by product_class_code
having averageproductprice>=4000;

select  customer_gender,count(customer_gender) as cnt  from online_customer group by customer_gender ;

select count(distinct(city)) as citycnt from address;

select * from order_items;

use orders;

SELECT SUM(5)
FROM product;
select product_id, case
 when PRODUCT_QUANTITY_AVAIL<=50 then 'Low stock'
 when PRODUCT_QUANTITY_AVAIL>50 and PRODUCT_QUANTITY_AVAIL<=150 then 'Medium stock'
 when PRODUCT_QUANTITY_AVAIL>150 then 'HIGH stock'
END as stockinfo
from product;


SELECT SUM(5)
FROM product;

SELECT SUM(product_quantity_avail) AS total_stock
FROM product;


SELECT COUNT(product_quantity_avail) total_stock
FROM product;

select count(*) as cnt from online_customer;


SELECT AVG(product_quantity_avail),
MAX(product_quantity_avail),
MIN(product_quantity_avail)
FROM product;

SELECT COUNT(DISTINCT pincode)
FROM address;



SELECT  product_class_code, SUM(product_quantity_avail)
FROM product
GROUP BY  product_class_code;

SELECT product_class_code, AVG(product_quantity_avail) AS avg_qty
FROM product
GROUP BY product_class_code
ORDER BY avg_qty;


SELECT payment_mode, COUNT(order_id)
FROM order_header
WHERE shipper_id=50001
GROUP BY payment_mode;



SELECT product_desc, SUM(product_quantity_avail) AS inventory
FROM product
GROUP BY 1
HAVING inventory >100;

SELECT PRODUCT_DESC, PRODUCT_PRICE,
CASE 
 WHEN product_price >= 20000 then "High Price"
 WHEN product_price < 20000 then "Low Price"
 END AS price_category
FROM product;