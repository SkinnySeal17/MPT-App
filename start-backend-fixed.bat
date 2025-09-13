@echo off
echo ========================================
echo   Starting Spring Boot Backend
echo ========================================
echo.

REM Check if Java is available
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Java is not installed or not in PATH
    echo Please install Java 21.0.8 first
    echo Run: install-java21.ps1 as Administrator
    pause
    exit /b 1
)

echo ✅ Java found
java -version

REM Check JAVA_HOME
if "%JAVA_HOME%"=="" (
    echo ⚠️  JAVA_HOME not set. Trying to find Java installation...
    for /f "tokens=*" %%i in ('where java 2^>nul') do (
        set JAVA_PATH=%%i
        goto :found_java
    )
    echo ❌ Could not find Java installation
    echo Please set JAVA_HOME environment variable
    pause
    exit /b 1
    :found_java
    echo Found Java at: %JAVA_PATH%
) else (
    echo ✅ JAVA_HOME: %JAVA_HOME%
)

echo.
echo Backend will be available at: http://localhost:8080
echo API test endpoint: http://localhost:8080/api/test
echo Admin login: admin/admin
echo.
echo Starting backend server...
echo (This may take 30-60 seconds on first run)
echo.

REM Use Maven wrapper
if exist mvnw.cmd (
    echo Using Maven wrapper...
    call mvnw.cmd spring-boot:run
) else (
    echo ❌ Maven wrapper not found
    echo Please ensure mvnw.cmd exists in the current directory
    pause
    exit /b 1
)

if %errorlevel% neq 0 (
    echo.
    echo ❌ Failed to start backend server
    echo Please check the error messages above
    echo.
    echo Common solutions:
    echo 1. Make sure Java 21.0.8 is installed
    echo 2. Set JAVA_HOME environment variable
    echo 3. Restart your computer after Java installation
    pause
    exit /b 1
)

echo.
echo Backend server stopped
pause
