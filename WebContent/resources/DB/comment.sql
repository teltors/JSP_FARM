CREATE TABLE `comment` (
  `id` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL,
  `parent_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8