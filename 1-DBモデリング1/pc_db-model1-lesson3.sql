CREATE SCHEMA `commerce`;

CREATE TABLE `commerce`.`orders` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int,
  `is_take_away` boolean NOT NULL,
  `pre_order_id` int
);

CREATE TABLE `commerce`.`pre_orders` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `picked_time` timestamp NOT NULL,
  `picked_store_id` int NOT NULL,
  `is_picked` boolean NOT NULL
);

CREATE TABLE `commerce`.`stores` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `address` string NOT NULL,
  `store_name` string NOT NULL,
  `postal_code` string NOT NULL
);

CREATE TABLE `commerce`.`users` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `tel_number` string NOT NULL
);

CREATE TABLE `commerce`.`ordered_items` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT 0,
  `remove_wasabi` boolean NOT NULL DEFAULT False,
  `created_at` timestamp NOT NULL
);

CREATE TABLE `commerce`.`order_status` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `paid` boolean NOT NULL DEFAULT False
);

CREATE TABLE `commerce`.`items` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `item_name` string NOT NULL,
  `price` integer64 NOT NULL
);

CREATE TABLE `commerce`.`categories` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` string DEFAULT "null",
  `created_at` timestamp NOT NULL
);

ALTER TABLE `commerce`.`orders` ADD FOREIGN KEY (`store_id`) REFERENCES `commerce`.`stores` (`id`);

ALTER TABLE `commerce`.`orders` ADD FOREIGN KEY (`user_id`) REFERENCES `commerce`.`users` (`id`);

ALTER TABLE `commerce`.`orders` ADD FOREIGN KEY (`pre_order_id`) REFERENCES `commerce`.`pre_orders` (`id`);

ALTER TABLE `commerce`.`pre_orders` ADD FOREIGN KEY (`picked_store_id`) REFERENCES `commerce`.`stores` (`id`);

ALTER TABLE `commerce`.`ordered_items` ADD FOREIGN KEY (`order_id`) REFERENCES `commerce`.`orders` (`id`);

ALTER TABLE `commerce`.`ordered_items` ADD FOREIGN KEY (`item_id`) REFERENCES `commerce`.`items` (`id`);

ALTER TABLE `commerce`.`order_status` ADD FOREIGN KEY (`order_id`) REFERENCES `commerce`.`orders` (`id`);

ALTER TABLE `commerce`.`items` ADD FOREIGN KEY (`category_id`) REFERENCES `commerce`.`categories` (`id`);
