select address,
	   pizzeria.name as name,
	   count(menu.pizzeria_id) as count_of_orders
from person_order po 
join person p on po.person_id = p.id 
join menu on po.menu_id = menu.id  
join pizzeria on menu.pizzeria_id  = pizzeria.id

group by address, pizzeria.name
order by address, pizzeria.name