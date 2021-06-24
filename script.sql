-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 ;
USE `store` ;

-- -----------------------------------------------------
-- Table `store`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(150) NULL,
  `lastName` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `role` ENUM("ADMIN", "USER") NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL,
  `price` DECIMAL NULL,
  `description` VARCHAR(240) NULL,
  `active` TINYINT(1) NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `store`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`shoppingCart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`shoppingCart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shoppingCart_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_shoppingCart_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `store`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`shoppingCart_has_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`shoppingCart_has_products` (
  `shoppingCart_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`shoppingCart_id`, `products_id`),
  INDEX `fk_shoppingCart_has_products_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_shoppingCart_has_products_shoppingCart1_idx` (`shoppingCart_id` ASC) VISIBLE,
  CONSTRAINT `fk_shoppingCart_has_products_shoppingCart1`
    FOREIGN KEY (`shoppingCart_id`)
    REFERENCES `store`.`shoppingCart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shoppingCart_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `store`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
