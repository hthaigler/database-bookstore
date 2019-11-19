-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;


-- ************************************** `employee`

CREATE TABLE `employee`
(
 `id`         int NOT NULL ,
 `first_name` varchar(45) NOT NULL ,
 `last_name`  varchar(45) NOT NULL ,

PRIMARY KEY (`id`)
);

-- ************************************** `customer`

CREATE TABLE `customer`
(
 `id`         int NOT NULL ,
 `first_name` varchar(45) NOT NULL ,
 `last_name`  varchar(45) NOT NULL ,
 `phone`      varchar(15) NOT NULL ,

PRIMARY KEY (`id`)
);

-- ************************************** `supplier`

CREATE TABLE `supplier`
(
 `id`                 int NOT NULL ,
 `company_name`       varchar(45) NOT NULL ,
 `contact_last_name`  varchar(45) NOT NULL ,
 `contact_first_name` varchar(45) NOT NULL ,
 `phone`              varchar(15) NOT NULL ,

PRIMARY KEY (`id`)
);

-- ************************************** `shipper`

CREATE TABLE `shipper`
(
 `id`   int NOT NULL ,
 `name` varchar(45) UNIQUE NOT NULL ,

PRIMARY KEY (`id`)
);

-- ************************************** `subject`

CREATE TABLE `subject`
(
 `id`       int NOT NULL ,
 `category` varchar(45) UNIQUE NOT NULL ,

PRIMARY KEY (`id`)
);

-- ************************************** `order`

CREATE TABLE `order`
(
 `id`           int NOT NULL ,
 `customer_id`  int NOT NULL ,
 `employee_id`  int NOT NULL ,
 `date_ordered` varchar(10) NOT NULL ,
 `date_shipped` varchar(10) NULL ,
 `shipper_id`   int NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_43` (`customer_id`),
CONSTRAINT `FK_43` FOREIGN KEY `fkIdx_43` (`customer_id`) REFERENCES `customer` (`id`),
KEY `fkIdx_46` (`employee_id`),
CONSTRAINT `FK_46` FOREIGN KEY `fkIdx_46` (`employee_id`) REFERENCES `employee` (`id`),
KEY `fkIdx_54` (`shipper_id`),
CONSTRAINT `FK_54` FOREIGN KEY `fkIdx_54` (`shipper_id`) REFERENCES `shipper` (`id`)
);

-- ************************************** `book`

CREATE TABLE `book`
(
 `id`          int NOT NULL ,
 `title`       varchar(45) NOT NULL ,
 `unit_price`  float NOT NULL ,
 `author`      varchar(45) NOT NULL ,
 `quantity`    int NOT NULL ,
 `supplier_id` int NOT NULL ,
 `subject_id`  int NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_64` (`supplier_id`),
CONSTRAINT `FK_64` FOREIGN KEY `fkIdx_64` (`supplier_id`) REFERENCES `supplier` (`id`),
KEY `fkIdx_67` (`subject_id`),
CONSTRAINT `FK_67` FOREIGN KEY `fkIdx_67` (`subject_id`) REFERENCES `subject` (`id`)
);

-- ************************************** `order_detail`

CREATE TABLE `order_detail`
(
 `id`       int NOT NULL ,
 `book_id`  int NOT NULL ,
 `order_id` int NOT NULL ,
 `quantity` int NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_81` (`book_id`),
CONSTRAINT `FK_81` FOREIGN KEY `fkIdx_81` (`book_id`) REFERENCES `book` (`id`),
KEY `fkIdx_84` (`order_id`),
CONSTRAINT `FK_84` FOREIGN KEY `fkIdx_84` (`order_id`) REFERENCES `order` (`id`)
);


-- ************** Populating Commands ****************;
-- ***************************************************;

