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
-- Table `mydb`.`STORE LOCATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`STORE LOCATION` (
  `StoreID` INT NOT NULL,
  `Longitude` INT NULL,
  `Latitude` INT NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `ZipCode` INT NULL,
  PRIMARY KEY (`StoreID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUCT AVAILABILITY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCT AVAILABILITY` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(45) NULL,
  `Price` INT NULL,
  `InventoryCount` INT NULL,
  `Size` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SALES TRACKING`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SALES TRACKING` (
  `TransactionID` INT NOT NULL,
  `Date` VARCHAR(45) NULL,
  `Time` VARCHAR(45) NULL,
  `StoreID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  PRIMARY KEY (`TransactionID`),
  INDEX `fk_SALES TRACKING_STORE LOCATION_idx` (`StoreID` ASC) VISIBLE,
  INDEX `fk_SALES TRACKING_PRODUCT AVAILABILITY1_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `fk_SALES TRACKING_STORE LOCATION`
    FOREIGN KEY (`StoreID`)
    REFERENCES `mydb`.`STORE LOCATION` (`StoreID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SALES TRACKING_PRODUCT AVAILABILITY1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `mydb`.`PRODUCT AVAILABILITY` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
