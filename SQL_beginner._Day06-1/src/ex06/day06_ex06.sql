create sequence seq_person_discounts start with 1;
alter table person_discounts alter column id set default nextval('seq_person_discounts');
select setval('seq_person_discounts', (select max(id) from person_discounts) + 1, false);

/*
create sequence seq_person_discounts start 1;
        alter table person_discounts alter column id set default nextval('seq_person_discounts');
        select setval('seq_person_discounts', (select count(*)+1 from person_discounts));

*/
