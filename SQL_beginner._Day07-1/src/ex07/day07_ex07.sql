select round(sum(rating)/count(id), 4) as global_rating
from pizzeria 