create index idx_person_name on person(upper(name));

set enable_seqscan = off;

explain analyse
select name 
from person
where upper(name) = 'Kate';