package main.java.com.mpt.mpt;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

@RestController
@RequestMapping("/api/admin")
@CrossOrigin(origins = "*")
public class AdminController {

    @GetMapping("/dashboard")
    public ResponseEntity<Map<String, Object>> getDashboardData() {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("data", Map.of(
            "totalBookings", 25,
            "totalRevenue", 12500.00,
            "activeUsers", 150,
            "galleryItems", 24,
            "services", 6,
            "testimonials", 12
        ));
        return ResponseEntity.ok(response);
    }

    @GetMapping("/stats")
    public ResponseEntity<Map<String, Object>> getSystemStats() {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("data", Map.of(
            "totalBookings", 25,
            "thisMonthBookings", 8,
            "totalRevenue", 12500.00,
            "averageBookingValue", 500.00,
            "galleryItems", 24,
            "services", 6,
            "testimonials", 12
        ));
        return ResponseEntity.ok(response);
    }

    @GetMapping("/users")
    public ResponseEntity<Map<String, Object>> getUsers() {
        Map<String, Object> response = new HashMap<>();
        List<Map<String, Object>> users = new ArrayList<>();
        
        users.add(Map.of(
            "id", 1,
            "username", "admin",
            "email", "admin@mpt.com",
            "role", "admin",
            "createdAt", "2024-01-01T00:00:00Z"
        ));
        
        users.add(Map.of(
            "id", 2,
            "username", "coach1",
            "email", "coach1@mpt.com",
            "role", "coach",
            "createdAt", "2024-01-15T00:00:00Z"
        ));
        
        response.put("success", true);
        response.put("data", users);
        return ResponseEntity.ok(response);
    }

    @PutMapping("/users/{userId}/role")
    public ResponseEntity<Map<String, Object>> updateUserRole(@PathVariable Long userId, @RequestBody Map<String, String> roleData) {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "User role updated successfully");
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/users/{userId}")
    public ResponseEntity<Map<String, Object>> deleteUser(@PathVariable Long userId) {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "User deleted successfully");
        return ResponseEntity.ok(response);
    }

    @PostMapping("/gallery/upload")
    public ResponseEntity<Map<String, Object>> uploadGalleryItem(
            @RequestParam("file") MultipartFile file,
            @RequestParam("title") String title,
            @RequestParam("category") String category) {
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            // In a real application, you would save the file to storage
            // For now, we'll just return a success response
            response.put("success", true);
            response.put("message", "Gallery item uploaded successfully");
            response.put("data", Map.of(
                "id", System.currentTimeMillis(),
                "title", title,
                "category", category,
                "filename", file.getOriginalFilename(),
                "size", file.getSize(),
                "url", "/uploads/" + file.getOriginalFilename()
            ));
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error uploading file: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    @PostMapping("/videos/upload")
    public ResponseEntity<Map<String, Object>> uploadVideo(
            @RequestParam("file") MultipartFile file,
            @RequestParam("title") String title,
            @RequestParam("description") String description) {
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            // In a real application, you would save the video file to storage
            // For now, we'll just return a success response
            response.put("success", true);
            response.put("message", "Video uploaded successfully");
            response.put("data", Map.of(
                "id", System.currentTimeMillis(),
                "title", title,
                "description", description,
                "filename", file.getOriginalFilename(),
                "size", file.getSize(),
                "url", "/uploads/videos/" + file.getOriginalFilename()
            ));
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error uploading video: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
}
