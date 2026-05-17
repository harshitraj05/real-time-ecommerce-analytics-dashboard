-- VIEW ORDEDRS --
select * from orders;


-- TOTAL REVENUE --
select sum(p.price * o.quantity) as total_revenue
from orders o
join products p
on o.product_id = p.product_id;



-- TOP SELLING PRODUCTS --
select p.product_name,
count(*) as total_orders
from orders o
JOIN products p
on o.product_id = p.product_id
group by p.product_name
order by total_orders DESC;



-- TOP CUSTOMERS --
select c.customer_name,
count(o.order_id) as total_orders
from orders o
join customers c
on o.customer_id = c.customer_id
group by c.customer_name
order by total_orders DESC;