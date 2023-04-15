select pizza.pizza_name, pizzeria.name as pizzeria_name, pizza.price
from (select * 
	  from menu
	  where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza') as pizza
full join pizzeria on pizza.pizzeria_id = pizzeria.id
where pizza.pizza_name is not null
order by pizza_name, pizzeria_name