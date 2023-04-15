with gender_pizzeria as(
select gender, pizzeria.name as pizzeria_name
from person_order po  
join person on po.person_id = person.id 
join menu on po.menu_id = menu.id 
join pizzeria on menu.pizzeria_id  = pizzeria.id
order by pizzeria_name),

male as(
select pizzeria_name
from gender_pizzeria 
where gender = 'male'),

female as (
select pizzeria_name
from gender_pizzeria 
where gender = 'female'),

mail_only as (
select pizzeria_name from male
except
select pizzeria_name from female),

femail_only as (
select pizzeria_name from female
except
select pizzeria_name from male)

select pizzeria_name
from mail_only
union
select pizzeria_name
from femail_only
order by pizzeria_name


