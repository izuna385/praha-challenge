USE airtable;
START TRANSACTION;

INSERT INTO airtable.users (name)
VALUES
("User 1"),
("User 2");

INSERT INTO airtable.documents (id, title, text)
VALUES
(1, "Document 1", "Text 1"),
(2, "Document 2", "Text 2"),
(3, "Document 3", "Text 3"),
(4, "Document 4", "Text 4"),
(5, "Document 5", "Text 5"),
(6, "Document 6", "Text 6");

INSERT INTO airtable.document_relations (parent_id, chanel_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 2),
(2, 3),
(3, 3),
(4, 4),
(4, 5),
(5, 5),
(5, 6),
(6, 6)
;

INSERT INTO airtable.display_order (document_id, order)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 1);

COMMIT;