
net stop "Apache Tomcat 7.0 Tomcat7"

del C:\dev\servers\apache-tomcat-7.0.23_win\webapps\JaluxxWeb.war
del "C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\JaluxxWeb.war"

rmdir /S /q C:\dev\servers\apache-tomcat-7.0.23_win\webapps\JaluxxWeb
rmdir /S /q "C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\JaluxxWeb"

copy target\JaluxxWeb.war C:\dev\servers\apache-tomcat-7.0.23_win\webapps\
copy target\JaluxxWeb.war "C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\"
rem copy H:\dev\FluxxWeb\target\FluxxWeb.war "C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\"

net start "Apache Tomcat 7.0 Tomcat7"
