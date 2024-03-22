-- Question 1 :
-- Vue pour les creneaux en semaine
CREATE VIEW vue_creneau_salle_semaine AS
SELECT 
    CASE
        WHEN c.Heure <= 10 THEN 'Matin'
        WHEN c.Heure => 10 AND c.Heure <=14 THEN 'Après-midi 1'
        WHEN c.Heure > 14 THEN AND c.Heure <= 19 THEN 'Après-midi 2'
        WHEN c.Heure > 19 AND c.Heure <= 20 THEN 'Soirée'
        ELSE 'Nuit'
    END AS creneaux_semaine,
    GROUP_CONCAT(s.nom ORDER BY s.id SEPARATOR ',') AS salles
FROM 
    creneau c
JOIN 
    salle s ON (
        (c.id = 1 AND s.id IN (1, 2, 3)) OR
        (c.id = 2 AND s.id IN (1, 2)) OR
        (c.id = 3 AND s.id IN (3)) OR
        (c.id = 4 AND s.id IN (1, 2)) OR
        (c.id = 5 AND s.id IN (3))
    )
GROUP BY 
    creneaux_semaine
ORDER BY
    FIELD(creneaux_semaine, 'Matin', 'Après-midi 1', 'Après-midi 2', 'Soirée', 'Nuit');

-- Vue pour les creneaux en week-end
CREATE VIEW vue_creneau_salle_weekend AS
SELECT 
    CASE
        WHEN c.id = 1 THEN 'Matin'
        WHEN c.id = 2 THEN 'Après-midi 1'
        WHEN c.id = 3 THEN 'Après-midi 2'
        WHEN c.id = 4 THEN 'Soirée'
        WHEN c.id = 5 THEN 'Nuit'
    END AS creneaux_weekend,
    GROUP_CONCAT(s.nom ORDER BY s.id SEPARATOR ',') AS salles
FROM
    creneau c
JOIN
    salle s ON (
        (c.id = 1 AND s.id IN (1, 2)) OR
        (c.id = 2 AND s.id IN (1, 2)) OR
        (c.id = 3 AND s.id IN (3)) OR
        (c.id = 4 AND s.id IN (1, 2, 3)) OR
        (c.id = 5 AND s.id IN (1, 2, 3))
    )
    GROUP BY 
creneaux_weekend
ORDER BY
    FIELD(creneaux_weekend, 'Matin', 'Après-midi 1', 'Après-midi 2', 'Soirée', 'Nuit');

-- Question 2 et 3:
-- Insert que j'ai déjà réalisé dans l'insertion de mes datas que je remet
INSERT INTO cinema.Personne (Nom, Prenom) VALUES ("Jackson", "Peter"), ("Plante", "Pascal"), ("Triet", "Justine"), ("Wood", "Elijah"), ("McCabe-Lokos", "Maxwell"), ("Machado Graner", "Milo"), ("McKellen", "Ian"), ("Gariépy", "Juliette "), ("Arlaud", "Swann"), ("Mortensen", "Viggo");

INSERT INTO cinema.Realisateur (Personne_id) VALUES (1), (2), (3);

INSERT INTO cinema.Acteur (Personne_id) VALUES (4), (5), (6), (7), (8), (9), (10);

