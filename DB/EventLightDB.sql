-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema eventlightdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `eventlightdb` ;

-- -----------------------------------------------------
-- Schema eventlightdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eventlightdb` DEFAULT CHARACTER SET utf8 ;
USE `eventlightdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(200) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(20) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NULL,
  `last_update` DATETIME NULL,
  `profile_picture` VARCHAR(2000) NULL,
  `about_me` TEXT NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `venue` ;

CREATE TABLE IF NOT EXISTS `venue` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `phone_number` VARCHAR(20) NULL,
  `address_id` INT NOT NULL,
  `description` TEXT NULL,
  `name` VARCHAR(45) NOT NULL,
  `picture` VARCHAR(2000) NULL,
  `picture_logo` VARCHAR(2000) NULL,
  `created_at` DATETIME NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venue_user1_idx` (`user_id` ASC),
  INDEX `fk_venue_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_venue_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venue_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_date` DATE NOT NULL,
  `venue_id` INT NOT NULL,
  `title` VARCHAR(200) NULL,
  `description` TEXT NULL,
  `image` VARCHAR(2000) NULL,
  `created_at` DATETIME NULL,
  `last_update` DATETIME NULL,
  `start_time` TIME NULL,
  `end_time` TIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_venue1_idx` (`venue_id` ASC),
  CONSTRAINT `fk_event_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `band`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `band` ;

CREATE TABLE IF NOT EXISTS `band` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NULL,
  `image` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artist` ;

CREATE TABLE IF NOT EXISTS `artist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `band_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `stage_name` VARCHAR(45) NULL,
  `instrument` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_artist_band1_idx` (`band_id` ASC),
  CONSTRAINT `fk_artist_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `band_has_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `band_has_event` ;

CREATE TABLE IF NOT EXISTS `band_has_event` (
  `band_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`band_id`, `event_id`),
  INDEX `fk_band_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_band_has_event_band1_idx` (`band_id` ASC),
  CONSTRAINT `fk_band_has_event_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_band_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_events` ;

