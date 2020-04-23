CREATE DEFINER=`root`@`localhost` PROCEDURE `find_order`(IN orderID INT)
    READS SQL DATA
    DETERMINISTIC
BEGIN
SELECT `Product`.`type`, `Car`.`type`, `Train`.`name` FROM `Order` 
INNER JOIN `Car` ON `Car`.id=`Order`.`car_id` 
INNER JOIN `Train_car_table` ON `Train_car_table`.`car_id`=`Car`.id
INNER JOIN `Train` ON `Train`.id = `Train_car_table`.`train_id`
INNER JOIN `Product` ON `Product`.id = `Order`.`product_id`
WHERE `Order`.id=orderID;
END