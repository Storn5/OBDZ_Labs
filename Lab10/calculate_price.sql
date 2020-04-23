CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_price`(productID INT) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE var_freight_rate FLOAT DEFAULT 0.0;
DECLARE var_weight FLOAT DEFAULT 0.0;
SELECT `freight_rate` INTO var_freight_rate FROM `Product` WHERE id=productID;
CALL calculate_weight(productID, var_weight);
RETURN (var_freight_rate * var_weight);
END