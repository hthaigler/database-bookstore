-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;

USE cah0077db;
-- ************************************** `employee`

CREATE TABLE `employees`
(
 `employee_id` int NOT NULL AUTO_INCREMENT ,
 `first_name`  varchar(45) NOT NULL ,
 `last_name`   varchar(45) NOT NULL ,

PRIMARY KEY (`employee_id`)
);

-- ************************************** `customer`

CREATE TABLE `customers`
(
 `customer_id` int NOT NULL AUTO_INCREMENT ,
 `first_name`  varchar(45) NOT NULL ,
 `last_name`   varchar(45) NOT NULL ,
 `phone`       varchar(15) NOT NULL ,

PRIMARY KEY (`customer_id`)
);

-- ************************************** `supplier`

CREATE TABLE `suppliers`
(
 `supplier_id`        int NOT NULL AUTO_INCREMENT ,
 `company_name`       varchar(45) NOT NULL ,
 `contact_last_name`  varchar(45) NOT NULL ,
 `contact_first_name` varchar(45) NOT NULL ,
 `phone`              varchar(15) NOT NULL ,

PRIMARY KEY (`supplier_id`)
);

-- ************************************** `shipper`

CREATE TABLE `shippers`
(
 `shipper_id` int NOT NULL AUTO_INCREMENT ,
 `name`       varchar(45) NOT NULL ,

PRIMARY KEY (`shipper_id`)
);

-- ************************************** `subject`

CREATE TABLE `subjects`
(
 `subject_id` int NOT NULL AUTO_INCREMENT ,
 `category`   varchar(45) NOT NULL ,

PRIMARY KEY (`subject_id`)
);

-- ************************************** `book`

CREATE TABLE `books`
(
 `book_id`     int NOT NULL AUTO_INCREMENT ,
 `title`       varchar(45) NOT NULL ,
 `unit_price`  float NOT NULL ,
 `author`      varchar(45) NOT NULL ,
 `quantity`    int NOT NULL ,
 `supplier_id` int NOT NULL ,
 `subject_id`  int NOT NULL ,

PRIMARY KEY (`book_id`),
KEY `fkIdx_64` (`supplier_id`),
CONSTRAINT `FK_64` FOREIGN KEY `fkIdx_64` (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
KEY `fkIdx_67` (`subject_id`),
CONSTRAINT `FK_67` FOREIGN KEY `fkIdx_67` (`subject_id`) REFERENCES `subject` (`subject_id`)
);

-- ************************************** `order`

CREATE TABLE `orders`
(
 `order_id`     int NOT NULL AUTO_INCREMENT ,
 `customer_id`  int NOT NULL ,
 `employee_id`  int NOT NULL ,
 `date_ordered` varchar(10) NOT NULL ,
 `date_shipped` varchar(10) NULL ,
 `shipper_id`   int NULL ,

PRIMARY KEY (`order_id`),
KEY `fkIdx_43` (`customer_id`),
CONSTRAINT `FK_43` FOREIGN KEY `fkIdx_43` (`customer_id`) REFERENCES `customer` (`customer_id`),
KEY `fkIdx_46` (`employee_id`),
CONSTRAINT `FK_46` FOREIGN KEY `fkIdx_46` (`employee_id`) REFERENCES `employee` (`employee_id`),
KEY `fkIdx_54` (`shipper_id`),
CONSTRAINT `FK_54` FOREIGN KEY `fkIdx_54` (`shipper_id`) REFERENCES `shipper` (`shipper_id`)
);

-- ************************************** `order_detail`

CREATE TABLE `order_details`
(
 `book_id`  int NOT NULL ,
 `order_id` int NOT NULL ,
 `quantity` int NOT NULL ,

KEY `fkIdx_81` (`book_id`),
CONSTRAINT `FK_81` FOREIGN KEY `fkIdx_81` (`book_id`) REFERENCES `book` (`book_id`),
KEY `fkIdx_84` (`order_id`),
CONSTRAINT `FK_84` FOREIGN KEY `fkIdx_84` (`order_id`) REFERENCES `order` (`order_id`)
);
