CREATE TABLE `shipping` (
  `id` varchar(50) NOT NULL,
  `cartid` varchar(200) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `orderday` varchar(100) DEFAULT NULL,
  `shipday` varchar(45) DEFAULT NULL,
  `requ` varchar(200) DEFAULT NULL,
  `pro` varchar(300) DEFAULT NULL,
  `sum2` varchar(45) DEFAULT NULL,
  `confirm` varchar(45) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8