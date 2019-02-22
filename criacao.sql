-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema TPBD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TPBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TPBD` DEFAULT CHARACTER SET utf8 ;
USE `TPBD` ;

-- -----------------------------------------------------
-- Table `TPBD`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`Pais` (
  `idPais` INT NOT NULL,
  `Designacao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`Editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`Editora` (
  `idEditora` INT NOT NULL,
  `Localidade` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Data_Fundacao` DATE NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Website` VARCHAR(45) NULL,
  `Telefone` VARCHAR(25) NULL,
  `Email` VARCHAR(100) NULL,
  `Pais` INT NOT NULL,
  PRIMARY KEY (`idEditora`),
  INDEX `fk_Editora_Pais1_idx` (`Pais` ASC),
  CONSTRAINT `fk_Editora_Pais1`
    FOREIGN KEY (`Pais`)
    REFERENCES `TPBD`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`Banda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`Banda` (
  `idBanda` INT NOT NULL,
  `DataFundacao` DATE NULL,
  `Nome` VARCHAR(100) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Biografia` TEXT NULL,
  `Pais` INT NOT NULL,
  `Editora` INT NOT NULL,
  PRIMARY KEY (`idBanda`),
  INDEX `fk_Banda_Pais1_idx` (`Pais` ASC),
  INDEX `fk_Banda_Editora1_idx` (`Editora` ASC),
  CONSTRAINT `fk_Banda_Pais1`
    FOREIGN KEY (`Pais`)
    REFERENCES `TPBD`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Banda_Editora1`
    FOREIGN KEY (`Editora`)
    REFERENCES `TPBD`.`Editora` (`idEditora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`Membro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`Membro` (
  `idMembro` INT NOT NULL,
  `DataNascimento` DATE NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  `Pais` INT NOT NULL,
  PRIMARY KEY (`idMembro`),
  INDEX `fk_Membro_Pais1_idx` (`Pais` ASC),
  CONSTRAINT `fk_Membro_Pais1`
    FOREIGN KEY (`Pais`)
    REFERENCES `TPBD`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`Membro_Banda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`Membro_Banda` (
  `bData` DATE NOT NULL,
  `Membro` INT NOT NULL,
  `Banda` INT NOT NULL,
  `eData` DATE NULL,
  PRIMARY KEY (`bData`, `Membro`, `Banda`),
  INDEX `fk_Membro_has_Banda_Banda1_idx` (`Banda` ASC),
  INDEX `fk_Membro_has_Banda_Membro1_idx` (`Membro` ASC),
  CONSTRAINT `fk_Membro_has_Banda_Membro1`
    FOREIGN KEY (`Membro`)
    REFERENCES `TPBD`.`Membro` (`idMembro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Membro_has_Banda_Banda1`
    FOREIGN KEY (`Banda`)
    REFERENCES `TPBD`.`Banda` (`idBanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`Album` (
  `idAlbum` INT NOT NULL,
  `Data` DATE NOT NULL,
  `Titulo` VARCHAR(100) NOT NULL,
  `Tipo` VARCHAR(100) NULL,
  `Duracao` INT NOT NULL,
  PRIMARY KEY (`idAlbum`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`BandaEditoraAlbum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`BandaEditoraAlbum` (
  `Banda` INT NOT NULL,
  `Album` INT NOT NULL,
  `Editora` INT NOT NULL,
  `DataLancamento` DATE NOT NULL,
  `Formato` VARCHAR(100) NULL,
  `NrCopias` INT UNSIGNED NOT NULL,
  INDEX `fk_BandaEditoraAlbum_Banda1_idx` (`Banda` ASC),
  INDEX `fk_BandaEditoraAlbum_Album1_idx` (`Album` ASC),
  INDEX `fk_BandaEditoraAlbum_Editora1_idx` (`Editora` ASC),
  PRIMARY KEY (`DataLancamento`, `Banda`, `Album`, `Editora`),
  CONSTRAINT `fk_BandaEditoraAlbum_Banda1`
    FOREIGN KEY (`Banda`)
    REFERENCES `TPBD`.`Banda` (`idBanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BandaEditoraAlbum_Album1`
    FOREIGN KEY (`Album`)
    REFERENCES `TPBD`.`Album` (`idAlbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BandaEditoraAlbum_Editora1`
    FOREIGN KEY (`Editora`)
    REFERENCES `TPBD`.`Editora` (`idEditora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`Genero` (
  `idGenero` INT NOT NULL,
  `Designacao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`Musica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`Musica` (
  `idMusica` INT NOT NULL,
  `Titulo` VARCHAR(100) NOT NULL,
  `Letra` TEXT NULL,
  `Duracao` INT NOT NULL,
  PRIMARY KEY (`idMusica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`AlbumMusica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`AlbumMusica` (
  `Album` INT NOT NULL,
  `Musica` INT NOT NULL,
  PRIMARY KEY (`Album`, `Musica`),
  INDEX `fk_Album_has_Musica_Musica1_idx` (`Musica` ASC),
  INDEX `fk_Album_has_Musica_Album1_idx` (`Album` ASC),
  CONSTRAINT `fk_Album_has_Musica_Album1`
    FOREIGN KEY (`Album`)
    REFERENCES `TPBD`.`Album` (`idAlbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_has_Musica_Musica1`
    FOREIGN KEY (`Musica`)
    REFERENCES `TPBD`.`Musica` (`idMusica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`AlbumGenero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`AlbumGenero` (
  `Album` INT NOT NULL,
  `Genero` INT NOT NULL,
  PRIMARY KEY (`Album`, `Genero`),
  INDEX `fk_Album_has_Genero_Genero1_idx` (`Genero` ASC),
  INDEX `fk_Album_has_Genero_Album1_idx` (`Album` ASC),
  CONSTRAINT `fk_Album_has_Genero_Album1`
    FOREIGN KEY (`Album`)
    REFERENCES `TPBD`.`Album` (`idAlbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_has_Genero_Genero1`
    FOREIGN KEY (`Genero`)
    REFERENCES `TPBD`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`MembroAlbum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`MembroAlbum` (
  `Membro` INT NOT NULL,
  `Album` INT NOT NULL,
  `eConvidado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Membro`, `Album`),
  INDEX `fk_Membro_has_Album_Album1_idx` (`Album` ASC),
  INDEX `fk_Membro_has_Album_Membro1_idx` (`Membro` ASC),
  CONSTRAINT `fk_Membro_has_Album_Membro1`
    FOREIGN KEY (`Membro`)
    REFERENCES `TPBD`.`Membro` (`idMembro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Membro_has_Album_Album1`
    FOREIGN KEY (`Album`)
    REFERENCES `TPBD`.`Album` (`idAlbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`Membro_Album_Funcao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`Membro_Album_Funcao` (
  `Descricao` VARCHAR(100) NOT NULL,
  `Membro` INT NOT NULL,
  `Album` INT NOT NULL,
  PRIMARY KEY (`Descricao`, `Membro`, `Album`),
  INDEX `fk_Membro_Album_Funcao_MembroAlbum1_idx` (`Membro` ASC, `Album` ASC),
  CONSTRAINT `fk_Membro_Album_Funcao_MembroAlbum1`
    FOREIGN KEY (`Membro` , `Album`)
    REFERENCES `TPBD`.`MembroAlbum` (`Membro` , `Album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TPBD`.`Membro_Banda_Funcao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TPBD`.`Membro_Banda_Funcao` (
  `Descricao` VARCHAR(100) NOT NULL,
  `bData` DATE NOT NULL,
  `Membro` INT NOT NULL,
  `Banda` INT NOT NULL,
  PRIMARY KEY (`Descricao`, `bData`, `Membro`, `Banda`),
  INDEX `fk_tabelaexemplo_Membro_Banda1_idx` (`bData` ASC, `Membro` ASC, `Banda` ASC),
  CONSTRAINT `fk_tabelaexemplo_Membro_Banda1`
    FOREIGN KEY (`bData` , `Membro` , `Banda`)
    REFERENCES `TPBD`.`Membro_Banda` (`bData` , `Membro` , `Banda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
