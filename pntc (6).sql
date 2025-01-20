-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el9
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 20, 2025 at 02:16 AM
-- Server version: 10.11.9-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pntc`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `id_f` int(11) NOT NULL,
  `id_cus` int(11) NOT NULL,
  `id_rest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id_cart`, `amount`, `id_f`, `id_cus`, `id_rest`) VALUES
(30, 1, 4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `codes_discount`
--

CREATE TABLE `codes_discount` (
  `id_code` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `codes_discount`
--

INSERT INTO `codes_discount` (`id_code`, `code`, `price`, `id_admin`) VALUES
(4, 'asdf', 10, 3),
(5, 'pntc', 50, 3);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id_f` int(11) NOT NULL,
  `name_f` varchar(100) NOT NULL,
  `price_f` int(11) NOT NULL,
  `discount_f` int(11) NOT NULL,
  `img_f` varchar(100) NOT NULL,
  `id_rest` int(11) NOT NULL,
  `type_f` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id_f`, `name_f`, `price_f`, `discount_f`, `img_f`, `id_rest`, `type_f`) VALUES
(2, 'กระเพรา', 50, 0, '1078226007.jpeg', 4, 3),
(4, 'นมชมพู', 20, 0, '347123294.jpeg', 4, 2),
(7, 'แกงกระทิ', 40, 10, '1558058447.jpg', 4, 2),
(8, 'ผัดพริก', 50, 0, '135376398.jpeg', 4, 3),
(9, 'กาแฟ', 40, 10, '203678245.jpeg', 5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `orderd`
--

CREATE TABLE `orderd` (
  `id_or` int(11) NOT NULL,
  `status_or` int(11) NOT NULL DEFAULT 0,
  `status_pay` int(11) NOT NULL DEFAULT 0,
  `status` varchar(100) NOT NULL DEFAULT 'new',
  `time` date NOT NULL DEFAULT current_timestamp(),
  `total` float NOT NULL,
  `dis` float NOT NULL DEFAULT 0,
  `id_sen` int(11) DEFAULT NULL,
  `id_cus` int(11) NOT NULL,
  `id_rest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `orderd`
--

INSERT INTO `orderd` (`id_or`, `status_or`, `status_pay`, `status`, `time`, `total`, `dis`, `id_sen`, `id_cus`, `id_rest`) VALUES
(22667474, 0, 0, 'new', '2025-01-15', 20, 0, NULL, 1, 4),
(92003924, 6, 1, 'old', '2024-12-04', 50, 0, 6, 1, 5),
(410859424, 6, 0, 'old', '2024-12-04', 18, 18, 6, 1, 5),
(569707733, 0, 0, 'new', '2025-01-15', 20, 0, NULL, 1, 4),
(653087107, 6, 0, 'old', '2025-01-07', 36, 0, NULL, 1, 6),
(660588217, 4, 1, 'old', '2024-12-05', 36, 0, 2, 1, 7),
(779919482, 4, 1, 'old', '2024-12-05', 63, 7, 9, 8, 5),
(1358535933, 1, 0, 'cur', '2024-12-04', 120, 0, NULL, 7, 4),
(1374857848, 4, 1, 'old', '2024-12-04', 50, 0, 6, 1, 11),
(1392343677, 1, 0, 'cur', '2025-01-07', 100, 0, NULL, 1, 8),
(1455993271, 4, 1, 'old', '2024-12-04', 70, 0, 9, 1, 15),
(1518619147, 4, 1, 'old', '2025-01-06', 200, 0, 9, 1, 5),
(1873579050, 1, 0, 'cur', '2025-01-07', 70, 0, NULL, 1, 4),
(2096174181, 1, 0, 'cur', '2025-01-07', 70, 0, NULL, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id_or` int(11) NOT NULL,
  `id_f` int(11) NOT NULL,
  `sum` float NOT NULL,
  `discount` float NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id_or`, `id_f`, `sum`, `discount`, `amount`) VALUES
