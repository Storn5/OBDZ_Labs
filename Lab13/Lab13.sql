USE trains;
CREATE INDEX order_product_indx ON `order` (id, product_id);
SHOW INDEX FROM `order`;
CREATE INDEX car_type_indx ON `car` (id, `type`);
SHOW INDEX FROM `car`;

SELECT `order`.id AS `Order`, product.`type` AS `Product`, `order`.product_volume AS `Volume`,
car.`type` AS `Car Type`, train.`name` AS `Train`
FROM `order` INNER JOIN `product` INNER JOIN `car` INNER JOIN `train_car_table` INNER JOIN `train`
ON `order`.product_id=product.id AND `order`.car_id=car.id AND `train_car_table`.car_id=car.id AND `train`.id=`train_car_table`.train_id;

SELECT STRAIGHT_JOIN `order`.id AS `Order`, product.`type` AS `Product`, `order`.product_volume AS `Volume`,
car.`type` AS `Car Type`, train.`name` AS `Train`
FROM `order` INNER JOIN `product` INNER JOIN `car` INNER JOIN `train_car_table` INNER JOIN `train`
ON `order`.product_id=product.id AND `order`.car_id=car.id AND `train_car_table`.car_id=car.id AND `train`.id=`train_car_table`.train_id;