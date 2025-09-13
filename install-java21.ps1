# Java 21.0.8 Installation Script for Windows
# This script will install Java 21 using Chocolatey

Write-Host "🚀 Installing Java 21.0.8..." -ForegroundColor Green

# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "❌ This script needs to be run as Administrator" -ForegroundColor Red
    Write-Host "Right-click PowerShell and select 'Run as Administrator'" -ForegroundColor Yellow
    pause
    exit 1
}

# Install Chocolatey if not already installed
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "📦 Installing Chocolatey..." -ForegroundColor Blue
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    
    # Refresh environment variables
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Install Java 21
Write-Host "☕ Installing Java 21..." -ForegroundColor Blue
choco install openjdk21 -y

# Refresh environment variables
Write-Host "🔄 Refreshing environment variables..." -ForegroundColor Blue
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Verify installation
Write-Host "✅ Verifying Java installation..." -ForegroundColor Green
try {
    $javaVersion = java -version 2>&1 | Select-String "version"
    Write-Host "Java version: $javaVersion" -ForegroundColor Green
    
    if ($javaVersion -match "21") {
        Write-Host "🎉 Java 21 installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Java installed but version might not be 21" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Java installation verification failed" -ForegroundColor Red
}

# Check JAVA_HOME
Write-Host "🏠 Checking JAVA_HOME..." -ForegroundColor Blue
$javaHome = $env:JAVA_HOME
if ($javaHome) {
    Write-Host "JAVA_HOME: $javaHome" -ForegroundColor Green
} else {
    Write-Host "⚠️  JAVA_HOME not set. You may need to restart your computer." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎯 Next Steps:" -ForegroundColor Cyan
Write-Host "1. Close this PowerShell window" -ForegroundColor White
Write-Host "2. Open a new PowerShell window" -ForegroundColor White
Write-Host "3. Navigate to your project: cd C:\Users\Asus\ppt-app" -ForegroundColor White
Write-Host "4. Start the backend: .\start-backend.bat" -ForegroundColor White
Write-Host "5. Test the API: curl http://localhost:8080/api/test" -ForegroundColor White
Write-Host ""
Write-Host "If JAVA_HOME is still not set, restart your computer." -ForegroundColor Yellow

pause
