-- MySQL Workbench Synchronization
-- Generated: 2021-02-14 19:03
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: seila

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `vk_new` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

CREATE TABLE IF NOT EXISTS `vk_new`.`communities` (
  `id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(145) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `description` VARCHAR(245) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `admin_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_communities_users1_idx` (`admin_id` ASC) VISIBLE,
  CONSTRAINT `fk_communities_users1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `vk_new`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vk_new`.`friend` (
  `from_users_id` INT(10) UNSIGNED NOT NULL,
  `to_users_id` INT(10) UNSIGNED NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '-1 - отклонен\\n0 - запрос\\n1 - принят',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`from_users_id`, `to_users_id`),
  INDEX `fk_friend_requests_users1_idx` (`from_users_id` ASC) VISIBLE,
  INDEX `fk_friend_requests_users2_idx` (`to_users_id` ASC) VISIBLE,
  CONSTRAINT `fk_friend_requests_users1`
    FOREIGN KEY (`from_users_id`)
    REFERENCES `vk_new`.`users` (`id`),
  CONSTRAINT `fk_friend_requests_users2`
    FOREIGN KEY (`to_users_id`)
    REFERENCES `vk_new`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vk_new`.`likes` (
  `users_id` INT(10) UNSIGNED NOT NULL,
  `media_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `messages_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `posts_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `likescol` INT(11) NULL DEFAULT NULL,
  `summ` INT(10) UNSIGNED NOT NULL,
  UNIQUE INDEX `like_media` (`users_id` ASC, `media_id` ASC) VISIBLE,
  UNIQUE INDEX `like_messages` (`users_id` ASC, `messages_id` ASC) VISIBLE,
  UNIQUE INDEX `like_posts` (`users_id` ASC, `posts_id` ASC) VISIBLE,
  INDEX `fk_likes_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_likes_media1_idx` (`media_id` ASC) VISIBLE,
  INDEX `fk_likes_messages1_idx` (`messages_id` ASC) VISIBLE,
  INDEX `fk_likes_posts1_idx` (`posts_id` ASC) VISIBLE,
  CONSTRAINT `fk_likes_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `vk_new`.`media` (`id`),
  CONSTRAINT `fk_likes_messages1`
    FOREIGN KEY (`messages_id`)
    REFERENCES `vk_new`.`messages` (`id`),
  CONSTRAINT `fk_likes_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `vk_new`.`posts` (`id`),
  CONSTRAINT `fk_likes_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `vk_new`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vk_new`.`media` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_types_id` INT(10) UNSIGNED NOT NULL,
  `users_id` INT(10) UNSIGNED NOT NULL,
  `size` BIGINT(20) NOT NULL,
  `file` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL COMMENT '/files/folder/file.jpg\\n\\n',
  `blob` BLOB NULL DEFAULT NULL,
  `metadata` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_media_media_types1_idx` (`media_types_id` ASC) VISIBLE,
  INDEX `fk_media_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_media_media_types1`
    FOREIGN KEY (`media_types_id`)
    REFERENCES `vk_new`.`media_types` (`id`),
  CONSTRAINT `fk_media_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `vk_new`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vk_new`.`media_types` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vk_new`.`messages` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_users_id` INT(10) UNSIGNED NOT NULL,
  `to_users_id` INT(10) UNSIGNED NOT NULL,
  `text` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_messages_users1_idx` (`from_users_id` ASC) VISIBLE,
  INDEX `fk_messages_users2_idx` (`to_users_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`from_users_id`)
    REFERENCES `vk_new`.`users` (`id`),
  CONSTRAINT `fk_messages_users2`
    FOREIGN KEY (`to_users_id`)
    REFERENCES `vk_new`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vk_new`.`posts` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `posts_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `users_id` INT(10) UNSIGNED NOT NULL,
  `communities_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `text` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `media_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_posts_communities1_idx` (`communities_id` ASC) VISIBLE,
  INDEX `fk_posts_media1_idx` (`media_id` ASC) VISIBLE,
  INDEX `fk_posts_posts1_idx` (`posts_id` ASC) VISIBLE,
  CONSTRAINT `fk_posts_communities1`
    FOREIGN KEY (`communities_id`)
    REFERENCES `vk_new`.`communities` (`id`),
  CONSTRAINT `fk_posts_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `vk_new`.`media` (`id`),
  CONSTRAINT `fk_posts_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `vk_new`.`posts` (`id`),
  CONSTRAINT `fk_posts_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `vk_new`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vk_new`.`profiles` (
  `users_id` INT(10) UNSIGNED NOT NULL,
  `firstname` VARCHAR(245) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `lastname` VARCHAR(245) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `gender` ENUM('m', 'f', 'x') CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `birthday` DATE NOT NULL,
  `address` VARCHAR(245) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `status` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `photo_id` INT(10) UNSIGNED NULL DEFAULT NULL AUTO_INCREMENT,
  `school` VARCHAR(145) NULL DEFAULT NULL,
  PRIMARY KEY (`users_id`),
  INDEX `fk_profiles_media1_idx` (`photo_id` ASC) VISIBLE,
  INDEX `firstname_lastname_idx` (`lastname` ASC, `firstname` ASC) VISIBLE,
  CONSTRAINT `fk_profiles_media1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `vk_new`.`media` (`id`),
  CONSTRAINT `fk_profiles_users_users_id`
    FOREIGN KEY (`users_id`)
    REFERENCES `vk_new`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vk_new`.`users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(245) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `phone` BIGINT(20) NOT NULL,
  `password_hash` CHAR(64) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vk_new`.`users_communities` (
  `communities_id` INT(10) UNSIGNED NOT NULL,
  `users_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`communities_id`, `users_id`),
  INDEX `fk_users_communities_communities1_idx` (`communities_id` ASC) VISIBLE,
  INDEX `fk_users_communities_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_communities_communities1`
    FOREIGN KEY (`communities_id`)
    REFERENCES `vk_new`.`communities` (`id`),
  CONSTRAINT `fk_users_communities_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `vk_new`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vk_new`.`school_types` (
  `profiles_users_id` INT(10) UNSIGNED NOT NULL,
  `types` ENUM('h', 'c', 'u') NULL DEFAULT NULL COMMENT 'h - high school\nc - college\nu - university',
  `name` VARCHAR(145) NULL DEFAULT NULL,
  `city` VARCHAR(145) NOT NULL,
  INDEX `fk_school_types_profiles1_idx` (`profiles_users_id` ASC) VISIBLE,
  PRIMARY KEY (`profiles_users_id`),
  CONSTRAINT `fk_school_types_profiles1`
    FOREIGN KEY (`profiles_users_id`)
    REFERENCES `vk_new`.`profiles` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
