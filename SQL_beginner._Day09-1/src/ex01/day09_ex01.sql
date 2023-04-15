create or replace function fnc_trg_person_update_audit() returns trigger as $person_audit$
    begin
        if (TG_OP = 'UPDATE') then
            insert into person_audit 
            select now(), 'U', new.*;
            return new;
        end if;
        return null;
    end;
$person_audit$ language plpgsql;

create trigger trg_person_update_audit
after update on person
    for each row execute procedure fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10;