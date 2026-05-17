----------------- Queries ---------------------

#1. TOTAL NUMBER OF ORDERS
select count(*) as total_orders
from orders;

#2. TOTAL ITEMS SOLD
select sum(quantity) as total_items_sold
from orders;

#3. REVENUE BY PRODUCT
select p.product_name,sum(p.price * o.quantity) as revenue
from orders o
join products p
on o.product_id	= p.product_id
group by p.product_name
order by revenue desc;

#4. CATEGORY-WISE SALES
select p.category, sum(o.quantity) as total_items_sold
from orders o
join products p 
on o.product_id = p.product_id
group by p.category;

#5. MOST RECENT ORDERS
select * from orders
order by order_date desc
limit 10;

#6. CUSTOMER SPENDING ANALYSIS
select c.customer_name,
sum(p.price* o.quantity) as total_spent
from orders o 
join customers c
on o.customer_id = c.customer_id
join product p 
on o.product_id = p.product_id
group by c.customer_name
order by total_spent desc;

#7. AVERAGE ORDER VALUE
select avg(order_total) as average_order_value
from(
      select o.order_id, sum(p.price * o.quantity) as order_total
      from orders o
      join products p 
      on o.product_id = p.product_id
      group by o.order_id
	) as order_summary;

#8. NUMBER OF ORDERS PER CUSTOMER
select c.customer_name, count(o.order_id) as orde_count
from customer c 
left join orders o 
on c.customer_id = o.customer_id
group by c.customer_name
order by order_count desc;

#9. PRODUCTS NEVER ORDERED
select p.product_name
from products p 
left join orders o 
on p.product_id = o.product_id
where o.order_id is null;

#10. ORDERS PER HOUR
select hour(order_date) as order_hour,
count(*) as total_orders
from orders
group by hour(order_date)
order by order_hour;










	