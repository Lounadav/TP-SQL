PARTIE A :
Q1 - INSERT INTO EQUIPEMENT VALUES (1,"Routeur Principal","Routeur","192.168.1.1")
Q2- INSERT INTO INTERFACE VALUES (1, "eth0", 1);
INSERT INTO INTERFACE VALUES (2, "eth1", 1)
Q3 - INSERT INTO MESURE_RESEAU VALUES (1,'2025-03-20 10:00:00',100.5,12,1)
PARTIE B : 
Q1- SELECT * FROM EQUIPEMENT
Q2- SELECT nom, adresse_ip FROM EQUIPEMENT
Q3- SELECT * FROM MESURE_RESEAU WHERE latence_ms >=20 
PARTIE C : 
Q1 - SELECT mesure_reseau.date_mesure,mesure_reseau.debit_mbps,equipement.nom FROM `mesure_reseau` 
JOIN equipement ON mesure_reseau.id_interface=equipement.id_equipement;
Q2 - SELECT mesure_reseau.*, interface.nom_interface FROM mesure_reseau
JOIN interface ON mesure_reseau.id_interface=interface.id_interface;
Q3-SELECT mesure_reseau.* FROM mesure_reseau
JOIN interface ON mesure_reseau.id_interface=interface.id_interface
WHERE interface.nom_interface="eth0"
PARTIE D : 
Q1- UPDATE equipement SET equipement.adresse_ip="192.168.1.254"
WHERE equipement.id_equipement=1; 
Q2- UPDATE mesure_reseau SET mesure_reseau.latence_ms=mesure_reseau.latence_ms+5
Q3- DELETE FROM mesure_reseau WHERE mesure_reseau.id_mesure=1;
PARTIE E : 
 Q1-      SELECT
            i.nom_interface,
            COUNT(m.id_mesure) AS nombre_mesures
        FROM
            interface i
        LEFT JOIN
            mesure_reseau m ON i.id_interface = m.id_interface
        GROUP BY
            i.id_interface, i.nom_interface;

 Q2 -SELECT
    i.nom_interface,
    AVG(m.latence_ms) AS latence_moyenne
FROM
    interface i
JOIN
    mesure_reseau m ON i.id_interface = m.id_interface
GROUP BY
    i.id_interface, i.nom_interface;
Q3- SELECT
    i.nom_interface,
    COUNT(m.id_mesure) AS nombre_mesures
FROM
    interface i
JOIN
    mesure_reseau m ON i.id_interface = m.id_interface
GROUP BY
    i.id_interface, i.nom_interface
HAVING
    COUNT(m.id_mesure) > 1;
PARTIE F : 
Q1 - Les clés étrangères garantissent l'intégrité des données en empêchant l'ajout d'enregistrements orphelins (comme une mesure liée à aucune interface existante).

Q2 - WHERE sert à filtrer les lignes brutes avant tout regroupement

HAVING sert à filtrer les résultats d'un calcul après le regroupement 