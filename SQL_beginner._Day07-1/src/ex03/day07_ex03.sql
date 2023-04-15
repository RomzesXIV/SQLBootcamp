with visits as (
	select name, count(pizzeria_id)
	from person_visits
	join pizzeria on person_visits.pizzeria_id  = pizzeria.id 
	group by name  
	order by count desc
),
	orders as (
	select name, count(pizzeria_id)
	from person_order
	join menu on person_order.menu_id  = menu.id 
	join pizzeria on menu.pizzeria_id  = pizzeria.id 
	group by name 
	order by count desc
)
select orders.name,
    orders.count + visits.count as total_count
from orders
join visits on orders.name = visits.name
order by total_count desc, orders.name

/*
with pizzeria_visits as 
(select p."name", count(pv.pizzeria_id) as "count", 'visit' as action_type
from pizzeria p join person_visits pv 
  on p.id = pv.pizzeria_id 
group by p."name" 
order by "count" desc 
),
pizzeria_orders as
(select p."name" as "name", count(po.id) as "count", 'order' as action_type
from pizzeria p join menu m 
  on p.id = m.pizzeria_id 
  join person_order po 
  on m.id = po.menu_id 
group by p."name" 
order by "count" desc 
)
select p2."name", coalesce(pvc.count + poc.count, pvc.count, poc.count, 0) as total_count
from pizzeria p2 full join pizzeria_visits pvc 
  on p2."name" = pvc."name"
  full join pizzeria_orders poc
  on p2."name" = poc."name"
order by total_count desc, p2."name" asc;
*/
