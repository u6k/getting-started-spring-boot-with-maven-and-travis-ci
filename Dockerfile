FROM openjdk:8-alpine AS dev

COPY . /var/my-app
WORKDIR /var/my-app
RUN chmod +x mvnw && \
    ./mvnw clean package

FROM openjdk:8-alpine
LABEL maintainer="u6k.apps@gmail.com"

COPY --from=dev /var/my-app/target/my-app.jar /opt/my-app.jar

ENV APP_DB_PATH /var/my-app/db/my-app
EXPOSE 8080

CMD ["java", "-jar", "/opt/my-app.jar"]