INSERT INTO cinema.Film (Titre, Duree, Date_de_sortie, Synopsis, Avant_premiere, duree_exploitation, Realisateur_id, LimiteAge_id)
VALUES ("Le Seigneur des Anneaux : La communauté de l'anneau", 178, "2001-12-19", "Dans ce chapitre de la trilogie, le jeune et timide Hobbit, Frodon Sacquet, hérite d'un anneau. Bien loin d'être une simple babiole, il s'agit de l'Anneau Unique, un instrument de pouvoir absolu qui permettrait à Sauron, le Seigneur des ténèbres, de régner sur la Terre du Milieu et de réduire en esclavage ses peuples. Etc.", 0, 8, 1, 1),
        ("Le Seigneur des Anneaux : Les deux tours", 179, "2002-12-18", "Après la mort de Boromir et la disparition de Gandalf,  la Communauté s'est scindée en trois. Perdus dans les collines d'Emyn Muil  Frodon et Sam découvrent qu'ils sont suivis par Gollum  une créature versatile corrompue par l'Anneau etc.", 0, 8, 1, 1),
        ("Le Seigneur des Anneaux : Le retour du roi", 201, "2003-12-17", "Les armées de Sauron ont attaqué Minas Tirith  la capitale de Gondor. Jamais ce royaume autrefois puissant n'a eu autant besoin de son roi. Mais Aragorn trouvera-t-il en lui la volonté d'accomplir sa destinée ?", 0, 8, 1, 1),
        ("Les chambres rouges", 118, "2024-01-10", "Deux jeunes femmes se réveillent chaque matin aux portes du palais de justice pour pouvoir assister au procès hypermédiatisé", 0, 8, 2, 3),
        ("Anatomie d'une chute", 150, "2023-01-01", "Sandra, Samuel et leur fils malvoyant de 11 ans, Daniel, vivent depuis un an loin de tout, à la montagne. Un jour, Samuel est etc.", 0, 8, 3, 1)

INSERT INTO cinema.Film_has_Acteur (Film_id, Acteur_id) VALUES (1, 1), (1, 4), (1, 7), (2, 1), (2, 4), (2, 7), (3, 1), (3, 4), (3, 7), (4, 2), (4, 5), (5, 3), (5, 6);

INSERT INTO cinema.Film_has_Genre (Film_id, Genre_id) VALUES (1, 15), (1, 5), (2, 15), (2, 5), (3, 5), (3, 15), (4, 16), (5, 1), (5, 14), (5, 16);

-- Question 4:
SELECT Titre AS "Films réalisés par Peter Jackson" 
FROM Film Inner Join Realisateur ON Film.Realisateur_id = Realisateur.Personne_id
		  Inner Join Personne ON Realisateur.Personne_id = Personne.id
WHERE Personne.Nom = "Jackson" AND Personne.Prenom = "Peter"
ORDER BY Date_de_sortie ASC;

-- Question 5:
SELECT Titre AS "Films dans lesquels a joué Viggo Mortensen"
FROM Film f
    INNER JOIN film_has_acteur fa ON f.id = fa.Film_id
    INNER JOIN Acteur a ON fa.Acteur_id = a.Personne_id
    INNER JOIN Personne p ON a.Personne_id = p.id
WHERE p.Nom = 'Mortensen' AND p.Prenom = 'Viggo';

-- Question 6:
SELECT Titre AS "Films dans lesquels apparaissent Viggo Mortensen et Ian McKellen"
FROM Film f
    INNER JOIN film_has_acteur fa ON f.id = fa.Film_id
    INNER JOIN Acteur a ON fa.Acteur_id = a.Personne_id
    INNER JOIN Personne p ON a.Personne_id = p.id
WHERE (p.Nom = 'Mortensen' AND p.Prenom = 'Viggo') OR (p.Nom = 'McKellen' AND p.Prenom = 'Ian')
GROUP BY f.id, f.Titre
HAVING COUNT(DISTINCT p.id) = 2;

-- Question 7:
DELIMITER //
CREATE FUNCTION format_movie_duration(duration_in_min INT) RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE formatted_duration VARCHAR(10);

    SET hours = duration_in_min DIV 60;
    SET minutes = duration_in_min MOD 60;
    SET formatted_duration = CONCAT(hours, 'h', LPAD(minutes, 2, '0'));

    RETURN formatted_duration;
END //
DELIMITER ;
-- Exemple d'utilisation de la fonction:
SELECT format_movie_duration(133);

-- Question 8:

SELECT
    f.Titre AS Titre,
    f.Synopsis AS Synopsis,
    CONCAT(pr.Nom, ' ', pr.Prenom) AS Realisateur,
    GROUP_CONCAT(CONCAT(pa.Nom, ' ', pa.Prenom) SEPARATOR ', ') AS Acteurs,
    CONCAT(f.Duree DIV 60, 'h', LPAD(f.Duree MOD 60, 2, '0')) AS Duree_du_film,
    GROUP_CONCAT(g.Intitule SEPARATOR ', ') AS Genres,
    la.Intitule AS Public,
    f.Commentaire_additionnel AS Commentaire
