create table person_audit(
	created timestamp with time zone default now() not null,
	type_event char(1) default 'I' not null,
	row_id int8 not null,
	name varchar not null,
	age int4 not null,
	gender varchar not null,
	address varchar null
);
create or replace function fnc_trg_person_insert_audit() returns trigger as $person_audit$
    begin
        if (TG_OP = 'INSERT') then
            insert into person_audit 
            select now(), 'I', new.*;
            return new;
        end if;
        return null;
    end;
$person_audit$ language plpgsql;

create trigger trg_person_insert_audit
after insert on person
    for each row execute procedure fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address) 
values (10,'Damir', 22, 'male', 'Irkutsk');