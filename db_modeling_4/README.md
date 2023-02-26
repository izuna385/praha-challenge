# db modeling 4

![img](./db_modeling_4.png)

```
(base) ➜  usecase git:(main) ✗ docker-compose up -d
(base) ➜  usecase git:(main) ✗ docker exec -it mysql-container bash
hostname -i
# mysql -h 172.18.0.2 -P 3306 -u root -p
mysql -u root -p
```

# サンプルクエリ
* 使用できるのは、シードデータの投入後とする。
* [挿入データ](https://github.com/izuna385/praha-challenge/blob/main/db_modeling_4/usecase/initdb.d/02_insert_data.sql)を参照のこと。

## 新reminder の追加
```mysql
INSERT INTO `app`.`reminders` (`id`, `team_id`, `created_at`, `updated_at`, `text`, `frequency`, `initial_remind_time`, `next_remind_time`, `publisher_id`, `reciever_id`)
VALUES 
('rem1', 'team1', '2022-01-01 10:00:00', '2022-01-01 10:00:00', 'Reminder 1', 'daily', '2022-01-01 10:00:00', '2022-01-02 10:00:00', 'pub1', 'rec1'),
('rem2', 'team1', '2022-01-02 10:00:00', '2022-01-02 10:00:00', 'Reminder 2', 'weekly', '2022-01-02 10:00:00', '2022-01-09 10:00:00', 'pub2', 'rec2'),
('rem3', 'team3', '2022-01-03 10:00:00', '2022-01-03 10:00:00', 'Reminder 3', 'monthly', '2022-01-03 10:00:00', '2022-02-03 10:00:00', 'pub3', 'rec3');
```

## バッチ処理後の `reminders.next_remind_time` アップデート
* `reminders.frequency`, `reminders.initial_remind_time` の2つをアプリ側で読み取り、バッチ処理のtimestampとこの2つを考慮して、アプリ側から `reminders.next_remind_time` をアップデートする。

