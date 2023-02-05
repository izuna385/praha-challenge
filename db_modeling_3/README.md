# db modeling 3

![img](./db_modeling_3.png)

```
(base) ➜  usecase git:(main) ✗ docker-compose up -d
(base) ➜  usecase git:(main) ✗ docker exec -it mysql-container bash
hostname -i
# mysql -h 172.27.0.3 -P 3306 -u root -p
mysql -u root -p
```

# 要件
https://shared-brake-3fd.notion.site/DB-3-bab0923d811140ca9d1421d2ebc0d53c

# 構造
![img](./structure.png)

# サンプルクエリ
子孫

```mysql
mysql> SELECT documents.* FROM documents INNER JOIN document_relations ON documents.id = document_relations.child_id WHERE parent_id = 2;
+----+------------+--------+---------------------+
| id | title      | text   | created_at          |
+----+------------+--------+---------------------+
|  2 | Document 2 | Text 2 | 2023-02-06 07:01:53 |
|  3 | Document 3 | Text 3 | 2023-02-06 07:01:53 |
|  7 | Document 7 | Text 7 | 2023-02-06 07:01:53 |
+----+------------+--------+---------------------+
3 rows in set (0.03 sec)
```


先祖
```
mysql> SELECT documents.* FROM documents INNER JOIN document_relations ON documents.id = document_relations.parent_id WHERE child_id = 7;
+----+------------+--------+---------------------+
| id | title      | text   | created_at          |
+----+------------+--------+---------------------+
|  1 | Document 1 | Text 1 | 2023-02-06 07:01:53 |
|  2 | Document 2 | Text 2 | 2023-02-06 07:01:53 |
|  7 | Document 7 | Text 7 | 2023-02-06 07:01:53 |
+----+------------+--------+---------------------+
3 rows in set (0.03 sec)

```

削除
```
# それより深い階層側が消える
DELETE FROM document_relations WHERE child_id = 5;

# 葉ノード削除
DELETE
FROM document_relations
WHERE child_id IN (SELECT child_id FROM document_relations WHERE parent_id = 5);

# https://qiita.com/Kohei-Sato-1221/items/d1cbdc1d3affcd9c3a9e
DELETE FROM document_relations WHERE child_id IN (SELECT child_id FROM (SELECT child_id FROM document_relations WHERE parent_id = 5) AS tmp);

mysql> SELECT * FROM document_relations;
+-----------+----------+
| parent_id | child_id |
+-----------+----------+
|         1 |        1 |
|         1 |        2 |
|         2 |        2 |
|         1 |        3 |
|         2 |        3 |
|         3 |        3 |
|         1 |        4 |
|         4 |        4 |
|         1 |        7 |
|         2 |        7 |
|         7 |        7 |
+-----------+----------+
11 rows in set (0.07 sec)

```



閉包テーブル
```
SELECT * FROM document_relations;
```

