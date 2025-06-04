FROM tomcat:10.1-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY build/libs/Bookstore-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

RUN sed -i "s/8080/${PORT}/g" /usr/local/tomcat/conf/server.xml

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