FROM
    cinema.Film f
    JOIN cinema.Realisateur r ON f.Realisateur_id = r.id
    JOIN cinema.Personne pr ON r.Personne_id = pr.id
    JOIN cinema.Film_has_Acteur fa ON f.id = fa.Film_id
    JOIN cinema.Acteur a ON fa.Acteur_id = a.id
    JOIN cinema.Personne pa ON a.Personne_id = pa.id
    JOIN cinema.Film_has_Genre fg ON f.id = fg.Film_id
    JOIN cinema.Genre g ON fg.Genre_id = g.id
    JOIN cinema.LimiteAge la ON f.LimiteAge_id = la.id
WHERE
    f.Titre = "Anatomie d'une chute"
GROUP BY
    f.Titre,
    f.Synopsis,
    pr.Nom,
    pr.Prenom,
    f.Duree,
    la.Intitule,
    f.Commentaire_additionnel;

-- Création de la vue : 
CREATE VIEW movie_summary AS
SELECT
    f.Titre AS Titre,
    f.Synopsis AS Synopsis,
    CONCAT(pr.Nom, ' ', pr.Prenom) AS Realisateur,
    GROUP_CONCAT(CONCAT(pa.Nom, ' ', pa.Prenom) SEPARATOR ', ') AS Acteurs,
    CONCAT(f.Duree DIV 60, 'h', LPAD(f.Duree MOD 60, 2, '0')) AS Duree_du_film,
    GROUP_CONCAT(g.Intitule SEPARATOR ', ') AS Genres,
    la.Intitule AS Public,
    f.Commentaire_additionnel AS Commentaire
FROM
    cinema.Film f
    JOIN cinema.Realisateur r ON f.Realisateur_id = r.Personne_id
    JOIN cinema.Personne pr ON r.Personne_id = pr.id
    JOIN cinema.Film_has_Acteur fa ON f.id = fa.Film_id
    JOIN cinema.Acteur a ON fa.Acteur_id = a.id
    JOIN cinema.Personne pa ON a.Personne_id = pa.id
    JOIN cinema.Film_has_Genre fg ON f.id = fg.Film_id
    JOIN cinema.Genre g ON fg.Genre_id = g.id
    JOIN cinema.LimiteAge la ON f.LimiteAge_id = la.id
GROUP BY
    f.Titre,
    f.Synopsis,
    pr.Nom,
    pr.Prenom,
    f.Duree,
    la.Intitule,
    f.Commentaire_additionnel;

-- Question 9:
DELIMITER //
CREATE PROCEDURE print_movie_summary (IN movie_title VARCHAR(100))
BEGIN
    SELECT * FROM movie_summary
    WHERE Titre = movie_title;
END //
DELIMITER ;

-- Utilisation de la procédure:
CALL print_movie_summary ("Anatomie d'une chute");

-- Question 10:
-- Programmation du Seigneur des anneaux : la communauté de l'anneau en VF sur toutes les séances matin (semaine et weekend) dans la salle 01
INSERT INTO
    plan_seance (Film_id, Langue_id, Salle_id, Creneau_id)
SELECT
    (
        SELECT id
        FROM Film
        WHERE Titre = "Le Seigneur des Anneaux : La communauté de l'anneau"
    ) AS Film_id,
    (
        SELECT id
        FROM Langue
        WHERE Langue = 'VF'
    ) AS Langue_id,
    (
        SELECT id
        FROM Salle
        WHERE id = '01'
    ) AS Salle_id,
    Creneau.id AS Creneau_id
FROM Creneau
WHERE HOUR (Creneau.Heure) >= 9 AND HOUR (Creneau.Heure) < 12;

-- Programmation d'Anatomie d'une chute en VF sur toutes les séances Après-midi 2 la semaine et soirée du week-end dans la salle 03
INSERT INTO
    plan_seance (Film_id, Langue_id, Salle_id, Creneau_id)
