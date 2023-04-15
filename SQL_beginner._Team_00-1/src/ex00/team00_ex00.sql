create table points (
  point1 varchar(1), point2 varchar(1), cost int);
insert into points (point1, point2, cost)
values 
  ('a', 'b', 10),
  ('a', 'c', 15),
  ('a', 'd', 20),
  ('b', 'd', 25),
  ('b', 'c', 35),
  ('d', 'c', 30),
  ('b', 'a', 10),
  ('c', 'a', 15),
  ('d', 'a', 20),
  ('d', 'b', 25),
  ('c', 'b', 35),
  ('c', 'd', 30);




with recursive main as (
	select point2,
	       concat(point1, ' , ', point2, ', ') as path,
	       1 as step,
	       cost,
	       cost as distance_final
	from points where point1 = 'a'
	union all 
	select slave.point2,
	       concat (main.path, slave.point2, ', ') as path,
	       main.step + 1 as step,
	       slave.cost + main.cost as cost,
	       case 
	       	when slave.point2 = 'b' then slave.cost + main.cost + 10
	       	when slave.point2 = 'd' then slave.cost + main.cost + 20
	       	else slave.cost + main.cost + 15
	       end final_cost
	       
	from main 
	join points slave on main.point2 = slave.point1
	where  path NOT LIKE '%' || slave.point2 || '%'
	)
	select main.distance_final as total_cost,
		   concat('{', main.path, 'a}') as tour
    from main
    where step = 3 and main.distance_final = (select min(main.distance_final) from main where step = 3)