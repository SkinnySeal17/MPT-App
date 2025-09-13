# Java 21.0.8 Installation Guide for Windows

## 🚀 Quick Installation Steps

### Option 1: Using Chocolatey (Recommended)
```powershell
# Install Chocolatey if not already installed
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Java 21
choco install openjdk21 -y
```

### Option 2: Manual Installation
1. **Download Java 21.0.8**:
   - Go to: https://adoptium.net/temurin/releases/
   - Select: Version 21 (LTS)
   - Select: Windows x64
   - Download the `.msi` installer

2. **Install Java 21**:
   - Run the downloaded `.msi` file
   - **IMPORTANT**: Check "Set JAVA_HOME" during installation
   - **IMPORTANT**: Check "Add to PATH" during installation
   - Complete the installation

### Option 3: Using SDKMAN (Alternative)
```powershell
# Install SDKMAN
Invoke-WebRequest -Uri "https://get.sdkman.io" -OutFile "sdkman-install.ps1"
.\sdkman-install.ps1

# Install Java 21
sdk install java 21.0.8-tem
```

## 🔧 Verify Installation

After installation, open a **new** PowerShell window and run:

```powershell
# Check Java version
java -version

# Check JAVA_HOME
echo $env:JAVA_HOME

# Expected output should show Java 21.0.8
```

## 🚀 Start the Backend

Once Java 21.0.8 is installed:

```powershell
# Navigate to your project directory
cd C:\Users\Asus\ppt-app

# Start the backend
.\start-backend.bat
```

## 🐛 Troubleshooting

### If JAVA_HOME is not set:
```powershell
# Find Java installation
where java

# Set JAVA_HOME manually (replace with your actual path)
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.8.101-hotspot"
```

### If Maven wrapper fails:
```powershell
# Try with full path
.\mvnw.cmd spring-boot:run

# Or use system Maven if installed
mvn spring-boot:run
```

### If port 8080 is in use:
```powershell
# Find process using port 8080
netstat -ano | findstr :8080

# Kill the process (replace PID with actual process ID)
taskkill /PID <PID> /F
```

## ✅ Test the Backend

Once the backend is running:

```powershell
# Test the API
curl http://localhost:8080/api/test

# Expected response:
# {"message":"Backend is working!","status":"success"}
```

## 🌐 Access Points

- **Backend API**: http://localhost:8080
- **API Test**: http://localhost:8080/api/test
- **Admin Panel**: http://localhost:8080/admin
- **Frontend**: http://localhost:3000 (after starting frontend)

## 🔐 Admin Login

- **Username**: `admin`
- **Password**: `admin`
- **URL**: http://localhost:3000/admin

## 📱 Next Steps

1. **Install Java 21.0.8** using one of the methods above
2. **Start the backend**: `.\start-backend.bat`
3. **Start the frontend**: `.\start-frontend.bat`
4. **Test admin login**: Go to http://localhost:3000/admin
5. **Login with**: admin/admin

## 🆘 Still Having Issues?

If you're still having problems:

1. **Restart your computer** after installing Java
2. **Open a new PowerShell window** (important!)
3. **Check Java version**: `java -version`
4. **Check JAVA_HOME**: `echo $env:JAVA_HOME`
5. **Try the manual Maven command**: `.\mvnw.cmd spring-boot:run`

The backend should start successfully with Java 21.0.8!
