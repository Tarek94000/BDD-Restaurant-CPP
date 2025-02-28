-- Script SQL pour tester différentes commandes et vérifier le bon fonctionnement de la base de données restaurant_cpp
USE restaurant_cpp;


-- Commandes SQL pertinentes pour tester la base de données d'un restaurant

-- 1. Gestion des Commandes
-- 1.1 Sélectionner toutes les commandes et leurs détails
SELECT * FROM Commande;

-- 1.2 Sélectionner toutes les commandes passées un jour particulier
SELECT * FROM Commande WHERE date_commande = '2024-10-25';

-- 1.3 Classement des articles les plus vendus
SELECT Nourriture.nom_nourriture, SUM(Contient.quantite) AS total_vendu
FROM Contient
JOIN Nourriture ON Contient.id_article = Nourriture.id_article
GROUP BY Nourriture.nom_nourriture
ORDER BY total_vendu DESC;

-- 1.4 Voir le montant moyen des commandes par type
SELECT type_commande, AVG(montant_estimatif) AS montant_moyen
FROM Commande
GROUP BY type_commande;

-- 1.5 Lister les articles dans une commande particulière
SELECT Nourriture.nom_nourriture, Contient.quantite
FROM Contient
JOIN Nourriture ON Contient.id_article = Nourriture.id_article
WHERE Contient.id_commande = 5;


-- 2. Gestion des Tables
-- 2.1 Voir quelles tables sont disponibles
SELECT * FROM Place WHERE etat_table = 'Libre';

-- 2.2 Voir quelles tables sont occupées et par quels clients
SELECT Place.id_table, Place.capacite, Client.nom_client
FROM Commande
JOIN Place ON Commande.id_table = Place.id_table
JOIN Client ON Commande.id_client = Client.id_client
WHERE Place.etat_table = 'Occupée';

-- 2.3 Compter le nombre de tables libres
SELECT COUNT(*) AS nombre_tables_libres
FROM Place
WHERE etat_table = 'Libre';


-- 3. Gestion des Employés
-- 3.1 Lister les employés disponibles sur un shift particulier (ex. : matin)
SELECT * FROM Employe WHERE shift = 'Matin';

-- 3.2 Voir quel employé est responsable d’une commande en cours
SELECT Employe.nom, Commande.id_commande
FROM Commande
JOIN Employe ON Commande.id_employe = Employe.id_employe
WHERE Commande.etat_commande = 'En cours';

-- 3.3 Calculer le salaire total mensuel de chaque poste
SELECT Employe.Poste, SUM(Statut.Salaire) AS salaire_total
FROM Employe
JOIN Statut ON Employe.Poste = Statut.Poste
GROUP BY Poste;


-- 4. Gestion des Ventes et des Plats
-- 4.1 Voir les plats les plus populaires (classement des articles les plus vendus)
SELECT Nourriture.nom_nourriture, SUM(Contient.quantite) AS total_vendu
FROM Contient
JOIN Nourriture ON Contient.id_article = Nourriture.id_article
GROUP BY Nourriture.nom_nourriture
ORDER BY total_vendu DESC;

-- 4.2 Voir les ventes totales pour chaque type de nourriture
SELECT Nourriture.type_nourriture, SUM(Contient.quantite * Nourriture.prix) AS total_ventes
FROM Contient
JOIN Nourriture ON Contient.id_article = Nourriture.id_article
GROUP BY Nourriture.type_nourriture;

-- 4.3 Calculer la moyenne des quantités vendues par article
SELECT Nourriture.nom_nourriture, AVG(Contient.quantite) AS quantite_moyenne
FROM Contient
JOIN Nourriture ON Contient.id_article = Nourriture.id_article
GROUP BY Nourriture.nom_nourriture;


-- 5. Gestion des Factures
-- 5.1 Lister les factures impayées
SELECT * FROM Facture WHERE etat_facture = 'En attente';

-- 5.2 Lister les commandes qui ont une facture payée avec un montant supérieur à 40 euros
SELECT Facture.id_facture, Commande.id_commande, Facture.montant_facturation
FROM Facture
JOIN Commande ON Facture.id_commande = Commande.id_commande
WHERE Facture.etat_facture = 'Payée' AND Facture.montant_facturation > 40;

-- 5.3 Voir les factures générées sur une période donnée
SELECT * FROM Facture
WHERE date_facturation BETWEEN '2024-10-22' AND '2024-10-24';

-- 6. Informations sur les Clients
-- 6.1 Lister les clients qui ont commandé au moins 2 fois
SELECT Client.nom_client, COUNT(Commande.id_commande) AS nombre_commandes
FROM Commande
JOIN Client ON Commande.id_client = Client.id_client
GROUP BY Client.nom_client
HAVING COUNT(Commande.id_commande) > 1;

-- 6.2 Sélectionner les clients avec le montant total dépensé
SELECT Client.nom_client, SUM(Facture.montant_facturation) AS total_depense
FROM Facture
JOIN Commande ON Facture.id_commande = Commande.id_commande
JOIN Client ON Commande.id_client = Client.id_client
GROUP BY Client.nom_client;

