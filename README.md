# Base de Données - Restaurant "CPP"

## Description du Projet
Ce projet consiste en la conception et l'implémentation d'une base de données relationnelle pour la gestion d'un restaurant de plage, nommé "CPP". La base de données permet la gestion des tables, des clients, des commandes et de la facturation.

## Objectifs
- Centraliser et simplifier la gestion du restaurant.
- Assurer l'intégrité et la cohérence des données.
- Faciliter les analyses et le suivi des activités.
- Rendre le système extensible pour de futures évolutions (ex: commandes en ligne, réservations).

## Schéma Relationnel
Le modèle conceptuel de données (E/A) a été conçu en respectant la normalisation (3NF) pour optimiser la structure et éviter la redondance.

## Organisation du Dépôt

### 1. Fichiers SQL
📂 **SQL/** *(Dossier contenant les scripts SQL)*

- `01_Creation.sql` : Création des tables, définition des clés primaires et étrangères.
- `02_ContraintesValidation.sql` : Ajout des contraintes d'intégrité et validations.
- `03_JeuxDonnées.sql` : Peuplement de la base avec des données fictives.
- `04_Exploration.sql` : Requêtes d'analyse et d'exploration des données.

### 2. Documentation
📂 **Docs/** *(Dossier contenant la documentation)*

- `restaurant_cpp.pdf` : Rapport détaillé expliquant la conception et la mise en place de la base de données.
- `Schema.png` : Schéma relationnel de la base de données.
- `Schema.loo` : Schéma relationnel de la base de données sur looping.

## Technologies Utilisées
- **MySQL Workbench** : Conception et implémentation.
- **Looping** : Modélisation E/A.
- **SQL** : Langage de manipulation et de gestion des données.

## Exemples de Requêtes SQL
### 1. Afficher toutes les commandes en cours
```sql
SELECT * FROM Commande WHERE etat_commande = 'En cours';
```

### 2. Récupérer le chiffre d'affaires total du restaurant
```sql
SELECT SUM(montant_estimatf) AS chiffre_affaires FROM Facture;
```

### 3. Afficher les 5 plats les plus commandés
```sql
SELECT id_article, COUNT(*) AS nombre_commandes
FROM Contient
GROUP BY id_article
ORDER BY nombre_commandes DESC
LIMIT 5;
```

## Améliorations Possibles
- Ajouter un module de **gestion des réservations**.
- Intégrer une **gestion des livraisons**.
- Développer une **interface utilisateur** pour faciliter l'utilisation de la base.

## Installation
1. Clonez le dépôt :
```bash
git clone https://github.com/Tarek94000/BDD-Restaurant-CPP.git
```
2. Importez les scripts dans MySQL Workbench.
3. Exécutez les fichiers SQL dans l'ordre suivant :
   - `01_Creation.sql`
   - `02_ContraintesValidation.sql`
   - `03_JeuxDonnées.sql`
   - `04_Exploration.sql`

## Auteur
📌 **@Tarek94000**

N'hésitez pas à me contacter pour toute question ou suggestion d'amélioration ! 🚀
