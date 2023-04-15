create unique index idx_menu_unique on menu(pizzeria_id, pizza_name);

set enable_seqscan = off;

explain analyse
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizzeria_id = 1 AND pizza_name = 'cheese pizza';