CREATE SCHEMA `airtable`;

CREATE TABLE `airtable`.`users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `airtable`.`documents` (
  `id` int PRIMARY KEY,
  `title` varchar(50) NOT NULL,
  `text` varchar(50) NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `airtable`.`document_relations` (
  `parent_id` int,
  `chanel_id` int,
  PRIMARY KEY (`parent_id`, `chanel_id`)
);

CREATE TABLE `airtable`.`display_order` (
  `id` int PRIMARY KEY,
  `document_id` int NOT NULL,
  `order` int NOT NULL DEFAULT 1
);

ALTER TABLE `airtable`.`document_relations` ADD FOREIGN KEY (`parent_id`) REFERENCES `airtable`.`documents` (`id`);

ALTER TABLE `airtable`.`document_relations` ADD FOREIGN KEY (`chanel_id`) REFERENCES `airtable`.`documents` (`id`);

ALTER TABLE `airtable`.`display_order` ADD FOREIGN KEY (`document_id`) REFERENCES `airtable`.`documents` (`id`);
