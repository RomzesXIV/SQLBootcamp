create or replace function fnc_person_visits_and_eats_on_date (
	in pperson varchar default 'Dmitriy',
	in pprice numeric default 500,
	in pdate date default '2022-01-08') 
returns table (name varchar) as $$
begin
	return query select distinct p2.name as pizzeria_name
	from person_order po 
	join person p on po.person_id = p.id 
	join menu m on po.menu_id  = m.id  
	join pizzeria p2 on m.pizzeria_id = p2.id 
	where p.name  = pperson and m.price < pprice and order_date = pdate;
end;
$$
language plpgsql;
