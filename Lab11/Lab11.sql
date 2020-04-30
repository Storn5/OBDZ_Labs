SELECT * FROM product;
SELECT * FROM connection;
SELECT * FROM station;
DELETE FROM station WHERE id=5;
INSERT INTO station VALUE (5, "Ternopil Station", 49.55, 25.59);

SET autocommit=0;
START TRANSACTION;
	INSERT INTO product VALUE (4, "Coal", 1100, 420, 43.2, 3);
	INSERT INTO product VALUE (5, "Iron", 7874, 50, 89.3, 4);
	INSERT INTO product VALUE (6, "Iron", 7874, 61.3, 95.2, 5);
	SAVEPOINT connections;
	INSERT INTO connection VALUE (2, 2, 4, 268.4);
	INSERT INTO connection VALUE (3, 4, 3, 120.2);
	INSERT INTO connection VALUE (4, 3, 5, 111.7);
	INSERT INTO connection VALUE (5, 1, 5, 128.2);

ROLLBACK;
ROLLBACK TO connections;
COMMIT;