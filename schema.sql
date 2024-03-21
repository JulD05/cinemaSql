DROP DATABASE IF EXISTS cinema;
-- Create Schema
CREATE DATABASE cinema;

-- Create Table Salle
DROP TABLE IF EXISTS cinema.Salle;
CREATE TABLE cinema.Salle 
(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Nom VARCHAR(45) NOT NULL,
  Nb_Places INT NOT NULL
);

-- Create Table Langue
DROP TABLE IF EXISTS cinema.Langue;
CREATE TABLE cinema.Langue 
(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Langue VARCHAR(45) NOT NULL
);

-- Create Table Personne
DROP TABLE IF EXISTS cinema.Personne;
CREATE TABLE cinema.Personne 
(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Nom VARCHAR(45) NULL,
  Prenom VARCHAR(45) NULL
);

-- Create Table Realisateur
DROP TABLE IF EXISTS cinema.Realisateur;
CREATE TABLE cinema.Realisateur 
(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Personne_id INT NOT NULL,
  FOREIGN KEY (Personne_id) REFERENCES Personne(id)
);

-- Create table LimiteAge
DROP TABLE IF EXISTS cinema.LimiteAge;
CREATE TABLE cinema.LimiteAge 
(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Intitule VARCHAR(45) NOT NULL,
  Age_Mini INT NOT NULL
);

-- Create Table Tarif
DROP TABLE IF EXISTS cinema.Tarif;
CREATE TABLE cinema.Tarif 
(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Intitule VARCHAR(45) NOT NULL,
  Prix FLOAT NOT NULL
);

-- Create Table Film
DROP TABLE IF EXISTS cinema.Film;
CREATE TABLE cinema.Film 
(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Titre VARCHAR(100) NOT NULL,
  Duree INT NOT NULL,
  Date_de_sortie DATE NOT NULL,
  Synopsis LONGTEXT NULL,
  Commentaire_additionnel LONGTEXT NULL,
  Avant_premiere TINYINT NULL,
  duree_exploitation INT NOT NULL,
  Realisateur_id INT NOT NULL,
  LimiteAge_id INT NOT NULL,
  INDEX fk_Film_Realisateur1_idx (Realisateur_id ASC),
  INDEX fk_Film_LimiteAge1_idx (LimiteAge_id ASC),
  CONSTRAINT fk_Film_Realisateur1
    FOREIGN KEY (Realisateur_id)
    REFERENCES cinema.Realisateur (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Film_LimiteAge1
    FOREIGN KEY (LimiteAge_id)
    REFERENCES cinema.LimiteAge (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create table Creneau
DROP TABLE IF EXISTS cinema.Creneau;
CREATE TABLE cinema.Creneau
(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Date DATE NOT NULL,
  Heure TIME NOT NULL
);

-- Create Table Plan_Seance
DROP TABLE IF EXISTS cinema.Plan_Seance;
CREATE TABLE cinema.Plan_Seance
(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Salle_id INT NOT NULL,
  Film_id INT NOT NULL,
  Creneau_id INT NOT NULL,
  Langue_id INT NOT NULL,
  INDEX fk_Seance_Salle1_idx (Salle_id ASC),
  INDEX fk_Plan_Seance_Film1_idx (Film_id ASC),
  INDEX fk_Plan_Seance_Creneau1_idx (Creneau_id ASC),
  INDEX fk_Plan_Seance_Langue1_idx (Langue_id ASC),
  CONSTRAINT fk_Seance_Salle1
    FOREIGN KEY (Salle_id)
    REFERENCES cinema.Salle (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Plan_Seance_Film1
    FOREIGN KEY (Film_id)
    REFERENCES cinema.Film (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Plan_Seance_Creneau1
    FOREIGN KEY (Creneau_id)
    REFERENCES cinema.Creneau (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Plan_Seance_Langue1
    FOREIGN KEY (Langue_id)
    REFERENCES cinema.Langue (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create Table Acteur
DROP TABLE IF EXISTS cinema.Acteur;
CREATE TABLE cinema.Acteur
(
  id INT AUTO_INCREMENT NOT NULL,
  Personne_id INT NOT NULL,
  PRIMARY KEY (id, Personne_id),
  INDEX fk_Acteur_Personne1_idx (Personne_id ASC),
  CONSTRAINT fk_Acteur_Personne1
    FOREIGN KEY (Personne_id)
    REFERENCES cinema.Personne (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create Table Genre
DROP TABLE IF EXISTS cinema.Genre;
CREATE TABLE cinema.Genre
(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Intitule VARCHAR(45) NOT NULL
);

-- Create Table Film_has_Genre
DROP TABLE IF EXISTS cinema.Film_has_Genre;
CREATE TABLE cinema.Film_has_Genre (
  Film_id INT NOT NULL,
  Genre_id INT NOT NULL,
  PRIMARY KEY (Film_id, Genre_id),
  INDEX fk_Film_has_Genre_Genre1_idx (Genre_id ASC),
  INDEX fk_Film_has_Genre_Film1_idx (Film_id ASC),
  CONSTRAINT fk_Film_has_Genre_Film1
    FOREIGN KEY (Film_id)
    REFERENCES cinema.Film (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Film_has_Genre_Genre1
    FOREIGN KEY (Genre_id)
    REFERENCES cinema.Genre (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS cinema.Billet;
CREATE TABLE cinema.Billet
(
  id INT AUTO_INCREMENT NOT NULL,
  Tarif_id INT NOT NULL,
  Seance_id INT NOT NULL,
  Salle_id INT NOT NULL,
  PRIMARY KEY (id, Tarif_id, Seance_id, Salle_id),
  INDEX fk_Billet_Tarif1_idx (Tarif_id ASC),
  INDEX fk_Billet_Seance1_idx (Seance_id ASC),
  INDEX fk_Billet_Salle1_idx (Salle_id ASC),
  CONSTRAINT fk_Billet_Tarif1
    FOREIGN KEY (Tarif_id)
    REFERENCES cinema.Tarif (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Billet_Seance1
    FOREIGN KEY (Seance_id)
    REFERENCES cinema.Plan_Seance (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Billet_Salle1
    FOREIGN KEY (Salle_id)
    REFERENCES cinema.Salle (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create table Film_has_Acteur
DROP TABLE IF EXISTS cinema.Film_has_Acteur;
CREATE TABLE cinema.Film_has_Acteur
(
  Film_id INT NOT NULL,
  Acteur_id INT NOT NULL,
  PRIMARY KEY (Film_id, Acteur_id),
  INDEX fk_Film_has_Acteur_Acteur1_idx (Acteur_id ASC),
  INDEX fk_Film_has_Acteur_Film1_idx (Film_id ASC),
  CONSTRAINT fk_Film_has_Acteur_Film1
    FOREIGN KEY (Film_id)
    REFERENCES cinema.Film (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Film_has_Acteur_Acteur1
    FOREIGN KEY (Acteur_id)
    REFERENCES cinema.Acteur (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
