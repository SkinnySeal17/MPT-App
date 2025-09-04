# --- Build the Spring Boot jar ---
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src src
RUN mvn -DskipTests clean package

# --- Runtime image ---
FROM eclipse-temurin:21-jre
WORKDIR /app
# Copy the built jar (use wildcard to match your SNAPSHOT name)
COPY --from=build /app/target/*SNAPSHOT.jar app.jar
# Render provides $PORT; make Spring Boot listen on it
CMD ["sh", "-c", "java -Dserver.port=$PORT -jar /app/app.jar"]
