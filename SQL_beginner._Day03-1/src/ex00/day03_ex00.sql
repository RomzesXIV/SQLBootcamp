with pizza_pizzeria_price as(
select menu.pizza_name, pizzeria.name as pizzeria_name, 
	   menu.price as price, visit_date, person.name as person_name
from person_visits pv 
join person on pv.person_id = person.id 
join pizzeria on pv.pizzeria_id = pizzeria.id 
join menu on menu.pizzeria_id = pv.pizzeria_id
order by pizza_name,price, pizzeria_name)

select pizza_name, price, pizzeria_name, visit_date
from pizza_pizzeria_price
where person_name = 'Kate' and price between 800 and 1000
