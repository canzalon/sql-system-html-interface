/* SQL Statements 3: A view is created, jheavy, which defines
itself as the set of project records (j#, jname, city) for 
projects that are supplied with parts having weight > 14. 
Duplicates are omitted. */

set echo on
set serveroutput on

/* Create or replace view, jheavy, which defines jheavy
as the set of project records for projects which are 
supplied with parts having weight > 14. Duplicates 
are omitted. */

create or replace view jheavy as
select distinct J.* from J,SPJ,P
		where P.weight > 14 and
		J.J# = SPJ.J# and
		P.P# = SPJ.P#;
/

/* Create or replace instead of trigger, jheavyd, meant 
to complement the above view, jheavy. It deletes the
related SPJ records to the project records deleted from
the view, jheavy. */

create or replace trigger jheavyd 
    instead of delete on jheavy
		for each row
    	begin
			delete from SPJ where J#=:old.J# and
			P# in (select P# from p where weight > 14);
end;
/

/* Test for the above instead of (delete) trigger. 
Prints jheavy, j, and SPJ. Then deletes the jheavy 
record for J4. Then prints the aforementioned again.
Note that J4 is associated with four parts in the 
SPJ table that have weight > 14. */

select * from jheavy;
select * from j;
Select * from spj;
delete from jheavy where jheavy.J# = 'J4';
select * from jheavy;
Select * from j;
select * from spj;

/* End transaction and rollback the earlier changes.
Drop the view and trigger. */

rollback;
drop trigger jheavyd;
drop view jheavy;

/* Generates a link back to main menu.  */

set markup html entmap off
set feedback off
set echo off
declare
	url varchar(100) :=
		'"/sql-system-html-interface.html"';
begin
	dbms_output.put_line('	<p>');
	dbms_output.put_line('		<a href='||url||'>');
	dbms_output.put_line('			Return to menu');
	dbms_output.put_line('		</a>');
	dbms_output.put_line('	</p>');
end;
/


