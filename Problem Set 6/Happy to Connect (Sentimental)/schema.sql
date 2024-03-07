CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(10) NOT NULL,
    `last_name` VARCHAR(10) NOT NULL,
    `username` VARCHAR(10) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL UNIQUE,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(20) NOT NULL,
    `foundation_year` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL UNIQUE,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `user_connection` (
    `user1_id` INT,
    `user2_id` INT,
    PRIMARY KEY(`user1_id`, `user2_id`)
);

CREATE TABLE `school_connection` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `school_id` INT,
    `attend` DATE NOT NULL,
    `graduated` DATE,
    `degree` ENUM("BA", "MA", "PhD") NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `company_connection` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `company_id` INT,
    `began` DATE NOT NULL,
    `left` DATE,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
