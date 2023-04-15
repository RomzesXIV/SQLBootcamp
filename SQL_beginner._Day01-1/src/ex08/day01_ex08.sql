SELECT order_date,
	   CONCAT(person_natural.name,' (', 'age:', person_natural.age,')') AS person_information
FROM person_order 
NATURAL JOIN
    (SELECT id AS person_id, name, age 
     FROM person) AS person_natural
ORDER BY order_date, person_information
