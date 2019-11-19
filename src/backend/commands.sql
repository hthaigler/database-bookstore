-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;

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

-- ************** Populating Commands ****************;
-- ***************************************************;

-- ************************************** `employees`
INSERT INTO `employees` 
(
 `employee_id`, `first_name`, `last_name`
)
VALUES 
(1, 'firstname5', 'lastname5'),
(2, 'firstname6', 'lastname6'),
(3, 'firstname9', 'lastname6');

-- ************************************** `customers`
INSERT INTO `customers`
(
 `customer_id`, `first_name`, `last_name`, `phone`
)
VALUES
(1, 'firstname1', 'lastname1', '334-001-001'),
(2, 'firstname2', 'lastname2', '334-002-002'),
(3, 'firstname3', 'lastname3', '334-003-003'),
(4, 'firstname4', 'lastname4', '334-004-004');

-- ************************************** `suppliers`
INSERT INTO `suppliers`
(
 `supplier_id`, `company_name`, `contact_last_name`, `contact_first_name`, `phone`
)
VALUES
(1, 'supplier1', 'company1', 'company1', '1111111111'),
(2, 'supplier2', 'company2', 'company2', '2222222222'),
(3, 'supplier3', 'company3', 'company3', '3333333333');
-- ************************************** adding in a row with NULL attributes
INSERT INTO `suppliers`
(
 `supplier_id`, `company_name`, `contact_last_name`, `phone`
)
VALUES
(4, 'supplier4', 'company4', '4444444444');

-- ************************************** `shippers`
INSERT INTO `shippers`
(
 `shipper_id`, `name`
)
VALUES
(1, 'shipper1'),
(2, 'shipper2'),
(3, 'shipper3'),
(4, 'shipper4');

-- ************************************** `subjects`
INSERT INTO `subjects`
(
 `subject_id`, `category`
)
VALUES
(1, 'category1'),
(2, 'category2'),
(3, 'category3'),
(4, 'category4'),
(5, 'category5');

-- ************************************** `orders`
INSERT INTO `orders`
(
 `order_id`, `customer_id`, `employee_id`, `date_ordered`, `date_shipped`, `shipper_id`
)
VALUES
(1, 1, 1, '8/1/2016', '8/3/2016', 1),
(2, 1, 2, '8/4/2016', NULL, NULL),
(3, 2, 1, '8/1/2016', '8/4/2016', 2),
(4, 4, 2, '8/4/2016', '8/4/2016', 1),
(5, 1, 1, '8/4/2016', '8/5/2016', 1),
(6, 4, 2, '8/4/2016', '8/5/2016', 1),
(7, 3, 1, '8/4/2016', '8/4/2016', 1);

-- ************************************** `books`
INSERT INTO `books`
(
 `book_id`, `title`, `unit_price`, `author`, `quantity`, `supplier_id`, `subject_id`
)
VALUES
(1, 'book1', 12.34, 'author1', 5, 3, 1),
(2, 'book2', 56.78, 'author2', 2, 3, 1),
(3, 'book3', 90.12, 'author3', 10, 2, 1),
(4, 'book4', 34.56, 'author4', 12, 3, 2),
(5, 'book5', 78.90, 'author5', 5, 2, 2),
(6, 'book6', 12.34, 'author6', 30, 1, 3),
(7, 'book7', 56.90, 'author2', 17, 3, 4),
(8, 'book8', 33.44, 'author7', 2, 1, 3);

-- ************************************** `order_details`
INSERT INTO `order_details`
(
 `book_id`, `order_id`, `quantity`
)
VALUES
(1, 1, 2),
(4, 1, 1),
(6, 2, 2),
(7, 2, 3),
(5, 3, 1),
(3, 4, 2),
(4, 4, 1),
(7, 4, 1),
(1, 5, 1),
(1, 6, 2),
(1, 7, 1);
