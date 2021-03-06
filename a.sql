-- MySQL Script generated by MySQL Workbench
-- Mon Nov 15 18:28:29 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Libreria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Libreria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Libreria` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `Libreria` ;

-- -----------------------------------------------------
-- Table `Libreria`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Usuarios` (
  `Id_usuario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `PrimerApellido` VARCHAR(45) NOT NULL,
  `SegundoApellido` VARCHAR(45) NOT NULL,
  `Rol` VARCHAR(45) NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `Contrasena` VARCHAR(45) NOT NULL,
  `FechaCaptura` DATE NULL,
  PRIMARY KEY (`Id_usuario`),
  UNIQUE INDEX `Usuario_UNIQUE` (`Usuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`imagenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`imagenes` (
  `Id_imagen` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Ruta` VARCHAR(250) NOT NULL,
  `FechaSubida` DATE NULL,
  PRIMARY KEY (`Id_imagen`),
  UNIQUE INDEX `Nombre_UNIQUE` (`Nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Autores` (
  `Id_autor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `PrimerApellido` VARCHAR(45) NOT NULL,
  `SegundoApellido` VARCHAR(45) NOT NULL,
  `Nacionalidad` VARCHAR(45) NOT NULL,
  `FechaNacimiento` DATE NOT NULL,
  `FechaCaptura` DATE NULL,
  PRIMARY KEY (`Id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Temas` (
  `Id_tema` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `FechaCaptura` DATE NULL,
  PRIMARY KEY (`Id_tema`),
  UNIQUE INDEX `Nombre_UNIQUE` (`Nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Contactos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Contactos` (
  `Id_contacto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `PrimerApellido` VARCHAR(45) NOT NULL,
  `SegundoApellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_contacto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Editoriales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Editoriales` (
  `Id_editorial` INT NOT NULL AUTO_INCREMENT,
  `NombreEditorial` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(20) NOT NULL,
  `FechaCaptura` DATE NULL,
  `Contactos_Id_contacto` INT NOT NULL,
  PRIMARY KEY (`Id_editorial`),
  UNIQUE INDEX `NombreEditorial_UNIQUE` (`NombreEditorial` ASC) VISIBLE,
  INDEX `fk_Editoriales_Contactos1_idx` (`Contactos_Id_contacto` ASC) VISIBLE,
  CONSTRAINT `fk_Editoriales_Contactos1`
    FOREIGN KEY (`Contactos_Id_contacto`)
    REFERENCES `Libreria`.`Contactos` (`Id_contacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Libros` (
  `Id_libro` INT NOT NULL AUTO_INCREMENT,
  `ISBN` VARCHAR(15) NOT NULL,
  `Titulo` VARCHAR(100) NOT NULL,
  `NombreEditorial` VARCHAR(100) NOT NULL,
  `FechaEdicion` DATE NOT NULL,
  `Tema` VARCHAR(100) NOT NULL,
  `Precio` FLOAT NOT NULL,
  `FechaCaptura` DATE NULL,
  `Autores_Id_autor` INT NOT NULL,
  `Temas_Id_tema` INT NOT NULL,
  `Editoriales_Id_editorial` INT NOT NULL,
  `imagenes_Id_imagen` INT NOT NULL,
  PRIMARY KEY (`Id_libro`),
  INDEX `fk_Libros_Autores_idx` (`Autores_Id_autor` ASC) VISIBLE,
  INDEX `fk_Libros_Temas1_idx` (`Temas_Id_tema` ASC) VISIBLE,
  INDEX `fk_Libros_Editoriales1_idx` (`Editoriales_Id_editorial` ASC) VISIBLE,
  INDEX `fk_Libros_imagenes1_idx` (`imagenes_Id_imagen` ASC) VISIBLE,
  CONSTRAINT `fk_Libros_Autores`
    FOREIGN KEY (`Autores_Id_autor`)
    REFERENCES `Libreria`.`Autores` (`Id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libros_Temas1`
    FOREIGN KEY (`Temas_Id_tema`)
    REFERENCES `Libreria`.`Temas` (`Id_tema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libros_Editoriales1`
    FOREIGN KEY (`Editoriales_Id_editorial`)
    REFERENCES `Libreria`.`Editoriales` (`Id_editorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libros_imagenes1`
    FOREIGN KEY (`imagenes_Id_imagen`)
    REFERENCES `Libreria`.`imagenes` (`Id_imagen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;