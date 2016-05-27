1) Install HSQL (hsqldb.org)
2) Start HSQL Server
	cd db
	java -cp ../lib/hsqldb.jar org.hsqldb.server.Server
3) Start HSQL Database Manager
	java -cp hsqldb.jar org.hsqldb.util.DatabaseManagerSwing
4) Connect to the server
	Set 'type' to 'HSQL Database Engine Server'
5) Create the tables
	Open init-db.sql and execute SQL commands
6) Compile Test program
	javac Test.java
7) Run Test program
	java -cp .:hsqldb.jar Test

