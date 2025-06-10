CREATE TABLE `book` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `author` VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `published` VARCHAR(100),
    `isbn` VARCHAR(20),
    `price` DECIMAL(10,2) DEFAULT NULL,
    `stock` INT,
    `description` TEXT,
    `created_at` datetime NOT NULL,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted` tinyint UNSIGNED NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `isbn` (`isbn`),
    KEY `deleted` (`deleted`)
);