(1455993271, 2, 50, 0, 1),
(1455993271, 4, 20, 0, 1),
(660588217, 7, 36, 4, 1),
(1374857848, 2, 50, 0, 1),
(410859424, 9, 36, 4, 1),
(92003924, 2, 50, 0, 1),
(1358535933, 2, 100, 0, 2),
(1358535933, 4, 20, 0, 1),
(779919482, 2, 50, 0, 1),
(779919482, 4, 20, 0, 1),
(1518619147, 2, 50, 0, 1),
(1518619147, 8, 150, 0, 3),
(1392343677, 2, 50, 0, 1),
(1392343677, 8, 50, 0, 1),
(653087107, 7, 36, 4, 1),
(1873579050, 2, 50, 0, 1),
(1873579050, 4, 20, 0, 1),
(2096174181, 2, 50, 0, 1),
(2096174181, 4, 20, 0, 1),
(22667474, 4, 20, 0, 1),
(569707733, 4, 20, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rest`
--

CREATE TABLE `rest` (
  `id_rest` int(11) NOT NULL,
  `username_rest` varchar(100) NOT NULL,
  `password_rest` varchar(100) NOT NULL,
  `name_rest` varchar(100) NOT NULL,
  `address_rest` varchar(100) NOT NULL,
  `phone_rest` varchar(100) NOT NULL,
  `img_rest` varchar(100) NOT NULL,
  `status_rest` int(11) NOT NULL DEFAULT 0,
  `status` varchar(100) NOT NULL DEFAULT 'new',
  `type_rest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `rest`
--

INSERT INTO `rest` (`id_rest`, `username_rest`, `password_rest`, `name_rest`, `address_rest`, `phone_rest`, `img_rest`, `status_rest`, `status`, `type_rest`) VALUES
(4, 'r', 'r', 'ลับโภชณา', '157/863', '0684799643', '1125969739.jpg', 1, 'old', 3),
(5, 'r1', 'r1', 'ป้าแดงตามสั่ง', '935/768', '0578466556', '1660134703.jpg', 1, 'new', 3),
(6, 'r3', 'r3', 'ลุงวิทย์ข้าวมันไก่', '800/1', '0489478948', '1488625553.jpeg', 1, 'new', 3),
(7, 'r4', 'r4', 'ยายศรีข้าวกะปิ', '173/569', '054898516', '1948234408.jpeg', 1, 'new', 3),
(8, 'r5', 'r5', 'นายสัพตามสั่ง', '178/14', '0865354964', '1799166055.jpeg', 1, 'new', 3),
(9, 'r6', 'r6', 'นิวโภชณา', '111/11', '075485164', '1163003447.jpeg', 1, 'new', 3),
(10, 'r7', 'r7', 'itarano', '139/12', '08694764', '1016598889.jpg', 1, 'new', 5),
(11, 'r8', 'r8', 'fastthefood', '75/1', '06455648', '1365312175.jpg', 1, 'new', 5),
(12, 'r9', 'r9', 'waitsteakhouse', '1578/13', '038528552', '1882317010.jpg', 1, 'new', 5),
(13, 'r10', 'r10', 'pho fusion', '165/16', '0943568957', '237470633.jpg', 1, 'new', 5),
(14, 'r11', 'r11', 'light cofeshop', '14/1', '0859682468', '1600298754.jpeg', 1, 'new', 5),
(15, 'r12', 'r12', 'fusion flame', '114/12', '0853159865', '1704550932.jpg', 1, 'new', 5),
(16, 'rest123', '123', 'นิวโภณนา1', '123', '061768', '1762132694.jfif', 1, 'new', 7);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id_re` int(11) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `id_cus` int(11) NOT NULL,
  `id_rest` int(11) NOT NULL,
  `id_or` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id_re`, `comment`, `id_cus`, `id_rest`, `id_or`) VALUES
(4, 'อร่อยๆ', 1, 4, 660588217),
(5, 'อร่อยมากๆ', 8, 4, 779919482);

-- --------------------------------------------------------

