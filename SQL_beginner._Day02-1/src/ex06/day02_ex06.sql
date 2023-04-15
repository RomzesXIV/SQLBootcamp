with Who_Let_The_Dogs_Out as(
select person.name as person_name, menu.pizza_name as pizza_name, pizzeria.name as pizzeria_name
from person_order po
join person on po.person_id = person.id 
join menu on po.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id 
order by 2, 3)

select pizza_name, pizzeria_name
from Who_Let_The_Dogs_Out
where person_name = 'Denis' or person_name = 'Anna'