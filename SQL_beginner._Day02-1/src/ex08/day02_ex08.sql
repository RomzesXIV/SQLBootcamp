with Who_Let_The_Dogs_Out as(
select person.name, menu.pizza_name, 
	   person.gender, person.address
from person_order po
join person on po.person_id = person.id 
join menu on po.menu_id = menu.id)

select name
from Who_Let_The_Dogs_Out
where gender = 'male' and (address = 'Moscow' or address = 'Samara') and 
	(pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza')
order by name DESC