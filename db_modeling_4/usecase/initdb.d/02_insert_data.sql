-- Insert sample data for teams table
INSERT INTO `app`.`teams` (`id`, `name`, `access_token`)
VALUES
('team1', 'Team 1', 'access_token1'),
('team2', 'Team 2', 'access_token2');

-- Insert sample data for users table
INSERT INTO `app`.`users` (`id`, `team_id`, `access_token`)
VALUES
(1, 'team1', 'access_token1_user1'),
(2, 'team1', 'access_token1_user2'),
(3, 'team2', 'access_token2_user1'),
(4, 'team2', 'access_token2_user2');

-- Insert sample data for publishers table
INSERT INTO `app`.`publishers` (`user_id`, `reminder_id`)
VALUES
('1', '7e8f9de1-afdb-4a43-b37e-dbf844376711'),
('2', 'eeff2d0d-3179-4a7d-a21a-0e7e172df45b'),
('3', 'a0aa4a22-4d9a-4c5d-a620-6fcd5b5e47df'),
('4', '94a6b25f-80ce-413c-a59b-47a6b8127346');

-- Insert sample data for recievers table
INSERT INTO `app`.`recievers` (`user_id`, `reminder_id`)
VALUES
('1', '7e8f9de1-afdb-4a43-b37e-dbf844376711'),
('2', '7e8f9de1-afdb-4a43-b37e-dbf844376711'),
('3', 'eeff2d0d-3179-4a7d-a21a-0e7e172df45b'),
('4', 'a0aa4a22-4d9a-4c5d-a620-6fcd5b5e47df');

-- Insert sample data for reminders table
INSERT INTO `app`.`reminders` (`id`, `team_id`, `created_at`, `updated_at`, `text`, `frequency`, `initial_remind_time`, `next_remind_time`, `publisher_id`, `reciever_id`)
VALUES
('7e8f9de1-afdb-4a43-b37e-dbf844376711', 'team1', NOW(), NOW(), 'Reminder 1', 'daily', NOW(), NOW(), '1', '1'),
('eeff2d0d-3179-4a7d-a21a-0e7e172df45b', 'team1', NOW(), NOW(), 'Reminder 2', 'weekly', NOW(), NOW(), '2', '3'),
('a0aa4a22-4d9a-4c5d-a620-6fcd5b5e47df', 'team2', NOW(), NOW(), 'Reminder 3', 'monthly', NOW(), NOW(), '4', '4');