create function func_minimum (variadic arr numeric[]) 
returns numeric as $$
select min($1[i]) from generate_subscripts($1, 1) g(i);
$$
language 'sql';