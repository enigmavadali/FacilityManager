FROM maven:3.9.6-amazoncorretto-17-al2023 AS MAVEN_BUILD

COPY ./ ./

RUN mvn clean package -DskipTests

FROM openjdk:23-jdk-slim

WORKDIR /app

COPY --from=MAVEN_BUILD /target/FacilityManager.jar /app/FacilityManager.jar

# COPY ./docker/application-env.properties /app/application-env.properties
#
# CMD ["java", "-jar", "FacilityManager.jar", "--spring.config.import=optional:file:/app/application-env.properties"]

CMD ["java", "-jar", "FacilityManager.jar"]