CREATE TABLE IF NOT EXISTS `favorite_events` (
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_user_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_user_has_event_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_band`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_band` ;

CREATE TABLE IF NOT EXISTS `favorite_band` (
  `user_id` INT NOT NULL,
  `band_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `band_id`),
  INDEX `fk_user_has_band_band1_idx` (`band_id` ASC),
  INDEX `fk_user_has_band_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_band_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_band_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `venue_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `venue_comment` ;

CREATE TABLE IF NOT EXISTS `venue_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NULL,
  `comment_date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `venue_id` INT NOT NULL,
  `reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venue_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_venue_comment_venue1_idx` (`venue_id` ASC),
  INDEX `fk_venue_comment_venue_comment1_idx` (`reply_to_id` ASC),
  CONSTRAINT `fk_venue_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venue_comment_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venue_comment_venue_comment1`
    FOREIGN KEY (`reply_to_id`)
    REFERENCES `venue_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `band_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `band_comment` ;

CREATE TABLE IF NOT EXISTS `band_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NOT NULL,
  `comment_date` DATETIME NULL,
  `band_id` INT NOT NULL,
  `band_comment_id` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_band_comment_band1_idx` (`band_id` ASC),
  INDEX `fk_band_comment_band_comment1_idx` (`band_comment_id` ASC),
  INDEX `fk_band_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_band_comment_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_band_comment_band_comment1`
    FOREIGN KEY (`band_comment_id`)
    REFERENCES `band_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_band_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_rating` ;

CREATE TABLE IF NOT EXISTS `event_rating` (
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `rating_comment` TEXT NULL,
  `rating_date` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_user_has_event_event2_idx` (`event_id` ASC),
  INDEX `fk_user_has_event_user2_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_user2`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event2`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS eventdev@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'eventdev'@'localhost' IDENTIFIED BY 'eventdev';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'eventdev'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `country`) VALUES (1, '123 Fake St', 'Jacksonville', 'FL', '32205', 'US');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `country`) VALUES (2, '567 Kings Road', 'Jacksonville', 'FL', '32205', 'US');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `country`) VALUES (3, '888 Lane Ln', 'Jacksonville', 'FL', '32205', 'US');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `created_at`, `last_update`, `profile_picture`, `about_me`, `address_id`) VALUES (1, 'admin', '1234', 1, 'admin', 'Gary', 'Fultz', '2023-01-05 10:34', '2023-01-10 05:25', NULL, 'Just a dude that likes music', 1);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `created_at`, `last_update`, `profile_picture`, `about_me`, `address_id`) VALUES (2, 'NoOne', 'NoOne25', 1, 'vo', 'Arya', 'Stark', '2023-02-15 11:55', '2023-02-15 11:55', NULL, 'Likes vacationing down south.', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `venue`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `venue` (`id`, `user_id`, `phone_number`, `address_id`, `description`, `name`, `picture`, `picture_logo`, `created_at`, `last_update`) VALUES (1, 1, '(555)555-5555', 1, '\"Small dive bar atmosphere with one main stage\"', 'FreeBird', NULL, NULL, '2023-04-18 22:58', '2023-04-18 22:58');
INSERT INTO `venue` (`id`, `user_id`, `phone_number`, `address_id`, `description`, `name`, `picture`, `picture_logo`, `created_at`, `last_update`) VALUES (2, 2, '(123)456-7890', 3, 'Indoor/Outdoor seating with a main stage inside', 'Lions', NULL, NULL, '2023-05-16 13:13', '2023-05-16 13:13');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `event` (`id`, `event_date`, `venue_id`, `title`, `description`, `image`, `created_at`, `last_update`, `start_time`, `end_time`) VALUES (1, '2023-07-30', 1, 'The most amazing show ever', 'Metallica playing at FreeBird', NULL, '2023-05-01 07:22', '2023-05-01 07:22', '20:00', '23:00');
INSERT INTO `event` (`id`, `event_date`, `venue_id`, `title`, `description`, `image`, `created_at`, `last_update`, `start_time`, `end_time`) VALUES (2, '2023-08-12', 1, 'A cool band plays cool music', 'Metallica again', NULL, '2023-06-14 02:55', '2023-06-14 02:55', '19:00', '22:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `band`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `band` (`id`, `name`, `genre`, `image`, `description`) VALUES (1, 'Metallica', 'Metal', NULL, 'Old School metal band');

COMMIT;


-- -----------------------------------------------------
-- Data for table `artist`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`) VALUES (1, 1, 'Robert', 'Trujilo', NULL, 'Bass');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`) VALUES (2, 1, 'James', 'Hetfield', NULL, 'Vocals');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`) VALUES (3, 1, 'Lars', 'Ulrich', NULL, 'Drums');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`) VALUES (4, 1, 'Kirk', 'Hammett', NULL, 'Lead Guitar');

COMMIT;


-- -----------------------------------------------------
-- Data for table `band_has_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_events`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `favorite_events` (`user_id`, `event_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_band`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `favorite_band` (`user_id`, `band_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `venue_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `venue_comment` (`id`, `comment`, `comment_date`, `user_id`, `venue_id`, `reply_to_id`) VALUES (1, 'This place is awesome, favorite venue ever', '2023-03-16 15:22', 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `band_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `band_comment` (`id`, `comment`, `comment_date`, `band_id`, `band_comment_id`, `user_id`) VALUES (1, 'This is my favorite band', '2023-05-02 10:59', 1, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `event_rating` (`user_id`, `event_id`, `rating`, `rating_comment`, `rating_date`) VALUES (1, 1, 5, 'This event is going to be awesome I\'m so excited!', '2023-05-18 06:15');
INSERT INTO `event_rating` (`user_id`, `event_id`, `rating`, `rating_comment`, `rating_date`) VALUES (1, 2, 3, 'Kinda boring.', '2023-02-18 05:45');

COMMIT;

