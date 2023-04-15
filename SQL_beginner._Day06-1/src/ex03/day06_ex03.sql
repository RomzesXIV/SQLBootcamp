create unique index idx_person_discounts_unique 
on person_discounts(person_id, pizzeria_id);

set enable_seqscan = off;

explain analyse
SELECT *
FROM person_discounts
WHERE person_id = 1 AND pizzeria_id = 1;