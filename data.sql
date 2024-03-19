INSERT INTO cinema.Salle (Nom, Capacite) VALUES ("Salle 01", 100), ("Salle 02", 150), ("Salle 03", 200);

INSERT INTO cinema.Langue (Langue) VALUES ("VOSTFR"), ("VF");

INSERT INTO cinema.LimiteAge (Intitule, Age_Mini) VALUES ("Tout public", 0), ("Interdit aux moins de 12 ans", 12), ("Interdit aux moins de 16 ans", 16), ("Interdit aux mineurs", 18);

INSERT INTO cinema.Genre (Intitule) VALUES ("Drame"), ("Comedie"), ("Aventure"), ("Animation"), ("Famille"), ("Romance"), ("Fantastique"), ("Science-fiction"), ("Comédie"), ("Dramatique"), ("Western"), ("Action"), ("Documentaire"), ("Policier"), ("Fantasy"), ("Thriller");

INSERT INTO cinema.Tarif (Intitule, Prix) VALUES ("Tarif plein", 9.80), ("Tarif etudiant", 5), ("Tarif demandeur d'emploi", 5), ("Tarif -14 ans", 3.80);

INSERT INTO cinema.Personne (Nom, Prénom) VALUES ("Jackson", "Peter"), ("Plante", "Pascal"), ("Triet", "Justine"), ("");

INSERT INTO cinema.Realisateur (id, Personne_id) VALUES ();

INSERT INTO cinema.Acteur (id, Personne_id) VALUES ();


INSERT INTO cinema.Film_has_Genre (Film_id, Genre_id) VALUES ();

INSERT INTO cinema.Plan_Seance (id, Date, Heure, Film_id, Salle_id) VALUES ();

INSERT INTO cinema.Date (id, Date) VALUES ();

INSERT INTO cinema.Film_has_Acteur (Film_id, Acteur_id) VALUES ();

INSERT INTO cinema.Billet (id, Tarif_id, Seance_id, Salle_id) VALUES ();
insert into cinema.Film (id, Titre, Duree, Date_de_sortie, Synopsis, Commentaire_additionnel, Avant_premiere, duree_exploitation, Version_id, Realisateur_id, LimiteAge_id, Tarif_id)






