-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Salle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Salle` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Salle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nom` CHAR(2) NOT NULL,
  `Nb_Places` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Langue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Langue` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Langue` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Langue` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Personne`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Personne` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Personne` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Prénom` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Réalisateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Réalisateur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Réalisateur` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Personne_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Personne_id`),
  INDEX `fk_Réalisateur_Personne1_idx` (`Personne_id` ASC) VISIBLE,
  CONSTRAINT `fk_Réalisateur_Personne1`
    FOREIGN KEY (`Personne_id`)
    REFERENCES `mydb`.`Personne` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LimiteAge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`LimiteAge` ;

CREATE TABLE IF NOT EXISTS `mydb`.`LimiteAge` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Intitulé` VARCHAR(45) NULL,
  `Age_Mini` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarif`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tarif` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tarif` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Intitulé` VARCHAR(45) NOT NULL,
  `Prix` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Film` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Film` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Titre` VARCHAR(100) NOT NULL,
  `Durée` VARCHAR(45) NOT NULL,
  `Date de sortie` DATE NOT NULL,
  `Synopsis` VARCHAR(500) NULL,
  `Commentaire additionnel` VARCHAR(500) NULL,
  `Avant-Première` TINYINT NULL,
  ` durée_d'exploitation` DATE NOT NULL,
  `Version_id` INT NOT NULL,
  `Réalisateur_id` INT NOT NULL,
  `LimiteAge_id` INT NOT NULL,
  `Tarif_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Film_Réalisateur1_idx` (`Réalisateur_id` ASC) VISIBLE,
  INDEX `fk_Film_LimiteAge1_idx` (`LimiteAge_id` ASC) VISIBLE,
  INDEX `fk_Film_Tarif1_idx` (`Tarif_id` ASC) VISIBLE,
  CONSTRAINT `fk_Film_Réalisateur1`
    FOREIGN KEY (`Réalisateur_id`)
    REFERENCES `mydb`.`Réalisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_LimiteAge1`
    FOREIGN KEY (`LimiteAge_id`)
    REFERENCES `mydb`.`LimiteAge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_Tarif1`
    FOREIGN KEY (`Tarif_id`)
    REFERENCES `mydb`.`Tarif` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Date` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Date` (
  `id` INT NOT NULL,
  `Date` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plan_Seance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Plan_Seance` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Plan_Seance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Salle_id` INT NOT NULL,
  `Film_id` INT NOT NULL,
  `Date_id` INT NOT NULL,
  `Langue_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Seance_Salle1_idx` (`Salle_id` ASC) VISIBLE,
  INDEX `fk_Plan_Seance_Film1_idx` (`Film_id` ASC) VISIBLE,
  INDEX `fk_Plan_Seance_Date1_idx` (`Date_id` ASC) VISIBLE,
  INDEX `fk_Plan_Seance_Langue1_idx` (`Langue_id` ASC) VISIBLE,
  CONSTRAINT `fk_Seance_Salle1`
    FOREIGN KEY (`Salle_id`)
    REFERENCES `mydb`.`Salle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plan_Seance_Film1`
    FOREIGN KEY (`Film_id`)
    REFERENCES `mydb`.`Film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plan_Seance_Date1`
    FOREIGN KEY (`Date_id`)
    REFERENCES `mydb`.`Date` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plan_Seance_Langue1`
    FOREIGN KEY (`Langue_id`)
    REFERENCES `mydb`.`Langue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Acteur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Acteur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Acteur` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Personne_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Personne_id`),
  INDEX `fk_Acteur_Personne1_idx` (`Personne_id` ASC) VISIBLE,
  CONSTRAINT `fk_Acteur_Personne1`
    FOREIGN KEY (`Personne_id`)
    REFERENCES `mydb`.`Personne` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Genre` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Prénom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Film_has_Genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Film_has_Genre` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Film_has_Genre` (
  `Film_id` INT NOT NULL,
  `Genre_id` INT NOT NULL,
  PRIMARY KEY (`Film_id`, `Genre_id`),
  INDEX `fk_Film_has_Genre_Genre1_idx` (`Genre_id` ASC) VISIBLE,
  INDEX `fk_Film_has_Genre_Film1_idx` (`Film_id` ASC) VISIBLE,
  CONSTRAINT `fk_Film_has_Genre_Film1`
    FOREIGN KEY (`Film_id`)
    REFERENCES `mydb`.`Film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Genre_Genre1`
    FOREIGN KEY (`Genre_id`)
    REFERENCES `mydb`.`Genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Billet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Billet` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Billet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Tarif_id` INT NOT NULL,
  `Seance_id` INT NOT NULL,
  `Salle_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Tarif_id`, `Seance_id`, `Salle_id`),
  INDEX `fk_Billet_Tarif1_idx` (`Tarif_id` ASC) VISIBLE,
  INDEX `fk_Billet_Seance1_idx` (`Seance_id` ASC) VISIBLE,
  INDEX `fk_Billet_Salle1_idx` (`Salle_id` ASC) VISIBLE,
  CONSTRAINT `fk_Billet_Tarif1`
    FOREIGN KEY (`Tarif_id`)
    REFERENCES `mydb`.`Tarif` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Billet_Seance1`
    FOREIGN KEY (`Seance_id`)
    REFERENCES `mydb`.`Plan_Seance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Billet_Salle1`
    FOREIGN KEY (`Salle_id`)
    REFERENCES `mydb`.`Salle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Film_has_Acteur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Film_has_Acteur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Film_has_Acteur` (
  `Film_id` INT NOT NULL,
  `Acteur_id` INT NOT NULL,
  PRIMARY KEY (`Film_id`, `Acteur_id`),
  INDEX `fk_Film_has_Acteur_Acteur1_idx` (`Acteur_id` ASC) VISIBLE,
  INDEX `fk_Film_has_Acteur_Film1_idx` (`Film_id` ASC) VISIBLE,
  CONSTRAINT `fk_Film_has_Acteur_Film1`
    FOREIGN KEY (`Film_id`)
    REFERENCES `mydb`.`Film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Acteur_Acteur1`
    FOREIGN KEY (`Acteur_id`)
    REFERENCES `mydb`.`Acteur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
