/* SQL Statements 2: Contains procedure and trigger creation 
(or replacement). A procedure, check_jparis_s10, is created 
that invokes a procedure, raise_application_error, if the 
following is not true: All paris projects are supplied by 
a supplier with status 10. Triggers are created, which are 
used to invoke check_jparis_s10 in order to enforce the 
aforementioned constraint. */

set echo on
set serveroutput on

/* Procedure create or replace for check_jparis_s10 which 
invokes the procedure raise_application_error if
!(All Paris projects are supplied by a suppler with 
status 10) */

create or replace
procedure check_jparis_s10 as
x integer; y integer;
begin
	select count(distinct s.s#) into x from spj, j, s
	where j.city = 'Paris'
		and s.status = 10
		and spj.s# = s.s#
		and spj.j# = j.j#;
		
	select count(*) into y from j 
		where city ='Paris';
	
	if x < y then
		raise_application_error(-20001, 'Not all Paris projects have status of 10.');
	end if;
end;
/

/* Triggers created or replaced, that invoke 
check_jparis_s10 to enforce the constraint
mentioned above. */

create or replace trigger jparis_s10_s
       after update of status on s
       begin
          check_jparis_s10();
       end;
     /

create or replace trigger jparis_s10_j
       after insert or update of city on j
       begin
          check_jparis_s10();
       end;
     /

create or replace trigger jparis_s10_spj
       after delete or update on spj
       begin
          check_jparis_s10();
       end;
     /

/* Tests for each of the above triggers. */

update s set status='20' where s# = 'S2';
insert into j values ('J8', 'Ruler','New York');
delete from spj where s#='S2';

/* Dropping of the above triggers and procedure. */

drop trigger jparis_s10_s;
drop trigger jparis_s10_j;
drop trigger jparis_s10_spj;
drop procedure check_jparis_s10;

/* Generates a link back to main menu */

set markup html entmap off
set feedback off
set echo off
declare
  url varchar(100) :=
    '"/sql-system-html-interface.html"';
begin
  dbms_output.put_line('    <p>');
  dbms_output.put_line('      <a href='||url||'>');
  dbms_output.put_line('        Return to menu');
  dbms_output.put_line('      </a>');
  dbms_output.put_line('    </p>');
end;
/


