CREATE DATABASE restaurant_cpp;

USE restaurant_cpp;

CREATE TABLE Place(
   id_table INT,
   capacite INT,
   etat_table VARCHAR(50),
   PRIMARY KEY(id_table)
);

CREATE TABLE Client(
   id_client INT,
   nom_client VARCHAR(50),
   telephone VARCHAR(50),
   email VARCHAR(50),
   PRIMARY KEY(id_client)
);

CREATE TABLE Nourriture(
   id_article INT,
   nom_nourriture VARCHAR(50),
   type_nourriture VARCHAR(50),
   prix DECIMAL(15,2),
   PRIMARY KEY(id_article)
);

CREATE TABLE Statut(
   Poste VARCHAR(50),
   Salaire VARCHAR(50),
   PRIMARY KEY(Poste)
);

CREATE TABLE Employe(
   id_employe INT,
   nom VARCHAR(50),
   shift VARCHAR(50),
   Poste VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_employe),
   FOREIGN KEY(Poste) REFERENCES Statut(Poste)
);

CREATE TABLE Commande(
   id_commande INT,
   date_commande DATE,
   type_commande VARCHAR(50),
   etat_commande VARCHAR(50),
   montant_estimatif DECIMAL(15,2),
   id_client INT,
   id_table INT,
   id_employe INT NOT NULL,
   PRIMARY KEY(id_commande),
   FOREIGN KEY(id_client) REFERENCES Client(id_client),
   FOREIGN KEY(id_table) REFERENCES Place(id_table),
   FOREIGN KEY(id_employe) REFERENCES Employe(id_employe)
);

CREATE TABLE Facture(
   id_facture INT,
   date_facturation DATE,
   montant_facturation DECIMAL(15,2),
   etat_facture VARCHAR(50),
   mode_paiement VARCHAR(50),
   id_commande INT NOT NULL,
   PRIMARY KEY(id_facture),
   FOREIGN KEY(id_commande) REFERENCES Commande(id_commande)
);

CREATE TABLE Contient(
   id_commande INT,
   id_article INT,
   quantite INT,
   PRIMARY KEY(id_commande, id_article),
   FOREIGN KEY(id_commande) REFERENCES Commande(id_commande),
   FOREIGN KEY(id_article) REFERENCES Nourriture(id_article)
);
