/* SQL Statements 1: Includes alter table statements that implement 
enforcement of particular constraints with check clauses. */

set echo on
set serveroutput on

/* Alter table statement that implements the enforcement 
of the following constraint with a check clause: No part can 
have a pname that is equal to its color. 

An update statement then attempts to violate the constraint.

Finally, an alter table statement drops the constraint.*/

alter table p add constraint p_pname_color
	check (pname <> color);
	
update p set pname='Blue' where pname='Cam';

alter table p drop constraint p_pname_color;

/* Alter table statement that implements the enforcement
of the following constraint with a check clause: Every Paris 
project must be supplied by some supplier with status 10.
Note: this query doesn't work in Oracle. */

alter table j add constraint j_status_Paris
	check 
		(
			(select count(distinct spj.j#) from spj, j, s
				where s.status = '10'
                and j.city = 'Paris'
                and spj.j# = j.j# 
                and spj.s# = s.s#) = 
            (select count(*) from j where city='Paris')
		);


/* Select statement which prints "Yes" if the constraint
from the above query (previous) has been satisfied by the
database. */

select 'Yes' ans from dual
	where
		(select count(distinct s.s#) from spj, s, j where 
				j.city='Paris'and s.status=10 and spj.s#=s.s# 
				and spj.j#=j.j#)
							=
		(select count(*) from j where city='Paris');


/* Select statement which prints the p#s and average qtys of 
parts that are supplied, if their average qty is greater than
the average qty of supplied red parts. */

select p# , avg(qty) from spj
	group by p#
		having avg(qty) > ( select avg(qty) from spj where p# in 
							 (select p# from p where color ='Red') );

set markup html entmap off
set echo off

/* Generates a link back to main menu */

declare url varchar(100) :=
	'"/sql-system-html-interface.html"';

begin
	dbms_output.put_line(' <p>');
	dbms_output.put_line(' <a href='||url||'>');
	dbms_output.put_line(' Return to main menu');
	dbms_output.put_line(' </a>');
	dbms_output.put_line(' </p>');
end;
/

