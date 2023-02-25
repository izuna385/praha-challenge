-- teamsテーブルにデータを挿入するためのクエリ
INSERT INTO app.teams (id, name, access_token)
VALUES ('1', 'Team A', 'abc123'), ('2', 'Team B', 'def456');

-- usersテーブルにデータを挿入するためのクエリ
INSERT INTO app.users (id, team_id, access_token)
VALUES (1, '1', 'user_token_1'), (2, '1', 'user_token_2'), (3, '2', 'user_token_3');

-- publishersテーブルにデータを挿入するためのクエリ
INSERT INTO app.publishers (id, user_id, reminder_id)
VALUES ('pub1', '1', 'rem1'), ('pub2', '2', 'rem2');

-- recieversテーブルにデータを挿入するためのクエリ
INSERT INTO app.recievers (id, user_id, reminder_id)
VALUES ('rec1', '1', 'rem1'), ('rec2', '2', 'rem2'), ('rec3', '3', 'rem2');

-- remindersテーブルにデータを挿入するためのクエリ
INSERT INTO app.reminders (id, team_id, created_at, updated_at, text, frequency, initial_remind_time, next_Remind_time, publisher_id, reciever_id)
VALUES ('rem1', '1', NOW(), NOW(), 'Reminder 1', 'daily', NOW(), NOW() + INTERVAL 1 DAY, 'pub1', 'rec1'),
('rem2', '1', NOW(), NOW(), 'Reminder 2', 'weekly', NOW(), NOW() + INTERVAL 1 WEEK, 'pub2', 'rec2');