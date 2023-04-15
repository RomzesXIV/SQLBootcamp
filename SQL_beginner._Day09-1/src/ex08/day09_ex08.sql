create function fnc_fibonacci (in pstop integer default 10) 
returns table (number integer) 
as $$
with recursive fibonacci (number_1, number_2)
  as (
    select 0, 1
    union all
    select number_2, number_1 + number_2
    from fibonacci
    where number_2 < pstop
    )
    select number_1 from fibonacci;
$$
language 'sql';
