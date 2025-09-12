@echo off
echo ========================================
echo   Starting React Frontend
echo ========================================
echo.

REM Check if Node.js is available
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo Please install Node.js from: https://nodejs.org/
    echo Make sure to check "Add to PATH" during installation
    pause
    exit /b 1
)

echo ✅ Node.js found
echo.

REM Check if frontend dependencies are installed
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

echo Frontend will be available at: http://localhost:3000
echo.
echo Starting frontend server...
echo (This may take 30-60 seconds on first run)
echo.

cd frontend
call npm start

if %errorlevel% neq 0 (
    echo.
    echo ❌ Failed to start frontend server
    echo Please check the error messages above
    pause
    exit /b 1
)

echo.
echo Frontend server stopped
pause
