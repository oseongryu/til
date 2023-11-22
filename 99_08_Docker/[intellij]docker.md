# 1. Dockerfile using

## Dockerfile
```bash
FROM openjdk:11-jdk

LABEL maintainer="maintainer"
VOLUME /tmp
EXPOSE 8089 5005
ARG JAR_FILE=drawing-app/build/libs/drawing-app.war
ADD ${JAR_FILE} drawing-app.war
# 실행 명령
ENTRYPOINT ["java","-Djava.security.egd", "-Xdebug","-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005","-jar","/drawing-app.war"]
```

## Dockerfile (tomcat, maven)
```
FROM tomcat:9.0
LABEL maintainer="maintainer"
ARG JAR_FILE=target/hyInterface-1.0.0.war
ADD ${JAR_FILE} interface-app.war
EXPOSE 8080
#ENTRYPOINT ["./bin/catalina.sh", "run"]
```

## build
```bash
docker build --tag war-app .
```

### references
https://ysjee141.github.io/blog/dev%20tools/intellij-springboot-docker/
