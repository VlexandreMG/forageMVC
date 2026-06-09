-- Active: 1774215634831@@127.0.0.1@3306@forage
DROP DATABASE IF EXISTS forage;

CREATE DATABASE IF NOT EXISTS forage;

use forage;

-- Table region
CREATE TABLE region (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

-- Table district
CREATE TABLE district (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL,
    idRegion INT,
    FOREIGN KEY (idRegion) REFERENCES region (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table commune
CREATE TABLE commune (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL,
    idDistrict INT,
    FOREIGN KEY (idDistrict) REFERENCES district (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table client
CREATE TABLE client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    adresse TEXT,
    contact VARCHAR(50)
);

-- Table user
CREATE TABLE
user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Table demande
CREATE TABLE demande (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    idCommune INT,
    lieu VARCHAR(255),
    FOREIGN KEY (idClient) REFERENCES client (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idCommune) REFERENCES commune (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table statut
CREATE TABLE statut (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL,
    sigle VARCHAR(10)
);

-- Table demandeStatut
CREATE TABLE demandeStatut (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idDemande INT,
    idStatut INT DEFAULT 1,
    date DATETIME,
    idUser INT,
    observation TEXT,
    DT DECIMAL(10, 2),
    FOREIGN KEY (idDemande) REFERENCES demande (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idStatut) REFERENCES statut (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idUser) REFERENCES
    user (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE Table typeDevis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

CREATE TABLE devis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idDemande INT,
    idTypeDevis INT,
    CONSTRAINT fk_devis_demande FOREIGN KEY (idDemande) REFERENCES demande (id) ON DELETE CASCADE,
    CONSTRAINT fk_devis_typeDevis FOREIGN KEY (idTypeDevis) REFERENCES typeDevis (id) ON DELETE CASCADE
);

CREATE TABLE sousDevis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idDevis INT,
    description TEXT,
    quantite INT,
    prixUnitaire DECIMAL(10, 2),
    CONSTRAINT fk_sousDevis_devis FOREIGN KEY (idDevis) REFERENCES devis (id) ON DELETE CASCADE
);

CREATE TABLE parametres(
    id INT AUTO_INCREMENT PRIMARY KEY,
    idStatut1 INT,
    idStatut2 INT,
    DT DECIMAL(10, 2),
    alerte VARCHAR(20)
);