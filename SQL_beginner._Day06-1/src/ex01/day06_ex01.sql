insert into person_discounts (id, person_id, pizzeria_id, discount)
SELECT row_number() over () as id, 
		person_id, 
		pizzeria_id,
		(case
		when count(person_id) = 1 then 10.5
        	when count(person_id) = 2 then 22
        	else 30
        	end)
from person_order
join menu on person_order.menu_id = menu.id 
group by person_id, pizzeria_id
order by person_id
