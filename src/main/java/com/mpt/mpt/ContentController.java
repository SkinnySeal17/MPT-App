package com.mpt.mpt;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@RestController
@RequestMapping("/api/content")
@CrossOrigin(origins = "*")
public class ContentController {

    // In-memory storage for demo (use database in production)
    private static Map<String, Object> websiteContent = new HashMap<>();
    private static List<Map<String, Object>> galleryItems = new ArrayList<>();
    private static List<Map<String, Object>> videos = new ArrayList<>();
    private static String backgroundImage = "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1920&h=1080&fit=crop";

    static {
        // Initialize default content
        websiteContent.put("heroTitle", "Transform Your Movement Performance");
        websiteContent.put("heroSubtitle", "Experience world-class movement training methodologies backed by scientific research and proven results.");
        websiteContent.put("aboutTitle", "Movement Performance Training");
        websiteContent.put("aboutDescription", "MPT specializes in movement performance training, helping athletes and fitness enthusiasts improve their movement quality, efficiency, and performance.");
        
        // Initialize gallery with some default items
        galleryItems.add(Map.of(
            "id", 1,
            "title", "Training Session 1",
            "category", "training",
            "imageUrl", "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop"
        ));
        galleryItems.add(Map.of(
            "id", 2,
            "title", "Training Session 2", 
            "category", "training",
            "imageUrl", "https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=300&fit=crop"
        ));
    }

    @GetMapping("/all")
    public ResponseEntity<Map<String, Object>> getAllContent() {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("data", Map.of(
            "content", websiteContent,
            "gallery", galleryItems,
            "videos", videos,
            "backgroundImage", backgroundImage
        ));
        return ResponseEntity.ok(response);
    }

    @PostMapping("/update")
    public ResponseEntity<Map<String, Object>> updateContent(@RequestBody Map<String, Object> contentData) {
        try {
            // Update website content
            if (contentData.containsKey("heroTitle")) {
                websiteContent.put("heroTitle", contentData.get("heroTitle"));
            }
            if (contentData.containsKey("heroSubtitle")) {
                websiteContent.put("heroSubtitle", contentData.get("heroSubtitle"));
            }
            if (contentData.containsKey("aboutTitle")) {
                websiteContent.put("aboutTitle", contentData.get("aboutTitle"));
            }
            if (contentData.containsKey("aboutDescription")) {
                websiteContent.put("aboutDescription", contentData.get("aboutDescription"));
            }

            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("message", "Content updated successfully");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "Error updating content: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    @PostMapping("/background/upload")
    public ResponseEntity<Map<String, Object>> uploadBackgroundImage(@RequestParam("file") MultipartFile file) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            if (file.isEmpty()) {
                response.put("success", false);
                response.put("message", "Please select a file");
                return ResponseEntity.badRequest().body(response);
            }

            // For demo purposes, we'll use a placeholder URL
            // In production, save the file to a proper storage location
            String fileName = "background_" + System.currentTimeMillis() + ".jpg";
            backgroundImage = "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1920&h=1080&fit=crop&t=" + System.currentTimeMillis();
            
            response.put("success", true);
            response.put("message", "Background image updated successfully");
            response.put("data", Map.of(
                "imageUrl", backgroundImage,
                "fileName", fileName
            ));
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error uploading background image: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    @PostMapping("/gallery/upload")
    public ResponseEntity<Map<String, Object>> uploadGalleryItem(
            @RequestParam("file") MultipartFile file,
            @RequestParam("title") String title,
            @RequestParam("category") String category) {
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            if (file.isEmpty()) {
                response.put("success", false);
                response.put("message", "Please select a file");
                return ResponseEntity.badRequest().body(response);
            }

            // Create new gallery item
            Map<String, Object> newItem = new HashMap<>();
            newItem.put("id", galleryItems.size() + 1);
            newItem.put("title", title);
            newItem.put("category", category);
            newItem.put("imageUrl", "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop&t=" + System.currentTimeMillis());
            newItem.put("uploadedAt", System.currentTimeMillis());
            
            galleryItems.add(newItem);
            
            response.put("success", true);
            response.put("message", "Gallery item uploaded successfully");
            response.put("data", newItem);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error uploading gallery item: " + e.getMessage());
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
            if (file.isEmpty()) {
                response.put("success", false);
                response.put("message", "Please select a file");
                return ResponseEntity.badRequest().body(response);
            }

            // Create new video item
            Map<String, Object> newVideo = new HashMap<>();
            newVideo.put("id", videos.size() + 1);
            newVideo.put("title", title);
            newVideo.put("description", description);
            newVideo.put("videoUrl", "https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4");
            newVideo.put("thumbnailUrl", "https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=300&fit=crop");
            newVideo.put("uploadedAt", System.currentTimeMillis());
            
            videos.add(newVideo);
            
            response.put("success", true);
            response.put("message", "Video uploaded successfully");
            response.put("data", newVideo);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error uploading video: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    @GetMapping("/gallery")
    public ResponseEntity<Map<String, Object>> getGallery() {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("data", galleryItems);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/videos")
    public ResponseEntity<Map<String, Object>> getVideos() {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("data", videos);
        return ResponseEntity.ok(response);
    }
}
