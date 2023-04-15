with person_pizzeria_price as(
select person.name as person_name, pizzeria.name as pizzeria_name, 
	   menu.price, visit_date
from person_visits pv 
join person on pv.person_id = person.id 
join pizzeria on pv.pizzeria_id = pizzeria.id 
join menu on menu.pizzeria_id = pv.pizzeria_id)

select pizzeria_name
from person_pizzeria_price
where person_name = 'Dmitriy' and price < 800 and visit_date = '2022-01-08'