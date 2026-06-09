### FORAGE

- Creation base forage
    - Creation table :
        - client : id,nom,prenom,adresse,contact
        - region : id,libelle
        - district : id,libelle,idRegion
        - commune : id,libelle,idDistrict
        - demande : id,idClient,idCommune,lieu
        - statut : id,libelle
        - demandeStatut : id,idDemande,idStatut,date(datetime),idUser,observation
        - user : id,nom,password
        - devis : id,nom,idDemande,montant
        - devisStatut : id, idDevis,idStatut
        - sousDevis : id,idDevis,description,quantite,prixUnitaire

- Creation des entity
    - client
    - region
    - district
    - commune
    - demande
    - statut
    - demandeStatut

- Creation repository
    - clientRepository
    - regionRepository
    - districtRepository
    - communeRepository
    - demandeRepository
    - statutRepository
    - demandeStatutRepository
    
- Creation controller
    - clientController
    - regionController
    - districtController
    - communeController
    - demandeController :
        - fonction afficher formulaire demande :
            - appelle fonction liste :
                - region
                - district par id_region
                - commune par id_district
        - fonction inserer une demande 
    - statutController
    - demandeStatutController

- Creation service
    - clientService
    - regionService
    - districtService
    - communeService
    - demandeService
    - statutService
    - demandeStatutService



- Creation des vues
    - formDemande
    - listDemande : bare de recherche (Statut,date)