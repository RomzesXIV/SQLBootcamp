with base as (
	select person.name as name,
               menu.pizza_name as pizza_name,
               price,
               pizzeria.name as pizzeria_name,
               person.id as person_id, 
               pizzeria.id as pizzeria_id
	from person_order
        join menu on menu.id = person_order.menu_id
        join person on person.id = person_order.person_id
        join pizzeria on pizzeria.id = menu.pizzeria_id)
select name, 
       pizza_name, 
       price, 
       (price - price * (person_discounts.discount / 100)) as discount_price,
       pizzeria_name
from base
join person_discounts on person_discounts.person_id = base.person_id
	   	     and person_discounts.pizzeria_id = base.pizzeria_id
order by name, pizza_name;

/*
select p2.name,
       m.pizza_name,
       m.price,
       (m.price * (100 - pd.discount) / 100) as discount_price,
       p.name
from person_order po 
join menu m on m.id = po.menu_id 
join pizzeria p on p.id = m.pizzeria_id 
left join person_discounts pd on (pd.person_id = po.person_id and pd.pizzeria_id = p.id)
join person p2 on p2.id = po.person_id 
order by 1, 2
*/
