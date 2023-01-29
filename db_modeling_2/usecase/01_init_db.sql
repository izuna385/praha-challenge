CREATE SCHEMA `slack`;

CREATE TABLE `slack`.`workspaces` (
  `id` int,
  `authenticated_user_id` int,
  `name` varchar(255)
);

CREATE TABLE `slack`.`crete_workspace` (
  `id` int,
  `authenticated_user_id` int,
  `created_at` varchar(255) DEFAULT (now())
);

CREATE TABLE `slack`.`user_authentificate` (
  `id` int,
  `authenticated_user_id` int,
  `created_at` varchar(255) DEFAULT (now())
);

CREATE TABLE `slack`.`authentificated_user` (
  `id` int,
  `mail` varchar(255) NOT NULL
);

CREATE TABLE `slack`.`users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `created_at` timestamp DEFAULT (now()),
  `country_code` int
);

CREATE TABLE `slack`.`channels` (
  `id` int PRIMARY KEY,
  `channel_name` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `workspace_id` int NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `slack`.`channel_invitation_status` (
  `id` int PRIMARY KEY,
  `user_id` int NOT NULL,
  `channel_id` int NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `slack`.`messages` (
  `id` int PRIMARY KEY,
  `user_id` int NOT NULL,
  `chanel_id` int NOT NULL,
  `created_at` timestamp DEFAULT (now()),
  `message` varchar(200) NOT NULL
);

CREATE TABLE `slack`.`threads` (
  `message_id` int,
  `parent_message_id` int,
  PRIMARY KEY (`message_id`, `parent_message_id`)
);

ALTER TABLE `slack`.`workspaces` ADD FOREIGN KEY (`authenticated_user_id`) REFERENCES `slack`.`authentificated_user` (`id`);

ALTER TABLE `slack`.`crete_workspace` ADD FOREIGN KEY (`authenticated_user_id`) REFERENCES `slack`.`authentificated_user` (`id`);

ALTER TABLE `slack`.`user_authentificate` ADD FOREIGN KEY (`authenticated_user_id`) REFERENCES `slack`.`authentificated_user` (`id`);

ALTER TABLE `slack`.`channels` ADD FOREIGN KEY (`user_id`) REFERENCES `slack`.`users` (`id`);

ALTER TABLE `slack`.`channels` ADD FOREIGN KEY (`workspace_id`) REFERENCES `slack`.`workspaces` (`id`);

ALTER TABLE `slack`.`channel_invitation_status` ADD FOREIGN KEY (`user_id`) REFERENCES `slack`.`users` (`id`);

ALTER TABLE `slack`.`channel_invitation_status` ADD FOREIGN KEY (`channel_id`) REFERENCES `slack`.`channels` (`id`);

ALTER TABLE `slack`.`messages` ADD FOREIGN KEY (`user_id`) REFERENCES `slack`.`users` (`id`);

ALTER TABLE `slack`.`messages` ADD FOREIGN KEY (`chanel_id`) REFERENCES `slack`.`channels` (`id`);

ALTER TABLE `slack`.`threads` ADD FOREIGN KEY (`message_id`) REFERENCES `slack`.`messages` (`id`);

ALTER TABLE `slack`.`threads` ADD FOREIGN KEY (`parent_message_id`) REFERENCES `slack`.`messages` (`id`);