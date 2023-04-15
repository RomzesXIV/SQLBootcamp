with gender_pizzeria as(
select gender, pizzeria.name as pizzeria_name
from person_visits pv 
join person on pv.person_id = person.id 
join pizzeria on pv.pizzeria_id = pizzeria.id
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
except all
select pizzeria_name from female),

femail_only as (
select pizzeria_name from female
except all
select pizzeria_name from male)

select pizzeria_name
from mail_only
union all
select pizzeria_name
from femail_only
order by pizzeria_name