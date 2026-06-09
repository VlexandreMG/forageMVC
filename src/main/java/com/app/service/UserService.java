package com.app.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.app.model.User;
import com.app.repository.UserRepository;

@Service
public class UserService {

    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User findbyNomandPassword(String nom, String password) {
        return userRepository.findByNomAndPassword(nom, password);
    }

}