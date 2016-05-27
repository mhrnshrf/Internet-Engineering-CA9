if [ -z "$CATALINA_HOME" ]; then
    echo "The environment variable CATALINA_HOME must be set to the root of the Tomcat installation directory"
    exit 1
fi  

rm -rf target
mkdir target
mkdir target/WEB-INF
mkdir target/WEB-INF/classes
mkdir target/admin
mkdir target/WEB-INF/lib

javac -sourcepath src -classpath $CATALINA_HOME/lib/servlet-api.jar:./lib/hsqldb.jar:./lib/standard.jar:./lib/jstl.jar  -d target/WEB-INF/classes src/far/*.java

cp conf/web.xml target/WEB-INF
cp conf/server.xml $CATALINA_HOME/conf
cp pages/* target/
cp adminpages/* target/admin
cp lib/*.jar target/WEB-INF/lib
