SELECT pizzeria.name, pizzeria.rating 
FROM person_visits
RIGHT JOIN pizzeria ON person_visits.pizzeria_id=pizzeria.id
WHERE (person_id IS NULL)