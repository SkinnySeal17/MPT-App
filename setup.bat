@echo off
echo ========================================
echo   Movement Performance Training Setup
echo ========================================
echo.

echo Checking system requirements...
echo.

REM Check Java
echo Checking Java installation...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Java is not installed or not in PATH
    echo Please install Java 21 from: https://adoptium.net/
    echo Make sure to check "Set JAVA_HOME" and "Add to PATH" during installation
    pause
    exit /b 1
) else (
    echo ✅ Java is installed
)

REM Check Node.js
echo Checking Node.js installation...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo Please install Node.js from: https://nodejs.org/
    echo Make sure to check "Add to PATH" during installation
    pause
    exit /b 1
) else (
    echo ✅ Node.js is installed
)

echo.
echo Installing frontend dependencies...
cd frontend
call npm install
if %errorlevel% neq 0 (
    echo ❌ Failed to install frontend dependencies
    pause
    exit /b 1
)
cd ..

echo.
echo ✅ Setup completed successfully!
echo.
echo You can now run your website using:
echo   - start-both.bat (recommended)
echo   - start-backend.bat + start-frontend.bat (manual)
echo.
echo Your website will be available at: http://localhost:3000
echo.
pause
