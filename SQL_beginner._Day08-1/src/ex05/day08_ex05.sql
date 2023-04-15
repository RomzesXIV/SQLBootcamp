--Session #1
begin transaction isolation level read committed;
--Session #2
begin transaction isolation level read committed;
--Session #1
select sum(rating) from pizzeria;
--Session #2
update pizzeria set rating = 1 where name = 'Pizza Hut';
--Session #2
commit;
--Session #1
select sum(rating) from pizzeria;
--Session #1
commit;
--Session #1
select sum(rating) from pizzeria;
--Session #2
select sum(rating) from pizzeria;
