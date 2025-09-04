# Single-stage Dockerfile for Spring Boot with React frontend
FROM maven:3.9-eclipse-temurin-21

WORKDIR /app

# Copy React source and build it
COPY frontend/package*.json ./frontend/
WORKDIR /app/frontend
RUN npm install
COPY frontend/ ./
RUN npm run build

# Copy Spring Boot source and build with React files
WORKDIR /app
COPY clean-spring-boot/pom.xml ./clean-spring-boot/
COPY clean-spring-boot/src ./clean-spring-boot/src
WORKDIR /app/clean-spring-boot
RUN mvn -DskipTests clean package

# Create runtime directory
WORKDIR /app/runtime
RUN cp /app/clean-spring-boot/target/*SNAPSHOT.jar app.jar

EXPOSE 8080
CMD ["sh", "-c", "java -Dserver.port=$PORT -jar /app/runtime/app.jar"]
