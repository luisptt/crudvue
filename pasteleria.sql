-- MySQL Script generated by MySQL Workbench
-- Tue Mar 26 11:01:25 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pasteleria
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pasteleria` ;

-- -----------------------------------------------------
-- Schema pasteleria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pasteleria` DEFAULT CHARACTER SET utf8mb4 ;
USE `pasteleria` ;

-- -----------------------------------------------------
-- Table `pasteleria`.`pasteles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pasteleria`.`pasteles` (
  `IDpastel` INT(11) NOT NULL AUTO_INCREMENT,
  `NombrePastel` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`IDpastel`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pasteleria`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pasteleria`.`ingredientes` (
  `IDingrediente` INT(11) NOT NULL AUTO_INCREMENT,
  `Ingrediente` VARCHAR(30) NOT NULL,
  `IDpastel` INT(11) NOT NULL,
  PRIMARY KEY (`IDingrediente`),
  CONSTRAINT `ingredientes_ibfk_1`
    FOREIGN KEY (`IDpastel`)
    REFERENCES `pasteleria`.`pasteles` (`IDpastel`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `ingredientes_ibfk_2`
    FOREIGN KEY (`IDpastel`)
    REFERENCES `pasteleria`.`pasteles` (`IDpastel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `IDpastel` ON `pasteleria`.`ingredientes` (`IDpastel` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
