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
(6, "Document 6", "Text 6"),
(7, "Document 7", "Text 7");

INSERT INTO airtable.document_relations (parent_id, child_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 2),
(2, 3),
(2, 7),
(3, 3),
(4, 4),
(4, 5),
(5, 5),
(5, 6),
(6, 6),
(7, 7);

INSERT INTO airtable.display_orders (id, document_id, order_number)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1),
(6, 6, 1),
(7, 7, 2);

COMMIT;