-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 17-03-2024 a las 05:06:23
-- Versión del servidor: 11.2.2-MariaDB-1:11.2.2+maria~ubu2204
-- Versión de PHP: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `user_management`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `action`
--

CREATE TABLE `action` (
  `id` int(11) NOT NULL,
  `action_name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `route_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `action`
--

INSERT INTO `action` (`id`, `action_name`, `created_by`, `created_at`, `updated_by`, `updated_at`, `route_id`) VALUES
(1, 'create-role', 7, '2024-03-01 11:50:30', 7, '2024-03-01 11:50:30', 1),
(2, 'assign-role', 7, '2024-03-01 11:51:19', 7, '2024-03-01 11:51:19', 1),
(3, 'desactivate-role', 7, '2024-03-01 11:51:30', 7, '2024-03-01 11:51:30', 1),
(4, 'read-role', 7, '2024-03-01 11:51:37', 7, '2024-03-01 11:51:37', 1),
(5, 'read-route', 7, '2024-03-01 11:54:20', 7, '2024-03-01 11:54:20', 1),
(6, 'assign-route', 7, '2024-03-01 11:54:31', 7, '2024-03-01 11:54:31', 1),
(7, 'assign-action', 7, '2024-03-01 11:54:44', 7, '2024-03-01 11:54:44', 1),
(8, 'read-user', 7, '2024-03-01 23:09:41', 7, '2024-03-01 23:09:41', 2),
(9, 'read-cat', 7, '2024-03-07 23:25:00', 7, '2024-03-07 23:25:00', 3),
(10, 'create-cat', 7, '2024-03-07 23:25:49', 7, '2024-03-07 23:25:49', 3),
(11, 'edit-cat', 7, '2024-03-07 23:25:53', 7, '2024-03-07 23:25:53', 3),
(12, 'delete-cat', 7, '2024-03-07 23:25:56', 7, '2024-03-07 23:25:56', 3),
(13, 'edit-user', 7, '2024-03-09 17:06:21', 7, '2024-03-09 17:06:21', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat`
--

CREATE TABLE `cat` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `race` varchar(45) NOT NULL,
  `birth` date NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `photo_name` varchar(300) DEFAULT NULL,
  `photo_url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat`
--

INSERT INTO `cat` (`id`, `name`, `race`, `birth`, `price`, `photo_name`, `photo_url`) VALUES
(1, 'Gringo', 'Orange Tabby', '2017-07-10', 600.00, NULL, NULL),
(2, 'Rayito', 'Orange Tabby', '2020-04-30', 400.00, NULL, NULL),
(4, 'Mishifus', 'Siames', '2007-07-10', 4000.00, '2 two fat cats', 'https://static.nationalgeographicla.com/files/styles/image_3200/public/nationalgeographic_703697.jpg?w=1600&h=1121'),
(5, 'Billy', 'Marinero', '2007-07-10', 100.00, '2 two fat cats', 'https://static.wikia.nocookie.net/silly-cat/images/9/95/Billy.png/revision/latest?cb=20231010114915&format=original'),
(6, 'Canon', 'Mixto', '2007-07-10', 50.00, '2 two fat cats', 'https://static.wikia.nocookie.net/silly-cat/images/8/86/Uncle.png/revision/latest?cb=20231013132411'),
(7, 'Mr Despair', 'Orange Tabby', '2007-07-10', 400.00, '2 two fat cats', 'https://static.wikia.nocookie.net/silly-cat/images/b/bc/Mr._Despair.png/revision/latest/scale-to-width-down/1000?cb=20240117171829&format=original'),
(8, 'Curius', 'Mixto', '2007-07-10', 500.00, '2 two fat cats', 'https://static.wikia.nocookie.net/silly-cat/images/3/36/Ah_So_Cat.png/revision/latest?cb=20231003075048&format=original'),
(9, 'Terrorist', 'Arabe', '2007-07-10', 2000.00, '2 two fat cats', 'https://i1.sndcdn.com/avatars-000681753827-tm8ggl-t500x500.jpg'),
(10, 'Terrorist Kamikaze', 'Arabe', '2007-07-10', 5000.00, '2 two fat cats', 'https://i.imgflip.com/1ifdo0.jpg'),
(11, 'Darth vader cat', 'Arabe', '2000-01-11', 9000.00, '2 two fat cats', 'https://i.ebayimg.com/images/g/oaAAAOSwSD9eiCtk/s-l1600.jpg'),
(12, 'Floppa', 'I don\'t remember', '2010-12-11', 1000.00, '2 two fat cats', 'https://pbs.twimg.com/profile_images/1575633484034498560/eagA7CF6_400x400.jpg'),
(13, 'Mr Hunter', 'Lince', '2014-12-11', 6000.00, '2 two fat cats', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Lince_ib%C3%A9rico_%28Lynx_pardinus%29%2C_Almuradiel%2C_Ciudad_Real%2C_Espa%C3%B1a%2C_2021-12-19%2C_DD_06.jpg/800px-Lince_ib%C3%A9rico_%28Lynx_pardinus%29%2C_Almuradiel%2C_Ciudad_Real%2C_Espa%C3%B1a%2C_2021-12-19%2C_DD_06.jpg'),
(14, 'Cookie', 'Persa', '2014-12-11', 6000.00, '2 two fat cats', 'https://pbs.twimg.com/media/EFlDpQVXkAAs-KU.jpg'),
(15, 'Cookie 2', 'Persa', '2014-12-11', 6000.00, '2 two fat cats', 'https://pbs.twimg.com/media/EFlDpQVXkAAs-KU.jpg'),
(16, 'Mr. fresh', 'Orange Tabby', '2005-03-07', 5000.00, NULL, 'https://tr.rbxcdn.com/d01b06113a78982ff159fae9c3654252/420/420/Hat/Png'),
(17, 'Mr. fresh', 'Orange Tabby', '2024-03-03', 3131.00, NULL, 'https://tr.rbxcdn.com/d01b06113a78982ff159fae9c3654252/420/420/Hat/Png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(65) NOT NULL,
  `last_name` varchar(65) NOT NULL,
  `birth` date NOT NULL,
  `phone_number` varchar(25) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `first_name`, `last_name`, `birth`, `phone_number`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 3, 'Roberto', 'Contreras', '2002-03-12', '+51 965368241', 1, '2024-02-29 18:57:27', 1, '2024-02-29 18:57:27'),
(2, 4, 'Roberto', 'Contreras', '2002-03-12', '+51 965368241', 1, '2024-02-29 18:59:21', 1, '2024-02-29 18:59:21'),
(3, 5, 'Roberto', 'Contreras', '2002-03-12', '+51 965368241', 1, '2024-02-29 14:01:28', 1, '2024-02-29 14:01:28'),
(4, 6, 'Fabrizio', 'Perez', '2002-03-12', '+51 965368241', 1, '2024-02-29 14:02:16', 1, '2024-02-29 14:02:16'),
(5, 7, 'Emilio Roberto Fabrizio', 'Contreras Gonzales', '2002-03-12', '+51 965368241', 1, '2024-03-01 09:38:48', 1, '2024-03-01 09:38:48'),
(6, 8, 'Javier', 'Contreras Cordova', '2002-03-12', '+51 965368241', 1000000, '2024-03-05 12:25:50', 1000000, '2024-03-05 12:25:50'),
(7, 9, 'Javier', 'Contreras Cordova', '2002-03-12', '+51 965368241', 1000000, '2024-03-05 12:27:34', 1000000, '2024-03-05 12:27:34'),
(8, 10, 'I\'m just a bot', 'What i just told you', '2023-03-10', '+51 931 312 312', 7, '2024-03-09 19:52:08', 7, '2024-03-09 19:52:08'),
(9, 11, 'Mark', 'IDK Last Name', '2024-03-04', '+51 123456789', 7, '2024-03-09 20:19:38', 7, '2024-03-09 20:19:38'),
(10, 2, 'Javier', 'Ramirez Smith', '2024-03-07', '+(01) 12312331', 2, '2024-03-16 23:44:22', 2, '2024-03-16 23:44:22'),
(11, 12, 'Javier', 'Ramirez Smith', '2024-03-07', '+(01) 12312331', 12, '2024-03-16 23:53:15', 12, '2024-03-16 23:53:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(45) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `role_name`, `description`, `active`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'super-admin', 'power of everything', 1, 1, '2024-02-29 21:28:34', 7, '2024-03-09 11:56:55'),
(2, 'admin', 'almost power of everything', 1, 1, '2024-03-01 09:39:39', 1, '2024-03-01 09:39:39'),
(3, 'manager', 'the person assigned to manage the process of creating users, at least that\'s what i think', 0, 7, '2024-03-01 09:46:06', 7, '2024-03-01 09:53:36'),
(4, 'cat-manager', 'create, read, update and delete cats.', 1, 7, '2024-03-05 13:04:12', 7, '2024-03-05 13:04:12'),
(5, 'example-1', 'an easy example', 1, 7, '2024-03-07 14:00:28', 7, '2024-03-07 14:00:28'),
(6, 'example-2', 'an easy example', 1, 7, '2024-03-07 14:00:32', 7, '2024-03-07 14:00:32'),
(7, 'example-3', 'an easy example', 1, 7, '2024-03-07 14:00:36', 7, '2024-03-07 14:00:36'),
(8, 'example-4', 'an easy example', 1, 7, '2024-03-07 14:00:40', 7, '2024-03-07 14:00:40'),
(9, 'example-5', 'an easy example', 1, 7, '2024-03-07 14:00:43', 7, '2024-03-07 14:00:43'),
(10, 'example-6', 'an easy example', 1, 7, '2024-03-07 14:00:46', 7, '2024-03-07 14:00:46'),
(11, 'example-7', 'an easy example', 1, 7, '2024-03-07 14:00:51', 7, '2024-03-07 14:00:51'),
(12, 'example-8', 'an easy example', 1, 7, '2024-03-07 14:00:55', 7, '2024-03-07 14:00:55'),
(13, 'example-9', 'an easy example', 1, 7, '2024-03-07 14:00:57', 7, '2024-03-07 14:00:57'),
(14, 'example-10', 'an easy example', 1, 7, '2024-03-07 14:01:00', 7, '2024-03-07 14:01:00'),
(15, 'example-11', 'an easy example', 1, 7, '2024-03-07 14:01:04', 7, '2024-03-07 14:01:04'),
(16, 'example-12', 'an easy example', 1, 7, '2024-03-07 14:01:19', 7, '2024-03-07 14:01:19'),
(17, 'example-13', 'an easy example', 1, 7, '2024-03-07 14:01:22', 7, '2024-03-07 14:01:22'),
(18, 'example-14', 'an easy example', 1, 7, '2024-03-07 14:01:24', 7, '2024-03-07 14:01:24'),
(19, 'example-15', 'an easy example', 1, 7, '2024-03-07 14:01:27', 7, '2024-03-07 14:01:27'),
(20, 'example-16', 'an easy example', 1, 7, '2024-03-07 14:01:30', 7, '2024-03-07 14:01:30'),
(21, 'example-17', 'an easy example', 1, 7, '2024-03-07 14:01:33', 7, '2024-03-07 14:01:33'),
(22, 'example-18', 'an easy example', 1, 7, '2024-03-07 14:01:36', 7, '2024-03-07 14:01:36'),
(23, 'example-19', 'an easy example', 1, 7, '2024-03-07 14:01:41', 7, '2024-03-07 14:01:41'),
(24, 'example-20', 'an easy example', 1, 7, '2024-03-07 14:01:44', 7, '2024-03-07 14:01:44'),
(25, 'example-21', 'an easy example', 1, 7, '2024-03-07 14:01:47', 7, '2024-03-07 14:01:47'),
(26, 'cat-1', 'an easy example', 1, 7, '2024-03-07 14:01:53', 7, '2024-03-07 14:01:53'),
(27, 'cat-2', 'an easy example', 1, 7, '2024-03-07 14:01:55', 7, '2024-03-07 14:01:55'),
(28, 'cat-3', 'an easy example', 1, 7, '2024-03-07 14:01:58', 7, '2024-03-07 14:01:58'),
(29, 'cat-4', 'an easy example', 1, 7, '2024-03-07 14:02:00', 7, '2024-03-07 14:02:00'),
(30, 'cat-5', 'an easy example', 1, 7, '2024-03-07 14:02:03', 7, '2024-03-07 14:02:03'),
(31, 'cat-6', 'an easy example', 1, 7, '2024-03-07 14:02:06', 7, '2024-03-07 14:02:06'),
(32, 'cat-7', 'an easy example', 1, 7, '2024-03-07 14:02:09', 7, '2024-03-07 14:02:09'),
(33, 'cat-8', 'an easy example', 1, 7, '2024-03-07 14:02:13', 7, '2024-03-07 14:02:13'),
(34, 'cat-9', 'an easy example', 1, 7, '2024-03-07 14:02:15', 7, '2024-03-07 14:02:15'),
(35, 'cat-10', 'an easy example', 1, 7, '2024-03-07 14:02:18', 7, '2024-03-07 14:02:18'),
(36, 'cat-11', 'an easy example', 1, 7, '2024-03-07 14:02:21', 7, '2024-03-07 14:02:21'),
(37, 'cat-12', 'an easy example', 1, 7, '2024-03-07 23:22:40', 7, '2024-03-08 23:13:53'),
(38, 'cat admin', 'has the power to create, delete, edit or read cats', 1, 7, '2024-03-07 23:31:13', 7, '2024-03-07 23:31:13'),
(39, 'Second important role', 'I don\'t know what to write', 1, 7, '2024-03-08 12:27:18', 7, '2024-03-08 12:27:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_action`
--

CREATE TABLE `role_action` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `role_action`
--

INSERT INTO `role_action` (`id`, `role_id`, `action_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 1, 1, 7, '2024-03-03 20:32:56', 7, '2024-03-03 20:32:56'),
(2, 1, 2, 7, '2024-03-03 20:33:30', 7, '2024-03-03 20:33:30'),
(3, 1, 3, 7, '2024-03-03 20:33:30', 7, '2024-03-03 20:33:30'),
(4, 1, 4, 7, '2024-03-03 20:33:30', 7, '2024-03-03 20:33:30'),
(5, 1, 5, 7, '2024-03-03 20:33:30', 7, '2024-03-03 20:33:30'),
(6, 1, 6, 7, '2024-03-03 20:33:30', 7, '2024-03-03 20:33:30'),
(7, 1, 7, 7, '2024-03-03 20:33:30', 7, '2024-03-03 20:33:30'),
(8, 1, 8, 7, '2024-03-03 20:33:30', 7, '2024-03-03 20:33:30'),
(24, 2, 4, 7, '2024-03-03 20:37:19', 7, '2024-03-03 20:37:19'),
(25, 2, 5, 7, '2024-03-03 20:37:19', 7, '2024-03-03 20:37:19'),
(26, 3, 8, 7, '2024-03-03 20:46:38', 7, '2024-03-03 20:46:38'),
(27, 4, 8, 7, '2024-03-05 13:15:04', 7, '2024-03-05 13:15:04'),
(28, 38, 9, 7, '2024-03-07 23:31:13', 7, '2024-03-07 23:31:13'),
(29, 38, 10, 7, '2024-03-07 23:31:13', 7, '2024-03-07 23:31:13'),
(30, 38, 11, 7, '2024-03-07 23:31:13', 7, '2024-03-07 23:31:13'),
(31, 38, 12, 7, '2024-03-07 23:31:13', 7, '2024-03-07 23:31:13'),
(32, 39, 1, 7, '2024-03-08 12:27:18', 7, '2024-03-08 12:27:18'),
(33, 39, 6, 7, '2024-03-08 12:27:18', 7, '2024-03-08 12:27:18'),
(34, 39, 8, 7, '2024-03-08 12:27:18', 7, '2024-03-08 12:27:18'),
(35, 39, 9, 7, '2024-03-08 12:27:18', 7, '2024-03-08 12:27:18'),
(36, 39, 12, 7, '2024-03-08 12:27:18', 7, '2024-03-08 12:27:18'),
(37, 39, 2, 7, '2024-03-08 19:05:25', 7, '2024-03-08 19:05:25'),
(38, 39, 3, 7, '2024-03-08 19:05:25', 7, '2024-03-08 19:05:25'),
(39, 39, 4, 7, '2024-03-08 19:05:25', 7, '2024-03-08 19:05:25'),
(40, 39, 5, 7, '2024-03-08 19:05:25', 7, '2024-03-08 19:05:25'),
(41, 39, 7, 7, '2024-03-08 19:05:25', 7, '2024-03-08 19:05:25'),
(42, 1, 13, 7, '2024-03-09 17:06:52', 7, '2024-03-09 17:06:52'),
(43, 1, 9, 7, '2024-03-10 18:37:53', 7, '2024-03-10 18:37:53'),
(44, 1, 10, 7, '2024-03-10 18:37:53', 7, '2024-03-10 18:37:53'),
(45, 1, 11, 7, '2024-03-10 18:37:53', 7, '2024-03-10 18:37:53'),
(46, 1, 12, 7, '2024-03-10 18:37:53', 7, '2024-03-10 18:37:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_route`
--

CREATE TABLE `role_route` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `role_route`
--

INSERT INTO `role_route` (`id`, `role_id`, `route_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 1, 1, 7, '2024-03-01 11:05:36', 7, '2024-03-01 11:05:36'),
(2, 1, 2, 7, '2024-03-01 23:17:34', 7, '2024-03-01 23:17:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `route`
--

CREATE TABLE `route` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `description` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `route`
--

INSERT INTO `route` (`id`, `url`, `created_by`, `created_at`, `updated_by`, `updated_at`, `description`) VALUES
(1, '/user-management/roles', 7, '2024-03-01 10:48:47', 7, '2024-03-01 10:48:47', 'this is where you manage the roles for users'),
(2, '/user-management/users', 7, '2024-03-01 23:09:24', 7, '2024-03-01 23:09:24', 'Actions like desactivate or create user'),
(3, '/user-management/cat', 7, '2024-03-06 14:21:40', 7, '2024-03-06 14:21:40', 'CRUD Action for cat');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(105) NOT NULL,
  `password` varchar(255) NOT NULL,
  `logged_token` varchar(600) DEFAULT NULL,
  `recovery_token` varchar(600) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `logged_token`, `recovery_token`, `active`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(2, 'example@hotmail.com', '$2a$10$5x.4Flh2nUeLBbl7EVs8t.ZCq95K7HWgclPzgpDYzjVxBshK3o.Ke', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInJvbGVzIjpbXSwicm91dGVzIjpbXSwiaWF0IjoxNzEwNjQ5MjgyLCJleHAiOjE3MTA2NjM2ODJ9.fU3btKYIEiUuI2b4xFzE20XGvf217kc-tYsCz-7lhtQ', NULL, 1, 1, '2024-03-17 04:20:28', 1, '2024-03-17 04:20:28'),
(3, 'example@gmail.com', '$2b$10$9QAXMW6iqxZVXQrarm/up.2WXnitMsQLI5//zt5K.JB3.561D.se.', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjMsInJvbGVzIjpbXSwicm91dGVzIjpbXSwiaWF0IjoxNzEwNjQ5MDYxLCJleHAiOjE3MTA2NjM0NjF9.fGW-ti7DKJn2z7rHgGBgs9FAjGrp4IozXDyeJdCfOuc', NULL, 1, 1, '2024-02-29 18:57:27', 1, '2024-02-29 18:57:27'),
(4, 'example1@gmail.com', '$2b$10$XtzuOBalQAoo03z/38kaYecgzyVm8FApOQy6V1EPmwRaK0DKIIz6C', NULL, NULL, 1, 1, '2024-02-29 18:59:21', 1, '2024-02-29 18:59:21'),
(5, 'example2@gmail.com', '$2b$10$rCRNLtinIUfZGGreHdKEx.njN3YtcKiUGMNfQtD4m76K8bNcgGspy', NULL, NULL, 1, 1, '2024-02-29 14:01:28', 1, '2024-02-29 14:01:28'),
(6, 'example3@gmail.com', '$2b$10$azUKrqkjnVZ5wfBFtVWp1OJJ41XDsTEbRcSvFSjV.rNxvuRtdBh9y', NULL, NULL, 1, 1, '2024-02-29 14:02:16', 1, '2024-02-29 14:02:16'),
(7, 'robertog-18@hotmail.com', '$2b$10$XOKsElGpHbsv1z26C.Qtyut1zRvti3GmACeqgBtfgeHDhQH98WRFu', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjcsInJvbGVzIjpbInN1cGVyLWFkbWluIiwiYWRtaW4iLCJjYXQtbWFuYWdlciJdLCJyb3V0ZXMiOlsiL3VzZXItbWFuYWdlbWVudC9yb2xlcyIsIi91c2VyLW1hbmFnZW1lbnQvdXNlcnMiLCIvdXNlci1tYW5hZ2VtZW50L2NhdCJdLCJpYXQiOjE3MTA2NTEyOTIsImV4cCI6MTcxMDY2NTY5Mn0.nnIMmGYnz-y-gXk1XzHTr5MmD8f5QcDcX_BJUoubPao', '', 1, 1, '2024-03-01 09:38:48', 7, '2024-03-09 12:01:03'),
(8, 'example5@gmail.com', '$2b$10$QWavzlHXiYi/CRaJSS3MQuFxRaDtAu1OYjr65SYOdJpBZi4FHD9.S', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjgsInJvbGVzIjpbXSwicm91dGVzIjpbXSwiaWF0IjoxNzA5NjYwMTIwLCJleHAiOjE3MDk2NzQ1MjB9.oDOEqiKRbIBoFxrwcKR_7ZPdf61EHyJl_Srw-hK7osM', NULL, 1, 1000000, '2024-03-05 12:25:50', 1000000, '2024-03-05 12:25:50'),
(9, 'example6@gmail.com', '$2b$10$6EY5458fe8HTpiq2O12xAO6h2eM/8tsB366XQ89XExHqx3luhmxcq', NULL, NULL, 1, 1000000, '2024-03-05 12:27:34', 7, '2024-03-09 12:08:03'),
(10, 'example10@gmail.com', '$2b$10$45ME8pNR1xKiDv3ELoDH5eBM6735HlEr13VKabdRCIkcJwKyMTLz6', NULL, NULL, 1, 7, '2024-03-09 19:52:08', 7, '2024-03-09 19:52:08'),
(11, 'superman@google.com', '$2b$10$zJsVV8vxxDsFEYbatR6AxeSwbi1NbnSdWbC25l4hD0NixR7qzo9Oq', NULL, NULL, 1, 7, '2024-03-09 20:19:38', 7, '2024-03-09 20:19:38'),
(12, 'example2@hotmail.com', '$2b$10$5CEcDxywHvebx5qVgqK4Re/kkyjKAyA2udjdJRL4JH0RVVKOwiGZ.', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEyLCJyb2xlcyI6W10sInJvdXRlcyI6W10sImlhdCI6MTcxMDY1MTE1NSwiZXhwIjoxNzEwNjY1NTU1fQ.Fdv40DZH3NIMCTxiwMTzhXbBgrMQrdJ4sRl_qnhyIyc', NULL, 1, 1, '2024-03-17 04:51:39', 1, '2024-03-17 04:51:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 7, 1, 7, '2024-03-01 17:27:56', 7, '2024-03-01 17:27:56'),
(2, 7, 2, 7, '2024-03-04 13:07:45', 7, '2024-03-04 13:07:45'),
(3, 7, 4, 7, '2024-03-05 13:06:26', 7, '2024-03-05 13:06:26'),
(4, 10, 30, 7, '2024-03-09 19:52:08', 7, '2024-03-09 19:52:08'),
(5, 10, 31, 7, '2024-03-09 19:52:08', 7, '2024-03-09 19:52:08'),
(6, 11, 4, 7, '2024-03-09 20:19:38', 7, '2024-03-09 20:19:38'),
(7, 11, 5, 7, '2024-03-10 00:26:53', 7, '2024-03-10 00:26:53'),
(8, 11, 6, 7, '2024-03-10 00:26:53', 7, '2024-03-10 00:26:53');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `action_name` (`action_name`),
  ADD KEY `fk_action_route_id` (`route_id`);

--
-- Indices de la tabla `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_action`
--
ALTER TABLE `role_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `action_id` (`action_id`);

--
-- Indices de la tabla `role_route`
--
ALTER TABLE `role_route`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indices de la tabla `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `action`
--
ALTER TABLE `action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cat`
--
ALTER TABLE `cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `role_action`
--
ALTER TABLE `role_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `role_route`
--
ALTER TABLE `role_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `action`
--
ALTER TABLE `action`
  ADD CONSTRAINT `fk_action_route_id` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`);

--
-- Filtros para la tabla `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `role_action`
--
ALTER TABLE `role_action`
  ADD CONSTRAINT `role_action_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_action_ibfk_2` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `role_route`
--
ALTER TABLE `role_route`
  ADD CONSTRAINT `role_route_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_route_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
