IF EXISTS (SELECT 1 FROM cinema.Salle)
BEGIN
    DELETE FROM cinema.Salle
END
INSERT INTO cinema.Salle (Nom, Nb_places) VALUES ("Salle 01", 100), ("Salle 02", 150), ("Salle 03", 200);

IF EXISTS (SELECT 1 FROM cinema.Langue)
BEGIN
    DELETE FROM cinema.Langue
END
INSERT INTO cinema.Langue (Langue) VALUES ("VOSTFR"), ("VF");

IF EXISTS (SELECT 1 FROM cinema.LimiteAge)
BEGIN
    DELETE FROM cinema.LimiteAge
END
INSERT INTO cinema.LimiteAge (Intitule, Age_Mini) VALUES ("Tout public", 0), ("Interdit aux moins de 12 ans", 12), ("Interdit aux moins de 16 ans", 16), ("Interdit aux mineurs", 18);

IF EXISTS (SELECT 1 FROM cinema.Genre)
BEGIN
    DELETE FROM cinema.Genre
END
INSERT INTO cinema.Genre (Intitule) VALUES ("Drame"), ("Comedie"), ("Aventure"), ("Animation"), ("Famille"), ("Romance"), ("Fantastique"), ("Science-fiction"), ("Comédie"), ("Dramatique"), ("Western"), ("Action"), ("Documentaire"), ("Policier"), ("Fantasy"), ("Thriller");

IF EXISTS (SELECT 1 FROM cinema.Tarif)
BEGIN
    DELETE FROM cinema.Tarif
END
INSERT INTO cinema.Tarif (Intitule, Prix) VALUES ("Tarif plein", 9.80), ("Tarif etudiant", 5), ("Tarif demandeur d'emploi", 5), ("Tarif -14 ans", 3.80);

IF EXISTS (SELECT 1 FROM cinema.Personne)
BEGIN
    DELETE FROM cinema.Personne
END
INSERT INTO cinema.Personne (Nom, Prenom) VALUES ("Jackson", "Peter"), ("Plante", "Pascal"), ("Triet", "Justine"), ("Wood", "Elijah"), ("McCabe-Lokos", "Maxwell"), ("Machado Graner", "Milo"), ("McKellen", "Ian"), ("Gariépy", "Juliette "), ("Arlaud", "Swann"), ("Mortensen", "Viggo");

IF EXISTS (SELECT 1 FROM cinema.Creneau)
BEGIN
    DELETE FROM cinema.Creneau
END
INSERT INTO cinema.Creneau (Jour, Heure) VALUES ("2024/03/05", "10:00:00"), ("2024/03/05", "14:00:00"), ("2024/03/05", "18:15:00"), ("2024/03/05", "20:00:00"), ("2024/03/05", "22:00:00");

IF EXISTS (SELECT 1 FROM cinema.Realisateur)
BEGIN
    DELETE FROM cinema.Realisateur
END
INSERT INTO cinema.Realisateur (Personne_id) VALUES (1), (2), (3);

IF EXISTS (SELECT 1 FROM cinema.Acteur)
BEGIN
    DELETE FROM cinema.Acteur
END
INSERT INTO cinema.Acteur (Personne_id) VALUES (4), (5), (6), (7), (8), (9), (10);

IF EXISTS (SELECT 1 FROM cinema.Film_has_Genre)
BEGIN
    DELETE FROM cinema.Film_has_Genre
END
INSERT INTO cinema.Film_has_Genre (Film_id, Genre_id) VALUES ();

IF EXISTS (SELECT 1 FROM cinema.Plan_Seance)
BEGIN
    DELETE FROM cinema.Plan_Seance
END
INSERT INTO cinema.Plan_Seance (Jour, Heure, Film_id, Salle_id) VALUES ();

IF EXISTS (SELECT 1 FROM cinema.Film_has_Acteur)
BEGIN
    DELETE FROM cinema.Film_has_Acteur
END
INSERT INTO cinema.Film_has_Acteur (Film_id, Acteur_id) VALUES ();

IF EXISTS (SELECT 1 FROM cinema.Billet)
BEGIN
    DELETE FROM cinema.Billet
END
INSERT INTO cinema.Billet (Tarif_id, Seance_id, Salle_id) VALUES ();

IF EXISTS (SELECT 1 FROM cinema.Film)
BEGIN
    DELETE FROM cinema.Film
END
INSERT INTO cinema.Film (Titre, Duree, Date_de_sortie, Synopsis, Commentaire_additionnel, Avant_premiere, duree_exploitation, Version_id, Realisateur_id, LimiteAge_id, Tarif_id)
VALUES ("Le Seigneur des Anneaux : La communauté de l'anneau", 178, "", "Dans ce chapitre de la trilogie, le jeune et timide Hobbit, Frodon Sacquet, hérite d'un anneau. Bien loin d'être une simple babiole, il s'agit de l'Anneau Unique, un instrument de pouvoir absolu qui permettrait à Sauron, le Seigneur des ténèbres, de régner sur la Terre du Milieu et de réduire en esclavage ses peuples. Etc."),
        ("Le Seigneur des Anneaux : Les deux tours", 179, "", "Après la mort de Boromir et la disparition de Gandalf,  la Communauté s'est scindée en trois. Perdus dans les collines d'Emyn Muil  Frodon et Sam découvrent qu'ils sont suivis par Gollum  une créature versatile corrompue par l'Anneau etc."),
        ("Le Seigneur des Anneaux : Le retour du roi", 201, "", "Les armées de Sauron ont attaqué Minas Tirith  la capitale de Gondor. Jamais ce royaume autrefois puissant n'a eu autant besoin de son roi. Mais Aragorn trouvera-t-il en lui la volonté d'accomplir sa destinée ?"),
        ("Les chambres rouges", 118, "", "Deux jeunes femmes se réveillent chaque matin aux portes du palais de justice pour pouvoir assister au procès hypermédiatisé"),
        ("Anatomie d'une chute", 150, "", "Sandra, Samuel et leur fils malvoyant de 11 ans, Daniel, vivent depuis un an loin de tout, à la montagne. Un jour, Samuel est etc.")






