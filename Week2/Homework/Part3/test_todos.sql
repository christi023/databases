-- MySQL Workbench Synchronization
-- Generated: 2019-10-16 14:28
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: hp

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `test`.`items` (
  `Item_id` INT(11) NULL DEFAULT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `Finished` VARCHAR(45) NULL DEFAULT NULL,
  `Deadline` DATETIME NULL DEFAULT NULL,
  `Notification` VARCHAR(255) NULL DEFAULT NULL,
  `User_ID` INT(11) NULL DEFAULT NULL,
  `Item_tag_User_Item_ID` INT(11) NOT NULL,
  `User_User_ID` INT(11) NOT NULL,
  PRIMARY KEY (`Item_id`, `Item_tag_User_Item_ID`, `User_User_ID`),
  INDEX `fk_items_Item_tag1_idx` (`Item_tag_User_Item_ID` ASC) VISIBLE,
  INDEX `fk_items_User1_idx` (`User_User_ID` ASC) VISIBLE,
  CONSTRAINT `fk_items_Item_tag1`
    FOREIGN KEY (`Item_tag_User_Item_ID`)
    REFERENCES `test`.`Item_tag` (`User_Item_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_items_User1`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `test`.`User` (`User_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `test`.`User` (
  `User_ID` INT(11) NULL DEFAULT NULL,
  `Username` VARCHAR(255) NULL DEFAULT NULL,
  `Email` VARCHAR(255) NULL DEFAULT NULL,
  `Tag_Tag_ID` INT(11) NOT NULL,
  PRIMARY KEY (`User_ID`, `Tag_Tag_ID`),
  INDEX `fk_User_Tag1_idx` (`Tag_Tag_ID` ASC) INVISIBLE,
  CONSTRAINT `fk_User_Tag1`
    FOREIGN KEY (`Tag_Tag_ID`)
    REFERENCES `test`.`Tag` (`Tag_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `test`.`Item_tag` (
  `User_Item_ID` INT(11) NOT NULL,
  `Item_ID` INT(11) NULL DEFAULT NULL,
  `Tag_ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`User_Item_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `test`.`Tag` (
  `Tag_ID` INT(11) NULL DEFAULT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Tag_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
