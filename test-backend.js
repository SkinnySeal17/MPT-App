// Simple test script to verify backend endpoints
const API_BASE_URL = 'http://localhost:8080';

async function testBackend() {
  console.log('🧪 Testing Backend Endpoints...\n');

  try {
    // Test health endpoint
    console.log('1. Testing health endpoint...');
    const healthResponse = await fetch(`${API_BASE_URL}/api/test`);
    const healthData = await healthResponse.json();
    console.log('✅ Health check:', healthData);

    // Test packages endpoint
    console.log('\n2. Testing packages endpoint...');
    const packagesResponse = await fetch(`${API_BASE_URL}/api/packages`);
    const packagesData = await packagesResponse.json();
    console.log('✅ Packages:', packagesData);

    // Test auth login
    console.log('\n3. Testing auth login...');
    const authResponse = await fetch(`${API_BASE_URL}/api/auth/login`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        username: 'admin',
        password: 'admin'
      })
    });
    const authData = await authResponse.json();
    console.log('✅ Auth login:', authData);

    // Test admin dashboard
    console.log('\n4. Testing admin dashboard...');
    const adminResponse = await fetch(`${API_BASE_URL}/api/admin/dashboard`);
    const adminData = await adminResponse.json();
    console.log('✅ Admin dashboard:', adminData);

    console.log('\n🎉 All backend tests passed!');
  } catch (error) {
    console.error('❌ Backend test failed:', error.message);
    console.log('\n💡 Make sure the backend is running on port 8080');
  }
}

testBackend();
