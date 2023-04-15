SELECT person_visits.visit_date AS missing_date
FROM person_visits
LEFT JOIN (SELECT *
	  FROM person_visits
	  WHERE person_id BETWEEN 1 AND 2 
	  AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') AS vizit
ON vizit.visit_date = person_visits.visit_date 
WHERE vizit.person_id IS NULL
GROUP BY missing_date
ORDER BY missing_date