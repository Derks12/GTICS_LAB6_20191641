-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rol` (
  `idrol` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dispositivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dispositivos` (
  `iddispositivos` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `cantidad` VARCHAR(45) NULL,
  PRIMARY KEY (`iddispositivos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prestamos` (
  `idprestamos` INT NOT NULL,
  `fecha_inicio` VARCHAR(45) NULL,
  `fecha_fin` VARCHAR(45) NULL,
  `dispositivos_iddispositivos1` INT NULL,
  PRIMARY KEY (`idprestamos`),
  INDEX `fk_prestamos_dispositivos1_idx` (`dispositivos_iddispositivos1` ASC) VISIBLE,
  CONSTRAINT `fk_prestamos_dispositivos1`
    FOREIGN KEY (`dispositivos_iddispositivos1`)
    REFERENCES `mydb`.`dispositivos` (`iddispositivos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idUsuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `activo` TINYINT(1) NULL,
  `rol_idrol1` INT NOT NULL,
  `prestamos_idprestamos` INT NOT NULL,
  PRIMARY KEY (`idUsuario`, `prestamos_idprestamos`),
  INDEX `fk_usuario_rol1_idx` (`rol_idrol1` ASC) VISIBLE,
  INDEX `fk_usuario_prestamos1_idx` (`prestamos_idprestamos` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rol1`
    FOREIGN KEY (`rol_idrol1`)
    REFERENCES `mydb`.`rol` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_prestamos1`
    FOREIGN KEY (`prestamos_idprestamos`)
    REFERENCES `mydb`.`prestamos` (`idprestamos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reservas` (
  `dispositivos_iddispositivos` INT NOT NULL,
  `usuario_idUsuario` INT NOT NULL,
  `fecha_inicio` VARCHAR(45) NULL,
  `fecha_fin` VARCHAR(45) NULL,
  PRIMARY KEY (`dispositivos_iddispositivos`, `usuario_idUsuario`),
  INDEX `fk_usuario_has_dispositivos_dispositivos1_idx` (`dispositivos_iddispositivos` ASC) VISIBLE,
  INDEX `fk_reservas_usuario1_idx` (`usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_dispositivos_dispositivos1`
    FOREIGN KEY (`dispositivos_iddispositivos`)
    REFERENCES `mydb`.`dispositivos` (`iddispositivos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservas_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `mydb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
