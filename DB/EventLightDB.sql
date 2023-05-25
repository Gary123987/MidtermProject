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
  `enabled` TINYINT NOT NULL DEFAULT 1,
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
  `enabled` TINYINT NOT NULL DEFAULT 1,
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
  `band_id` INT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `stage_name` VARCHAR(45) NULL,
  `instrument` VARCHAR(45) NULL,
  `image` VARCHAR(5000) NULL,
  `description` TEXT NULL,
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
  `reply_id` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_band_comment_band1_idx` (`band_id` ASC),
  INDEX `fk_band_comment_band_comment1_idx` (`reply_id` ASC),
  INDEX `fk_band_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_band_comment_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_band_comment_band_comment1`
    FOREIGN KEY (`reply_id`)
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
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `country`) VALUES (4, '456 Road rd', 'Jacksonville', 'FL', '32205', 'US');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `created_at`, `last_update`, `profile_picture`, `about_me`, `address_id`) VALUES (1, 'Gary', '1234', 1, 'vo', 'Gary', 'Fultz', '2023-01-05 10:34', '2023-01-10 05:25', NULL, 'Just a dude that likes music', 1);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `created_at`, `last_update`, `profile_picture`, `about_me`, `address_id`) VALUES (2, 'NoOne', '1234', 1, 'vo', 'Arya', 'Stark', '2023-02-15 11:55', '2023-02-15 11:55', NULL, 'Likes vacationing down south.', 2);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `created_at`, `last_update`, `profile_picture`, `about_me`, `address_id`) VALUES (3, 'Kristen', '1234', 1, 'vo', 'Kristen', 'Tsuboi', '2023-04-16 05:20', '2023-04-17 10:00', NULL, 'I like cheese and a quarter Japanese', 4);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `created_at`, `last_update`, `profile_picture`, `about_me`, `address_id`) VALUES (4, 'attendee', '1234', 1, 'att', 'Anyone', 'Anyname', '2023-04-15 05:20', '2023-04-16 10:00', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `created_at`, `last_update`, `profile_picture`, `about_me`, `address_id`) VALUES (5, 'Brailyn', '1234', 1, 'vo', 'Brailyn', 'Pichardo', '2023-04-10 05:00', '2023-04-10 05:00', NULL, 'cool dude', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `venue`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `venue` (`id`, `user_id`, `phone_number`, `address_id`, `description`, `name`, `picture`, `picture_logo`, `created_at`, `last_update`, `enabled`) VALUES (1, 1, '(555)555-5555', 1, 'A two Story indoor stage, with standing room upstairs and downstairs.', 'FreeBird', 'https://uplup.com/music_spot/freebird-live-jacksonville-beach/additional_images/fb1.jpg', NULL, '2023-04-18 22:58', '2023-04-18 22:58', DEFAULT);
INSERT INTO `venue` (`id`, `user_id`, `phone_number`, `address_id`, `description`, `name`, `picture`, `picture_logo`, `created_at`, `last_update`, `enabled`) VALUES (2, 2, '(123)456-7890', 3, 'A large outdoor amiptheater, with covered seating and a full service bar.', 'Lions', 'https://s3.mortarr.com/images/project_gallery_images/dailys-place-amphitheater-flex-field-structurflex-amphitheater-stage-seating-1-1920x1920.jpeg', NULL, '2023-05-16 13:13', '2023-05-16 13:13', DEFAULT);
INSERT INTO `venue` (`id`, `user_id`, `phone_number`, `address_id`, `description`, `name`, `picture`, `picture_logo`, `created_at`, `last_update`, `enabled`) VALUES (3, 3, '(777)888-9999', 4, 'Indoor concert hall, feature over 200 rows of seats and a massive main stage. ', 'Vystar Arena', 'https://aviewfrommyseat.com/medium/anonymous-20220424060242.jpg', NULL, '2023-03-12 11:00', '2023-04-10 12:00', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `event` (`id`, `event_date`, `venue_id`, `title`, `description`, `image`, `created_at`, `last_update`, `start_time`, `end_time`, `enabled`) VALUES (1, '2023-07-30', 1, 'Metal Night', 'Metallica and Alice in Chains together for the first time ever.', 'https://cdn.shopify.com/s/files/1/0581/0159/6351/products/008-0002326_b1276f4b-da89-4d08-b235-0b859414bacf_750x.jpg?v=1637003401', '2023-05-01 07:22', '2023-05-01 07:22', '20:00', '23:00', DEFAULT);
INSERT INTO `event` (`id`, `event_date`, `venue_id`, `title`, `description`, `image`, `created_at`, `last_update`, `start_time`, `end_time`, `enabled`) VALUES (2, '2023-08-12', 2, 'Rock and Roll Experience', 'Foo Fighters, Red Hot Chili Peppers, and Guns N\' Roses bring you a concert you wont want to miss. ', 'https://i.etsystatic.com/14652798/r/il/eb9972/4402218983/il_fullxfull.4402218983_5msq.jpg', '2023-06-14 02:55', '2023-06-14 02:55', '19:00', '22:00', DEFAULT);
INSERT INTO `event` (`id`, `event_date`, `venue_id`, `title`, `description`, `image`, `created_at`, `last_update`, `start_time`, `end_time`, `enabled`) VALUES (3, '2023-08-15', 3, 'The Never Ending Concert', 'All of our bands come together for one night of endless rock and metal.', 'https://mir-s3-cdn-cf.behance.net/project_modules/fs/44097150726775.58d846b6607ab.jpg', '2023-04-20 2:22', '2023-04-21 2:22', '07:00', '23:00', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `band`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `band` (`id`, `name`, `genre`, `image`, `description`) VALUES (1, 'Metallica', 'Metal', 'https://th-thumbnailer.cdn-si-edu.com/6ucpypxSRQ5aN1VvG-CtCoSoGQg=/fit-in/1600x0/filters:focal(2000x1352:2001x1353)/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer_public/e2/e0/e2e09263-df6c-4d05-af86-6f68bbe6e967/gettyimages-1449774455_1.jpg', 'Metallica is an American heavy metal band. The band was formed in 1981 in Los Angeles by vocalist and guitarist James Hetfield and drummer Lars Ulrich, and has been based in San Francisco for most of its career.[1][2] The band\'s fast tempos, instrumentals and aggressive musicianship made them one of the founding \"big four\" bands of thrash metal, alongside Megadeth, Anthrax and Slayer. Metallica\'s current lineup comprises founding members and primary songwriters Hetfield and Ulrich, longtime lead guitarist Kirk Hammett, and bassist Robert Trujillo.');
INSERT INTO `band` (`id`, `name`, `genre`, `image`, `description`) VALUES (2, 'Red Hot Chilli Peppers', 'Rock', 'https://assets2.cbsnewsstatic.com/hub/i/r/2023/02/05/9f66e391-35ae-4fa5-9208-0b41402343aa/thumbnail/1280x720/b7b6c8e6aa4d1f750e2d854d71a6710a/0205-60minutes-wertheim-1687461-640x360.jpg', 'The Red Hot Chili Peppers are an American rock band formed in Los Angeles in 1982,[1] comprising vocalist Anthony Kiedis, bassist Flea, drummer Chad Smith, and guitarist John Frusciante. Their music incorporates elements of alternative rock, funk, punk rock, hard rock, hip hop, and psychedelic rock. Their eclectic range has influenced genres such as funk metal,[2] rap metal,[3] rap rock,[4] and nu metal.[5][3] With over 120 million records sold worldwide, the Red Hot Chili Peppers are one of the best-selling bands of all time.[6] They hold the records for most number-one singles (15), most cumulative weeks at number one (91) and most top-ten songs (28) on the Billboard Alternative Songs chart.[7] They have won six Grammy Awards, were inducted into the Rock and Roll Hall of Fame in 2012, and in 2022 received a star on the Hollywood Walk of Fame.');
INSERT INTO `band` (`id`, `name`, `genre`, `image`, `description`) VALUES (3, 'Foo Fighters', 'Rock', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/FoosLondonStad220618-124_%2842989552522%29.jpg', 'Foo Fighters is an American rock band formed in Seattle in 1994. Foo Fighters was initially formed as a one-man project by former Nirvana drummer Dave Grohl. Following the success of the 1995 eponymous debut album, Grohl (lead vocals, guitar) recruited a band consisting of Nate Mendel (bass guitar), William Goldsmith (drums), and Pat Smear (guitar). After a succession of lineup changes, including the departures of Goldsmith and Smear, the band formed its core lineup in 1999, consisting of Grohl, Mendel, Chris Shiflett (guitar), and Taylor Hawkins (drums). Smear rejoined in 2005, and Rami Jaffee (keyboards) joined in 2017. Over the course of their career, Foo Fighters have won 15 Grammy Awards, including Best Rock Album five times, making them among the most successful rock acts in Grammy history.[4] In 2021, the band was announced as recipients of the first-ever \"Global Icon\" award at the 2021 MTV Video Music Awards. They were inducted into the Rock and Roll Hall of Fame in 2021, their first year of eligibility.');
INSERT INTO `band` (`id`, `name`, `genre`, `image`, `description`) VALUES (4, 'Guns N\' Roses', 'Rock', 'https://marvel-b1-cdn.bc0a.com/f00000000293000/www.rockhall.com/sites/default/files/styles/c03g_desktop_1920_870/public/2019-11/Hero_GunsNRoses_photoGettyWireImage.jpg?h=4e8381a5&itok=HGhds3YC', 'Guns N\' Roses\' debut album, Appetite for Destruction (1987), reached number one on the Billboard 200 a year after its release, on the strength of the top 10 singles \"Welcome to the Jungle\", \"Paradise City\", and \"Sweet Child o\' Mine\", the band\'s only single to reach number one on the Billboard Hot 100. The album has sold approximately 30 million copies worldwide, including 18 million units in the United States, making it the country\'s bestselling debut album and eleventh-bestselling album. Their next studio album, G N\' R Lies (1988), reached number two on the Billboard 200, sold ten million copies worldwide (including five million in the U.S.), and included the top 5 hit \"Patience\". Use Your Illusion I and Use Your Illusion II, recorded simultaneously and released in 1991, debuted at number two and number one on the Billboard 200 respectively and have sold a combined 35 million copies worldwide (including 14 million units in the U.S.). The Illusion albums included the lead single \"You Could Be Mine\", covers of \"Live and Let Die\" and \"Knockin\' on Heaven\'s Door\", and a trilogy of ballads (\"Don\'t Cry\", \"November Rain\", and \"Estranged\"), which featured notably high-budget music videos. The records were supported by the Use Your Illusion Tour, a world tour that lasted from 1991 to 1993. The covers album \"The Spaghetti Incident?\" (1993) was the last studio album to feature Slash and McKagan before their initial departure.');
INSERT INTO `band` (`id`, `name`, `genre`, `image`, `description`) VALUES (5, 'Alice in Chains', 'Metal', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Alice_in_Chains_Live_Leeds_2018.jpg/1200px-Alice_in_Chains_Live_Leeds_2018.jpg', 'Alice in Chains (often abbreviated as AIC) is an American rock band from Seattle, Washington, formed in 1987 by guitarist and vocalist Jerry Cantrell and drummer Sean Kinney, who later recruited bassist Mike Starr and lead vocalist Layne Staley. Starr was replaced by Mike Inez in 1993. William DuVall joined the band in 2006 as co-lead vocalist and rhythm guitarist, replacing Staley, who died in 2002. The band took its name from Staley\'s previous group, the glam metal band Alice N\' Chains.\n\nOften associated with grunge music, Alice in Chains\' sound incorporates heavy metal elements. The band is known for its distinctive vocal style, which often included the harmonized vocals between Staley and Cantrell (and later Cantrell and DuVall). Cantrell started to sing lead vocals on the 1992 acoustic EP Sap, and his role continued to grow in the following albums, making Alice in Chains a two-vocal band.\n\nAlice in Chains rose to international fame as part of the grunge movement of the early 1990s, along with other Seattle bands such as Nirvana, Pearl Jam, and Soundgarden. They achieved success during the era with the albums Facelift (1990), Dirt (1992) and Alice in Chains (1995), as well as the EP Jar of Flies (1994). Although never officially disbanding, Alice in Chains was plagued by extended inactivity from 1996 onward, due to Staley\'s substance abuse, which resulted in his death in 2002. The band regrouped in 2006, with DuVall taking over as lead vocalist full-time,[10] and they have since released three more albums: Black Gives Way to Blue (2009), The Devil Put Dinosaurs Here (2013), and Rainier Fog (2018).');

COMMIT;


-- -----------------------------------------------------
-- Data for table `artist`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (1, 1, 'Robert', 'Trujilo', NULL, 'Bass', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fencrypted-tbn0.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcS8yrrT3hWP9NDSxqe3_i5RlSQGqM2DKtAdWAGSpwLxw4KFfCcn_MnRRPnWIxxsuh7Weu0SEu084eUWzeM&psig=AOvVaw1x48A2VkMQyF83brqlDZRk&ust=1685035341834000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLidzvm7jv8CFQAAAAAdAAAAABAE', 'Roberto Agustín Miguel Santiago Samuel Trujillo Veracruz (/truːˈhiːjoʊ/; born October 23, 1964) is an American musician, best known as the bassist for heavy metal band Metallica since 2003. He first rose to prominence as the bassist of crossover thrash band Suicidal Tendencies from 1989 to 1995, while also collaborating with Suicidal Tendencies frontman Mike Muir for funk metal supergroup Infectious Grooves. After leaving Suicidal Tendencies, he performed with Ozzy Osbourne, Jerry Cantrell, and heavy metal band Black Label Society. Trujillo joined Metallica in 2003 and is the band\'s longest-serving bassist. He was inducted to the Rock and Roll Hall of Fame as a member of Metallica in 2009.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (2, 1, 'James', 'Hetfield', NULL, 'Vocals', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/James_Hetfield_live_in_Amesterdam_29_April_2023.jpg/800px-James_Hetfield_live_in_Amesterdam_29_April_2023.jpg', 'James Alan Hetfield (born August 3, 1963) is an American musician. He is the lead vocalist, rhythm guitarist, co-founder and a primary songwriter of heavy metal band Metallica. He is mainly known for his intricate rhythm playing, but occasionally performs lead guitar duties and solos, both live and in the studio. Hetfield co-founded Metallica in October 1981 after answering an advertisement by drummer Lars Ulrich in the Los Angeles newspaper The Recycler. Metallica has won nine Grammy Awards and released eleven studio albums, three live albums, four extended plays and 24 singles. Hetfield is often regarded as one of the greatest heavy metal rhythm guitar players of all time.\n\nIn 2009, Hetfield was ranked at No. 8 in Joel McIver\'s book The 100 Greatest Metal Guitarists and No. 24 by Hit Parader on their list of the 100 Greatest Metal Vocalists of All Time. In Guitar World\'s poll, Hetfield was placed as the 19th greatest guitarist of all time, as well as being placed second (along with Metallica lead guitarist Kirk Hammett) in The 100 Greatest Metal Guitarists poll of the same magazine. Rolling Stone placed him as the 87th-greatest guitarist of all time.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (3, 1, 'Lars', 'Ulrich', NULL, 'Drums', 'https://media.gettyimages.com/id/1411560233/photo/lars-ulrich-of-metallica-performs-in-concert-during-day-1-of-lollapalooza-at-grant-park-on.jpg?s=612x612&w=gi&k=20&c=ONv3Uiw-Xcf2p8zkOx2dMPZ7RKoBX7bWfaiqpUlzQYk=', 'Lars Ulrich R (/ˈʊlrɪk/; Danish: [ˈlɑːs ˈulˀʁek]; born 26 December 1963) is a Danish musician best known as the drummer and co-founder of American heavy metal band Metallica. The son and grandson respectively of tennis players Torben and Einer Ulrich, he played tennis in his youth and moved to Los Angeles at age 16 to train professionally. However, rather than playing tennis, Ulrich began playing drums. After publishing an advertisement in The Recycler, Ulrich met James Hetfield and formed Metallica. Along with Hetfield, Ulrich has songwriting credits on almost all of the band\'s songs, and the two of them are the only remaining original members of the band.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (4, 1, 'Kirk', 'Hammett', NULL, 'Lead Guitar', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Kirk_Hammett_live_in_London_15_September_2008.jpg/170px-Kirk_Hammett_live_in_London_15_September_2008.jpg', 'Kirk Lee Hammett (born November 18, 1962) is an American musician who has been the lead guitarist of heavy metal band Metallica since 1983. Prior to joining Metallica, he co-formed the thrash metal band Exodus in 1979. In 2003, Hammett was ranked 11th on Rolling Stone\'s list of The 100 Greatest Guitarists of All Time. In 2009, Hammett was ranked number 15 in Joel McIver\'s book The 100 Greatest Metal Guitarists.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (5, 2, 'Michael', 'Balazary', 'Flea', 'Bass', 'https://hips.hearstapps.com/hmg-prod/images/michael-peter-balzary-flee-1519837808.jpg', 'Michael Peter Balzary (born October 16, 1962), known professionally as Flea, is an American musician and actor. He is a founding member and bassist of the rock band Red Hot Chili Peppers.\n\nFlea was born in Melbourne, Victoria; his family moved to Rye, New York, when he was four. After his parents divorced, Flea spent his childhood in the United States and Australia, before settling in California. At high school, he befriended singer Anthony Kiedis, with whom he formed the Red Hot Chili Peppers in 1983. Flea is also a member of the supergroups Atoms for Peace, Antemasque, Pigface, and Rocket Juice & the Moon, and has played with acts including the Mars Volta, Johnny Cash, Tom Waits, Alanis Morissette, Young MC, Nirvana, What Is This?, Fear, and Jane\'s Addiction.\n\nFlea incorporates elements of funk (including slap bass), psychedelic, punk, and hard rock in his playing. In 2009, Rolling Stone readers ranked Flea the second-best bassist of all time, behind John Entwistle. In 2012, he and the other members of Red Hot Chili Peppers were inducted into the Rock and Roll Hall of Fame.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (6, 2, 'Anthony', 'Kiedis', NULL, 'Vocals', 'https://faroutmagazine.co.uk/static/uploads/2020/01/2016_RiP_Red_Hot_Chili_Peppers_-_Anthony_Kiedis_-_by_2eight_-_DSC0249-1.jpg', 'Anthony Kiedis (/ˈkiːdɪs/ KEE-dis; born November 1, 1962) is an American singer and songwriter. He is a founding member and lead vocalist of the rock band Red Hot Chili Peppers. Kiedis and his fellow band members were inducted into the Rock and Roll Hall of Fame in 2012.\n\nKiedis spent his youth in Grand Rapids, Michigan, with his mother, and then moved shortly before his twelfth birthday to live with his father in Hollywood. While attending Fairfax High School, Kiedis befriended students Flea and Hillel Slovak, who were members of a band called Anthym. After high school, Kiedis began taking classes at UCLA but dropped out in his sophomore year.\n\nWhen Kiedis received an offer to be the opening act for a local band, he enlisted Flea, Slovak, and drummer Jack Irons. After a show under the name Tony Flow and the Miraculously Majestic Masters of Mayhem, the band progressed and the line-up eventually became the Red Hot Chili Peppers. He has recorded thirteen studio albums with the Red Hot Chili Peppers.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (7, 2, 'Chad', 'Smith', NULL, 'Drums', 'https://cdn.mos.cms.futurecdn.net/TEZQyfS3c4FLcXaJdsqZ3P.jpg', 'Chad Gaylord Smith (born October 25, 1961)[2] is an American musician who has been the drummer of the rock band Red Hot Chili Peppers since 1988. The group was inducted into the Rock and Roll Hall of Fame in 2012. Smith is also the drummer of the hard rock supergroup Chickenfoot, formed in 2008, and of the all-instrumental outfit Chad Smith\'s Bombastic Meatbats, formed in 2007. He worked with the Chicks on Taking the Long Way, an album that won five Grammy Awards in 2007.\n\nSmith has recorded with Glenn Hughes, Johnny Cash, John Fogerty, Geezer Butler, Jennifer Nettles, Kid Rock, Jake Bugg, the Avett Brothers, Joe Satriani, Post Malone, Eddie Vedder, Lana Del Rey and Halsey. In 2010, joined by Dick Van Dyke and Leslie Bixler, he released Rhythm Train, a children\'s album which featured Smith singing and playing various instruments. In 2020, Smith co-wrote and performed as part of the backing band on Ozzy Osbourne\'s album, Ordinary Man, and again in 2022 on Patient Number 9.\n\nSpin magazine placed Smith at #10 on their list of the \"100 Greatest Drummers of Alternative Music\" in May 2013. Readers of UK-based Rhythm magazine ranked Smith and Red Hot Chili Pepper bassist Flea the fourth-greatest rhythm section of all time in their June 2013 issue. Smith is also known for his charity work especially with young musicians. He has been a lobbyist in support of music education in U.S. public schools. Smith is also the host of the PBS concert series Landmarks Live in Concert, which began in January 2017.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (8, 2, 'John', 'Frusciante', NULL, 'Guitar', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/John_Frusciante_strat.jpg/170px-John_Frusciante_strat.jpg', 'John Anthony Frusciante (/fruːˈʃɑːnteɪ/ ; born March 5, 1970) is an American musician. He has been the guitarist for the Red Hot Chili Peppers across three stints (1988–1992, 1998–2009, 2019–present), and has released 11 solo albums and 7 EPs, ranging in style from acoustic guitar to electronic music. In 2003, Rolling Stone named Frusciante the 13th-greatest guitarist of all time. He was inducted into the Rock and Roll Hall of Fame as a member of the Red Hot Chili Peppers in 2012.\n\nFrusciante joined the Chili Peppers at the age of 18 after the death of guitarist Hillel Slovak, and first appeared on their album Mother\'s Milk (1989). His second album with the band, Blood Sugar Sex Magik (1991), was their breakthrough success.\n\nFrusciante\'s solo work encompasses genres including experimental rock, ambient music, and electronica. He released six albums in 2004, each exploring different genres and recording techniques. In 2009, Frusciante released The Empyrean, which features Chili Peppers bassist Flea and guitarist Josh Klinghoffer and again parted ways with the Chili Peppers before rejoining them in 2019. Frusciante also releases acid house under the alias Trickfinger. With Klinghoffer and Joe Lally, he has released two albums as Ataxia.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (9, 3, 'Dave', 'Grohl', NULL, 'Guitar and Vocals', 'https://assets.medpagetoday.net/media/images/97xxx/97588.jpg', 'Kinda looks like the drummer from Nirvana');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (10, 3, 'Taylor', 'Hawkins', NULL, 'Drums', 'https://static01.nyt.com/images/2022/03/27/arts/25hawkins-print1-sub/25hawkins-new-mediumSquareAt3X.jpg', 'Oliver Taylor Hawkins (February 17, 1972 – March 25, 2022) was an American musician, best known as the drummer of the rock band Foo Fighters, with whom he recorded eight studio albums between 1999 and 2021. Before joining the band in 1997, he was a touring drummer for Sass Jordan and for Alanis Morissette, as well as the drummer of the progressive experimental band Sylvia.\n\nIn 2004, Hawkins formed his own side project, Taylor Hawkins and the Coattail Riders, in which he played drums and sang, releasing three studio albums between 2006 and 2019.[3] He formed the supergroup NHC with Jane\'s Addiction members Dave Navarro and Chris Chaney in 2020, where he also took on lead vocal and drumming duties.\n\nHawkins was inducted into the Rock and Roll Hall of Fame in 2021 as a member of Foo Fighters. He was voted \"Best Rock Drummer\" in 2005 by the British drumming magazine Rhythm. He died at the age of 50 on March 25, 2022, in Bogotá, Colombia.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (11, 3, 'Nate', 'Mendel', NULL, 'Bass', 'https://www.billboard.com/wp-content/uploads/media/nate-mendel-performance-2012-billboard-650.jpg', 'Nathan Gregor Mendel (born December 2, 1968) is an American musician best known as the bass guitarist for the rock band Foo Fighters, as well as a former member of Sunny Day Real Estate. He has also worked with musical acts The Jealous Sound and The Fire Theft. He has released one solo album, If I Kill This Thing We\'re All Going to Eat for a Week, under the name Lieutenant. Aside from the Foo Fighters\' lead vocalist and founder Dave Grohl, he is the second longest serving member of the band, and appeared on nine of the band\'s studio albums.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (12, 3, 'Franz', 'Stahl', NULL, 'Guitar', 'https://img.washingtonpost.com/rf/image_1484w/WashingtonPost/Content/Blogs/click-track/201105/images/STSCREAM22-4.jpg?uuid=y9OLLIe3EeCxnX7pF-wLVQ', 'Franz and his brother Pete were raised in Bailey\'s Crossroads, Virginia, which they reference by putting the letters \"BXR\" in Scream\'s albums. Their father, Arnold, was a lawyer and also managed the DC rock band The Hangmen, who scored a regional hit with 1965\'s \"What a Girl Can\'t Do\". After learning guitar, Franz started playing in local Virginian bands with bassist Skeeter Thompson. In 1981, Franz and Thompson formed Scream in Alexandria, along with Pete and drummer Kent Stax.\n\nAfter Scream broke up in 1990, Franz and Pete formed the band Wool, which released the album Box Set for London Records before breaking up in 1996. As Stahl visited a friend who was producing Japanese musician J, he found out that the drummer was fellow DC musician Scott Garrett, and that they needed a guitarist for the tour. Stahl accepted, and played around Japan as a member of J\'s backing band. During the tour, Franz Stahl was invited by Grohl to replace the Foo Fighters\' original guitarist Pat Smear, who had decided to leave the band. After the tour was finished, he flew in just two days before his debut performance at the Radio City Music Hall in September 1997, having just one day of rehearsal. Stahl started his Foo Fighters career with their hit \"Everlong\" from their second studio album, The Colour and the Shape.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (13, 4, 'Saul', 'Hudson', 'Slash', 'Guitar', 'https://upload.wikimedia.org/wikipedia/commons/3/39/Slash_live_in_London_2022_%28Cropped%29.jpg', 'Saul Hudson (born July 23, 1965), better known as Slash, is a British-American musician who is best known as the lead guitarist of the hard rock band Guns N\' Roses, with whom he achieved worldwide success in the late 1980s and early 1990s. Slash has received critical acclaim and is considered one of the greatest guitarists in history.\n\nBorn in Hampstead, London, Slash moved to Los Angeles with his father when he was five years old. His parents were both active in the entertainment industry; he was given the nickname \"Slash\" as a child by actor Seymour Cassel. In 1983 he joined the glam metal band Hollywood Rose, then in 1985 he joined Guns N\' Roses (which was composed of former members of Hollywood Rose and L.A. Guns), replacing founding member Tracii Guns.\n\nIn 1994, amid growing tensions within Guns N\' Roses, Slash formed the supergroup Slash\'s Snakepit, and in 1996 he left Guns N\' Roses. In 2002, he co-founded the supergroup Velvet Revolver with vocalist Scott Weiland, which re-established Slash as a mainstream performer in the mid to late 2000s. Slash has released five solo albums: Slash (2010), Apocalyptic Love (2012), World on Fire (2014), Living the Dream (2018) and 4 (2022). All but the first of these were billed to \"Slash featuring Myles Kennedy and the Conspirators\". He returned to Guns N\' Roses in 2016.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (14, 4, 'Axl', 'Rose', NULL, 'Vocals', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/2022-06-30_DSC00750.jpg/800px-2022-06-30_DSC00750.jpg', 'W. Axl Rose (born William Bruce Rose Jr.; born February 6, 1962) is an American musician. He is best known for being the lead vocalist and lyricist of the hard rock band Guns N\' Roses, and has been the band\'s sole constant member since its inception in 1985.[4] Possessing a distinctive and powerful wide-ranging voice,[5] Rose has been named one of the greatest singers of all time by various media outlets, including Rolling Stone and NME.\n\nBorn and raised in Lafayette, Indiana, Rose moved in the early 1980s to Los Angeles, where he became active in the local hard rock scene and joined several bands, including Hollywood Rose and L.A. Guns. In 1985, he co-founded Guns N\' Roses, with whom he had great success and recognition in the late 1980s and early 1990s. Their first album, Appetite for Destruction (1987), has sold in excess of 30 million copies worldwide and is the best-selling debut album of all time in the U.S. with 18 million units sold.[10] Its full-length follow-ups, the twin albums Use Your Illusion I and Use Your Illusion II (1991), were also widely successful; they respectively debuted at No. 2 and No. 1 on the Billboard 200 and have sold a combined 35 million copies worldwide.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (15, 4, 'Steven', 'Adler', NULL, 'Drums', 'https://www.thetrapset.net/wp-content/uploads/2014/12/269825_10150244561857446_645760_n.jpeg', 'Steven Adler (born Michael Coletti; January 22, 1965) is an American musician. He was the drummer and co-songwriter of the hard rock band Guns N\' Roses, with whom he achieved worldwide success in the late 1980s.  He was inducted into the Rock and Roll Hall of Fame in 2012 as a member of Guns N\' Roses.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (16, 4, 'Duff', 'McKagan', NULL, 'Bass', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/14-06-08_RiP_Walking_Papers_Duff_McKagan_2.JPG/220px-14-06-08_RiP_Walking_Papers_Duff_McKagan_2.JPG', 'Michael Andrew \"Duff\" McKagan (born February 5, 1964), sometimes credited as Duff \"Rose\" McKagan, is an American musician. He played bass for twelve years in the hard rock band Guns N\' Roses, with whom he achieved worldwide success in the late 1980s and early 1990s. McKagan rejoined the band in 2016, following their induction into the Rock and Roll Hall of Fame.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (17, 5, 'Layne', 'Stanley', NULL, 'Vocals', 'https://express-images.franklymedia.com/3745/sites/10/2022/08/22113110/GettyImages-1214371212.jpg', 'Layne Thomas Staley (born Layne Rutherford Staley; August 22, 1967 – April 5, 2002) was an American singer and songwriter who was the original lead vocalist of Alice in Chains, which rose to international fame in the early 1990s as part of Seattle\'s grunge movement. He was known for his distinctive vocal style as well as his harmonizing with guitarist/vocalist Jerry Cantrell. Staley was also a member of the glam metal bands Sleze and Alice N\' Chains, and the supergroups Mad Season and Class of \'99.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (18, 5, 'Jerry', 'Cantrell', NULL, 'Guitar', 'https://www.revolvermag.com/sites/default/files/media/images/article/gettyimages-1171898030.jpg', 'Jerry Fulton Cantrell Jr. (born March 18, 1966) is an American guitarist, singer and songwriter. He is best known as the founder, lead guitarist, co-lead vocalist, and main songwriter of the rock band Alice in Chains. The band rose to international fame in the early 1990s during Seattle\'s grunge movement, and is known for its distinctive vocal style and the harmonized vocals between Cantrell and Layne Staley (and later Cantrell and William DuVall). Cantrell started to sing lead vocals on Alice in Chains\' 1992 EP Sap. After Staley\'s death in 2002, Cantrell took the role of Alice in Chains\' lead singer on most of the songs from the band\'s post-Staley albums, Black Gives Way to Blue (2009), The Devil Put Dinosaurs Here (2013) and Rainier Fog (2018), with DuVall harmonizing with him in the new songs and singing Staley\'s vocals in the old songs in live concerts.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (19, 5, 'Mike', 'Inez', NULL, 'Bass', 'https://i.redd.it/rwcntc4u3y0a1.jpg', 'Michael Allen Inez (born May 14, 1966) is an American rock musician best known for his role as the bassist of Alice in Chains since 1993. He is also recognized for his work with Ozzy Osbourne from 1989–1993. Inez has also been associated with Slash\'s Snakepit, Black Label Society, Spys4Darwin, and Heart. He is of Filipino descent. Inez has earned seven Grammy Award nominations as a member of Alice in Chains.');
INSERT INTO `artist` (`id`, `band_id`, `first_name`, `last_name`, `stage_name`, `instrument`, `image`, `description`) VALUES (20, 5, 'Sean', 'Kiney', NULL, 'Drums', 'https://www.beatit.tv/wp-content/uploads/2016/06/Sean-Kinney-1.jpg', 'Sean Howard Kinney (born May 27, 1966) is an American musician, best known as the drummer and co-founder of the rock band Alice in Chains. Kinney also founded the short-lived supergroup Spys4Darwin, and has collaborated with other artists such as Johnny Cash and Metallica. He played drums for his Alice in Chains bandmate, Jerry Cantrell\'s first solo album, Boggy Depot (1998). Since 2009, Kinney has been co-owner of the Crocodile club in Seattle. He was a guest drummer on NBC\'s Late Night with Seth Meyers in September 2018. Kinney has earned nine Grammy Award nominations as a member of Alice in Chains.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `band_has_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (1, 1);
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (5, 1);
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (2, 2);
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (3, 2);
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (4, 2);
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (1, 3);
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (2, 3);
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (4, 3);
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (3, 3);
INSERT INTO `band_has_event` (`band_id`, `event_id`) VALUES (5, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_events`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `favorite_events` (`user_id`, `event_id`) VALUES (4, 2);

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
INSERT INTO `venue_comment` (`id`, `comment`, `comment_date`, `user_id`, `venue_id`, `reply_to_id`) VALUES (2, 'I agree!', '2023-03-17 14:00', 2, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `band_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `band_comment` (`id`, `comment`, `comment_date`, `band_id`, `reply_id`, `user_id`) VALUES (1, 'This is my favorite band', '2023-05-02 10:59', 1, NULL, 1);
INSERT INTO `band_comment` (`id`, `comment`, `comment_date`, `band_id`, `reply_id`, `user_id`) VALUES (2, 'Mine too!', '2023-05-03 15:20', 1, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `eventlightdb`;
INSERT INTO `event_rating` (`user_id`, `event_id`, `rating`, `rating_comment`, `rating_date`) VALUES (1, 1, 5, 'This event is going to be awesome I\'m so excited!', '2023-05-18 06:15');
INSERT INTO `event_rating` (`user_id`, `event_id`, `rating`, `rating_comment`, `rating_date`) VALUES (1, 2, 3, 'Kinda boring.', '2023-02-18 05:45');

COMMIT;

