SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `eCommerce` DEFAULT CHARACTER SET utf8 ;
USE `eCommerce` ;

-- -----------------------------------------------------
-- Table `eCommerce`.`categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `eCommerce`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eCommerce`.`products`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `eCommerce`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `price` DECIMAL NULL ,
  `rating` INT NULL DEFAULT NULL ,
  `pic_url_1` VARCHAR(45) NULL DEFAULT NULL ,
  `pic_url_2` VARCHAR(45) NULL DEFAULT NULL ,
  `pic_url_3` VARCHAR(45) NULL DEFAULT NULL ,
  `inventory_count` INT NULL DEFAULT NULL ,
  `amount_sold` INT NULL DEFAULT NULL ,
  `description` LONGTEXT NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL ,
  `category_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_Products_categories1_idx` (`category_id` ASC) ,
  CONSTRAINT `fk_Products_categories1`
    FOREIGN KEY (`category_id` )
    REFERENCES `eCommerce`.`categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eCommerce`.`customers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `eCommerce`.`customers` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(45) NULL DEFAULT NULL ,
  `last_name` VARCHAR(45) NULL DEFAULT NULL ,
  `address1` VARCHAR(45) NULL DEFAULT NULL ,
  `address2` VARCHAR(45) NULL DEFAULT NULL ,
  `city` VARCHAR(45) NULL DEFAULT NULL ,
  `state` VARCHAR(45) NULL DEFAULT NULL ,
  `zipcode` VARCHAR(45) NULL DEFAULT NULL ,
  `credit_card_number` INT NULL DEFAULT NULL ,
  `security_code` INT NULL DEFAULT NULL ,
  `expiration_date` DATETIME NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eCommerce`.`orders`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `eCommerce`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `product_total` INT NULL DEFAULT NULL ,
  `shipping_costs` INT NULL DEFAULT NULL ,
  `total` INT NULL DEFAULT NULL ,
  `status` VARCHAR(45) NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL ,
  `customer_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_orders_customers1_idx` (`customer_id` ASC) ,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customer_id` )
    REFERENCES `eCommerce`.`customers` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eCommerce`.`shipping_customers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `eCommerce`.`shipping_customers` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(45) NULL DEFAULT NULL ,
  `last_name` VARCHAR(45) NULL DEFAULT NULL ,
  `address1` VARCHAR(45) NULL DEFAULT NULL ,
  `address2` VARCHAR(45) NULL DEFAULT NULL ,
  `city` VARCHAR(45) NULL DEFAULT NULL ,
  `state` VARCHAR(45) NULL DEFAULT NULL ,
  `zipcode` VARCHAR(45) NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL ,
  `customer_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_shipping_customers_customers1_idx` (`customer_id` ASC) ,
  CONSTRAINT `fk_shipping_customers_customers1`
    FOREIGN KEY (`customer_id` )
    REFERENCES `eCommerce`.`customers` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eCommerce`.`admins`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `eCommerce`.`admins` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(45) NULL DEFAULT NULL ,
  `password` VARCHAR(45) NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eCommerce`.`carts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `eCommerce`.`carts` (
  `product_id` INT NOT NULL ,
  `order_id` INT NOT NULL ,
  PRIMARY KEY (`product_id`, `order_id`) ,
  INDEX `fk_Products_has_orders_orders1_idx` (`order_id` ASC) ,
  INDEX `fk_Products_has_orders_Products_idx` (`product_id` ASC) ,
  CONSTRAINT `fk_Products_has_orders_Products`
    FOREIGN KEY (`product_id` )
    REFERENCES `eCommerce`.`products` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_has_orders_orders1`
    FOREIGN KEY (`order_id` )
    REFERENCES `eCommerce`.`orders` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eCommerce`.`images`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `eCommerce`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `url` VARCHAR(255) NULL ,
  `main_pic` TINYINT(1) NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  `product_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_images_Products1_idx` (`product_id` ASC) ,
  CONSTRAINT `fk_images_Products1`
    FOREIGN KEY (`product_id` )
    REFERENCES `eCommerce`.`products` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `eCommerce` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
