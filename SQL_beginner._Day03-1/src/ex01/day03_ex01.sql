select id as menu_id
from menu
except
select po.menu_id 
from person_order po 
order by menu_id
