CREATE SCHEMA `app`;

CREATE TABLE `app`.`teams` (
  `id` varchar(255) PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL
);

CREATE TABLE `app`.`users` (
  `id` varchar(255) PRIMARY KEY,
  `team_id` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL
);

CREATE TABLE `app`.`publishers` (
  `id` varchar(255) PRIMARY KEY NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `reminder_id` varchar(255) NOT NULL
);

CREATE TABLE `app`.`recievers` (
  `id` varchar(255) PRIMARY KEY NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `reminder_id` varchar(255) NOT NULL
);

CREATE TABLE `app`.`reminders` (
  `id` varchar(255) PRIMARY KEY NOT NULL,
  `team_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `text` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `initial_remind_time` timestamp NOT NULL,
  `next_remind_time` timestamp NOT NULL,
  `publisher_id` varchar(255) NOT NULL,
  `reciever_id` varchar(255) NOT NULL
);

ALTER TABLE `app`.`users` ADD FOREIGN KEY (`team_id`) REFERENCES `app`.`teams` (`id`);

ALTER TABLE `app`.`reminders` ADD FOREIGN KEY (`team_id`) REFERENCES `app`.`teams` (`id`);

ALTER TABLE `app`.`reminders` ADD FOREIGN KEY (`publisher_id`) REFERENCES `app`.`publishers` (`id`);

ALTER TABLE `app`.`reminders` ADD FOREIGN KEY (`reciever_id`) REFERENCES `app`.`recievers` (`id`);

ALTER TABLE `app`.`publishers` ADD FOREIGN KEY (`user_id`) REFERENCES `app`.`users` (`id`);

ALTER TABLE `app`.`recievers` ADD FOREIGN KEY (`user_id`) REFERENCES `app`.`users` (`id`);
