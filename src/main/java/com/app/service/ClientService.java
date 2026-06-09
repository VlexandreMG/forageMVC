package com.app.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.app.model.Client;
import com.app.repository.ClientRepository;

@Service
public class ClientService {

    private ClientRepository clientRepository;

    public ClientService(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    public List<Client> getAllClients() {
        return clientRepository.findAll();
    }
}