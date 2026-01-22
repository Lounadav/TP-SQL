
# TP SQL : Gestion et Analyse de Réseau

Ce dépôt contient les travaux pratiques réalisés dans le cadre du module de bases de données. L'objectif est de manipuler une base de données relationnelle modélisant une infrastructure réseau simple.

## 📂 Structure du projet

* `requetes.md` : Contient l'intégralité des requêtes SQL (INSERT, SELECT, JOIN, UPDATE, DELETE, AGGREGATION) ainsi que les réponses aux questions théoriques.

## 🗃️ Schéma de la Base de Données

Les requêtes reposent sur trois tables principales :

1.  **EQUIPEMENT** : Stocke les appareils physiques (Routeurs, Switchs, etc.).
    * *Colonnes :* `id_equipement`, `nom`, `type`, `adresse_ip`
2.  **INTERFACE** : Les interfaces réseaux rattachées aux équipements.
    * *Colonnes :* `id_interface`, `nom_interface`, `id_equipement` (FK)
3.  **MESURE_RESEAU** : Les relevés de performance (latence, débit).
    * *Colonnes :* `id_mesure`, `date_mesure`, `debit_mbps`, `latence_ms`, `id_interface` (FK)

## 🚀 Progression du TP

Le travail est divisé en plusieurs parties progressives :

* **Partie A :** Insertion (INSERT) des données initiales.
* **Partie B :** Interrogations simples (SELECT, WHERE).
* **Partie C :** Requêtes multi-tables (INNER JOIN).
* **Partie D :** Manipulation de données (UPDATE, DELETE).
* **Partie E :** Fonctions d'agrégation et groupement (COUNT, AVG, GROUP BY, HAVING).
* **Partie F :** Questions de compréhension théorique (Clés étrangères, filtrage).

## 🛠️ Utilisation

Pour tester ces requêtes :
1.  Ouvrez votre SGBD (MySQL, MariaDB, etc.).
2.  Créez la base de données et les tables selon le schéma ci-dessus.
3.  Copiez les blocs de code SQL depuis le fichier `requetes.md`.

---
*Projet réalisé par Lounadav*