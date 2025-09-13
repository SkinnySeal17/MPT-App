@echo off
echo ========================================
echo   Starting Spring Boot Backend
echo ========================================
echo.

REM Check if Java is available
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Java is not installed or not in PATH
    echo Please install Java 21 from: https://adoptium.net/
    echo Make sure to check "Set JAVA_HOME" and "Add to PATH" during installation
    pause
    exit /b 1
)

echo ✅ Java found
echo.
echo Backend will be available at: http://localhost:8080
echo H2 Console will be available at: http://localhost:8080/h2-console
echo Admin Panel will be available at: http://localhost:8080/admin
echo.
echo Starting backend server...
echo (This may take 30-60 seconds on first run)
echo.

REM Use Maven wrapper if available, otherwise use system Maven
if exist mvnw.cmd (
    call mvnw.cmd spring-boot:run
) else (
    mvn spring-boot:run
)

if %errorlevel% neq 0 (
    echo.
    echo ❌ Failed to start backend server
    echo Please check the error messages above
    pause
    exit /b 1
)

echo.
echo Backend server stopped
pause
