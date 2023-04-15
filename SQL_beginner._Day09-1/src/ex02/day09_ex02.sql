create or replace function fnc_trg_person_delete_audit() returns trigger as $person_audit$
    begin
        if (TG_OP = 'DELETE') then
            insert into person_audit 
            select now(), 'D', old.*;
            return old;
        end if;
        return null;
    end;
$person_audit$ language plpgsql;

create trigger trg_person_delete_audit
after delete on person
    for each row execute procedure fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;