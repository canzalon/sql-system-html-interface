create or replace 
PROCEDURE printjtable  AS 
 url varchar(100) :=
'"/sql-system-html-interface.html"'; 
 url2 varchar(100) :=
'"/jFunctions.html"'; 
 BEGIN NULL;
htp.prn('
');
htp.prn('
');
htp.prn('
');
htp.prn('
<html>
	<head>
		<title> PRINT JOB TABLE </title>
	</head>
	
	<body>
		<h1> JOB TABLE </h1>
		<table border="1">
			<tr>
				<th> JNUM </th>
				<th> JNAME </th>
				<th> CITY </th>
			</tr>
			');

				for i in (select * from j)
				loop
			
htp.prn('
				<tr>
				     <td> ');
htp.prn(i.j#);
htp.prn(' </td>
				     <td> ');
htp.prn(i.jname);
htp.prn(' </td>
				     <td> ');
htp.prn(i.city);
htp.prn(' </td>
				</tr>
			');

				end loop;
			
htp.prn('
		</table>
		<p>
			<a href=');
htp.prn(url2);
htp.prn('>
			Click here to return to J Table Functions menu.
			</a>
		</p>
		
		<p>
			<a href=');
htp.prn(url);
htp.prn('>
			Click here to return to Main Menu.
			</a>
		</p>
	</body>
</html>
');
 END;
