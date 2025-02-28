-- Script SQL pour peupler les tables de la base de données restaurant_cpp avec divers scénarios
USE restaurant_cpp;

-- Peuplement de la table Statut
INSERT INTO Statut (Poste, Salaire) VALUES ('Serveur', '2000');
INSERT INTO Statut (Poste, Salaire) VALUES ('Cuisinier', '2500');
INSERT INTO Statut (Poste, Salaire) VALUES ('Manager', '3500');
INSERT INTO Statut (Poste, Salaire) VALUES ('Hôte', '1800');
INSERT INTO Statut (Poste, Salaire) VALUES ('Plongeur', '1500');
INSERT INTO Statut (Poste, Salaire) VALUES ('Barman', '2200');

-- Peuplement de la table Employe
INSERT INTO Employe (id_employe, nom, shift, Poste) VALUES (1, 'Alice Martin', 'Matin', 'Serveur');
INSERT INTO Employe (id_employe, nom, shift, Poste) VALUES (2, 'Bob Durand', 'Soir', 'Cuisinier');
INSERT INTO Employe (id_employe, nom, shift, Poste) VALUES (3, 'Claire Dubois', 'Journee', 'Manager');
INSERT INTO Employe (id_employe, nom, shift, Poste) VALUES (4, 'David Leroy', 'Matin', 'Hôte');
INSERT INTO Employe (id_employe, nom, shift, Poste) VALUES (5, 'Emma Fournier', 'Soir', 'Plongeur');
INSERT INTO Employe (id_employe, nom, shift, Poste) VALUES (6, 'Francois Petit', 'Nuit', 'Barman');
INSERT INTO Employe (id_employe, nom, shift, Poste) VALUES (7, 'Nina Ricci', 'Matin', 'Serveur');
INSERT INTO Employe (id_employe, nom, shift, Poste) VALUES (8, 'Hugo Lambert', 'Nuit', 'Cuisinier');

-- Peuplement de la table Place
INSERT INTO Place (id_table, capacite, etat_table) VALUES (1, 4, 'Libre');
INSERT INTO Place (id_table, capacite, etat_table) VALUES (2, 2, 'Occupée');
INSERT INTO Place (id_table, capacite, etat_table) VALUES (3, 6, 'Occupée');
INSERT INTO Place (id_table, capacite, etat_table) VALUES (4, 4, 'Libre');
INSERT INTO Place (id_table, capacite, etat_table) VALUES (5, 8, 'Libre');
INSERT INTO Place (id_table, capacite, etat_table) VALUES (6, 2, 'Occupée');
INSERT INTO Place (id_table, capacite, etat_table) VALUES (7, 3, 'Occupée');
INSERT INTO Place (id_table, capacite, etat_table) VALUES (8, 5, 'Libre');

-- Peuplement de la table Client
INSERT INTO Client (id_client, nom_client, telephone, email) VALUES (1, 'Jean Dupont', '0606060606', 'jean.dupont@gmail.com');
INSERT INTO Client (id_client, nom_client, telephone, email) VALUES (2, 'Marie Curie', '0707070707', 'marie.curie@gmail.com');
INSERT INTO Client (id_client, nom_client, telephone, email) VALUES (3, 'Lucas Roche', '0808080808', 'lucas.roche@gmail.com');
INSERT INTO Client (id_client, nom_client, telephone, email) VALUES (4, 'Sophie Moreau', '0909090909', 'sophie.moreau@gmail.com');
INSERT INTO Client (id_client, nom_client, telephone, email) VALUES (5, 'Henri Leblanc', '0607070707', 'henri.leblanc@gmail.com');
INSERT INTO Client (id_client, nom_client, telephone, email) VALUES (6, 'Emma Lemoine', '0618181818', 'emma.lemoine@gmail.com');
INSERT INTO Client (id_client, nom_client, telephone, email) VALUES (7, 'Paul Martin', '0656565656', 'paul.martin@gmail.com');
INSERT INTO Client (id_client, nom_client, telephone, email) VALUES (8, 'Julie Dubois', '0626262626', 'julie.dubois@gmail.com');

-- Peuplement de la table Nourriture
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (1, 'Coca-Cola', 'Boisson', 3.50);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (2, 'Salade Cesar', 'Entrée', 12.00);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (3, 'Pizza Margherita', 'Plat Principal', 15.00);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (4, 'Tiramisu', 'Dessert', 6.50);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (5, 'Eau Minérale', 'Boisson', 2.00);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (6, 'Spaghetti Bolognaise', 'Plat Principal', 14.00);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (7, 'Burger Classique', 'Plat Principal', 13.50);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (8, 'Veloute de champignons', 'Entrée', 7.00);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (9, 'Mousse au chocolat', 'Dessert', 5.00);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (10, 'Smoothie Mangue', 'Boisson', 4.50);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (11, 'Pizza 4 Fromages', 'Entrée', 8.50);
INSERT INTO Nourriture (id_article, nom_nourriture, type_nourriture, prix) VALUES (12, 'Poulet Roti', 'Plat Principal', 17.00);

