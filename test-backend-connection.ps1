# Backend Connection Test Script
Write-Host "🧪 Testing Backend Connection..." -ForegroundColor Green
Write-Host ""

# Test 1: Check if backend is running
Write-Host "1. Checking if backend is running on port 8080..." -ForegroundColor Blue
$port8080 = netstat -an | findstr :8080
if ($port8080) {
    Write-Host "   ✅ Backend is running on port 8080" -ForegroundColor Green
} else {
    Write-Host "   ❌ Backend is not running on port 8080" -ForegroundColor Red
    Write-Host "   Please start the backend with: .\start-backend-fixed.bat" -ForegroundColor Yellow
    exit 1
}

# Test 2: Test API endpoint
Write-Host "2. Testing API endpoint..." -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "http://localhost:8080/api/test" -Method Get -TimeoutSec 10
    Write-Host "   ✅ API is responding" -ForegroundColor Green
    Write-Host "   Response: $($response | ConvertTo-Json)" -ForegroundColor Gray
} catch {
    Write-Host "   ❌ API is not responding" -ForegroundColor Red
    Write-Host "   Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Test 3: Test authentication endpoint
Write-Host "3. Testing authentication endpoint..." -ForegroundColor Blue
try {
    $authData = @{
        username = "admin"
        password = "admin"
    } | ConvertTo-Json

    $authResponse = Invoke-RestMethod -Uri "http://localhost:8080/api/auth/login" -Method Post -Body $authData -ContentType "application/json" -TimeoutSec 10
    
    if ($authResponse.success) {
        Write-Host "   ✅ Authentication is working" -ForegroundColor Green
        Write-Host "   Token: $($authResponse.token)" -ForegroundColor Gray
    } else {
        Write-Host "   ❌ Authentication failed" -ForegroundColor Red
        Write-Host "   Response: $($authResponse | ConvertTo-Json)" -ForegroundColor Red
    }
} catch {
    Write-Host "   ❌ Authentication endpoint error" -ForegroundColor Red
    Write-Host "   Error: $($_.Exception.Message)" -ForegroundColor Red
}

# Test 4: Test content endpoint
Write-Host "4. Testing content endpoint..." -ForegroundColor Blue
try {
    $contentResponse = Invoke-RestMethod -Uri "http://localhost:8080/api/content/all" -Method Get -TimeoutSec 10
    Write-Host "   ✅ Content API is working" -ForegroundColor Green
} catch {
    Write-Host "   ❌ Content API error" -ForegroundColor Red
    Write-Host "   Error: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "🎉 Backend tests completed!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Access your application:" -ForegroundColor Cyan
Write-Host "   Backend API: http://localhost:8080" -ForegroundColor White
Write-Host "   API Test:    http://localhost:8080/api/test" -ForegroundColor White
Write-Host "   Admin Panel: http://localhost:3000/admin (after starting frontend)" -ForegroundColor White
Write-Host "   Login:       admin/admin" -ForegroundColor White
