-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 23. čen 2022, 20:10
-- Verze serveru: 10.4.24-MariaDB
-- Verze PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `qr_system`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `admin`
--

INSERT INTO `admin` (`id`, `login`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'Admin');

-- --------------------------------------------------------

--
-- Struktura tabulky `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `cat_id` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `categories`
--

INSERT INTO `categories` (`id`, `cat_name`, `cat_id`) VALUES
(10, 'Občerstvení', 'obcerstveni'),
(11, 'Nealkoholické nápoje', 'nealk_napoje'),
(12, 'Alkoholické nápoje', 'alk_napoje');

-- --------------------------------------------------------

--
-- Struktura tabulky `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `goods_name` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `description` text CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `goods`
--

INSERT INTO `goods` (`id`, `goods_name`, `price`, `image`, `category`, `description`) VALUES
(8, 'Pizza', '35', 'pizza.jpg', 'obcerstveni', 'Pizza se šunkou a sýrem s rajčatovou omačkou'),
(9, 'Kofola Originál', '20', 'kofola.jpg', 'nealk_napoje', 'Tradiční, československý kolový nápoj nezaměnitelné chuti a aroma vyráběný již od roku 1960. Směs 14 bylin a ovocných šťáv okořeněných lékořicí. To je Kofola Originál. Láska na první lok, láska na celý život.\r\n'),
(10, 'Pivo Ježek', '40', 'pivo.jpg', 'alk_napoje', 'Jihlavské pivo je na Vysočině tradičním, oblíbeným a často vyhledávaným nápojem. Patrně nejstarší písemnou zprávou o jihlavském sladovnictví a pivovarnictví je zmínka v městské knize z první poloviny 14. století. Historický vývoj vrcholí rokem 1859, kdy se usnesli jihlavští sladovníci uzavřít poslední 4 pivovárky a vybudovat společný moderní pivovar.');

-- --------------------------------------------------------

--
-- Struktura tabulky `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name_castomers` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `number_seat` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `goods_name` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `total_price` decimal(10,0) NOT NULL,
  `payment` varchar(100) NOT NULL,
  `state` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `count_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabulky `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `role`
--

INSERT INTO `role` (`id`, `role_id`) VALUES
(1, 'Admin'),
(2, 'Číšník');

-- --------------------------------------------------------

--
-- Struktura tabulky `sklad`
--

CREATE TABLE `sklad` (
  `id` int(11) NOT NULL,
  `goods_name` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `number_seat` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `name`, `number_seat`) VALUES
(1, 'test', '1a'),
(2, 'test2', '2a');

-- --------------------------------------------------------

--
-- Struktura tabulky `waiter`
--

CREATE TABLE `waiter` (
  `id` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- Indexy pro tabulku `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexy pro tabulku `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `goods_name` (`goods_name`);

--
-- Indexy pro tabulku `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `number_seat` (`number_seat`),
  ADD KEY `orders_ibfk_4` (`count_id`);

--
-- Indexy pro tabulku `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexy pro tabulku `sklad`
--
ALTER TABLE `sklad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `count` (`count`),
  ADD KEY `goods_name` (`goods_name`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `number_seat` (`number_seat`);

--
-- Indexy pro tabulku `waiter`
--
ALTER TABLE `waiter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pro tabulku `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `sklad`
--
ALTER TABLE `sklad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `waiter`
--
ALTER TABLE `waiter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE;

--
-- Omezení pro tabulku `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `goods` (`category`) ON UPDATE CASCADE;

--
-- Omezení pro tabulku `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`number_seat`) REFERENCES `users` (`number_seat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`count_id`) REFERENCES `sklad` (`count`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`goods_name`) REFERENCES `goods` (`goods_name`) ON UPDATE CASCADE;

--
-- Omezení pro tabulku `sklad`
--
ALTER TABLE `sklad`
  ADD CONSTRAINT `sklad_ibfk_1` FOREIGN KEY (`goods_name`) REFERENCES `goods` (`goods_name`) ON UPDATE CASCADE;

--
-- Omezení pro tabulku `waiter`
--
ALTER TABLE `waiter`
  ADD CONSTRAINT `waiter_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
