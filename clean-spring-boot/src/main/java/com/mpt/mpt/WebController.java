package com.mpt.mpt;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Controller
public class WebController {

    @GetMapping("/test")
    @ResponseBody
    public String test() {
        return "WebController is working!";
    }

    @GetMapping(value = {"/", "/{path:^(?!api).*}/**"})
    public ResponseEntity<String> serveReactApp(@PathVariable(required = false) String path) {
        try {
            Resource resource = new ClassPathResource("static/index.html");
            if (!resource.exists()) {
                return ResponseEntity.ok()
                        .contentType(MediaType.TEXT_HTML)
                        .body("<html><body><h1>React app not found</h1><p>Path: " + path + "</p><p>Resource exists: " + resource.exists() + "</p></body></html>");
            }
            String content = new String(resource.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
            return ResponseEntity.ok()
                    .contentType(MediaType.TEXT_HTML)
                    .body(content);
        } catch (IOException e) {
            return ResponseEntity.ok()
                    .contentType(MediaType.TEXT_HTML)
                    .body("<html><body><h1>Error loading React app</h1><p>Error: " + e.getMessage() + "</p></body></html>");
        }
    }
}