-- Peuplement de la table Commande (avec divers scénarios)
INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (1, '2024-10-22', 'Sur place', 'En cours', 35.50, 1, 1, 1);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (2, '2024-10-22', 'Sur place', 'Terminée', 27.00, 2, 2, 2);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (3, '2024-10-21', 'À emporter', 'Prête', 18.50, 3, NULL, 1);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (4, '2024-10-20', 'Livraison', 'Annulée', 0.00, 4, NULL, 4);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (5, '2024-10-23', 'Sur place', 'En préparation', 45.00, 5, 5, 3);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (6, '2024-10-24', 'À emporter', 'En cours', 22.00, 6, NULL, 6);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (7, '2024-10-25', 'Livraison', 'En attente', 30.00, 1, NULL, 4);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (8, '2024-10-26', 'Sur place', 'En attente', 60.00, 3, 6, 2);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (9, CURRENT_DATE, 'Sur place', 'En cours', 55.00, 7, 7, 7);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (10, '2024-10-26', 'Livraison', 'En attente', 25.00, 2, NULL, 4);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (11, '2024-10-26', 'À emporter', 'Prête', 33.00, 5, NULL, 6);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (12, '2024-10-25', 'Sur place', 'En cours', 80.00, 6, 8, 8);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (13, '2024-10-24', 'Livraison', 'Terminée', 40.00, 7, NULL, 3);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (14, '2024-10-23', 'À emporter', 'En cours', 50.00, 8, NULL, 1);

INSERT INTO Commande (id_commande, date_commande, type_commande, etat_commande, montant_estimatif, id_client, id_table, id_employe) 
VALUES (15, CURRENT_DATE, 'Sur place', 'En attente', 75.00, 4, 3, 5);

-- Peuplement de la table Contient (Articles des commandes)
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (1, 1, 2);  -- Commande 1 : 2 Coca-Cola
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (1, 3, 1);  -- Commande 1 : 1 Pizza Margherita
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (2, 2, 1);  -- Commande 2 : 1 Salade Cesar
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (2, 5, 2);  -- Commande 2 : 2 Eaux Minérales
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (3, 6, 1);  -- Commande 3 : 1 Spaghetti Bolognaise
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (4, 4, 1);  -- Commande 4 : 1 Tiramisu (commande annulée)
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (5, 2, 1);  -- Commande 5 : 1 Salade Cesar
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (5, 4, 2);  -- Commande 5 : 2 Tiramisu
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (5, 1, 1);  -- Commande 5 : 1 Coca-Cola
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (6, 7, 2);  -- Commande 6 : 2 Burger Classique
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (6, 10, 1);  -- Commande 6 : 1 Smoothie Mangue
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (7, 8, 1);  -- Commande 7 : 1 Veloute de champignons
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (7, 9, 2);  -- Commande 7 : 2 Mousses au chocolat
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (8, 3, 2);  -- Commande 8 : 2 Pizza Margherita
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (8, 1, 3);  -- Commande 8 : 3 Coca-Cola
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (9, 12, 1); -- Commande 9 : 1 Poulet Roti
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (9, 5, 1);  -- Commande 9 : 1 Eau Minérale
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (10, 7, 1);  -- Commande 10 : 1 Burger Classique
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (10, 5, 2);  -- Commande 10 : 2 Eaux Minérales
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (11, 3, 1);  -- Commande 11 : 1 Pizza Margherita
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (11, 9, 1);  -- Commande 11 : 1 Mousse au chocolat
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (11, 1, 1);  -- Commande 11 : 1 Coca-Cola
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (12, 12, 2); -- Commande 12 : 2 Poulet Roti
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (12, 2, 1);  -- Commande 12 : 1 Salade Cesar
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (13, 4, 1);  -- Commande 13 : 1 Tiramisu
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (13, 10, 1); -- Commande 13 : 1 Smoothie Mangue
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (14, 6, 1);  -- Commande 14 : 1 Spaghetti Bolognaise
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (14, 11, 1); -- Commande 14 : 1 Pizza 4 Fromages
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (15, 8, 1);  -- Commande 15 : 1 Veloute de champignons
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (15, 3, 2);  -- Commande 15 : 2 Pizza Margherita
INSERT INTO Contient (id_commande, id_article, quantite) VALUES (15, 5, 3);  -- Commande 15 : 3 Eaux Minérales

-- Peuplement de la table Facture (uniquement pour les commandes terminées)
INSERT INTO Facture (id_facture, date_facturation, montant_facturation, etat_facture, mode_paiement, id_commande)
VALUES (1, '2024-10-22', 27.00, 'Payée', 'Carte bancaire', 2);

INSERT INTO Facture (id_facture, date_facturation, montant_facturation, etat_facture, mode_paiement, id_commande)
VALUES (2, '2024-10-23', 45.00, 'Payée', 'Espèces', 5);

INSERT INTO Facture (id_facture, date_facturation, montant_facturation, etat_facture, mode_paiement, id_commande)
VALUES (4, '2024-10-24', 40.00, 'Payée', 'Carte bancaire', 13);

INSERT INTO Facture (id_facture, date_facturation, montant_facturation, etat_facture, mode_paiement, id_commande)
VALUES (5, '2024-10-26', 33.00, 'En attente', 'Espèces', 11);

-- Ajouter une facture en attente pour une commande
INSERT INTO Facture (id_facture, date_facturation, montant_facturation, etat_facture, mode_paiement, id_commande)
VALUES (3, CURRENT_DATE, 60.00, 'En attente', 'Carte bancaire', 8);
