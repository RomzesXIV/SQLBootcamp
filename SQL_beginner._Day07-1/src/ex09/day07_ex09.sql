select address,
	   round(max(age)::numeric - min(age)::numeric/max(age)::numeric, 2) as formula,
	   round((avg(age)::numeric), 2) as average,
	   (select
             case
             when (max(age)::numeric - min(age)::numeric/max(age)::numeric) > avg((age)::numeric)
                 then true
                 else false
             	 end comparison)
from person
group by address
order by address