--
-- Table structure for table `type_f`
--

CREATE TABLE `type_f` (
  `id_typef` int(11) NOT NULL,
  `name_typef` varchar(100) NOT NULL,
  `id_rest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `type_f`
--

INSERT INTO `type_f` (`id_typef`, `name_typef`, `id_rest`) VALUES
(2, 'เครื่องดื่ม', 4),
(3, 'อาหารจารเดี่ยว', 4),
(4, 'แกง', 4),
(8, 'เครื่องดื่ม', 5),
(10, '้้เครื่องดื่ม1', 16);

-- --------------------------------------------------------

--
-- Table structure for table `type_rest`
--

CREATE TABLE `type_rest` (
  `id_typerest` int(11) NOT NULL,
  `name_typerest` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `type_rest`
--

INSERT INTO `type_rest` (`id_typerest`, `name_typerest`) VALUES
(3, 'ร้านอาหารไทย'),
(5, 'ร้านอาหารต่างประเทศ'),
(7, 'ร้านอาหารจีน');

-- --------------------------------------------------------

--
-- Table structure for table `type_user`
--

CREATE TABLE `type_user` (
  `id_typeuser` int(11) NOT NULL,
  `name_typeuser` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `type_user`
--

INSERT INTO `type_user` (`id_typeuser`, `name_typeuser`) VALUES
(1, 'admin'),
(2, 'customer'),
(3, 'sender');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username_user` varchar(100) NOT NULL,
  `password_user` varchar(100) NOT NULL,
  `fname_user` varchar(100) NOT NULL,
  `lname_user` varchar(100) NOT NULL,
  `address_user` varchar(100) NOT NULL,
  `phone_user` varchar(100) NOT NULL,
  `email_user` varchar(100) NOT NULL,
  `img_user` varchar(100) NOT NULL,
  `status_user` int(11) NOT NULL DEFAULT 0,
  `status` varchar(100) NOT NULL DEFAULT 'new',
  `type_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_thai_520_w2;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username_user`, `password_user`, `fname_user`, `lname_user`, `address_user`, `phone_user`, `email_user`, `img_user`, `status_user`, `status`, `type_user`) VALUES
