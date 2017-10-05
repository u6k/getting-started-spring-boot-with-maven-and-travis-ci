FROM gradle:alpine AS dev

COPY . /var/sample-spring-boot-with-gradle
WORKDIR /var/sample-spring-boot-with-gradle
RUN gradle build

FROM openjdk:8-alpine
LABEL maintainer="u6k.apps@gmail.com"

COPY --from=dev /var/sample-spring-boot-with-gradle/build/libs/sample-spring-boot-with-gradle-0.0.1-SNAPSHOT.jar /opt/sample-spring-boot-with-gradle.jar

ENV APP_DB_PATH /var/sample-spring-boot-with-gradle/db/my-app
VOLUME /var/sample-spring-boot-with-gradle

CMD ["java", "-jar", "/opt/sample-spring-boot-with-gradle.jar"]
