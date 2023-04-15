with find as(
select pizza_name, price, pizzeria.name as pizzeria_name
from menu  
join pizzeria on menu.pizzeria_id  = pizzeria.id
order by pizza_name)

select
	p1.pizza_name as pizza_name,
	p1.pizzeria_name as pizzeria_name_1,
	p2.pizzeria_name as pizzeria_name_2,
	p1.price as price
from find as p1, find as p2
where p1.pizza_name = p2.pizza_name
	and p1.pizzeria_name != p2.pizzeria_name 
	and p1.price = p2.price
	and p1.pizzeria_name > p2.pizzeria_name
order by pizza_name