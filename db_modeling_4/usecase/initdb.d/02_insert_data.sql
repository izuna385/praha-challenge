INSERT INTO `app`.`teams` (`id`, `name`, `access_token`)
VALUES 
('team1', 'Team 1', 'token1'),
('team2', 'Team 2', 'token2'),
('team3', 'Team 3', 'token3');

INSERT INTO `app`.`users` (`id`, `team_id`, `access_token`)
VALUES 
('user1', 'team1', 'token1'),
('user2', 'team1', 'token2'),
('user3', 'team2', 'token3'),
('user4', 'team2', 'token4'),
('user5', 'team3', 'token5');

INSERT INTO `app`.`publishers` (`id`, `user_id`, `reminder_id`)
VALUES 
('pub1', 'user1', 'rem1'),
('pub2', 'user2', 'rem2'),
('pub3', 'user3', 'rem3');

INSERT INTO `app`.`recievers` (`id`, `user_id`, `reminder_id`)
VALUES 
('rec1', 'user4', 'rem1'),
('rec2', 'user4', 'rem2'),
('rec3', 'user5', 'rem3');

INSERT INTO `app`.`reminders` (`id`, `team_id`, `created_at`, `updated_at`, `text`, `frequency`, `initial_remind_time`, `next_remind_time`, `publisher_id`, `reciever_id`)
VALUES 
('rem1', 'team1', '2022-01-01 10:00:00', '2022-01-01 10:00:00', 'Reminder 1', 'daily', '2022-01-01 10:00:00', '2022-01-02 10:00:00', 'pub1', 'rec1'),
('rem2', 'team1', '2022-01-02 10:00:00', '2022-01-02 10:00:00', 'Reminder 2', 'weekly', '2022-01-02 10:00:00', '2022-01-09 10:00:00', 'pub2', 'rec2'),
('rem3', 'team3', '2022-01-03 10:00:00', '2022-01-03 10:00:00', 'Reminder 3', 'monthly', '2022-01-03 10:00:00', '2022-02-03 10:00:00', 'pub3', 'rec3');