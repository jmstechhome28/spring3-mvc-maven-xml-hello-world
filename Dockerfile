FROM tomcat:8.0.20-jre8
COPY target/spring3-mvc-maven-xml-hello-world-1.4.war  /usr/local/tomcat/webapps/spring3.war
