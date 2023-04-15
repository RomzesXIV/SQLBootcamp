insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

create or replace function fn_find_date(in_id bigint, in_date timestamp) 
returns numeric as $$
declare 
	left_int timestamp;
	right_int timestamp;
	result numeric;
begin 
	left_int := (select max(c.updated) 
				from currency c 
				where c.id = in_id and c.updated < in_date );
	right_int := (select min(c.updated) 
				from currency c 
				where c.id = in_id and c.updated > in_date );
	result := (select max(c.rate_to_usd) 
				from currency c 
				where c.updated = coalesce(left_int,right_int));
	return result;
end;
$$ language plpgsql;

select 
    coalesce (u."name", 'not defined') as "name",
    coalesce (u."lastname", 'not defined') as lastname,
    c."name" as currency_name,
    fn_find_date(b.currency_id, b.updated) * b."money" as currency_in_usd
from balance b 
	full join "user" u on u.id = b.user_id 
	full join currency c on c.id = b.currency_id 
where ((c.rate_to_usd = fn_find_date(b.currency_id, b.updated) and 
  c.updated = (select max(c2.updated) 
  				from currency c2 
  				where c2.id = c.id and 
  					c2.rate_to_usd = fn_find_date(b.currency_id, b.updated))))
order by "name" desc, lastname, currency_name;
