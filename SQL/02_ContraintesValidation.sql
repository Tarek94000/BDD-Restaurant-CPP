-- Utilisation de la base de données restaurant_cpp
USE restaurant_cpp;

-- Contraintes de validation pour la base de données restaurant_cpp

-- Assurer que les montants estimatifs et de facturation soient positifs
ALTER TABLE Commande
ADD CONSTRAINT chk_montant_estimatif CHECK (montant_estimatif >= 0);

ALTER TABLE Facture
ADD CONSTRAINT chk_montant_facturation CHECK (montant_facturation >= 0);

-- Vérification des états valides des commandes
ALTER TABLE Commande
ADD CONSTRAINT chk_etat_commande CHECK (etat_commande IN ('En attente', 'En cours', 'Terminée', 'Annulée', 'En préparation', 'Prête'));

-- Vérification des types de commande valides
ALTER TABLE Commande
ADD CONSTRAINT chk_type_commande CHECK (type_commande IN ('Sur place', 'À emporter', 'Livraison'));

-- Assurer que certaines colonnes soient non-nulles
ALTER TABLE Commande
MODIFY id_client INT NOT NULL;

ALTER TABLE Employe
MODIFY nom VARCHAR(50) NOT NULL;

ALTER TABLE Employe
MODIFY shift VARCHAR(50) NOT NULL;

ALTER TABLE Nourriture
MODIFY nom_nourriture VARCHAR(50) NOT NULL;

-- Assurer que la capacité d'une table soit positive
ALTER TABLE Place
ADD CONSTRAINT chk_capacite CHECK (capacite > 0);

-- Assurer que la quantité des articles dans une commande soit positive
ALTER TABLE Contient
ADD CONSTRAINT chk_quantite CHECK (quantite > 0);

-- Vérification des rôles valides pour les employés
ALTER TABLE Statut
ADD CONSTRAINT chk_poste CHECK (Poste IN ('Serveur', 'Cuisinier', 'Manager', 'Hôte', 'Plongeur', 'Barman'));

-- Assurer que le salaire des postes soit positif
ALTER TABLE Statut
ADD CONSTRAINT chk_salaire_positive CHECK (Salaire >= 0);

-- Vérifier que l'état de la table soit valide
ALTER TABLE Place
ADD CONSTRAINT chk_etat_table CHECK (etat_table IN ('Libre', 'Occupée', 'En nettoyage'));

-- Assurer que la date de la commande ne soit pas dans le futur
DELIMITER //
CREATE TRIGGER trg_check_date_commande BEFORE INSERT ON Commande
FOR EACH ROW
BEGIN
  IF NEW.date_commande > CURRENT_DATE THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La date de commande ne peut pas être dans le futur';
  END IF;
END //
DELIMITER ;

-- Assurer que la date de facturation ne soit pas antérieure à la date de commande
DELIMITER //
CREATE TRIGGER trg_check_date_facturation BEFORE INSERT ON Facture
FOR EACH ROW
BEGIN
  DECLARE date_commande DATE;
  SET date_commande = (SELECT date_commande FROM Commande WHERE id_commande = NEW.id_commande);
  IF NEW.date_facturation < date_commande THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La date de facturation ne peut pas être antérieure à la date de commande';
  END IF;
END //
DELIMITER ;

