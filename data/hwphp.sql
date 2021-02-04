-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Янв 28 2021 г., 12:44
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hwphp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

CREATE TABLE `basket` (
  `idprod` int(11) NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `idProdBasket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `basket`
--

INSERT INTO `basket` (`idprod`, `id`, `quantity`, `idProdBasket`) VALUES
(23, '4', 10, 1),
(5, '1', 10, 5),
(33, '1', 9, 7),
(31, '1', 1, 8),
(2, '1', 3, 47),
(13, '1', 1, 48);

-- --------------------------------------------------------

--
-- Структура таблицы `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `imgProd` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `veiws` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `price`, `imgProd`, `veiws`, `description`) VALUES
(1, 'Pizza', 50, '1.jpg', 187, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.'),
(2, 'Apple', 1, '2.jpg', 36, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.'),
(5, 'Tea', 7, '5.jpg', 85, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.'),
(7, 'Грибы', 30, '', 0, 'Лисички'),
(13, 'Молоко', 50, '12.img', 0, 'Коровье'),
(31, 'Торт', 45, NULL, 0, 'шоколадный'),
(32, 'Цай', 25, NULL, 0, 'Цейлонский'),
(33, 'Цай', 25, NULL, 0, 'Цейлонский'),
(34, 'Цай', 25, NULL, 0, 'Цейлонский');

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `idfeed` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datefeedback` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`idfeed`, `name`, `feedback`, `datefeedback`, `id`) VALUES
(4, 'Admin', 'С Наступающим!!', ' 28 December 2020 02:04:07 AM', 0),
(5, 'Вася', 'Успехов в Новом Году!', ' 28 December 2020 02:04:46 AM', 0),
(10, 'Коля', 'CRUD работает!', ' 28 December 2020 03:08:11 PM', 0),
(15, 'NIKOLAI DAVYDOV', ' Тест1', ' 16 January 2021 06:26:06 PM', 0),
(25, 'NIKOLAI DAVYDOV', ' Вкусно', ' 16 January 2021 06:43:21 PM', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `views` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `name`, `size`, `views`) VALUES
(40, '4.jpg', 310517, 33),
(42, '6.jpg', 141976, 91),
(43, '7.jpg', 1066328, 3),
(45, '5.jpg', 462708, NULL),
(46, '3.jpg', 493065, NULL),
(47, '2.jpg', 36767, NULL),
(48, '1.jpg', 274209, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iduser` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumOrder` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `iduser`, `userName`, `number`, `email`, `city`, `products`, `status`, `sumOrder`) VALUES
('5fff633597dab', '4', 'Вася', '435346', '2345@mail.ru', 'Лес', '[{\"idorder\":\"5fff633597dab\",\"iduser\":\"4\",\"idprod\":\"2\",\"quantity\":\"1\",\"id\":\"2\",\"name\":\"Apple\",\"price\":\"1\",\"imgProd\":\"2.jpg\",\"veiws\":\"36\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"},{\"idorder\":\"5fff633597dab\",\"iduser\":\"4\",\"idprod\":\"5\",\"quantity\":\"6\",\"id\":\"5\",\"name\":\"Tea\",\"price\":\"7\",\"imgProd\":\"5.jpg\",\"veiws\":\"85\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"}]', 'Заказ отправлен', '43 '),
('600583bb5a6f3', '1', 'NIKOLAI DAVYDOV', '578940', 'range91111@gmail.com', 'ИВАНОВО', '[{\"idorder\":\"600583bb5a6f3\",\"iduser\":\"1\",\"idprod\":\"1\",\"quantity\":\"2\",\"id\":\"1\",\"name\":\"Pizza\",\"price\":\"50\",\"imgProd\":\"1.jpg\",\"veiws\":\"186\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"},{\"idorder\":\"600583bb5a6f3\",\"iduser\":\"1\",\"idprod\":\"5\",\"quantity\":\"2\",\"id\":\"5\",\"name\":\"Tea\",\"price\":\"7\",\"imgProd\":\"5.jpg\",\"veiws\":\"85\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"}]', 'Заказ выполнен', '114 '),
('60058b9b92e7d', '1', 'NIKOLAI DAVYDOV', '578940', 'range91111@gmail.com', 'ИВАНОВО', '[{\"idorder\":\"60058b9b92e7d\",\"iduser\":\"1\",\"idprod\":\"5\",\"quantity\":\"1\",\"id\":\"5\",\"name\":\"Tea\",\"price\":\"7\",\"imgProd\":\"5.jpg\",\"veiws\":\"85\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"},{\"idorder\":\"60058b9b92e7d\",\"iduser\":\"1\",\"idprod\":\"1\",\"quantity\":\"3\",\"id\":\"1\",\"name\":\"Pizza\",\"price\":\"50\",\"imgProd\":\"1.jpg\",\"veiws\":\"186\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"}]', 'Заказ отправлен на обратоку', '157 '),
('600590b78ad1f', '27063018560058fe87a12b9.59547360', 'Петя', '578940', 'setg@jhfg.ru', 'Ljhjuf', '[{\"idorder\":\"600590b78ad1f\",\"iduser\":\"27063018560058fe87a12b9.59547360\",\"idprod\":\"5\",\"quantity\":\"1\",\"id\":\"5\",\"name\":\"Tea\",\"price\":\"7\",\"imgProd\":\"5.jpg\",\"veiws\":\"85\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"},{\"idorder\":\"600590b78ad1f\",\"iduser\":\"27063018560058fe87a12b9.59547360\",\"idprod\":\"2\",\"quantity\":\"1\",\"id\":\"2\",\"name\":\"Apple\",\"price\":\"1\",\"imgProd\":\"2.jpg\",\"veiws\":\"36\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"}]', 'Заказ отправлен на обратоку', '8 '),
('600593a6020f0', '1478104380600592b42508f7.57231874', 'Катя', '578940', '325@edtg.ru', 'Дом', '[{\"idorder\":\"600593a6020f0\",\"iduser\":\"1478104380600592b42508f7.57231874\",\"idprod\":\"1\",\"quantity\":\"1\",\"id\":\"1\",\"name\":\"Pizza\",\"price\":\"50\",\"imgProd\":\"1.jpg\",\"veiws\":\"186\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"},{\"idorder\":\"600593a6020f0\",\"iduser\":\"1478104380600592b42508f7.57231874\",\"idprod\":\"5\",\"quantity\":\"1\",\"id\":\"5\",\"name\":\"Tea\",\"price\":\"7\",\"imgProd\":\"5.jpg\",\"veiws\":\"85\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"}]', 'Заказ отправлен на обратоку', '57 '),
('60059a1d24b1e', '501254841600599a52ffe40.30049324', '43546', '578940', 'range91111@gmail.com', 'ИВАНОВО', '[{\"idorder\":\"60059a1d24b1e\",\"iduser\":\"501254841600599a52ffe40.30049324\",\"idprod\":\"5\",\"quantity\":\"1\",\"id\":\"5\",\"name\":\"Tea\",\"price\":\"7\",\"imgProd\":\"5.jpg\",\"veiws\":\"85\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"}]', 'Заказ отправлен на обратоку', '7 '),
('6005a7665dfea', '1', NULL, NULL, NULL, NULL, '[{\"idorder\":\"6005a7665dfea\",\"iduser\":\"1\",\"idprod\":\"1\",\"quantity\":\"5\",\"id\":\"1\",\"name\":\"Pizza\",\"price\":\"50\",\"imgProd\":\"1.jpg\",\"veiws\":\"187\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"},{\"idorder\":\"6005a7665dfea\",\"iduser\":\"1\",\"idprod\":\"5\",\"quantity\":\"20\",\"id\":\"5\",\"name\":\"Tea\",\"price\":\"7\",\"imgProd\":\"5.jpg\",\"veiws\":\"85\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque, dolorum.\"}]', NULL, '390 ');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `pass`, `hash`) VALUES
(1, 'admin', '$2y$10$/lf/pL9Y77Q3fXDFIp7qNeg4/NAFz6M3D.JuIkFrjSrS8WpNkE6Vi', '2705829485fff60f657dfc6.43773398'),
(4, 'login', '$2y$10$8yrE5aymeCHOzaWQawc1qucyaqIbKWbgR7/gUkgMR5liwUWzNFbum', '123'),
(9, 'nik', '123', NULL),
(44, 'Valad', '123', '555');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`idProdBasket`);

--
-- Индексы таблицы `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`idfeed`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `idProdBasket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `idfeed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
