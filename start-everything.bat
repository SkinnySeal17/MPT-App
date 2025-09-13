@echo off
echo ========================================
echo   Movement Performance Training
echo   Starting Full Application
echo ========================================
echo.

REM Set Java 21 environment
set JAVA_HOME=C:\Program Files\Java\jdk-21
set PATH=C:\Program Files\Java\jdk-21\bin;%PATH%

echo ☕ Java Environment:
java -version
echo.

echo 🔧 Starting Backend Server...
echo Backend will be available at: http://localhost:8080
echo.

REM Start backend in a new window
start "Backend Server" cmd /k "set JAVA_HOME=C:\Program Files\Java\jdk-21 && set PATH=C:\Program Files\Java\jdk-21\bin;%PATH% && mvnw.cmd spring-boot:run"

echo ⏳ Waiting for backend to start (30 seconds)...
timeout /t 30 /nobreak >nul

echo ⚛️  Starting Frontend Server...
echo Frontend will be available at: http://localhost:3000
echo.

REM Start frontend in a new window
start "Frontend Server" cmd /k "cd frontend && npm start"

echo ⏳ Waiting for frontend to start (20 seconds)...
timeout /t 20 /nobreak >nul

echo.
echo 🎉 Both servers are starting up!
echo.
echo 🌐 Access your application:
echo    Backend:  http://localhost:8080
echo    Frontend: http://localhost:3000
echo    Admin:    http://localhost:3000/admin
echo    Login:    admin/admin
echo.
echo 📱 Features available:
echo    ✅ Admin login and authentication
echo    ✅ Dynamic content management
echo    ✅ Background image upload
echo    ✅ Video upload functionality
echo    ✅ Real-time content updates
echo.
echo 🧪 Testing backend connection...
curl -s http://localhost:8080/api/test
echo.
echo.
echo ✅ Application is ready!
echo Close this window when you're done.
echo.
pause
