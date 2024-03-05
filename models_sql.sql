CREATE TABLE `user` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(105) UNIQUE NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `logged_token` VARCHAR(255),
    `recovery_token` VARCHAR(255),
    `active` TINYINT(1) NOT NULL DEFAULT 1,
    `created_by` INT NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_by` INT NOT NULL,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `role` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `role_name` VARCHAR(45) NOT NULL,
    `description` TINYTEXT,
    `active` TINYINT(1) NOT NULL DEFAULT 1,
    `created_by` INT NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_by` INT NOT NULL,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `route` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `url` VARCHAR(255) NOT NULL,
    `description` TINYTEXT,
    `created_by` INT NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_by` INT NOT NULL,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `action` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `action_name` varchar(255) NOT NULL,
    `created_by` INT NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_by` INT NOT NULL,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `user_role` (
    `id` int(11) NOT NULL,
    `user_id` int(11) NOT NULL,
    `role_id` int(11) NOT NULL,
    `created_by` int(11) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_by` int(11) NOT NULL,
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`role_id`) REFERENCES `role`(`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `role_action` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `role_id` INT NOT NULL,
    `action_id` INT NOT NULL,
    `created_by` INT NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_by` INT NOT NULL,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`role_id`) REFERENCES `role`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`action_id`) REFERENCES `action`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `profile` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `user_id` int(11) NOT NULL,
    `first_name` varchar(65) NOT NULL,
    `last_name` varchar(65) NOT NULL,
    `birth` date NOT NULL,
    `phone_number` varchar(25) NOT NULL,
    `created_by` INT NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_by` INT NOT NULL,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `cat`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `race` VARCHAR(45) NOT NULL,
    `birth` DATE NOT NULL,
    `price` DECIMAL(6,2) NOT NULL
);