#!/bin/bash

# Movement Performance Training - Application Test Script for Mac
echo "🧪 Testing Movement Performance Training Application..."
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test functions
test_backend() {
    echo -e "${BLUE}1. Testing Backend API...${NC}"
    
    # Test health endpoint
    echo "   Testing health endpoint..."
    response=$(curl -s http://localhost:8080/api/test)
    if [[ $response == *"Backend is working"* ]]; then
        echo -e "   ${GREEN}✅ Health check passed${NC}"
    else
        echo -e "   ${RED}❌ Health check failed${NC}"
        return 1
    fi
    
    # Test auth endpoint
    echo "   Testing authentication..."
    auth_response=$(curl -s -X POST http://localhost:8080/api/auth/login \
        -H "Content-Type: application/json" \
        -d '{"username":"admin","password":"admin"}')
    
    if [[ $auth_response == *"success"* ]]; then
        echo -e "   ${GREEN}✅ Authentication test passed${NC}"
    else
        echo -e "   ${RED}❌ Authentication test failed${NC}"
        return 1
    fi
    
    # Test content endpoint
    echo "   Testing content API..."
    content_response=$(curl -s http://localhost:8080/api/content/all)
    if [[ $content_response == *"success"* ]]; then
        echo -e "   ${GREEN}✅ Content API test passed${NC}"
    else
        echo -e "   ${RED}❌ Content API test failed${NC}"
        return 1
    fi
    
    echo -e "   ${GREEN}🎉 Backend tests passed!${NC}"
    return 0
}

test_frontend() {
    echo -e "${BLUE}2. Testing Frontend...${NC}"
    
    # Test if frontend is accessible
    echo "   Testing frontend accessibility..."
    response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000)
    if [ "$response" = "200" ]; then
        echo -e "   ${GREEN}✅ Frontend is accessible${NC}"
    else
        echo -e "   ${RED}❌ Frontend is not accessible (HTTP $response)${NC}"
        return 1
    fi
    
    echo -e "   ${GREEN}🎉 Frontend tests passed!${NC}"
    return 0
}

test_admin_panel() {
    echo -e "${BLUE}3. Testing Admin Panel...${NC}"
    
    # Test admin panel accessibility
    echo "   Testing admin panel accessibility..."
    response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/admin)
    if [ "$response" = "200" ]; then
        echo -e "   ${GREEN}✅ Admin panel is accessible${NC}"
    else
        echo -e "   ${RED}❌ Admin panel is not accessible (HTTP $response)${NC}"
        return 1
    fi
    
    echo -e "   ${GREEN}🎉 Admin panel tests passed!${NC}"
    return 0
}

check_ports() {
    echo -e "${BLUE}0. Checking Ports...${NC}"
    
    # Check backend port
    if lsof -i :8080 > /dev/null 2>&1; then
        echo -e "   ${GREEN}✅ Backend port 8080 is in use${NC}"
    else
        echo -e "   ${RED}❌ Backend port 8080 is not in use${NC}"
        echo -e "   ${YELLOW}   Start backend with: ./start-backend-mac.sh${NC}"
        return 1
    fi
    
    # Check frontend port
    if lsof -i :3000 > /dev/null 2>&1; then
        echo -e "   ${GREEN}✅ Frontend port 3000 is in use${NC}"
    else
        echo -e "   ${RED}❌ Frontend port 3000 is not in use${NC}"
        echo -e "   ${YELLOW}   Start frontend with: ./start-frontend-mac.sh${NC}"
        return 1
    fi
    
    return 0
}

# Main test execution
main() {
    echo "🔍 Checking if servers are running..."
    if ! check_ports; then
        echo ""
        echo -e "${RED}❌ Servers are not running. Please start them first:${NC}"
        echo -e "   ${YELLOW}./start-both-mac.sh${NC}"
        exit 1
    fi
    
    echo ""
    echo "⏳ Waiting 5 seconds for servers to be ready..."
    sleep 5
    
    echo ""
    echo "🧪 Running application tests..."
    echo ""
    
    # Run tests
    backend_result=0
    frontend_result=0
    admin_result=0
    
    test_backend || backend_result=1
    echo ""
    
    test_frontend || frontend_result=1
    echo ""
    
    test_admin_panel || admin_result=1
    echo ""
    
    # Summary
    echo "📊 Test Results Summary:"
    echo "========================"
    
    if [ $backend_result -eq 0 ]; then
        echo -e "Backend API:     ${GREEN}✅ PASSED${NC}"
    else
        echo -e "Backend API:     ${RED}❌ FAILED${NC}"
    fi
    
    if [ $frontend_result -eq 0 ]; then
        echo -e "Frontend:        ${GREEN}✅ PASSED${NC}"
    else
        echo -e "Frontend:        ${RED}❌ FAILED${NC}"
    fi
    
    if [ $admin_result -eq 0 ]; then
        echo -e "Admin Panel:     ${GREEN}✅ PASSED${NC}"
    else
        echo -e "Admin Panel:     ${RED}❌ FAILED${NC}"
    fi
    
    echo ""
    
    if [ $backend_result -eq 0 ] && [ $frontend_result -eq 0 ] && [ $admin_result -eq 0 ]; then
        echo -e "${GREEN}🎉 All tests passed! Your application is working correctly.${NC}"
        echo ""
        echo "🌐 Access your application:"
        echo "   Frontend: http://localhost:3000"
        echo "   Admin:    http://localhost:3000/admin (admin/admin)"
        echo "   API:      http://localhost:8080/api/test"
        exit 0
    else
        echo -e "${RED}❌ Some tests failed. Please check the errors above.${NC}"
        exit 1
    fi
}

# Run main function
main
