# Multi-stage build for Spring Boot + React
FROM node:18-alpine AS frontend-build

# Set working directory
WORKDIR /app/frontend

# Copy package files
COPY frontend/package*.json ./

# Install dependencies
RUN npm install

# Copy frontend source
COPY frontend/ ./

# Build React app
RUN npm run build

# Spring Boot stage
FROM maven:3.9-eclipse-temurin-21 AS backend-build

# Set working directory
WORKDIR /app

# Copy pom.xml
COPY clean-spring-boot/pom.xml ./

# Download dependencies
RUN mvn dependency:go-offline -B

# Copy source code
COPY clean-spring-boot/src ./src

# Copy React build from frontend stage
COPY --from=frontend-build /app/frontend/build ./src/main/resources/static

# Build Spring Boot app
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:21-jre-alpine

# Set working directory
WORKDIR /app

# Copy the built jar
COPY --from=backend-build /app/target/*SNAPSHOT.jar app.jar

# Expose port (Render will set PORT env var)
EXPOSE 8080

# Start the application
CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar app.jar"]
