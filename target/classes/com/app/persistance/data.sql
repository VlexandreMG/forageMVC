INSERT INTO client (nom, prenom, adresse, contact)
VALUES
    (
        'Rakoto',
        'Jean',
        'LOT AV 112 Faliarivo',
        '0341234567'
    ),
    (
        'Rabe',
        'Marie',
        'LOT VB 45 Soanierana',
        '0339876543'
    ),
    (
        'Andry',
        'Hery',
        'LOT TC 78 Ankadifotsy',
        '0321122334'
    ),
    (
        'Rasoa',
        'Lala',
        'LOT MG 210 Ambodivona',
        '0345566778'
    ),
    (
        'Randria',
        'Paul',
        'LOT TR 56 Itaosy',
        '0334455667'
    );

INSERT INTO
    statut (libelle, sigle)
VALUES
    ('Demande créée', 'DC'),
    ('Devis etude créé', 'DEC'),
    ('Devis etude refusé', 'DER'),
    ('Devis etude accepté', 'DEA'),
    ('Devis forage créé', 'DFC'),
    ('Devis forage refusé', 'DFR'),
    ('Devis forage accepté', 'DFA'),
    ('Travail commencé', 'TC'),
    ('Travail terminé', 'TT');

INSERT INTO
    typeDevis (libelle)
VALUES
    ('Etude'),
    ('Forage');

INSERT INTO
    user (nom, password)
VALUES
    ('admin', 'admin123');

-- Données region
INSERT INTO
    region (libelle)
VALUES
    ('Analamanga'),
    ('Atsinanana'),
    ('Boeny'),
    ('Haute Matsiatra'),
    ('Vakinankaratra');

-- Données district
INSERT INTO
    district (libelle, idRegion)
VALUES
    ('Antananarivo Renivohitra', 1),
    ('Ambohidratrimo', 1),
    ('Toamasina I', 2),
    ('Brickaville', 2),
    ('Mahajanga I', 3),
    ('Marovoay', 3),
    ('Fianarantsoa I', 4),
    ('Ambalavao', 4),
    ('Antsirabe I', 5),
    ('Betafo', 5);

-- Données commune
INSERT INTO
    commune (libelle, idDistrict)
VALUES
    ('Analakely', 1),
    ('Isotry', 1),
    ('Talatamaty', 2),
    ('Ivato', 2),
    ('Tanambao Verrerie', 3),
    ('Ambolomadinika', 3),
    ('Brickaville Centre', 4),
    ('Vohitranivona', 4),
    ('Mahabibo', 5),
    ('Tsararano', 5),
    ('Marovoay Ville', 6),
    ('Ankazomborona', 6),
    ('Tanambao', 7),
    ('Ambatomena', 7),
    ('Ambalavao Centre', 8),
    ('Sendrisoa', 8),
    ('Vatofotsy', 9),
    ('Mahazoarivo', 9),
    ('Betafo Centre', 10),
    ('Mandoto', 10);

INSERT INTO
    parametres (idStatut1, idStatut2, DT, alerte)
VALUES
    (1, 2, 160, 'Jaune'),
    (1, 2, 180, 'Rouge'),
    (2, 3, 67, 'Jaune'),
    (2, 3, 80, 'Rouge'),
    (2, 4, 160, 'Jaune'),
    (2, 4, 190, 'Rouge'),
    (4, 5, 100, 'Jaune'),
    (4, 5, 190, 'Rouge'),
    (5, 6, 132, 'Jaune'),
    (5, 6, 190, 'Rouge'),
    (5, 7, 186, 'Jaune'),
    (5, 7, 190, 'Rouge'),
    (7, 8, 166, 'Jaune'),
    (7, 8, 180, 'Rouge'),
    (8, 9, 19, 'Jaune'),
    (8, 9, 190, 'Rouge'),
    (1, 4, 150, 'Rouge'),
    (1, 4, 180, 'Rouge');

INSERT INTO
    parametres (idStatut1, idStatut2, DT, alerte)
VALUES
    (1, 5, 400, 'Jaune');