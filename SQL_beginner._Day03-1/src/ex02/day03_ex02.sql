with baza as (
select id as menu_id
from menu
except
select po.menu_id 
from person_order po 
order by menu_id)

select pizza_name, price, pizzeria.name as pizzeria_name
from baza
join menu on menu.id  = baza.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
order by pizza_name, price