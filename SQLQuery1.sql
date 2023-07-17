----WHOLE TABLE VIEW----
select * from pizza_sales;

----TOTAL REVENUE----
select SUM(total_price) as TOTAL_REVENUE from pizza_sales;

----AVERAGE ORDER VALUE----  
select SUM(total_price) / COUNT(DISTINCT(order_id)) as AVERAGE_ORDER_VALUE from pizza_sales;

----TOTAL PIZZA SOLD----
select SUM(quantity) as TOTAL_PIZZA_SOLD from pizza_sales; 

----TOTAL ORDERS----
select COUNT(DISTINCT(order_id)) as TOTAL_ORDERS from pizza_sales;

----AVERAGE PIZZA PER ORDER----
select CAST(CAST(SUM(quantity) AS decimal(10,2)) / CAST(COUNT(DISTINCT(order_id)) AS DECIMAL(10,2)) AS decimal(10,2) )as AVERAGE_PIZZA_SOLD from pizza_sales;

----DAILY TREND FOR TOTAL ORDERS----
select DATENAME(DW,order_date) as ORDER_DAY , COUNT(DISTINCT(order_id)) as TOTAL_ORDERS 
from pizza_sales 
GROUP BY DATENAME(DW,order_date);

----HOURLY TREND FOR TOTAL ORDERS----
select DATEPART(HOUR, order_time) as ORDER_HOURS , COUNT(DISTINCT(order_id)) as TOTAL_ORDERS 
from pizza_sales 
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);

---% OF SALES BY PIZZA CATEGORY---
select pizza_category , SUM(total_price)*100 / (select SUM(total_price) from pizza_sales) as TOTAL_SALES
from pizza_sales
GROUP BY pizza_category;

---MONTH WISE IF YOU WANT----
select pizza_category , SUM(total_price)*100 / (select SUM(total_price) from pizza_sales) as TOTAL_SALES
from pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category;

----% OF SALES BY PIZZA SIZE---
select pizza_size , CAST(SUM(total_price)*100 / (select SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) as TOTAL_SALES
from pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

----TOTAL PIZZA SOLD BY PIZZA CATEGORY----
select pizza_category , SUM(quantity) as TOTAL_PIZZA_SOLD 
from pizza_sales
GROUP BY pizza_category ;

----TOP 5 BEST SELLER BY TOTAL PIZZA SOLD----
select TOP 5 pizza_name, SUM(quantity) as TOTAL_PIZZA_SOLD 
from pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_PIZZA_SOLD DESC;

----BOTTOM 5 WORST SELLER BY TOTAL PIZZA SOLD----
select TOP 5 pizza_name , SUM(quantity) as TOTAL_PIZZA_SOLD 
from pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_PIZZA_SOLD;

