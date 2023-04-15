SELECT 
   CASE 
    WHEN person.name IS NULL THEN '-'
    ELSE person.name
   END person_name,
   date.visit_date, 
      CASE 
    WHEN pizzeria.name IS NULL THEN '-'
    ELSE pizzeria.name
   END pizzeria_name
FROM (SELECT *
    FROM person_visits
    WHERE person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS date
FULL JOIN person ON person.id = date.person_id
FULL JOIN pizzeria ON pizzeria.id = date.pizzeria_id 
ORDER BY person_name, visit_date, pizzeria_name;
