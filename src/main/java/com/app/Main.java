package com.app;

import com.app.config.ApplicationConfig;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
    public static void main(String[] args) {
        // 1. On charge le contexte
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class);
        System.out.println("Fin du programme.");
        context.close();
    }
}