drop function fnc_persons_male();
drop function fnc_persons_female();

create or replace function fnc_persons(in pgender varchar default 'female') 
  returns table (
    id int8,
    name varchar,
    age int4,
    gender varchar,
    address varchar
  ) 
as $$
  select *
  from person
  where person.gender = pgender;
$$
language 'sql';