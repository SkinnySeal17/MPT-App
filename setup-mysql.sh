#!/bin/bash

echo "🐬 Setting up MySQL for MPT Backend"
echo "=================================="

# Check if MySQL is installed
if ! command -v mysql &> /dev/null; then
    echo "❌ MySQL is not installed."
    echo ""
    echo "📦 To install MySQL on macOS:"
    echo "   1. Install Homebrew if you don't have it:"
    echo "      /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    echo ""
    echo "   2. Install MySQL:"
    echo "      brew install mysql"
    echo ""
    echo "   3. Start MySQL service:"
    echo "      brew services start mysql"
    echo ""
    echo "   4. Secure MySQL installation:"
    echo "      mysql_secure_installation"
    echo ""
    echo "   5. Set root password to 'password' (or update application.properties)"
    echo ""
    exit 1
fi

echo "✅ MySQL is installed"

# Check if MySQL service is running
if ! brew services list | grep mysql | grep started > /dev/null; then
    echo "🚀 Starting MySQL service..."
    brew services start mysql
    sleep 3
fi

echo "✅ MySQL service is running"

# Test MySQL connection
echo "🔍 Testing MySQL connection..."
if mysql -u root -ppassword -e "SELECT 1;" > /dev/null 2>&1; then
    echo "✅ MySQL connection successful"
else
    echo "❌ MySQL connection failed"
    echo ""
    echo "🔧 Troubleshooting:"
    echo "   1. Check if MySQL is running: brew services list"
    echo "   2. Try connecting manually: mysql -u root -p"
    echo "   3. Reset root password if needed:"
    echo "      mysql -u root -p"
    echo "      ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';"
    echo "      FLUSH PRIVILEGES;"
    echo "      EXIT;"
    echo ""
    exit 1
fi

# Create database if it doesn't exist
echo "🗄️  Creating database 'mpt_db'..."
mysql -u root -ppassword -e "CREATE DATABASE IF NOT EXISTS mpt_db;" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Database 'mpt_db' created/verified"
else
    echo "❌ Failed to create database"
    exit 1
fi

# Show database info
echo ""
echo "📊 Database Information:"
echo "   Host: localhost"
echo "   Port: 3306"
echo "   Database: mpt_db"
echo "   Username: root"
echo "   Password: password"
echo ""
echo "🔗 Connection URL:"
echo "   jdbc:mysql://localhost:3306/mpt_db"
echo ""
echo "🎉 MySQL setup complete!"
echo ""
echo "🚀 Next steps:"
echo "   1. Restart your Spring Boot application"
echo "   2. Check the logs for successful database connection"
echo "   3. Test the API endpoints"
echo ""
