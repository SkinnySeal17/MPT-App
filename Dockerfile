# Simple approach - use existing React build
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copy everything
COPY . .

# Copy existing React build to Spring Boot static resources
RUN cp -r frontend/build/* clean-spring-boot/src/main/resources/static/

# Build Spring Boot
RUN cd clean-spring-boot && ./mvnw clean package -DskipTests

# Start the application
WORKDIR /app/clean-spring-boot
CMD ["java", "-jar", "target/mpt-0.0.1-SNAPSHOT.jar"]