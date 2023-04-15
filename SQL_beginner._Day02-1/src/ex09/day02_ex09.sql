with pizza as(
select name, pizza_name, gender
from person_order po
join person on po.person_id = person.id 
join menu on po.menu_id = menu.id)

select name
from pizza 
where gender = 'female' and pizza_name = 'cheese pizza'
intersect 
select name
from pizza 
where gender = 'female' and pizza_name = 'pepperoni pizza'
order by name