@echo off
echo ========================================
echo   Starting Full Stack Application
echo ========================================
echo.

REM Check system requirements
echo Checking system requirements...

REM Check Java
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Java is not installed or not in PATH
    echo Please install Java 21 from: https://adoptium.net/
    echo Make sure to check "Set JAVA_HOME" and "Add to PATH" during installation
    pause
    exit /b 1
)

REM Check Node.js
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo Please install Node.js from: https://nodejs.org/
    echo Make sure to check "Add to PATH" during installation
    pause
    exit /b 1
)

echo ✅ All requirements met
echo.

REM Install frontend dependencies if needed
if not exist frontend\node_modules (
    echo Installing frontend dependencies...
    cd frontend
    call npm install
    if %errorlevel% neq 0 (
        echo ❌ Failed to install frontend dependencies
        pause
        exit /b 1
    )
    cd ..
    echo ✅ Dependencies installed
    echo.
)

echo Backend will be available at: http://localhost:8080
echo Frontend will be available at: http://localhost:3000
echo Admin Panel will be available at: http://localhost:8080/admin
echo.

echo Starting backend server in new window...
if exist mvnw.cmd (
    start "MPT Backend Server" cmd /k "mvnw.cmd spring-boot:run"
) else (
    start "MPT Backend Server" cmd /k "mvn spring-boot:run"
)

echo Waiting for backend to start...
timeout /t 10 /nobreak >nul

echo Starting frontend server in new window...
start "MPT Frontend Server" cmd /k "cd frontend && npm start"

echo.
echo ✅ Both services are starting...
echo.
echo IMPORTANT:
echo - Wait for both windows to show "Started" messages
echo - Backend: Look for "Started MptApplication"
echo - Frontend: Look for "webpack compiled"
echo - Then open your browser to: http://localhost:3000
echo.
echo To stop the servers, close both command windows.
echo.
pause