SELECT
    (
        SELECT id
        FROM Film
        WHERE Titre = "Anatomie d'une chute"
    ) AS Film_id,
    (
        SELECT id
        FROM Langue
        WHERE Langue = 'VF'
    ) AS Langue_id,
    (
        SELECT id
        FROM Salle
        WHERE id = '03'
    ) AS Salle_id,
    Creneau.id AS Creneau_id
FROM Creneau
WHERE
    (
        (
            WEEKDAY (Creneau.Date) < 5
            AND HOUR (Creneau.Heure) >= 14
            AND HOUR (Creneau.Heure) < 18
        )
        OR (
            WEEKDAY (Creneau.Date) >= 5
            AND HOUR (Creneau.Heure) >= 18
        )
    );

-- Question 11:

SELECT
    f.Titre AS Film,
    l.Langue AS Langue,
    c.Date AS Date,
    c.Heure AS Heure,
    s.Salle_id AS Salle,
    CASE
        WHEN DAYOFWEEK(c.Date) BETWEEN 2 AND 6 THEN 'Semaine'
        WHEN DAYOFWEEK(c.Date) IN (1, 7) THEN 'Weekend'
    END AS Creneaux
FROM
    cinema.Plan_Seance s
    INNER JOIN cinema.Film f ON s.Film_id = f.id
    INNER JOIN cinema.Creneau c ON s.Creneau_id = c.id
    INNER JOIN cinema.Langue l ON s.Langue_id = l.id
WHERE
    DAYOFWEEK(c.Date) BETWEEN 1 AND 7
ORDER BY
    f.Titre ASC,
    c.Date ASC,
    c.Heure ASC;

-- Question 12: 

INSERT INTO cinema.Billet (Tarif_id, Seance_id, Salle_id)
SELECT Tarif_id, Seance_id, Salle_id
FROM (
    SELECT 
        t.id AS Tarif_id,
        (SELECT ps.id 
         FROM cinema.Plan_Seance ps 
         JOIN cinema.Creneau c ON ps.Creneau_id = c.id 
         WHERE ps.Film_id = 1 AND c.Date = '2024-03-05' AND c.Heure = '10:00:00'
         LIMIT 1) AS Seance_id,
        (SELECT id FROM cinema.Salle WHERE Nom = 'Salle 02') AS Salle_id
    FROM cinema.Tarif t
    WHERE t.Intitule IN ('Tarif plein', 'Tarif demandeur d\'emploi')
) AS tickets;

SELECT b.id AS Ticket_ID, t.Intitule AS Tarif, f.Titre AS Film, c.Date AS Date, c.Heure AS Heure, s.Nom AS Salle
FROM cinema.Billet b
JOIN cinema.Tarif t ON b.Tarif_id = t.id
JOIN cinema.Plan_Seance ps ON b.Seance_id = ps.id
JOIN cinema.Creneau c ON ps.Creneau_id = c.id
JOIN cinema.Salle s ON b.Salle_id = s.id
JOIN cinema.Film f ON ps.Film_id = f.id
WHERE f.Titre = 'Le Seigneur des Anneaux : La communauté de l\'anneau' AND c.Date = '2024-03-05' AND c.Heure = '10:00:00'
ORDER BY b.id;

-- Question 13:
SELECT 
    (SELECT Nb_Places FROM cinema.Salle WHERE Nom = 'Salle 02') - 
    (SELECT COUNT(*) FROM cinema.Billet WHERE Seance_id IN 
        (SELECT ps.id FROM cinema.Plan_Seance ps 
         JOIN cinema.Creneau c ON ps.Creneau_id = c.id 
         WHERE c.Date = '2024-03-05' AND c.Heure = '10:00:00')
    ) AS Places_Restantes;


-- Question 14:
-- Il est envisageable d'utiliser un déclencheur BEFORE INSERT sur la table Plan_Seance qui vérifiera si la séance inséré ne chevauche pas les
-- horaires de séances existantes pour la même salle et le même créneau.