-- 7. Analyses et Indicateurs
-- 7.1 Voir le chiffre d'affaires total sur une période donnée
SELECT SUM(montant_facturation) AS chiffre_affaires
FROM Facture
WHERE date_facturation BETWEEN '2024-10-01' AND '2024-10-31';

-- 7.2 Identifier le shift le plus occupé en termes de commandes traitées
SELECT Employe.shift, COUNT(Commande.id_commande) AS total_commandes
FROM Commande
JOIN Employe ON Commande.id_employe = Employe.id_employe
GROUP BY Employe.shift
ORDER BY total_commandes DESC;

-- 7.3 Calculer le pourcentage de commandes annulées
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Commande)) AS pourcentage_annulees
FROM Commande
WHERE etat_commande = 'Annulée';


-- AUTRES commandes pour analyser les données --

-- 1. Sélectionner les détails des clients qui ont passé une commande sur place
SELECT Client.nom_client, Commande.type_commande, Commande.date_commande
FROM Commande
JOIN Client ON Commande.id_client = Client.id_client
WHERE Commande.type_commande = 'Sur place';

-- 2. Sélectionner les commandes avec les articles et les quantités associées
SELECT Commande.id_commande, Nourriture.nom_nourriture, Contient.quantite
FROM Commande
JOIN Contient ON Commande.id_commande = Contient.id_commande
JOIN Nourriture ON Contient.id_article = Nourriture.id_article;

-- 3. Sélectionner les employés et leurs rôles impliqués dans les commandes
SELECT Employe.nom, Employe.Poste, Commande.id_commande
FROM Commande
JOIN Employe ON Commande.id_employe = Employe.id_employe;

-- 4. Vérifier les tables qui sont actuellement occupées
SELECT * FROM Place WHERE etat_table = 'Occupée';

-- 5. Sélectionner les factures avec les montants facturés et les modes de paiement
SELECT Facture.id_facture, Facture.montant_facturation, Facture.mode_paiement
FROM Facture;

-- 6. Sélectionner les commandes annulées
SELECT * FROM Commande WHERE etat_commande = 'Annulée';

-- 7. Compter le nombre de commandes en cours
SELECT COUNT(*) AS nombre_commandes_en_cours
FROM Commande
WHERE etat_commande = 'En cours';

-- 8. Voir le total des ventes par type de nourriture
SELECT Nourriture.type_nourriture, SUM(Contient.quantite * Nourriture.prix) AS total_ventes
FROM Contient
JOIN Nourriture ON Contient.id_article = Nourriture.id_article
GROUP BY Nourriture.type_nourriture;

-- 9. Sélectionner les clients qui ont fait plus d'une commande
SELECT Client.nom_client, COUNT(Commande.id_commande) AS nombre_commandes
FROM Commande
JOIN Client ON Commande.id_client = Client.id_client
GROUP BY Client.nom_client
HAVING COUNT(Commande.id_commande) > 1;

-- 10. Sélectionner les commandes avec un montant estimatif supérieur à 30 euros
SELECT * FROM Commande WHERE montant_estimatif > 30;

-- 11. Sélectionner les commandes livrées ou à emporter
SELECT * FROM Commande WHERE type_commande IN ('Livraison', 'À emporter');

-- 12. Calculer la somme totale des factures payées
SELECT SUM(montant_facturation) AS total_factures_payees
FROM Facture
WHERE etat_facture = 'Payée';

-- 13. Voir les employés qui ont travaillé sur les commandes en cours
SELECT Employe.nom, Employe.shift, Commande.id_commande
FROM Commande
JOIN Employe ON Commande.id_employe = Employe.id_employe
WHERE Commande.etat_commande = 'En cours';

-- 14. Sélectionner les commandes avec le détail des tables associées
SELECT Commande.id_commande, Place.id_table, Place.capacite, Commande.type_commande
FROM Commande
JOIN Place ON Commande.id_table = Place.id_table
WHERE Commande.id_table IS NOT NULL;

-- 15. Sélectionner les commandes avec des factures en attente
SELECT Commande.id_commande, Facture.etat_facture, Facture.montant_facturation
FROM Commande
JOIN Facture ON Commande.id_commande = Facture.id_commande
WHERE Facture.etat_facture = 'En attente';

-- 16. Sélectionner les commandes qui ont été faites par des clients spécifiques (exemple : 'Jean Dupont')
SELECT *
FROM Commande
JOIN Client ON Commande.id_client = Client.id_client
WHERE Client.nom_client = 'Jean Dupont';

-- 17. Voir les employés qui travaillent sur des shifts de nuit
SELECT * FROM Employe WHERE shift = 'Nuit';

-- 18. Sélectionner les commandes avec le montant total des articles
SELECT Commande.id_commande, SUM(Contient.quantite * Nourriture.prix) AS montant_total
FROM Commande
JOIN Contient ON Commande.id_commande = Contient.id_commande
JOIN Nourriture ON Contient.id_article = Nourriture.id_article
GROUP BY Commande.id_commande;
