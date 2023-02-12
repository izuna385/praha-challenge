
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
  `child_id` int,
  PRIMARY KEY (`parent_id`, `child_id`)
);

CREATE TABLE `airtable`.`display_orders` (
  `id` int PRIMARY KEY,
  `document_id` int NOT NULL,
  `order_number` int NOT NULL
);

ALTER TABLE `airtable`.`document_relations` ADD FOREIGN KEY (`parent_id`) REFERENCES `airtable`.`documents` (`id`);

ALTER TABLE `airtable`.`document_relations` ADD FOREIGN KEY (`child_id`) REFERENCES `airtable`.`documents` (`id`);

ALTER TABLE `airtable`.`display_orders` ADD FOREIGN KEY (`document_id`) REFERENCES `airtable`.`documents` (`id`);
