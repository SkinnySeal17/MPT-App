# Multi-stage build for React + Spring Boot

# Stage 1: Build React frontend
FROM node:18-alpine AS frontend-build
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# Stage 2: Build Spring Boot backend
FROM maven:3.9-eclipse-temurin-21 AS backend-build
WORKDIR /app/backend
COPY clean-spring-boot/pom.xml .
COPY clean-spring-boot/src src
RUN mvn -DskipTests clean package

# Stage 3: Runtime image
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy the built Spring Boot jar
COPY --from=backend-build /app/backend/target/*SNAPSHOT.jar app.jar

# Copy the React build files
COPY --from=frontend-build /app/frontend/build static/

# Expose port
EXPOSE 8080

# Start Spring Boot (it will serve React from /static)
CMD ["sh", "-c", "java -Dserver.port=$PORT -jar /app/app.jar"]
