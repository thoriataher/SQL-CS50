CREATE DATABASE `linkedin`;

USE `linkedin`;

CREATE TABLE
    `users` (
        `id` INT AUTO_INCREMENT,
        `first_name` VARCHAR(32) NOT NULL,
        `last_name` VARCHAR(32) NOT NULL,
        `username` VARCHAR(32) NOT NULL UNIQUE,
        `password` VARCHAR(128) NOT NULL,
        PRIMARY KEY (`id`)
    );

CREATE TABLE
    `schools` (
        `id` INT AUTO_INCREMENT,
        `user_id` INT,
        `name` VARCHAR(100) NOT NULL,
        `type` ENUM ('Primary', 'Secondary', 'Higher Education') NOT NULL,
        `location` VARCHAR(100) NOT NULL,
        `Year_of_establishmen` YEAR NOT NULL,
        PRIMARY KEY (`id`),
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
    );

CREATE TABLE
    `companies` (
        `id` INT AUTO_INCREMENT,
        `user_id` INT,
        `name` VARCHAR(100) NOT NULL,
        `location` VARCHAR(100) NOT NULL,
        `industry` ENUM ('Technology', '“Education', 'Business'),
        PRIMARY KEY (`id`),
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
    );

CREATE TABLE
    `connections_with_people` (
        `user_id_1` INT NOT NULL,
        `user_id_2` INT NOT NULL,
        PRIMARY KEY (`user_id_1`, `user_id_2`),
        FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
        FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`)
    );

CREATE TABLE
    `connections_with_schools` (
        `user_id` INT NOT NULL,
        `school_id` INT NOT NULL,
        `start_date` DATE NOT NULL,
        `end_date` DATE,
        `status` ENUM ('earned', 'pursude') NOT NULL,
        `type` VARCHAR(10) NT NULL,
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
        FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
    );

CREATE TABLE
    `connections_with_companies` (
        `user_id` INT NOT NULL,
        `company_id` INT NOT NULL,
        `start_date` DATE NOT NULL,
        `end_date` DATE,
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
        FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
    )
