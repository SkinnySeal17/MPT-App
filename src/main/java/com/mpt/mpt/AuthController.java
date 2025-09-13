package main.java.com.mpt.mpt;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    // Simple authentication for demo purposes
    // In production, use proper authentication with JWT tokens
    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@RequestBody Map<String, String> credentials) {
        Map<String, Object> response = new HashMap<>();
        
        String username = credentials.get("username");
        String password = credentials.get("password");
        
        // Simple hardcoded credentials for demo
        if ("admin".equals(username) && "admin".equals(password)) {
            response.put("success", true);
            response.put("message", "Login successful");
            response.put("token", "demo-token-" + System.currentTimeMillis());
            response.put("user", Map.of(
                "id", 1,
                "username", "admin",
                "role", "admin"
            ));
            return ResponseEntity.ok(response);
        } else {
            response.put("success", false);
            response.put("message", "Invalid credentials");
            return ResponseEntity.status(401).body(response);
        }
    }

    @PostMapping("/logout")
    public ResponseEntity<Map<String, Object>> logout() {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Logout successful");
        return ResponseEntity.ok(response);
    }

    @GetMapping("/me")
    public ResponseEntity<Map<String, Object>> getCurrentUser() {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("user", Map.of(
            "id", 1,
            "username", "admin",
            "role", "admin"
        ));
        return ResponseEntity.ok(response);
    }

    @PostMapping("/refresh")
    public ResponseEntity<Map<String, Object>> refreshToken() {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("token", "demo-token-" + System.currentTimeMillis());
        return ResponseEntity.ok(response);
    }
}
