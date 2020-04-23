CREATE DATABASE IF NOT EXISTS trains;

USE trains;

CREATE TABLE `Station` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`latitude` FLOAT NOT NULL,
	`longitude` FLOAT NOT NULL,
	PRIMARY KEY (`id`),
    UNIQUE (`name`)
);

CREATE TABLE `Product` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(50) NOT NULL,
	`weight_per_m3` FLOAT NOT NULL,
	`volume` FLOAT NOT NULL,
	`freight_rate` FLOAT NOT NULL,
	`location_id` INT NOT NULL,
	PRIMARY KEY (`id`),
    CONSTRAINT `Product_fk0` FOREIGN KEY (`location_id`) REFERENCES `Station`(`id`)
	ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE `Connection` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`location_1_id` INT NOT NULL,
	`location_2_id` INT NOT NULL,
	`distance` FLOAT NOT NULL,
	PRIMARY KEY (`id`),
    CONSTRAINT `Connection_fk0` FOREIGN KEY (`location_1_id`) REFERENCES `Station`(`id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `Connection_fk1` FOREIGN KEY (`location_2_id`) REFERENCES `Station`(`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Car` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(25) NOT NULL,
	`weight` FLOAT NOT NULL,
	`volume` FLOAT NOT NULL,
	PRIMARY KEY (`id`),
    UNIQUE (`type`)
);

CREATE TABLE `Locomotive` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(25) NOT NULL,
	`max_speed` FLOAT NOT NULL,
	`acceleration` FLOAT NOT NULL,
	`weight` FLOAT NOT NULL,
	`price_per_km` FLOAT NOT NULL,
	PRIMARY KEY (`id`),
    UNIQUE (`type`)
);

CREATE TABLE `Train` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(25) NOT NULL,
	`locomotive_id` INT NOT NULL,
	`location_id` INT NOT NULL,
	PRIMARY KEY (`id`),
    UNIQUE (`name`),
    CONSTRAINT `Train_fk0` FOREIGN KEY (`locomotive_id`) REFERENCES `Locomotive`(`id`)
    ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT `Train_fk1` FOREIGN KEY (`location_id`) REFERENCES `Station`(`id`)
    ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE `Train_Car_Table` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`train_id` INT NOT NULL,
	`car_id` INT NOT NULL,
	PRIMARY KEY (`id`),
    CONSTRAINT `Train_Car_Table_fk0` FOREIGN KEY (`train_id`) REFERENCES `Train`(`id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `Train_Car_Table_fk1` FOREIGN KEY (`car_id`) REFERENCES `Car`(`id`)
    ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE `Client` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NOT NULL,
	`password` VARCHAR(50) NOT NULL,
	`email` VARCHAR(50) NOT NULL,
	`first_name` VARCHAR(25) NOT NULL,
	`last_name` VARCHAR(25) NOT NULL,
	PRIMARY KEY (`id`),
    UNIQUE (`email`),
    UNIQUE (`username`)
);

CREATE TABLE `Order` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`destination_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`product_volume` FLOAT NOT NULL,
	`client_id` INT NOT NULL,
	`car_id` INT NOT NULL,
	PRIMARY KEY (`id`),
    CONSTRAINT `Order_fk0` FOREIGN KEY (`destination_id`) REFERENCES `Station`(`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `Order_fk1` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `Order_fk2` FOREIGN KEY (`client_id`) REFERENCES `Client`(`id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `Order_fk3` FOREIGN KEY (`car_id`) REFERENCES `Car`(`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);