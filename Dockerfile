FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
# Maven Central rate-limits shared CI IPs (HTTP 429); use Google's mirror and retry.
COPY maven-settings.xml /root/.m2/settings.xml
ENV MAVEN_OPTS="-Dmaven.wagon.http.retryHandler.count=5 -Dmaven.wagon.http.retryHandler.requestSentEnabled=true"
COPY pom.xml .
COPY src ./src
RUN mvn -B -q package -DskipTests

FROM eclipse-temurin:21-jre
WORKDIR /app
RUN useradd --system --no-create-home app
COPY --from=build /app/target/*.jar app.jar
USER app
EXPOSE 8080
ENTRYPOINT ["java", "-XX:MaxRAMPercentage=75", "-jar", "app.jar"]
