/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ product_shop /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE product_shop;

DROP TABLE IF EXISTS clients;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `VIP` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients.email` (`email`),
  UNIQUE KEY `clients.phone` (`phone`),
  KEY `clients.name` (`name`),
  KEY `clients.last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS orders;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_gift` tinyint(1) NOT NULL,
  `client_id` int(11) NOT NULL,
  `is_supplied` tinyint(1) NOT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS order_products;
CREATE TABLE `order_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS products;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products.name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO clients(id,name,last_name,email,phone,address,VIP) VALUES(1,'idan','magled','Idanmagled@gmail.com','0526651266','the big world',0);

INSERT INTO orders(id,date,is_gift,client_id,is_supplied,price) VALUES(1,'2021-12-16 18:41:48',1,1,0,NULL),(2,'2021-12-16 18:52:49',0,1,0,NULL),(3,'2021-12-16 18:53:04',0,1,0,NULL);

INSERT INTO order_products(id,product_id,order_id) VALUES(1,2,1),(2,3,1),(3,2,2),(4,2,2),(5,1,3);
INSERT INTO products(id,name,weight,price,description) VALUES(1,'water',1,4,'נפח אחד ליטר'),(2,'coffee',2,10,'קפה מדהים'),(3,'espresso',3,40,'שרוול נספרסו (שרוויל מכיל 10 יחידות)');