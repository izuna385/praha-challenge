USE slack;
-- Insert initlal data
START TRANSACTION;

INSERT INTO `slack`.`workspaces` (`id`, `authenticated_user_id`, `name`)
VALUES (1, 1, 'Workplace 1'), (2, 2, 'Workplace 2');

INSERT INTO `slack`.`authentificated_user` (`id`, `mail`)
VALUES (1, 'user1@example.com'), (2, 'user2@example.com');

INSERT INTO `slack`.`users` (`id`, `name`, `created_at`, `country_code`)
VALUES (1, 'User 1', NOW(), 1), (2, 'User 2', NOW(), 2), (3, 'User 3', NOW(), 3);

INSERT INTO `slack`.`channels` (`id`, `channel_name`, `user_id`, `workspace_id`, `created_at`)
VALUES (1, 'Channel 1', 1, 1, NOW()), (2, 'Channel 2', 2, 2, NOW());

INSERT INTO `slack`.`channel_invitation_status` (`id`, `user_id`, `channel_id`, `created_at`)
VALUES (1, 1, 1, NOW()), (2, 2, 2, NOW());

INSERT INTO `slack`.`messages` (`id`, `user_id`, `chanel_id`, `created_at`, `message`)
VALUES (1, 1, 1, NOW(), 'Message 1'), (2, 2, 2, NOW(), 'Message 2');

INSERT INTO `slack`.`threads` (`message_id`, `parent_message_id`)
VALUES (2, 1);

COMMIT;