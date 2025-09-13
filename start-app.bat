@echo off
echo ========================================
echo   Movement Performance Training
echo   Starting Full Application
echo ========================================
echo.

echo 🔧 Starting Backend Server...
start "Backend" cmd /k "python simple-backend.py"

echo ⏳ Waiting for backend to start (10 seconds)...
timeout /t 10 /nobreak >nul

echo ⚛️  Starting Frontend Server...
start "Frontend" cmd /k "cd frontend && npm start"

echo ⏳ Waiting for frontend to start (15 seconds)...
timeout /t 15 /nobreak >nul

echo.
echo 🎉 Application is starting up!
echo.
echo 🌐 Access your application:
echo    Website:  http://localhost:3000
echo    Admin:    http://localhost:3000/admin
echo    Login:    admin/admin
echo    Backend:  http://localhost:8080
echo.
echo 📱 Features:
echo    ✅ Admin login and authentication
echo    ✅ Dynamic content management
echo    ✅ Background image upload
echo    ✅ Video upload functionality
echo    ✅ Real-time content updates
echo.
echo 🧪 Testing backend...
curl -s http://localhost:8080/api/test
echo.
echo.
echo ✅ Ready! Close this window when done.
pause
