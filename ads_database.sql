-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 01 2024 г., 13:41
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ads_database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `main_image` varchar(255) NOT NULL,
  `additional_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional_images`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `ads`
--

INSERT INTO `ads` (`id`, `title`, `description`, `price`, `main_image`, `additional_images`, `created_at`) VALUES
(1, 'Продается уютная квартира в центре города', 'Продается 2-комнатная квартира площадью 60 кв. м. на 5 этаже. Вся мебель остается. Рядом парк и магазины.', 8500000.00, '[\"kitchen.jpg\", \"livingroom.jpg\", \"bathroom.jpg\"]', NULL, '2024-11-01 11:14:05'),
(2, 'Авто в отличном состоянии', 'Продается Honda Civic 2017 года, пробег 50 000 км. Одна хозяйка, никогда не была в ДТП.', 950000.00, '[\"hondacivic.jpg\", \"interior.jpg\"]', NULL, '2024-11-01 11:14:05'),
(3, 'Ищу подработку в вечернее время', 'Студент, готов выполнять мелкие работы: уборка, доставка и т. д. Обращайтесь по телефону!', 0.00, '[]', NULL, '2024-11-01 11:14:05'),
(4, 'Продам велосипеды по низким ценам', 'Продаются новые и б/у велосипеды разных моделей. Отличное состояние. Готовы к использованию.', 15000.00, '[\"bicycle1.jpg\", \"bicycle2.jpg\"]', NULL, '2024-11-01 11:14:05'),
(5, 'Курс английского языка для начинающих', 'Групповые и индивидуальные занятия. Гибкий график, опытный преподаватель. Занятия проходят в центре города.', 12000.00, '[\"englishcourse.jpg\"]', NULL, '2024-11-01 11:14:05');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
