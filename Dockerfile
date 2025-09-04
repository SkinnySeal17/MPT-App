# Multi-stage build for React + Spring Boot

# Stage 1: Build React frontend
FROM node:18-alpine AS frontend-build
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# Stage 2: Build Spring Boot backend with React files included
FROM maven:3.9-eclipse-temurin-21 AS backend-build
WORKDIR /app
# Copy the React build files first
COPY --from=frontend-build /app/frontend/build ./frontend/build
# Copy Spring Boot source
COPY clean-spring-boot/pom.xml ./clean-spring-boot/
COPY clean-spring-boot/src ./clean-spring-boot/src
# Build the JAR (Maven will copy React files into the JAR)
WORKDIR /app/clean-spring-boot
RUN mvn -DskipTests clean package

# Stage 3: Runtime image
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy the built Spring Boot jar (includes React files)
COPY --from=backend-build /app/clean-spring-boot/target/*SNAPSHOT.jar app.jar

# Expose port
EXPOSE 8080

# Start Spring Boot
CMD ["sh", "-c", "java -Dserver.port=$PORT -jar /app/app.jar"]
