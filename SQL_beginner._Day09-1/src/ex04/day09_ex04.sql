create or replace function fnc_persons_male() 
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
  where person.gender = 'male';
$$
language 'sql';

create or replace function fnc_persons_female() 
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
  where person.gender = 'female';
$$
language 'sql';
