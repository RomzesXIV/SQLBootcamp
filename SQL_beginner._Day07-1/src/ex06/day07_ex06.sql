select pizzeria.name,
       count(menu.pizzeria_id) as count_of_orders,
       round(avg(price), 2) as average_price,
       max(price) as max_price,
       min(price) as min_price
from person_order po 
join menu on po.menu_id = menu.id  
join pizzeria on menu.pizzeria_id  = pizzeria.id
group by pizzeria.name
order by pizzeria.name
