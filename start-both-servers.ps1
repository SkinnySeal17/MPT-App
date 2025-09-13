# Start Both Frontend and Backend Servers
Write-Host "🚀 Starting Movement Performance Training - Full Application" -ForegroundColor Green
Write-Host ""

# Set Java 21 environment
Write-Host "☕ Setting up Java 21 environment..." -ForegroundColor Blue
$env:JAVA_HOME = "C:\Program Files\Java\jdk-21"
$env:PATH = "C:\Program Files\Java\jdk-21\bin;" + $env:PATH

# Verify Java version
$javaVersion = java -version 2>&1 | Select-String "version"
Write-Host "Java version: $javaVersion" -ForegroundColor Green

# Function to cleanup background processes
$backendPID = $null
$frontendPID = $null

function Cleanup {
    Write-Host ""
    Write-Host "🛑 Shutting down servers..." -ForegroundColor Yellow
    if ($backendPID) {
        Stop-Process -Id $backendPID -Force -ErrorAction SilentlyContinue
    }
    if ($frontendPID) {
        Stop-Process -Id $frontendPID -Force -ErrorAction SilentlyContinue
    }
    exit 0
}

# Set up signal handlers
$null = Register-EngineEvent PowerShell.Exiting -Action { Cleanup }

# Start backend
Write-Host "🔧 Starting backend server..." -ForegroundColor Blue
$backendJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    $env:JAVA_HOME = "C:\Program Files\Java\jdk-21"
    $env:PATH = "C:\Program Files\Java\jdk-21\bin;" + $env:PATH
    & ".\mvnw.cmd" spring-boot:run
}

# Wait for backend to start
Write-Host "⏳ Waiting for backend to start (30 seconds)..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

# Test backend
Write-Host "🧪 Testing backend..." -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "http://localhost:8080/api/test" -Method Get -TimeoutSec 5
    Write-Host "✅ Backend is running!" -ForegroundColor Green
} catch {
    Write-Host "⚠️  Backend might still be starting..." -ForegroundColor Yellow
}

# Start frontend
Write-Host "⚛️  Starting frontend server..." -ForegroundColor Blue
$frontendJob = Start-Job -ScriptBlock {
    Set-Location "$using:PWD\frontend"
    npm start
}

# Wait for frontend to start
Write-Host "⏳ Waiting for frontend to start (20 seconds)..." -ForegroundColor Yellow
Start-Sleep -Seconds 20

Write-Host ""
Write-Host "🎉 Both servers are starting up!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Access your application:" -ForegroundColor Cyan
Write-Host "   Backend:  http://localhost:8080" -ForegroundColor White
Write-Host "   Frontend: http://localhost:3000" -ForegroundColor White
Write-Host "   Admin:    http://localhost:3000/admin" -ForegroundColor White
Write-Host "   Login:    admin/admin" -ForegroundColor White
Write-Host ""
Write-Host "📱 Features available:" -ForegroundColor Cyan
Write-Host "   ✅ Admin login and authentication" -ForegroundColor Green
Write-Host "   ✅ Dynamic content management" -ForegroundColor Green
Write-Host "   ✅ Background image upload" -ForegroundColor Green
Write-Host "   ✅ Video upload functionality" -ForegroundColor Green
Write-Host "   ✅ Real-time content updates" -ForegroundColor Green
Write-Host ""
Write-Host "Press Ctrl+C to stop both servers" -ForegroundColor Yellow

# Keep the script running
try {
    while ($true) {
        Start-Sleep -Seconds 10
        
        # Check if backend is still running
        if ($backendJob.State -eq "Failed") {
            Write-Host "❌ Backend stopped unexpectedly" -ForegroundColor Red
            break
        }
        
        # Check if frontend is still running
        if ($frontendJob.State -eq "Failed") {
            Write-Host "❌ Frontend stopped unexpectedly" -ForegroundColor Red
            break
        }
    }
} catch {
    Write-Host "Stopping servers..." -ForegroundColor Yellow
} finally {
    Cleanup
}
