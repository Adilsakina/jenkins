FROM maven AS run
WORKDIR /app
COPY jenkins /app/jenkins
WORKDIR /app/jenkins
RUN mvn clean package

FROM tomcat
COPY --from=run app/jenkins/target/jenkins.war /usr/local/tomcat/webapps/
ENTRYPOINT ["catalina.sh", "run"]
