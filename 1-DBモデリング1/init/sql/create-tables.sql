CREATE SCHEMA `commerce`;

CREATE TABLE `commerce`.`orders` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `created_at` datetime,
  `user_id` int
);

CREATE TABLE `commerce`.`users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `created_at` timestamp,
  `tel_number` varchar(255)
);

CREATE TABLE `commerce`.`ordered_items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int,
  `item_id` int,
  `quantity` int DEFAULT 0,
  `remove_wasabi` boolean DEFAULT False,
  `created_at` timestamp
);

CREATE TABLE `commerce`.`order_status` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int,
  `take_away` boolean,
  `paid` boolean DEFAULT False
);

CREATE TABLE `commerce`.`items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `category_id` int,
  `created_at` timestamp,
  `item_name` varchar(255),
  `price` int
);

CREATE TABLE `commerce`.`categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) DEFAULT "null",
  `created_at` timestamp
);

ALTER TABLE `commerce`.`orders` ADD FOREIGN KEY (`user_id`) REFERENCES `commerce`.`users` (`id`);

ALTER TABLE `commerce`.`ordered_items` ADD FOREIGN KEY (`order_id`) REFERENCES `commerce`.`orders` (`id`);

ALTER TABLE `commerce`.`ordered_items` ADD FOREIGN KEY (`item_id`) REFERENCES `commerce`.`items` (`id`);

ALTER TABLE `commerce`.`order_status` ADD FOREIGN KEY (`order_id`) REFERENCES `commerce`.`orders` (`id`);

ALTER TABLE `commerce`.`items` ADD FOREIGN KEY (`category_id`) REFERENCES `commerce`.`categories` (`id`);