(1, 'c', 'asdf', 'ธีรภัทร์', 'ชูช่วย', '245 กระบี่', '0912412', 'teerapat@gmail.com', '1798916421.png', 1, 'old', 2),
(2, 's', 's', 'sen', 'sen', '923 พังงา', '0912312', 's@s', '574779993.jpeg', 0, 'old', 3),
(3, 'a', '123', 'a', 'a', 'a', 'a', 'a@a', '1623817411.jfif', 99, 'old', 1),
(6, 'sender', 'asdf', 'นฤดม', 'น นคร', '235 พังงา', '0124242', 'teer@fd', '1887944862.jpeg', 1, 'old', 3),
(7, 'new', '123', 'โลมา', 'น พังงา', '234 พังงา', '0912423', 'fsdf@fdf', '1638270464.png', 1, 'old', 2),
(8, 'new123', 'asdf', 'new', 'ch', '1234', '086051', 'terapat@gmail.com', '635282146.jfif', 1, 'old', 2),
(9, 'sen123', '123', 'new1', 'wt', '1234', '0642087497', 'terapat@gmail.com', '1787936302.jfif', 1, 'old', 3),
(10, 'c1', 'c1', 'c1', 'c1', 'c1', 'c1', 'c1@c1', 'default.png', 1, 'old', 2),
(11, 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asfd@fasdf', '641430091.jpg', 1, 'old', 2),
(12, '123', 'asdf', 'asdf', 'asdf', 'asfd', 'asdf', 'adfs@fasdf', '994583314.jpg', 1, 'old', 2),
(13, 'c2', 'c2', 'c2', 'c2', 'c2', 'c2', 'c2@c2', 'default.png', 1, 'old', 2),
(14, 'fa', '123', 'fa', 'fa', ' 456 ม.1', '0923', 'teerp@t.com', 'default.png', 1, 'old', 2),
(15, 'fd', 'fd', 'fd', 'fd', ' 456 ม.1', '0923', 'teerp@t.com', 'default.png', 1, 'old', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `id_f` (`id_f`,`id_cus`,`id_rest`),
  ADD KEY `id_cus` (`id_cus`),
  ADD KEY `id_rest` (`id_rest`);

--
-- Indexes for table `codes_discount`
--
ALTER TABLE `codes_discount`
  ADD PRIMARY KEY (`id_code`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id_f`),
  ADD KEY `id_rest` (`id_rest`,`type_f`),
  ADD KEY `type_f` (`type_f`);

--
-- Indexes for table `orderd`
--
ALTER TABLE `orderd`
  ADD PRIMARY KEY (`id_or`),
  ADD KEY `id_sen` (`id_sen`,`id_cus`,`id_rest`),
  ADD KEY `id_cus` (`id_cus`),
  ADD KEY `id_rest` (`id_rest`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD KEY `id_or` (`id_or`,`id_f`),
  ADD KEY `id_f` (`id_f`);

--
-- Indexes for table `rest`
--
ALTER TABLE `rest`
  ADD PRIMARY KEY (`id_rest`),
  ADD KEY `type_rest` (`type_rest`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id_re`),
  ADD KEY `id_cus` (`id_cus`,`id_rest`,`id_or`),
  ADD KEY `id_rest` (`id_rest`),
  ADD KEY `id_or` (`id_or`);

--
-- Indexes for table `type_f`
--
ALTER TABLE `type_f`
  ADD PRIMARY KEY (`id_typef`),
  ADD KEY `id_rest` (`id_rest`);

--
-- Indexes for table `type_rest`
--
ALTER TABLE `type_rest`
  ADD PRIMARY KEY (`id_typerest`);

--
-- Indexes for table `type_user`
--
ALTER TABLE `type_user`
  ADD PRIMARY KEY (`id_typeuser`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `type_user` (`type_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `codes_discount`
--
ALTER TABLE `codes_discount`
  MODIFY `id_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id_f` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rest`
--
ALTER TABLE `rest`
  MODIFY `id_rest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id_re` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `type_f`
--
ALTER TABLE `type_f`
  MODIFY `id_typef` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `type_rest`
--
ALTER TABLE `type_rest`
  MODIFY `id_typerest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `type_user`
--
ALTER TABLE `type_user`
  MODIFY `id_typeuser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_f`) REFERENCES `food` (`id_f`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`id_cus`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`id_rest`) REFERENCES `rest` (`id_rest`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `codes_discount`
--
ALTER TABLE `codes_discount`
  ADD CONSTRAINT `codes_discount_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`id_rest`) REFERENCES `rest` (`id_rest`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_ibfk_2` FOREIGN KEY (`type_f`) REFERENCES `type_f` (`id_typef`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderd`
--
ALTER TABLE `orderd`
  ADD CONSTRAINT `orderd_ibfk_1` FOREIGN KEY (`id_sen`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderd_ibfk_2` FOREIGN KEY (`id_cus`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderd_ibfk_3` FOREIGN KEY (`id_rest`) REFERENCES `rest` (`id_rest`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`id_or`) REFERENCES `orderd` (`id_or`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`id_f`) REFERENCES `food` (`id_f`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rest`
--
ALTER TABLE `rest`
  ADD CONSTRAINT `rest_ibfk_1` FOREIGN KEY (`type_rest`) REFERENCES `type_rest` (`id_typerest`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_rest`) REFERENCES `rest` (`id_rest`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`id_cus`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_3` FOREIGN KEY (`id_or`) REFERENCES `orderd` (`id_or`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `type_f`
--
ALTER TABLE `type_f`
  ADD CONSTRAINT `type_f_ibfk_1` FOREIGN KEY (`id_rest`) REFERENCES `rest` (`id_rest`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_user`) REFERENCES `type_user` (`id_typeuser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
