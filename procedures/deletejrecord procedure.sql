create or replace
procedure deletej(jnum j.j#%type) as

n integer;

url1 varchar(100) :=
'/jFunctions.html';

url2 varchar(100) :=
'/sql-system-html-interface.html';


begin
	htp.htmlopen;
		htp.headopen;
		
		select count(*) into n from j where j# = jnum;
		if n = 0 then
			htp.title('Error!');
			htp.headclose;
			htp.bodyopen;
				htp.header(1,'Error: Record requested could not be found; deletion terminated.');
			
		else
			delete from j where j#=jnum;
			commit;
			htp.title('Success!');
			htp.headclose;
			htp.bodyopen;
				htp.header(1, 'Delete completed');
		end if;
		
		htp.paragraph;
		htp.anchor(url1,'Return to J Table Functions menu');
		
		htp.paragraph;
		htp.anchor(url2,'Return to main menu');
		
		htp.bodyclose;
	htp.htmlclose;
end;
/
