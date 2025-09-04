package com.mpt.mpt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class MptApplication {

    public static void main(String[] args) {
        SpringApplication.run(MptApplication.class, args);
    }

    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("http://localhost:8000", "http://localhost:3000", "http://localhost:3001", "https://ppt-app.onrender.com")
                        .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                        .allowedHeaders("*")
                        .allowCredentials(true);
            }

            @Override
            public void addResourceHandlers(ResourceHandlerRegistry registry) {
                registry.addResourceHandler("/static/**")
                        .addResourceLocations("classpath:/static/static/");
                registry.addResourceHandler("/favicon.ico")
                        .addResourceLocations("classpath:/static/");
                registry.addResourceHandler("/manifest.json")
                        .addResourceLocations("classpath:/static/");
                registry.addResourceHandler("/logo192.png")
                        .addResourceLocations("classpath:/static/");
                registry.addResourceHandler("/logo512.png")
                        .addResourceLocations("classpath:/static/");
                registry.addResourceHandler("/**")
                        .addResourceLocations("classpath:/static/");
            }
        };
    }
}
