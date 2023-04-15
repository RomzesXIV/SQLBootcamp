select distinct name
from person_order po 
join person on po.person_id = person.id  
order by name