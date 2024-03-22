-- DELETE TABLE
DELETE FROM cinema.Billet;
DELETE FROM cinema.Plan_Seance;
DELETE FROM cinema.Creneau;
DELETE FROM cinema.Film_has_Genre;
DELETE FROM cinema.Film_has_Acteur;
DELETE FROM cinema.Film;
DELETE FROM cinema.Acteur;
DELETE FROM cinema.Realisateur;
DELETE FROM cinema.Personne;
DELETE FROM cinema.Tarif;
DELETE FROM cinema.LimiteAge;
DELETE FROM cinema.Genre;
DELETE FROM cinema.Langue;
DELETE FROM cinema.Salle;



INSERT INTO cinema.Salle (Nom, Nb_places) VALUES ("Salle 01", 100), ("Salle 02", 150), ("Salle 03", 200);
   
INSERT INTO cinema.Langue (Langue) VALUES ("VOSTFR"), ("VF");

INSERT INTO cinema.Genre (Intitule) VALUES ("Drame"), ("Comedie"), ("Aventure"), ("Animation"), ("Famille"), ("Romance"), ("Fantastique"), ("Science-fiction"), ("Comédie"), ("Dramatique"), ("Western"), ("Action"), ("Documentaire"), ("Policier"), ("Fantasy"), ("Thriller");

INSERT INTO cinema.LimiteAge (Intitule, Age_Mini) VALUES ("Tout public", 0), ("Interdit aux moins de 12 ans", 12), ("Interdit aux moins de 16 ans", 16), ("Interdit aux mineurs", 18);

INSERT INTO cinema.Tarif (Intitule, Prix) VALUES ("Tarif plein", 9.80), ("Tarif etudiant", 5), ("Tarif demandeur d'emploi", 5), ("Tarif -14 ans", 3.80);

INSERT INTO cinema.Personne (Nom, Prenom) VALUES ("Jackson", "Peter"), ("Plante", "Pascal"), ("Triet", "Justine"), ("Wood", "Elijah"), ("McCabe-Lokos", "Maxwell"), ("Machado Graner", "Milo"), ("McKellen", "Ian"), ("Gariépy", "Juliette "), ("Arlaud", "Swann"), ("Mortensen", "Viggo");

INSERT INTO cinema.Realisateur (Personne_id) VALUES (1), (2), (3);

INSERT INTO cinema.Acteur (Personne_id) VALUES (4), (5), (6), (7), (8), (9), (10);

INSERT INTO cinema.Film (Titre, Duree, Date_de_sortie, Synopsis, Avant_premiere, duree_exploitation, Realisateur_id, LimiteAge_id)
VALUES ("Le Seigneur des Anneaux : La communauté de l'anneau", 178, "2001-12-19", "Dans ce chapitre de la trilogie, le jeune et timide Hobbit, Frodon Sacquet, hérite d'un anneau. Bien loin d'être une simple babiole, il s'agit de l'Anneau Unique, un instrument de pouvoir absolu qui permettrait à Sauron, le Seigneur des ténèbres, de régner sur la Terre du Milieu et de réduire en esclavage ses peuples. Etc.", 0, 8, 1, 1),
        ("Le Seigneur des Anneaux : Les deux tours", 179, "2002-12-18", "Après la mort de Boromir et la disparition de Gandalf,  la Communauté s'est scindée en trois. Perdus dans les collines d'Emyn Muil  Frodon et Sam découvrent qu'ils sont suivis par Gollum  une créature versatile corrompue par l'Anneau etc.", 0, 8, 1, 1),
        ("Le Seigneur des Anneaux : Le retour du roi", 201, "2003-12-17", "Les armées de Sauron ont attaqué Minas Tirith  la capitale de Gondor. Jamais ce royaume autrefois puissant n'a eu autant besoin de son roi. Mais Aragorn trouvera-t-il en lui la volonté d'accomplir sa destinée ?", 0, 8, 1, 1),
        ("Les chambres rouges", 118, "2024-01-10", "Deux jeunes femmes se réveillent chaque matin aux portes du palais de justice pour pouvoir assister au procès hypermédiatisé", 0, 8, 2, 3),
        ("Anatomie d'une chute", 150, "2023-01-01", "Sandra, Samuel et leur fils malvoyant de 11 ans, Daniel, vivent depuis un an loin de tout, à la montagne. Un jour, Samuel est etc.", 0, 8, 3, 1);

INSERT INTO cinema.Film_has_Acteur (Film_id, Acteur_id) VALUES (1, 1), (1, 4), (1, 7), (2, 1), (2, 4), (2, 7), (3, 1), (3, 4), (3, 7), (4, 2), (4, 5), (5, 3), (5, 6);
INSERT INTO cinema.Film_has_Genre (Film_id, Genre_id) VALUES (1, 15), (1, 5), (2, 15), (2, 5), (3, 5), (3, 15), (4, 16), (5, 1), (5, 14), (5, 16);

INSERT INTO cinema.Creneau (Date, Heure) VALUES ("2024-03-05", "10:00:00"), ("2024-03-05", "14:00:00"), ("2024-03-05", "18:15:00"), ("2024-03-05", "20:00:00"), ("2024-03-05", "22:00:00"), ("2024-03-10", "10:00:00"), ("2024-03-10", "14:00:00"), ("2024-03-10", "18:15:00"), ("2024-03-10", "20:00:00"), ("2024-03-10", "22:00:00");

INSERT INTO cinema.Plan_Seance (Creneau_id, Film_id, Salle_id, Langue_id) VALUES (1, 1, 1, 1), (2, 2, 1, 2), (4, 3, 1, 2), (1, 4, 2, 1), (2, 5, 2, 2), (4, 1, 2, 2), (1, 2, 3, 1), (3, 3, 3, 2), (5, 4, 3, 2), (1, 5, 1, 1), (2, 1, 1, 2), (4, 2, 1, 2), (5, 3, 1, 1), (1, 4, 2, 1), (2, 5, 2, 2), (4, 1, 2, 2), (5, 2, 2, 2), (3, 3, 3, 2), (4, 4, 3, 2), (5, 5, 3, 2);

INSERT INTO cinema.Billet (Tarif_id, Seance_id, Salle_id) VALUES (1, 4, 2), (1, 7, 3), (3, 10, 1), (4, 14, 2), (2, 20, 3);