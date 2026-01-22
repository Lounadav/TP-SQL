
# Réponses aux questions du TP SQL


## PARTIE A : Insertion de données

### Q1 - Ajout d'un équipement
```sql
INSERT INTO EQUIPEMENT VALUES (1, "Routeur Principal", "Routeur", "192.168.1.1");
```
### Q2 - Ajout des interfaces
```sql

INSERT INTO INTERFACE VALUES (1, "eth0", 1);
INSERT INTO INTERFACE VALUES (2, "eth1", 1);
```
### Q3 - Ajout d'une mesure réseau
```sql

INSERT INTO MESURE_RESEAU VALUES (1, '2025-03-20 10:00:00', 100.5, 12, 1);
```
## PARTIE B : Sélection simple

### Q1 - Tout le contenu de la table Équipement
```sql

SELECT * FROM EQUIPEMENT;
```
### Q2 - Noms et IP des équipements
```sql

SELECT nom, adresse_ip FROM EQUIPEMENT;
```
### Q3 - Mesures avec une latence élevée (>= 20ms)
```sql

SELECT * FROM MESURE_RESEAU WHERE latence_ms >= 20;
```
## PARTIE C : Jointures (JOIN)


### Q1 - Date, débit et nom de l'équipement
```sql

SELECT 
    mesure_reseau.date_mesure,
    mesure_reseau.debit_mbps,
    equipement.nom 
FROM mesure_reseau 
JOIN interface ON mesure_reseau.id_interface = interface.id_equipement;
JOIN equipement  ON interface.id_equipement = equipement.id_equipement;
```
### Q2 - Détails des mesures avec le nom de l'interface
```sql

SELECT 
    mesure_reseau.*, 
    interface.nom_interface 
FROM mesure_reseau
JOIN interface ON mesure_reseau.id_interface = interface.id_interface;
```
### Q3 - Mesures spécifiques à l'interface "eth0"
```sql

SELECT 
    mesure_reseau.* FROM mesure_reseau
JOIN interface ON mesure_reseau.id_interface = interface.id_interface
WHERE interface.nom_interface = "eth0";
```
## PARTIE D : Mises à jour et Suppressions

### Q1 - Modification de l'IP de l'équipement 1
```sql

UPDATE equipement 
SET adresse_ip = "192.168.1.254"
WHERE id_equipement = 1;
```
### Q2 - Augmentation de la latence de 5ms pour toutes les mesures
```sql

UPDATE mesure_reseau 
SET latence_ms = latence_ms + 5;
```
### Q3 - Suppression de la mesure n°1
```sql

DELETE FROM mesure_reseau WHERE id_mesure = 1;
```
## PARTIE E : Agrégations (GROUP BY)

### Q1 - Nombre de mesures par interface (incluant celles sans mesures)
```sql

SELECT
    i.nom_interface,
    COUNT(m.id_mesure) AS nombre_mesures
FROM interface i
LEFT JOIN mesure_reseau m ON i.id_interface = m.id_interface
GROUP BY i.id_interface, i.nom_interface;
```
### Q2 - Latence moyenne par interface
```sql

SELECT
    i.nom_interface,
    AVG(m.latence_ms) AS latence_moyenne
FROM interface i
JOIN mesure_reseau m ON i.id_interface = m.id_interface
GROUP BY i.id_interface, i.nom_interface;
```
### Q3 - Interfaces ayant plus d'une mesure
```sql

SELECT
    i.nom_interface,
    COUNT(m.id_mesure) AS nombre_mesures
FROM interface i
JOIN mesure_reseau m ON i.id_interface = m.id_interface
GROUP BY i.id_interface, i.nom_interface
HAVING COUNT(m.id_mesure) > 1;
```
## PARTIE F : Questions théoriques
### Q1 - Rôle des clés étrangères
Les clés étrangères garantissent l'intégrité référentielle des données. Elles empêchent l'ajout d'enregistrements "orphelins" (par exemple, insérer une mesure liée à une interface qui n'existe pas dans la base de données).

### Q2 - Différence entre WHERE et HAVING
WHERE : Sert à filtrer les lignes brutes avant que le regroupement (GROUP BY) ne soit effectué.
HAVING : Sert à filtrer les résultats d'un calcul ou d'une agrégation après que le regroupement a été effectué.