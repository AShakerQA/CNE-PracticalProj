CREATE DATABASE  IF NOT EXISTS testdb;
CREATE DATABASE IF NOT EXISTS users;
USE users;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userName` varchar(30) NOT NULL
);

INSERT INTO `users` VALUES ('Bob'),('Jay'),('Matt'),('Ferg'),('Mo');
