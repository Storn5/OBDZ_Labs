CREATE DEFINER = CURRENT_USER PROCEDURE `calculate_weight` (IN productID INT) DETERMINISTIC READS SQL DATA
BEGIN
DECLARE weight_per_m3 FLOAT DEFAULT 0.0;
DECLARE volume FLOAT DEFAULT 0.0;
DECLARE weight FLOAT DEFAULT 0.0;
SELECT `weight_per_m3` INTO weight_per_m3 FROM `Product` WHERE `id`=productID;
SELECT `volume` INTO volume FROM `Product` WHERE `id`=productID;
SET weight = volume * weight_per_m3;
SELECT weight;
END
