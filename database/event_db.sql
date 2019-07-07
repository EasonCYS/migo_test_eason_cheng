-- MySQL Script generated by MySQL Workbench
-- Sun Jul  7 22:50:14 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema event
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema event
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `event` DEFAULT CHARACTER SET latin1 ;
USE `event` ;

-- -----------------------------------------------------
-- Table `event`.`event_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `event`.`event_category` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `event`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `event`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `event`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `event`.`event` (
  `id` INT(11) NOT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `title` VARCHAR(50) NULL DEFAULT NULL,
  `description` VARCHAR(1000) NULL DEFAULT NULL,
  `start_time` DATETIME NULL DEFAULT NULL,
  `end_time` DATETIME NULL DEFAULT NULL,
  `category_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_Event_User_idx` (`user_id` ASC) VISIBLE,
  INDEX `FK_Event_Category_idx` (`category_id` ASC) VISIBLE,
  INDEX `IDX_User_StartTime` (`user_id` ASC, `start_time` ASC) VISIBLE,
  INDEX `IDX_Title` (`user_id` ASC, `start_time` ASC, `title` ASC) VISIBLE,
  INDEX `IDX_Description` (`user_id` ASC, `start_time` ASC, `description` ASC) VISIBLE,
  INDEX `IDX_End_Time` (`user_id` ASC, `start_time` ASC, `end_time` ASC) VISIBLE,
  CONSTRAINT `FK_Event_Category`
    FOREIGN KEY (`category_id`)
    REFERENCES `event`.`event_category` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Event_User`
    FOREIGN KEY (`user_id`)
    REFERENCES `event`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
