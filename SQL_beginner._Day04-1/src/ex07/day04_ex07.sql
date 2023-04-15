insert into person_visits (id, person_id, pizzeria_id, visit_date)
values (
	(select MAX(id) + 1 from person_visits),
	(select id from person where name = 'Dmitriy'),
  	(select id from pizzeria where name = 'Best Pizza'), 
  	 '2022-01-08'
);
refresh materialized view mv_dmitriy_visits_and_eats;

/*
insert into person_visits (id, person_id, pizzeria_id, visit_date)

values (

(select MAX(id) + 1 from person_visits),

(select id from person where name = 'Dmitriy'),

(select pizzeria_id

from menu

join pizzeria p on p.id = menu.pizzeria_id

where p.name not like 'Papa Johns' and menu.price < 800 limit 1),

'2022-01-08');

refresh materialized view mv_dmitriy_visits_and_eats;

*/
