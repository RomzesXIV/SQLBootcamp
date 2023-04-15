with person_ord as(
select pizzeria.name as pizzeria_name
from person_order po  
join person on po.person_id = person.id 
join menu on po.menu_id = menu.id 
join pizzeria on menu.pizzeria_id  = pizzeria.id
where person.name = 'Andrey'),

person_vis as(
select pizzeria.name as pizzeria_name
from person_visits pv 
join person on pv.person_id = person.id
join pizzeria on pv.pizzeria_id = pizzeria.id 
where person.name = 'Andrey')

select pizzeria_name
from person_vis
except
select pizzeria_name
from person_ord
order by pizzeria_name