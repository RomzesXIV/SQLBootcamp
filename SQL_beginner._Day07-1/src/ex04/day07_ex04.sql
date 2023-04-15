select name, count(person_id) as count_of_visits
from person_visits
join person on person_visits.person_id = person.id 
group by name  
having count(person_id) > 3
order by count_of_visits desc