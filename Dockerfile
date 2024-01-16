FROM maven:3.9.6-amazoncorretto-17-al2023 AS MAVEN_BUILD

COPY ./ ./

RUN mvn clean package

FROM openjdk:23-jdk-slim

WORKDIR /app

COPY --from=MAVEN_BUILD /target/FacilityManager.jar /app/FacilityManager.jar

CMD ["java", "-jar", "FacilityManager.jar"]