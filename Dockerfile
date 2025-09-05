# Multi-stage build: Node.js for React, Java for Spring Boot
FROM node:18-alpine AS frontend-build

WORKDIR /app/frontend

# Copy package files and install dependencies
COPY frontend/package*.json ./
RUN npm install

# Copy source and build
COPY frontend/ ./
RUN npm run build

# Spring Boot stage
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copy Spring Boot source
COPY clean-spring-boot/ ./

# Copy React build from frontend stage
COPY --from=frontend-build /app/frontend/build ./src/main/resources/static/

# Build Spring Boot
RUN ./mvnw clean package -DskipTests

# Start the application
CMD ["java", "-jar", "target/mpt-0.0.1-SNAPSHOT.jar"]