SQL*Plus: Release 12.1.0.1.0 Production Copyright (c) 1982, 2013, Oracle. All rights reserved. Use SQL*Plus to execute SQL, PL/SQL and SQL*Plus statements. 
Usage 1: sqlplus -H | -V 

-H	Displays the SQL*Plus version and the 
usage help. 
-V	Displays the SQL*Plus version. 

Usage 2: sqlplus [ [<option>] [{logon | /nolog}] [<start>] ] 

<option> is: [-C <version>] [-L] [-M "<options>"] [-NOLOGINTIME] [-R <level>] 
[-S] 
-C <version>	Sets the compatibility of affected commands to the 
version specified by <version>. The version has 
the form "x.y[.z]". For example, -C 10.2.0 
-L	Attempts to log on just once, instead of 
reprompting on error. 
-M "<options>" Sets automatic HTML markup of output. The options 
have the form: 
HTML [ON|OFF] [HEAD text] [BODY text] [TABLE text] 
[ENTMAP {ON|OFF}] [SPOOL {ON|OFF}] [PRE[FORMAT] {ON|OFF}] 
-NOLOGINTIME Don't display Last Successful Login Time. 
-R <level>	Sets restricted mode to disable SQL*Plus commands 
that interact with the file system.	The level can 
be 1, 2 or 3. The most restrictive is -R 3 which 
disables all user commands interacting with the 
file system. 
-S	Sets silent mode which suppresses the display of 
the SQL*Plus banner, prompts, and echoing of 
commands. 

<logon> is: {<username>[/<password>][@<connect_identifier>] | / } 
[AS {SYSDBA | SYSOPER | SYSASM | SYSBACKUP | SYSDG | SYSKM}] [EDITION=value] 

Specifies the database account username, password and connect 
identifier for the database connection. Without a connect 
identifier, SQL*Plus connects to the default database. 
The AS SYSDBA, AS SYSOPER, AS SYSASM, AS SYSBACKUP, AS SYSDG, 
and AS SYSKM options are database administration privileges. 
<connect_identifier> can be in the form of Net Service Name 
or Easy Connect. 
@[<net_service_name> | [//]Host[:Port]/<service_name>] 
<net_service_name> is a simple name for a service that resolves 
to a connect descriptor. 
Example: Connect to database using Net Service Name and the 
database net service name is ORCL. 
sqlplus myusername/mypassword@ORCL 
Host specifies the host name or IP address of the database 
server computer. 
Port specifies the listening port on the database server. 
<service_name> specifies the service name of the database you 
want to access. 
Example: Connect to database using Easy Connect and the 
Service name is ORCL. 
sqlplus myusername/mypassword@Host/ORCL 
The /NOLOG option starts SQL*Plus without connecting to a 
database. The EDITION specifies the value for Session Edition. 

<start> is: @<URL>|<filename>[.<ext>] [<parameter> ...] 
Runs the specified SQL*Plus script from a web server (URL) or the 
local file system (filename.ext) with specified parameters that 
will be assigned to substitution variables in the script. 

When SQL*Plus starts, and after CONNECT commands, the site profile 
(e.g. $ORACLE_HOME/sqlplus/admin/glogin.sql) and the user profile 
(e.g. login.sql in the working directory) are run. The files may 
contain SQL*Plus commands. 
Refer to the SQL*Plus User's Guide and Reference for more information. 