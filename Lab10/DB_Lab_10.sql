USE trains;
SELECT * FROM `Product`;
SET @weight = 0.0;
CALL calculate_weight(1, @weight);
SELECT @weight;
SELECT calculate_price(1);