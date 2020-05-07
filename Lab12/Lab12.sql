CREATE TRIGGER order_delete
BEFORE DELETE ON trains.product FOR EACH ROW
UPDATE trains.order SET product_id=1, product_volume=0 WHERE product_id=OLD.id;

CREATE TRIGGER client_password
BEFORE INSERT ON trains.client FOR EACH ROW
SET NEW.password = AES_ENCRYPT(NEW.password, 'key-key');

CREATE TRIGGER subtract_volume
AFTER INSERT ON trains.order FOR EACH ROW
UPDATE trains.product SET volume = volume - NEW.product_volume WHERE id=NEW.product_id;

SELECT * FROM trains.order;
SELECT * FROM trains.product;
SELECT * FROM trains.client;

DELETE FROM trains.product WHERE id=2;
DELETE FROM trains.client WHERE id=1;
INSERT INTO trains.client VALUE (2, "NewUser", "12345", "user@user.com", "User", "Userovich");

INSERT INTO trains.product VALUE (2, "Coal", 1100, 300, 50, 1);
INSERT INTO trains.order VALUE (1, 2, 2, 20.0, 1, 1);
DELETE FROM trains.client WHERE id=2;
DELETE FROM trains.order WHERE id=1;