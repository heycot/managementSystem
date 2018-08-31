-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 31, 2018 lúc 03:16 PM
-- Phiên bản máy phục vụ: 10.1.26-MariaDB
-- Phiên bản PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mcts`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ability`
--

CREATE TABLE `ability` (
  `ability_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ability`
--

INSERT INTO `ability` (`ability_id`, `user_id`, `skill_id`, `experience`, `course_id`) VALUES
(2, 11, 2, 4, 2),
(3, 8, 11, 1, 0),
(4, 9, 12, 2, 0),
(15, 29, 2, 2, 2),
(16, 33, 4, 3, 1),
(19, 1, 13, 2, 0),
(35, 55, 1, 3, 0),
(36, 56, 5, 1, 0),
(37, 57, 5, 1, 0),
(38, 57, 4, 1, 0),
(39, 58, 1, 2, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `time_of_date` varchar(150) NOT NULL,
  `date_of_week` varchar(150) NOT NULL,
  `count_lesson` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`class_id`, `created_at`, `time_of_date`, `date_of_week`, `count_lesson`, `course_id`, `trainer_id`, `room_id`, `name`, `status`) VALUES
(2, '2018-12-02 00:00:00', '08:00-10:00', '2,4,6', 2, 1, 57, 1, 'Git 01', 1),
(3, '2018-12-02 00:00:00', '07:00-09:00', '2,4,6', 2, 2, 55, 2, 'English 01', 0),
(4, '2018-12-02 00:00:00', '10:00-12:00', '2,4,6', 4, 1, 57, 3, 'Git 02', 1),
(5, '2018-12-02 00:00:00', '10:00-12:00', '3,5,7', 0, 1, 25, 1, 'Git 03', 0),
(6, '2018-12-02 00:00:00', '13:00-15:00', '2,4', 0, 1, 14, 2, 'Git 04', 0),
(7, '2018-12-02 00:00:00', '14:00-16:00', '2,6', 4, 1, 57, 1, 'Git 05', 1),
(8, '2018-12-02 00:00:00', '14:00-16:00', '4,5', 0, 9, 55, 3, 'Basic Linux 01', 0),
(9, '2018-12-02 00:00:00', '15:00-17:00', '2,4', 0, 4, 53, 4, 'Basic Linux 02', 0),
(10, '2018-12-02 00:00:00', '15:00-17:00 ', '5,7', 0, 5, 57, 2, 'Java Core 01', 2),
(11, '2018-12-02 00:00:00', '13:00-14:00', '3,5,7', 2, 3, 57, 4, 'Basic Linux 03', 1),
(12, '2018-12-02 00:00:00', '14:00-15:00', '3,5,7', 3, 2, 56, 5, 'English 01', 1),
(13, '2018-11-20 00:00:00', '08:00-10:00', '3,7', 7, 7, 57, 6, 'Basic C++ 01', 1),
(14, '2018-12-07 00:00:00', '09:00-11:00', '2,4,6', 4, 3, 25, 7, 'JSP & Servlet 01', 1),
(15, '2018-12-08 00:00:00', '10:00-12:00', '3,7', 3, 8, 57, 1, 'Advance C++ 01', 0),
(16, '2018-12-09 00:00:00', '15:00-17:00', '3,4', 2, 3, 57, 8, 'Basic C++ 02', 1),
(17, '2018-12-09 00:00:00', '13:00-14:00', '3,5', 2, 1, 26, 9, 'Advance English 01', 1),
(18, '2018-12-07 00:00:00', '14:00-15:00', '5,7', 1, 4, 55, 2, 'Basic Composition 01', 1),
(19, '2018-12-09 00:00:00', '13:00-15:00', '4,6', 2, 3, 12, 4, 'Basic Composition 02', 0),
(20, '2018-12-08 00:00:00', '14:00-16:00', '5', 2, 4, 14, 1, 'Basic Linux 03', 0),
(21, '2018-12-09 00:00:00', '08:00-10:00', '3,5,7', 1, 3, 15, 2, 'Java Core 01', 2),
(22, '2018-11-20 00:00:00', '10:00-12:00', '5,7', 2, 5, 27, 3, 'Java Core 02', 0),
(23, '2018-11-20 00:00:00', '10:00-12:00', '5,7', 2, 5, 29, 4, 'Java Core 03', 0),
(30, '2017-12-07 00:00:00', '08:00-11:00', '4,5,6', 0, 3, 12, 3, 'GIT 06', 2),
(31, '2018-04-20 00:00:00', '09:00-10:00', '2', 5, 1, 13, 1, 'PHP 01', 2),
(32, '2018-04-20 00:00:00', '13:00-14:00', '3,4,5', 20, 3, 14, 4, 'PHP 02', 0),
(33, '2017-12-07 00:00:00', '08:00-11:00', '4,5,6', 0, 3, 12, 3, 'GIT 06', 0),
(34, '2017-12-07 00:00:00', '08:00-11:00', '4,5,6', 0, 3, 12, 3, 'GIT 06', 0),
(35, '2017-12-07 00:00:00', '08:00-11:00', '4,5,6', 0, 3, 12, 3, '.Net 02', 0),
(36, '2017-12-07 00:00:00', '08:00-11:00', '4,5,6', 0, 3, 12, 3, 'GIT 06', 0),
(37, '2018-04-20 00:00:00', '09:00-10:00', '2', 5, 1, 13, 1, 'PHP 01', 0),
(38, '2018-04-20 00:00:00', '13:00-14:00', '3,4,5', 20, 3, 14, 4, 'PHP 02', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `duration` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `kind` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `courses`
--

INSERT INTO `courses` (`course_id`, `major_id`, `name`, `duration`, `status`, `kind`) VALUES
(1, 3, 'Soft skills', 4, 1, 1),
(2, 1, 'Web', 20, 1, 0),
(3, 1, 'React JS', 20, 1, 0),
(4, 2, 'Reading English skills', 30, 1, 1),
(5, 1, 'JSP and Servlet with MVC', 30, 0, 0),
(6, 2, 'Writing English skills', 30, 1, 1),
(7, 1, 'Java', 15, 1, 0),
(8, 2, 'Listening English skills', 30, 1, 1),
(9, 1, 'PHP', 20, 0, 0),
(13, 3, 'Email ', 3, 1, 1),
(14, 1, 'HTML5 and CSS3', 20, 1, 0),
(15, 1, 'Speaking English skills', 25, 1, 1),
(16, 3, 'Comunication skill', 2, 1, 0),
(17, 1, 'Think Like an Engineer', 2, 1, 0),
(18, 1, 'React Native', 1, 1, 0),
(19, 1, 'Email', 1, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `learning`
--

CREATE TABLE `learning` (
  `learning_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `learning`
--

INSERT INTO `learning` (`learning_id`, `class_id`, `user_id`) VALUES
(28, 2, 21),
(30, 16, 11),
(31, 2, 27),
(32, 2, 11),
(33, 2, 33),
(34, 2, 27),
(36, 2, 25),
(37, 2, 58),
(38, 2, 29),
(39, 2, 31),
(59, 8, 25),
(61, 8, 54),
(62, 12, 54),
(63, 14, 54),
(64, 17, 54),
(65, 18, 54),
(67, 20, 54),
(68, 21, 54),
(69, 10, 5),
(70, 10, 6),
(71, 10, 7),
(72, 10, 8),
(73, 10, 9),
(74, 10, 54),
(82, 10, 13),
(84, 3, 16),
(88, 8, 16),
(89, 14, 25),
(90, 14, 26),
(91, 14, 27),
(92, 14, 28),
(93, 14, 29),
(94, 11, 22),
(95, 11, 23),
(96, 11, 24),
(97, 11, 25),
(98, 11, 26),
(99, 11, 27),
(100, 12, 30),
(101, 12, 31),
(102, 12, 32),
(103, 12, 33),
(104, 12, 34),
(105, 12, 29),
(106, 12, 55),
(107, 12, 57),
(108, 15, 27),
(109, 15, 28),
(110, 15, 29),
(111, 15, 25),
(112, 15, 26),
(113, 16, 30),
(114, 16, 31),
(115, 16, 32),
(116, 16, 33),
(117, 16, 17),
(118, 4, 21),
(119, 4, 25),
(120, 4, 27),
(121, 4, 28),
(122, 4, 30),
(123, 4, 24),
(124, 13, 22),
(125, 13, 23),
(126, 13, 26),
(127, 13, 29),
(128, 13, 31),
(129, 13, 32),
(130, 17, 55),
(131, 17, 57),
(132, 17, 58),
(133, 17, 53),
(134, 18, 11),
(135, 18, 30),
(136, 18, 26),
(137, 18, 34);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `majors`
--

CREATE TABLE `majors` (
  `major_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `majors`
--

INSERT INTO `majors` (`major_id`, `name`) VALUES
(1, 'Technique'),
(2, 'English'),
(3, 'Soft Skills');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `noti_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`msg_id`, `user_id`, `noti_id`, `status`, `request_id`) VALUES
(1, 4, 3, 1, 50),
(2, 4, 5, 1, 50),
(3, 4, 6, 1, 50),
(8, 4, 11, 1, 50),
(9, 4, 12, 1, 50),
(10, 4, 13, 1, 50),
(11, 4, 14, 1, 50),
(12, 4, 15, 1, 50),
(13, 4, 16, 1, 50),
(15, 54, 17, 1, 50),
(16, 54, 18, 1, 50),
(17, 53, 21, 1, 50),
(18, 53, 22, 1, 50),
(19, 53, 23, 1, 50),
(20, 56, 24, 0, 50),
(21, 56, 25, 0, 50),
(22, 56, 26, 0, 50),
(23, 56, 27, 0, 50),
(24, 56, 28, 0, 50),
(25, 56, 29, 0, 50),
(26, 56, 30, 0, 50),
(27, 56, 31, 0, 50),
(28, 56, 32, 0, 50),
(29, 56, 33, 0, 50),
(30, 56, 34, 0, 50),
(31, 56, 35, 0, 50),
(32, 56, 36, 0, 50),
(33, 56, 37, 0, 50),
(34, 56, 38, 0, 50),
(35, 56, 39, 0, 50),
(36, 56, 40, 0, 50),
(37, 56, 41, 0, 50),
(38, 56, 42, 0, 50),
(39, 56, 43, 0, 50),
(40, 56, 44, 0, 50),
(41, 56, 45, 0, 50),
(42, 56, 46, 0, 50),
(43, 56, 47, 0, 50),
(44, 56, 48, 0, 50),
(45, 56, 49, 0, 50),
(46, 56, 50, 0, 50),
(47, 56, 51, 0, 50),
(48, 56, 52, 0, 50),
(49, 56, 53, 0, 50),
(50, 56, 54, 0, 50),
(51, 56, 55, 0, 50),
(52, 56, 56, 0, 50),
(53, 56, 57, 0, 50),
(54, 56, 58, 0, 50),
(55, 56, 59, 0, 50),
(56, 56, 60, 0, 50),
(57, 56, 61, 0, 50),
(58, 56, 62, 0, 50),
(59, 56, 63, 0, 50),
(60, 56, 64, 0, 50),
(61, 56, 65, 0, 50),
(62, 56, 66, 0, 50),
(76, 6, 71, 0, 50),
(77, 1, 71, 0, 50),
(78, 17, 71, 0, 50),
(79, 5, 71, 0, 50),
(80, 18, 71, 0, 50),
(81, 7, 71, 0, 50),
(82, 19, 71, 0, 50),
(83, 8, 71, 0, 50),
(84, 20, 71, 0, 50),
(85, 15, 71, 0, 50),
(86, 16, 71, 0, 50),
(89, 56, 75, 0, 50),
(91, 5, 78, 0, 50),
(92, 6, 78, 0, 50),
(93, 7, 78, 0, 50),
(94, 8, 78, 0, 50),
(95, 12, 78, 0, 50),
(96, 13, 78, 0, 50),
(97, 14, 78, 0, 50),
(98, 15, 78, 0, 50),
(99, 16, 78, 0, 50),
(101, 56, 80, 0, 50),
(102, 5, 81, 0, 50),
(103, 6, 81, 0, 50),
(104, 7, 81, 0, 50),
(105, 8, 81, 0, 50),
(106, 9, 81, 0, 50),
(107, 54, 81, 1, 50),
(108, 16, 81, 0, 50),
(109, 13, 81, 0, 50),
(111, 56, 83, 0, 50),
(112, 56, 84, 0, 50),
(113, 53, 85, 1, 50),
(114, 6, 86, 0, 50),
(115, 1, 86, 0, 50),
(116, 17, 86, 0, 50),
(117, 5, 86, 0, 50),
(118, 18, 86, 0, 50),
(119, 7, 86, 0, 50),
(120, 19, 86, 0, 50),
(121, 8, 86, 0, 50),
(122, 20, 86, 0, 50),
(123, 15, 86, 0, 50),
(124, 16, 86, 0, 50),
(125, 57, 87, 1, 50),
(126, 53, 88, 1, 50),
(127, 53, 89, 1, 50),
(128, 53, 90, 1, 50),
(129, 53, 91, 1, 50),
(130, 53, 92, 1, 50),
(131, 53, 93, 1, 50),
(132, 53, 94, 1, 50),
(133, 53, 95, 1, 50),
(134, 53, 96, 1, 50),
(135, 53, 97, 1, 50),
(136, 53, 98, 1, 50),
(137, 53, 99, 1, 50),
(138, 53, 100, 1, 50),
(139, 53, 101, 1, 50),
(140, 53, 102, 1, 50),
(141, 53, 103, 1, 50),
(142, 53, 104, 1, 50),
(143, 53, 105, 1, 50),
(144, 53, 106, 1, 50),
(145, 53, 107, 1, 50),
(146, 57, 109, 1, 50),
(147, 5, 110, 0, 50),
(148, 6, 110, 0, 50),
(149, 7, 110, 0, 50),
(150, 8, 110, 0, 50),
(151, 12, 110, 0, 50),
(152, 13, 110, 0, 50),
(153, 14, 110, 0, 50),
(154, 15, 110, 0, 50),
(155, 57, 111, 1, 50),
(156, 54, 112, 1, 50),
(157, 57, 113, 1, 50),
(158, 5, 114, 0, 50),
(159, 6, 114, 0, 50),
(160, 7, 114, 0, 50),
(161, 8, 114, 0, 50),
(162, 12, 114, 0, 50),
(163, 13, 114, 0, 50),
(164, 14, 114, 0, 50),
(165, 15, 114, 0, 50),
(166, 57, 115, 1, 50),
(167, 5, 116, 0, 50),
(168, 6, 116, 0, 50),
(169, 7, 116, 0, 50),
(170, 8, 116, 0, 50),
(171, 9, 116, 0, 50),
(172, 54, 116, 1, 50),
(173, 13, 116, 0, 50),
(174, 57, 117, 1, 50),
(175, 53, 118, 1, 50),
(176, 53, 119, 1, 50),
(177, 5, 120, 0, 50),
(178, 6, 120, 0, 50),
(179, 7, 120, 0, 50),
(180, 8, 120, 0, 50),
(181, 12, 120, 0, 50),
(182, 13, 120, 0, 50),
(183, 14, 120, 0, 50),
(184, 15, 120, 0, 50),
(185, 57, 121, 1, 50),
(186, 6, 122, 0, 50),
(187, 17, 122, 0, 50),
(188, 5, 122, 0, 50),
(189, 18, 122, 0, 50),
(190, 7, 122, 0, 50),
(191, 19, 122, 0, 50),
(192, 8, 122, 0, 50),
(193, 20, 122, 0, 50),
(194, 15, 122, 0, 50),
(195, 57, 123, 1, 50),
(196, 5, 124, 0, 50),
(197, 6, 124, 0, 50),
(198, 7, 124, 0, 50),
(199, 8, 124, 0, 50),
(200, 12, 124, 0, 50),
(201, 13, 124, 0, 50),
(202, 14, 124, 0, 50),
(203, 15, 124, 0, 50),
(204, 57, 125, 1, 50),
(205, 53, 126, 1, 50),
(206, 53, 127, 1, 50),
(207, 6, 128, 0, 50),
(208, 17, 128, 0, 50),
(209, 5, 128, 0, 50),
(210, 18, 128, 0, 50),
(211, 7, 128, 0, 50),
(212, 19, 128, 0, 50),
(213, 8, 128, 0, 50),
(214, 20, 128, 0, 50),
(215, 15, 128, 0, 50),
(216, 57, 129, 1, 50),
(217, 53, 130, 1, 50),
(218, 6, 131, 0, 50),
(219, 17, 131, 0, 50),
(220, 5, 131, 0, 50),
(221, 18, 131, 0, 50),
(222, 7, 131, 0, 50),
(223, 19, 131, 0, 50),
(224, 8, 131, 0, 50),
(225, 20, 131, 0, 50),
(226, 15, 131, 0, 50),
(227, 57, 132, 1, 50),
(228, 5, 133, 0, 50),
(229, 6, 133, 0, 50),
(230, 7, 133, 0, 50),
(231, 8, 133, 0, 50),
(232, 12, 133, 0, 50),
(233, 13, 133, 0, 50),
(234, 14, 133, 0, 50),
(235, 15, 133, 0, 50),
(236, 57, 134, 1, 50),
(237, 6, 135, 0, 50),
(238, 17, 135, 0, 50),
(239, 5, 135, 0, 50),
(240, 18, 135, 0, 50),
(241, 7, 135, 0, 50),
(242, 19, 135, 0, 50),
(243, 8, 135, 0, 50),
(244, 20, 135, 0, 50),
(245, 15, 135, 0, 50),
(246, 57, 136, 1, 50),
(247, 6, 137, 0, 50),
(248, 17, 137, 0, 50),
(249, 5, 137, 0, 50),
(250, 18, 137, 0, 50),
(251, 7, 137, 0, 50),
(252, 19, 137, 0, 50),
(253, 8, 137, 0, 50),
(254, 20, 137, 0, 50),
(255, 15, 137, 0, 50),
(256, 57, 138, 1, 50),
(257, 5, 139, 0, 50),
(258, 6, 139, 0, 50),
(259, 7, 139, 0, 50),
(260, 8, 139, 0, 50),
(261, 12, 139, 0, 50),
(262, 13, 139, 0, 50),
(263, 14, 139, 0, 50),
(264, 15, 139, 0, 50),
(265, 57, 140, 1, 50),
(266, 5, 141, 0, 50),
(267, 6, 141, 0, 50),
(268, 7, 141, 0, 50),
(269, 8, 141, 0, 50),
(270, 9, 141, 0, 50),
(271, 54, 141, 0, 50),
(272, 13, 141, 0, 50),
(273, 57, 142, 1, 50),
(274, 53, 143, 1, 50),
(275, 53, 144, 1, 50),
(276, 53, 145, 1, 50),
(277, 53, 146, 1, 50),
(278, 53, 147, 1, 50),
(279, 53, 148, 1, 50),
(280, 53, 149, 1, 50),
(281, 53, 150, 1, 50),
(282, 53, 151, 1, 50),
(283, 53, 152, 1, 50),
(284, 53, 153, 1, 50),
(285, 53, 154, 1, 50),
(286, 53, 155, 1, 50),
(287, 53, 156, 1, 50),
(288, 53, 157, 1, 50),
(289, 53, 158, 1, 50),
(290, 53, 159, 1, 50),
(291, 53, 160, 1, 50),
(292, 53, 161, 1, 50),
(293, 53, 162, 1, 50),
(294, 53, 163, 1, 50),
(295, 53, 164, 1, 50),
(296, 53, 165, 1, 50),
(297, 53, 166, 1, 50),
(298, 53, 167, 1, 50),
(299, 53, 168, 1, 50),
(300, 53, 169, 1, 50),
(311, 53, 180, 1, 50),
(312, 5, 181, 0, 50),
(313, 6, 181, 0, 50),
(314, 7, 181, 0, 50),
(315, 8, 181, 0, 50),
(316, 9, 181, 0, 50),
(317, 54, 181, 0, 50),
(318, 13, 181, 0, 50),
(319, 57, 182, 1, 50),
(320, 53, 183, 1, 50),
(321, 53, 184, 1, 50),
(322, 5, 185, 0, 50),
(323, 6, 185, 0, 50),
(324, 7, 185, 0, 50),
(325, 8, 185, 0, 50),
(326, 9, 185, 0, 50),
(327, 54, 185, 0, 50),
(328, 13, 185, 0, 50),
(329, 57, 186, 1, 50),
(330, 53, 187, 1, 50),
(331, 5, 188, 0, 50),
(332, 6, 188, 0, 50),
(333, 7, 188, 0, 50),
(334, 8, 188, 0, 50),
(335, 9, 188, 0, 50),
(336, 54, 188, 1, 50),
(337, 13, 188, 0, 50),
(338, 57, 189, 1, 50),
(339, 53, 190, 1, 50),
(340, 25, 191, 0, 50),
(341, 26, 191, 0, 50),
(342, 27, 191, 0, 50),
(343, 28, 191, 0, 50),
(344, 32, 191, 0, 50),
(345, 33, 191, 0, 50),
(346, 24, 191, 0, 50),
(347, 57, 192, 1, 50),
(348, 53, 193, 1, 50),
(349, 21, 194, 0, 50),
(350, 27, 194, 0, 50),
(351, 11, 194, 0, 50),
(352, 33, 194, 0, 50),
(353, 27, 194, 0, 50),
(354, 25, 194, 0, 50),
(355, 58, 194, 0, 50),
(356, 29, 194, 0, 50),
(357, 31, 194, 0, 50),
(358, 57, 195, 1, 50),
(359, 53, 196, 1, 50),
(360, 22, 197, 0, 50),
(361, 23, 197, 0, 50),
(362, 26, 197, 0, 50),
(363, 29, 197, 0, 50),
(364, 31, 197, 0, 50),
(365, 32, 197, 0, 50),
(366, 57, 198, 1, 50),
(367, 53, 199, 1, 50),
(368, 53, 200, 1, 50),
(369, 53, 201, 1, 50),
(370, 53, 202, 1, 50),
(371, 11, 203, 0, 50),
(372, 30, 203, 0, 50),
(373, 31, 203, 0, 50),
(374, 32, 203, 0, 50),
(375, 33, 203, 0, 50),
(376, 17, 203, 0, 50),
(377, 57, 204, 1, 50),
(378, 11, 205, 0, 50),
(379, 30, 205, 0, 50),
(380, 31, 205, 0, 50),
(381, 32, 205, 0, 50),
(382, 33, 205, 0, 50),
(383, 17, 205, 0, 50),
(384, 57, 206, 1, 50),
(385, 53, 207, 1, 50),
(386, 53, 208, 1, 90),
(387, 53, 209, 1, 91),
(388, 27, 210, 0, NULL),
(389, 28, 210, 0, NULL),
(390, 29, 210, 0, NULL),
(391, 25, 210, 0, NULL),
(392, 26, 210, 0, NULL),
(393, 57, 211, 1, NULL),
(394, 22, 212, 0, NULL),
(395, 23, 212, 0, NULL),
(396, 24, 212, 0, NULL),
(397, 25, 212, 0, NULL),
(398, 26, 212, 0, NULL),
(399, 27, 212, 0, NULL),
(400, 57, 213, 1, NULL),
(401, 22, 214, 0, NULL),
(402, 23, 214, 0, NULL),
(403, 24, 214, 0, NULL),
(404, 25, 214, 0, NULL),
(405, 26, 214, 0, NULL),
(406, 27, 214, 0, NULL),
(407, 57, 215, 1, NULL),
(408, 53, 216, 1, NULL),
(409, 53, 217, 1, NULL),
(410, 53, 218, 1, 94),
(411, 5, 219, 0, NULL),
(412, 6, 219, 0, NULL),
(413, 7, 219, 0, NULL),
(414, 8, 219, 0, NULL),
(415, 9, 219, 0, NULL),
(416, 54, 219, 1, NULL),
(417, 13, 219, 0, NULL),
(418, 57, 220, 1, NULL),
(419, 53, 221, 1, 95),
(420, 22, 222, 0, NULL),
(421, 23, 222, 0, NULL),
(422, 26, 222, 0, NULL),
(423, 29, 222, 0, NULL),
(424, 31, 222, 0, NULL),
(425, 32, 222, 0, NULL),
(426, 57, 223, 1, 95),
(427, 53, 224, 1, 96),
(428, 5, 225, 0, NULL),
(429, 6, 225, 0, NULL),
(430, 7, 225, 0, NULL),
(431, 8, 225, 0, NULL),
(432, 9, 225, 0, NULL),
(433, 54, 225, 1, NULL),
(434, 13, 225, 0, NULL),
(435, 57, 226, 1, 96),
(436, 53, 227, 1, 97),
(437, 22, 228, 0, NULL),
(438, 23, 228, 0, NULL),
(439, 24, 228, 0, NULL),
(440, 25, 228, 0, NULL),
(441, 26, 228, 0, NULL),
(442, 27, 228, 0, NULL),
(443, 57, 229, 1, 97),
(444, 53, 230, 0, 98),
(445, 53, 231, 1, 99),
(446, 53, 232, 1, 100),
(447, 53, 233, 0, 101);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` varchar(1000) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `notification`
--

INSERT INTO `notification` (`id`, `content`, `user_id`, `title`, `createdDate`, `request_id`) VALUES
(1, 'All employees will be off work from January 28, 2017 to February 6, 2018. All work will start again on Monday, February 7, 2018. Wish you have a rest happy holidays!', '1,2,3,4,5', 'Notification About Tet Holiday', '2007-11-25 08:00:00', 50),
(3, 'English class 01 on Monday (26/3) will be transferred to Room 1A at 13:30.', '1,2,3,4,5', 'Notification About Changing Room Of English 01 Class', '2007-02-01 09:30:00', 50),
(5, 'Communication Skills class on Wednesday (1/4) will be transferred to Room 5A at 15:30.', '1,2,3,4,5', 'Notification About Changing Room Of Communication Skills Class', '2007-05-03 13:40:04', 50),
(6, 'Git 01 class on Friday (1/4) will be transferred to Room 2A at 14:30.', '1,2,3,4,5', 'Notification About Changing Room Of Git 01 Class', '2007-06-22 00:00:00', 50),
(11, 'Java 01 class on Thursday (23/4) will be transferred to Training Room at 8:00.', '1,2,3,4,5', 'Notification About Changing Room Of Java 01 Class', '2007-09-03 02:30:10', 50),
(12, 'Java 02 class on Monday (2/5) will be transferred to Training Room at 9:00.', '1,2,3,4,5', 'Notification About Changing Room Of Java 02 Class', '2007-10-01 10:02:44', 50),
(13, 'Speaking English class on Wednesday (5/5) will be transferred to Room 4A at 10:00.', '1,2,3,4,5', 'Notification About Changing Room Of Speaking English Class', '2007-11-11 10:03:05', 50),
(14, 'Listening English class on Wednesday (15/5) will be transferred to Room 2A at 15:00.', '1,2,3,4,5', 'Notification About Changing Room Of Listening English Class', '2007-11-14 00:30:00', 50),
(15, 'Git 02 class on Friday (22/4) will be transferred to Room 4A at 8:30.', '1,2,3,4,5', 'Notification About Changing Room Of Git 02 Class', '2007-11-02 06:20:20', 50),
(16, 'Basic C++ class on Monday (27/4) will be transferred to Room 5A at 8:30.', '1,2,3,4,5', 'Notification About Changing Room Of Basic C++ Class', '2007-12-01 06:05:00', 50),
(17, 'anhdaowill take day off on 4Replace learning plan is 6, at 7:00-9:00. If you approve it. Please check List Request of Trainer ', NULL, 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(18, 'anhdaowill take day off on 4Replace learning plan is 6, at 7:00-9:00. If you approve it. Please check List Request of Trainer ', NULL, 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(19, 'anhdaowill take day off on 4Replace learning plan is 6, at 7:00-9:00. If you approve it. Please check List Request of Trainer ', NULL, 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(20, 'anhdaowill take day off on 4Replace learning plan is 6, at 7:00-9:00. If you approve it. Please check List Request of Trainer ', NULL, 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(21, 'anhdaowill take day off on 4Replace learning plan is 6, at 7:00-9:00. If you approve it. Please check List Request of Trainer ', NULL, 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(22, 'anhdaowill take day off on 4Replace learning plan is 6, at 7:00-9:00. If you approve it. Please check List Request of Trainer ', NULL, 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(23, 'anhdaowill take day off on 4Replace learning plan is 6, at 7:00-9:00. If you approve it. Please check List Request of Trainer ', NULL, 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(24, 'nullwill take day off on Fri, 20 Jul 2018Replace learning plan is Wed, 18 Jul 2018-7, at 15:00-17:00. If you approve it. Please check List Request of Trainer ', NULL, 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(25, 'NamNguyenwill take day off on Fri, 20 Jul 2018. Replace learning plan is Sat, 21 Jul 2018-7, at 8:00-9:00, in . If you approve it. Please check List Request of Trainer ', NULL, 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(26, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Wed, 18 Jul 2018-7, at 15:00-17:00, in 4B. If you approve it. Please check List Request of Trainer ', NULL, 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(27, 'The announcement of Java Core 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Fri, 20 Jul 2018-10, at 15:00-17:00, in 5A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(28, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Thu, 19 Jul 2018-2, at 8:00-9:00, in 3B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(29, 'The announcement of Git 01 will take day off on Fri, 20 Jul 2018. Replace learning plan is Mon, 23 Jul 2018-2, at 15:00-17:00, in 5A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(30, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Fri, 20 Jul 2018-2, at 13:00-14:00, in 3B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(31, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Sat, 21 Jul 2018-2, at 8:00-9:00, in 3B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(32, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Wed, 18 Jul 2018-7, at 15:00-17:00, in 4A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(33, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Thu, 19 Jul 2018-2, at 9:00-10:00, in 3A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(34, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Mon, 23 Jul 2018-7, at 9:00-10:00, in 2B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(35, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Thu, 19 Jul 2018-2, at 8:00-9:00, in 3B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(36, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Sat, 21 Jul 2018-2, at 8:00-9:00, in 3B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(37, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Wed, 18 Jul 2018-2, at 15:00-17:00, in Training Room. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(38, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Thu, 19 Jul 2018-2, at 8:00-9:00, in 3B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(39, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Sat, 21 Jul 2018-2, at 8:00-9:00, in 3B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(40, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Sat, 21 Jul 2018-7, at 8:00-9:00, in 4B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(41, 'The announcement of Git 01 will take day off on Fri, 20 Jul 2018. Replace learning plan is Mon, 23 Jul 2018-2, at 15:00-17:00, in 5A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(42, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Fri, 20 Jul 2018-2, at 11:00-12:00, in Training Room. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(43, 'The announcement of Java Core 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Fri, 20 Jul 2018-10, at 9:00-10:00, in 3B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(44, 'The announcement of Java Core 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Sat, 21 Jul 2018-10, at 8:00-9:00, in 3B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(45, 'The announcement of Basic Linux 01 will take day off on Tue, 24 Jul 2018. Replace learning plan is Wed, 18 Jul 2018-11, at 15:00-17:00, in 4B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(46, 'The announcement of English 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Fri, 20 Jul 2018-12, at 10:00-11:00, in 5B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(47, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Sun, 22 Jul 2018-7, at 8:00-9:00, in 2A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(48, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Wed, 18 Jul 2018-7, at 15:00-17:00, in 4A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(49, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Thu, 19 Jul 2018-7, at 10:00-11:00, in 2B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(50, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Sat, 21 Jul 2018-7, at 8:00-9:00, in 3A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(51, 'The announcement of Java Core 01 will take day off on Sat, 21 Jul 2018. Replace learning plan is Thu, 19 Jul 2018-10, at 8:00-9:00, in 3A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(52, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Sat, 21 Jul 2018-7, at 13:00-15:00, in 2B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(53, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Thu, 19 Jul 2018-7, at 10:00-12:00, in 2B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(54, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Wed, 18 Jul 2018-7, at 9:00-10:00, in Training Room. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(55, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Wed, 18 Jul 2018-7, at 15:00-17:00, in 4B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(56, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Sun, 22 Jul 2018-7, at 15:00-17:00, in 3B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(57, 'The announcement of Java Core 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Sun, 22 Jul 2018-10, at 11:00-12:00, in 4A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(58, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Thu, 19 Jul 2018-2, at 8:00-9:00, in 3A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(59, 'The announcement of Git 01 will take day off on Fri, 20 Jul 2018. Replace learning plan is Tue, 24 Jul 2018-2, at 8:00-12:00, in 2B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(60, 'The announcement of Java Core 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Fri, 20 Jul 2018, at 9:00-10:00, in 3A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(61, 'The announcement of Git 01 will take day off on Mon, 23 Jul 2018. Replace learning plan is Fri, 20 Jul 2018, at 15:00-17:00, in 4A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(62, 'The announcement of Git 01 will take day off on Fri, 20 Jul 2018. Replace learning plan is Tue, 24 Jul 2018, at 15:00-17:00, in 5A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(63, 'The announcement of Git 01 will take day off on Fri, 20 Jul 2018. Replace learning plan is Thu, 19 Jul 2018, at 8:00-9:00, in 3A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(64, 'The announcement of Git 01 will take day off on Fri, 20 Jul 2018. Replace learning plan is Sun, 22 Jul 2018, at 8:00-12:00, in Training Room. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(65, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Thu, 19 Jul 2018, at 8:00-9:00, in 3A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(66, 'The announcement of Basic Linux 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Fri, 20 Jul 2018, at 14:00-17:00, in 3A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(71, 'Git 01 will take day off on Wed, 18 Jul 2018Replace learning plan is  at 8:00-9:00,onThu, 19 Jul 2018. Room  is Git 01. We inform  you to kmow and do it ontime ', NULL, 'Notice about The  Request Take Date Off : Git 01', '2017-12-07 00:00:00', 50),
(72, 'Git 01 will take day off on Wed, 18 Jul 2018Replace learning plan is  at 8:00-9:00,onThu, 19 Jul 2018. Room  is Git 01. We inform to kmow and do it ontime ', NULL, 'Notice about The Your Request Take Date Off is approved', '2017-12-07 00:00:00', 50),
(73, 'Basic Linux 01 will take day off on Thu, 19 Jul 2018Replace learning plan is  at 14:00-17:00,onFri, 20 Jul 2018. Room  is Basic Linux 01. We inform  you to kmow and do it ontime ', NULL, 'Notice about The  Request Take Date Off : Basic Linux 01', '2017-12-07 00:00:00', 50),
(74, 'Basic Linux 01 will take day off on Thu, 19 Jul 2018Replace learning plan is  at 14:00-17:00,onFri, 20 Jul 2018. Room  is Basic Linux 01. We inform to kmow and do it ontime ', NULL, 'Notice about The Your Request Take Date Off is approved', '2017-12-07 00:00:00', 50),
(75, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Tue, 24 Jul 2018, at 15:00-17:00, in 4B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(76, 'Basic Linux 01 will take day off on Thu, 19 Jul 2018Replace learning plan is  at 14:00-17:00,onFri, 20 Jul 2018. Room  is Basic Linux 01. We inform  you to kmow and do it ontime ', NULL, 'Notice about The  Request Take Date Off : Basic Linux 01', '2017-12-07 00:00:00', 50),
(77, 'Basic Linux 01 will take day off on Thu, 19 Jul 2018Replace learning plan is  at 14:00-17:00,onFri, 20 Jul 2018. Room  is Basic Linux 01. We inform to kmow and do it ontime ', NULL, 'Notice about The Your Request Take Date Off is approved', '2017-12-07 00:00:00', 50),
(78, 'Git 05 will take day off on Fri, 20 Jul 2018Replace learning plan is  at 15:00-17:00,onTue, 24 Jul 2018. Room  is Git 05. We inform  you to kmow and do it ontime ', NULL, 'Notice about The  Request Take Date Off : Git 05', '2017-12-07 00:00:00', 50),
(79, 'Git 05 will take day off on Fri, 20 Jul 2018Replace learning plan is  at 15:00-17:00,onTue, 24 Jul 2018. Room  is Git 05. We inform to kmow and do it ontime ', NULL, 'Notice about The Your Request Take Date Off is approved', '2017-12-07 00:00:00', 50),
(80, 'The announcement of Java Core 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Sat, 21 Jul 2018, at 13:00-16:00, in 3A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(81, 'Java Core 01 will take day off on Thu, 19 Jul 2018Replace learning plan is  at 13:00-16:00,onSat, 21 Jul 2018. Room  is Java Core 01. We inform  you to kmow and do it ontime ', NULL, 'Notice about The  Request Take Date Off : Java Core 01', '2017-12-07 00:00:00', 50),
(82, 'Java Core 01 will take day off on Thu, 19 Jul 2018Replace learning plan is  at 13:00-16:00,onSat, 21 Jul 2018. Room  is Java Core 01. We inform to kmow and do it ontime ', NULL, 'Notice about The Your Request Take Date Off is approved', '2017-12-07 00:00:00', 50),
(83, 'The announcement of Git 01 will take day off on Fri, 20 Jul 2018. Replace learning plan is Sun, 22 Jul 2018, at 8:00-12:00, in 2B. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(84, 'The announcement of Git 01 will take day off on Wed, 18 Jul 2018. Replace learning plan is Sat, 21 Jul 2018, at 13:00-15:00, in 3A. If you approve it. Please check List Request of Trainer ', '56', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(85, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Wed, 18 Jul 2018, at 9:00-10:00, in 2B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(86, 'Git 01 will take day off on Fri, 20 Jul 2018Replace learning plan is  at 8:00-12:00,onSun, 22 Jul 2018. Room  is Git 01. We inform  you to kmow and do it ontime ', NULL, 'Notice about The  Request Take Date Off : Git 01', '2017-12-07 00:00:00', 50),
(87, 'Git 01 will take day off on Fri, 20 Jul 2018Replace learning plan is  at 8:00-12:00,onSun, 22 Jul 2018. Room  is Git 01. We inform to kmow and do it ontime ', NULL, 'Notice about The Your Request Take Date Off is approved', '2017-12-07 00:00:00', 50),
(88, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Mon, 23 Jul 2018, at 15:00-17:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(89, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Fri, 20 Jul 2018, at 13:00-15:00, in 2A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(90, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Wed, 25 Jul 2018, at 9:00-10:00, in 2B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(91, 'The announcement of Java Core 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Fri, 20 Jul 2018, at 13:00-15:00, in 3B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(92, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Tue, 24 Jul 2018, at 8:00-9:00, in 3A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(93, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Mon, 23 Jul 2018, at 15:00-17:00, in 5A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(94, 'The announcement of Basic Linux 01 will take day off on Tue, 24 Jul 2018. Replace learning plan is Wed, 25 Jul 2018, at 8:00-9:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(95, 'The announcement of Basic Linux 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Sat, 21 Jul 2018, at 9:00-12:00, in 2B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(96, 'The announcement of Git 01 will take day off on Wed, 25 Jul 2018. Replace learning plan is Fri, 20 Jul 2018, at 8:00-9:00, in 3A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(97, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Thu, 19 Jul 2018, at 13:00-15:00, in 3B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(98, 'The announcement of Git 01 will take day off on Wed, 25 Jul 2018. Replace learning plan is Wed, 25 Jul 2018, at 13:00-15:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(99, 'The announcement of Git 01 will take day off on Wed, 25 Jul 2018. Replace learning plan is Fri, 20 Jul 2018, at 10:00-12:00, in Training Room. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(100, 'The announcement of Git 01 will take day off on Mon, 23 Jul 2018. Replace learning plan is Fri, 20 Jul 2018, at 10:00-12:00, in 3B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(101, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Tue, 24 Jul 2018, at 13:00-15:00, in 2B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(102, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Tue, 24 Jul 2018, at 13:00-15:00, in 3B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(103, 'The announcement of Java Core 01 will take day off on Thu, 19 Jul 2018. Replace learning plan is Sat, 21 Jul 2018, at 13:00-15:00, in 2B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(104, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Thu, 19 Jul 2018, at 13:00-15:00, in 2A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(105, 'The announcement of English 01 will take day off on Tue, 24 Jul 2018. Replace learning plan is Thu, 19 Jul 2018, at 13:00-15:00, in 2A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(106, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Tue, 24 Jul 2018, at 13:00-15:00, in 2B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(107, 'The announcement of Basic Linux 01 will take day off on Tue, 24 Jul 2018. Replace learning plan is Mon, 23 Jul 2018, at 10:00-12:00, in 3A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(108, 'Basic Linux 01 will take day off on Tue, 24 Jul 2018. \nReplace learning plan is  at 10:00-12:00 ,onMon, 23 Jul 2018.\n Room  is Basic Linux 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Basic Linux 01', '2017-12-07 00:00:00', 50),
(109, 'Basic Linux 01 will take day off on Tue, 24 Jul 2018. \nReplace learning plan is  at 10:00-12:00, onMon, 23 Jul 2018.\n Room  is Basic Linux 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(110, 'Git 05 will take day off on Fri, 20 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onTue, 24 Jul 2018.\n Room  is Git 05.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 05', '2017-12-07 00:00:00', 50),
(111, 'Git 05 will take day off on Fri, 20 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onTue, 24 Jul 2018.\n Room  is Git 05. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(112, 'English 01 will take day off on Tue, 24 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onThu, 19 Jul 2018.\n Room  is English 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : English 01', '2017-12-07 00:00:00', 50),
(113, 'English 01 will take day off on Tue, 24 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onThu, 19 Jul 2018.\n Room  is English 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(114, 'Git 05 will take day off on Mon, 23 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onThu, 19 Jul 2018.\n Room  is Git 05.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 05', '2017-12-07 00:00:00', 50),
(115, 'Git 05 will take day off on Mon, 23 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onThu, 19 Jul 2018.\n Room  is Git 05. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(116, 'Java Core 01 will take day off on Thu, 19 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onSat, 21 Jul 2018.\n Room  is Java Core 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Java Core 01', '2017-12-07 00:00:00', 50),
(117, 'Java Core 01 will take day off on Thu, 19 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onSat, 21 Jul 2018.\n Room  is Java Core 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(118, 'The announcement of Git 05 will take day off on Fri, 20 Jul 2018. Replace learning plan is Wed, 25 Jul 2018, at 13:00-15:00, in 3B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(119, 'The announcement of Git 01 will take day off on Wed, 25 Jul 2018. Replace learning plan is Wed, 25 Jul 2018, at 08:00-10:00, in 2A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(120, 'Git 05 will take day off on Fri, 20 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onWed, 25 Jul 2018.\n Room  is Git 05.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 05', '2017-12-07 00:00:00', 50),
(121, 'Git 05 will take day off on Fri, 20 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onWed, 25 Jul 2018.\n Room  is Git 05. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(122, 'Git 01 will take day off on Wed, 25 Jul 2018. \nReplace learning plan is  at 08:00-10:00 ,onWed, 25 Jul 2018.\n Room  is Git 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 01', '2017-12-07 00:00:00', 50),
(123, 'Git 01 will take day off on Wed, 25 Jul 2018. \nReplace learning plan is  at 08:00-10:00, onWed, 25 Jul 2018.\n Room  is Git 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(124, 'Git 05 will take day off on Fri, 20 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onTue, 24 Jul 2018.\n Room  is Git 05.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 05', '2017-12-07 00:00:00', 50),
(125, 'Git 05 will take day off on Fri, 20 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onTue, 24 Jul 2018.\n Room  is Git 05. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(126, 'The announcement of Git 01 will take day off on Wed, 25 Jul 2018. Replace learning plan is Thu, 26 Jul 2018, at 09:00-11:00, in 4B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(127, 'The announcement of Git 01 will take day off on Mon, 23 Jul 2018. Replace learning plan is Thu, 26 Jul 2018, at 14:00-16:00, in 3A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(128, 'Git 01 will take day off on Mon, 23 Jul 2018. \nReplace learning plan is  at 14:00-16:00 ,onThu, 26 Jul 2018.\n Room  is Git 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 01', '2017-12-07 00:00:00', 50),
(129, 'Git 01 will take day off on Mon, 23 Jul 2018. \nReplace learning plan is  at 14:00-16:00, onThu, 26 Jul 2018.\n Room  is Git 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(130, 'The announcement of Git 01 will take day off on Mon, 23 Jul 2018. Replace learning plan is Fri, 20 Jul 2018, at 10:00-12:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(131, 'Git 01 will take day off on Mon, 23 Jul 2018. \nReplace learning plan is  at 10:00-12:00 ,onFri, 20 Jul 2018.\n Room  is Git 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 01', '2017-12-07 00:00:00', 50),
(132, 'Git 01 will take day off on Mon, 23 Jul 2018. \nReplace learning plan is  at 10:00-12:00, onFri, 20 Jul 2018.\n Room  is Git 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(133, 'Git 05 will take day off on Fri, 20 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onTue, 24 Jul 2018.\n Room  is Git 05.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 05', '2017-12-07 00:00:00', 50),
(134, 'Git 05 will take day off on Fri, 20 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onTue, 24 Jul 2018.\n Room  is Git 05. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(135, 'Git 01 will take day off on Wed, 25 Jul 2018. \nReplace learning plan is  at 09:00-11:00 ,onThu, 26 Jul 2018.\n Room  is Git 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 01', '2017-12-07 00:00:00', 50),
(136, 'Git 01 will take day off on Wed, 25 Jul 2018. \nReplace learning plan is  at 09:00-11:00, onThu, 26 Jul 2018.\n Room  is Git 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(137, 'Git 01 will take day off on Mon, 23 Jul 2018. \nReplace learning plan is  at 10:00-12:00 ,onFri, 20 Jul 2018.\n Room  is Git 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 01', '2017-12-07 00:00:00', 50),
(138, 'Git 01 will take day off on Mon, 23 Jul 2018. \nReplace learning plan is  at 10:00-12:00, onFri, 20 Jul 2018.\n Room  is Git 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(139, 'Git 05 will take day off on Fri, 20 Jul 2018. \nReplace learning plan is  at 8:00-9:00 ,onTue, 24 Jul 2018.\n Room  is Git 05.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 05', '2017-12-07 00:00:00', 50),
(140, 'Git 05 will take day off on Fri, 20 Jul 2018. \nReplace learning plan is  at 8:00-9:00, onTue, 24 Jul 2018.\n Room  is Git 05. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(141, 'Java Core 01 will take day off on Thu, 19 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onFri, 20 Jul 2018.\n Room  is Java Core 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Java Core 01', '2017-12-07 00:00:00', 50),
(142, 'Java Core 01 will take day off on Thu, 19 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onFri, 20 Jul 2018.\n Room  is Java Core 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(143, 'The announcement of Git 01 will take day off on Mon, 23 Jul 2018. Replace learning plan is Mon, 23 Jul 2018, at 10:00-12:00, in 4B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(144, 'The announcement of Git 01 will take day off on Wed, 25 Jul 2018. Replace learning plan is Wed, 25 Jul 2018, at 10:00-12:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(145, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Fri, 27 Jul 2018, at 13:00-15:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(146, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Fri, 27 Jul 2018, at 13:00-15:00, in 3B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(147, 'The announcement of Basic Linux 01 will take day off on Thu, 26 Jul 2018. Replace learning plan is Sat, 28 Jul 2018, at 13:00-15:00, in 2B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(148, 'The announcement of Java Core 01 will take day off on Sat, 28 Jul 2018. Replace learning plan is Tue, 24 Jul 2018, at 13:00-15:00, in 2B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(149, 'The announcement of Git 05 will take day off on Fri, 27 Jul 2018. Replace learning plan is Mon, 23 Jul 2018, at 13:00-15:00, in 2B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(150, 'The announcement of Basic Linux 01 will take day off on Thu, 26 Jul 2018. Replace learning plan is Mon, 23 Jul 2018, at 10:00-12:00, in 4A.<a href= \'google.com\'> Approved</a> If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(151, 'The announcement of Git 01 will take day off on <b>Fri, 27 Jul 2018</b. <br>/ Replace learning plan: <br/><form><label> Date  </label><input value=Mon, 23 Jul 2018 readonly >   </input></form><button class=\'approved\' id=\'Fri, 27 Jul 2018\'> Approved This Request</button>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(152, 'The announcement of Git 05 will take day off on Mon, 23 Jul 2018. Replace learning plan is Thu, 26 Jul 2018, at 10:00-12:00, in 4B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(153, 'The announcement of Basic Linux 01 will take day off on <b>Thu, 26 Jul 2018</b. <br>/ Replace learning plan: <br/><form><label> Date:  </label><input value=Mon, 23 Jul 2018 readonly >   </input><label> Time:  </label><input value=13:00-15:00 readonly >   </input><label> Room:  </label><input value=3B readonly >   </input></form><button class=\'approved\' id=\'Thu, 26 Jul 2018\'> Approve It</button>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(154, 'The announcement of Git 01 will take day off on <b>Fri, 27 Jul 2018</b. <br>/ Replace learning plan: <br/><form><label> Date:  </label><input value=\'Mon, 23 Jul 2018\' readonly >   </input><label> Time:  </label><input value=13:00-15:00 readonly >   </input><label> Room:  </label><input value=3B readonly >   </input></form><button class=\'approved\' id=\'Fri, 27 Jul 2018\'> Approve It</button>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(155, 'The announcement of Java Core 01 will take day off on <b>Sat, 28 Jul 2018</b. <br>/ Replace learning plan: <br/><form><div class=\'row\'><div class=\'col-25\'><label> Date:  </label></div><div class=\'col-75\'><input value=\'Wed, 25 Jul 2018\' readonly >   </input></div></div><div class=\'row\'><div class=\'col-25\'><label> Time:  </label>/div<div class=\'col-75\'><input value=10:00-12:00 readonly >   </input></div></div><div class=\'row\'><div class=\'col-25\'><label> Room:  </label>/div<div class=\'col-75\'><input value=4B readonly >   </input></div></div></form><button class=\'approved\' id=\'Sat, 28 Jul 2018\'> Approve It</button>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(156, 'The announcement of Git 05 will take day off on <b>Fri, 27 Jul 2018</b>. <br/> Replace learning plan: <br/><form><div class=\'row\'><div class=\'col-25\'><label> Date:  </label></div><div class=\'col-75\'><input value=\'Tue, 24 Jul 2018\' readonly >   </input></div></div><div class=\'row\'><div class=\'col-25\'><label> Time:  </label></div><div class=\'col-75\'><input value=09:00-11:00 readonly >   </input></div></div><div class=\'row\'><div class=\'col-25\'><label> Room:  </label></div><div class=\'col-75\'><input value=4A readonly >   </input></div></div></form><button class=\'approved\' id=\'Fri, 27 Jul 2018\'> Approve It</button>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(157, 'The announcement of Git 01 will take day off on Wed, 25 Jul 2018. Replace learning plan is Fri, 27 Jul 2018, at 13:00-15:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(158, 'The announcement of Git 01 will take day off on <b>Fri, 27 Jul 2018</b>. <br/> Replace learning plan: <br/><form><div class=\'row\'><div class=\'col-25\'><label> Date:  </label></div><div class=\'col-50\'><input value=\'Tue, 24 Jul 2018\' readonly size=\'12\'>   </input></div></div><div class=\'row\'><div class=\'col-25\'><label> Time:  </label></div><div class=\'col-50\'><input value=13:00-15:00 readonly size=\'12\'>   </input></div></div><div class=\'row\'><div class=\'col-25\'><label> Room:  </label></div><div class=\'col-50\'><input value=3B readonly size=\'12\' >   </input></div></div></form><button class=\'approved\' id=\'Fri, 27 Jul 2018\'> Approve It</button>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(159, 'The announcement of Git 01 will take day off on <b>Mon, 30 Jul 2018</b>. <br/> Replace learning plan: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label >Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Room:  </label></div><div class=\'col-50\'><label >4B  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(160, 'The announcement of Git 01 will take day off on Wed, 25 Jul 2018. Replace learning plan is Mon, 30 Jul 2018, at 13:00-15:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(161, 'The announcement of Git 01 will take day off on Mon, 30 Jul 2018. Replace learning plan is Tue, 24 Jul 2018, at 15:00-17:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(162, 'The announcement of Git 01 will take day off on Mon, 30 Jul 2018. Replace learning plan is Mon, 30 Jul 2018, at 13:00-15:00, in 2A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(163, 'The Git 01 at <b>Fri, 27 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: block;\' >61  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Wed, 25 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label style=\'background-color: #ffe450;\' > Room:  </label></div><div class=\'col-50\'><label >4A  </label></div></div></form>Note: <label style=\'background-color: #ffe450;\' >Bring laptop.  </label>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(164, 'The Git 02 at <b>Fri, 27 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: block;\' >62  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Mon, 30 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >15:00-17:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label style=\'background-color: #ffe450;\' > Room:  </label></div><div class=\'col-50\'><label >5A  </label></div></div></form>Note: <label style=\'background-color: #ffe450;\' >Bring Laptop.  </label>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(165, 'The Git 02 at <b>Fri, 27 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: block;\' >63  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Sun, 29 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >10:00-12:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  > Room:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>4B  </label></div></div></form>Note: <label style=\'background-color: #ffe450;\' >Bring pen.  </label>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(166, 'The Git 02 at <b>Fri, 27 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: block;\' >64  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  > Room:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>3B  </label></div></div></form>Note: <label style=\'background-color: #ffe450;\' >Bring book.  </label>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(167, 'The Git 02 at <b>Fri, 27 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: block;\' >65  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Sat, 28 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >15:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  > Room:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>3A  </label></div></div></form>Note: <label style=\'background-color: #ffe450;\' >dss  </label>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(168, 'The Git 02 at <b>Fri, 27 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: block;\' >66  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Wed, 25 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >15:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  > Room:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>3A  </label></div></div></form>Note: <label style=\'background-color: #ffe450;\' >sdsd  </label>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(169, 'The Git 02 at <b>Fri, 27 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: none;\' >67  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >15:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  > Room:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>2B  </label></div></div></form>Note: <label style=\'background-color: #ffe450;\' >gfvxcbvc  </label>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50);
INSERT INTO `notification` (`id`, `content`, `user_id`, `title`, `createdDate`, `request_id`) VALUES
(170, 'The Java Core 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: none;\' >68  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Mon, 30 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >15:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  > Room:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>2B  </label></div></div></form>Note: <label style=\'background-color: #ffe450;\' >xxxx  </label>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(171, 'The Git 02 at <b>Fri, 27 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: none;\' >69  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Mon, 30 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >15:00-17:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  > Room:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>3A  </label></div></div></form>Note: <label style=\'background-color: #ffe450;\' > cfff  </label>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(172, 'The English 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: none;\' >70  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label> Date:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Mon, 30 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> Time:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  > Room:  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>4A  </label></div></div></form>Note: <label style=\'background-color: #ffe450;\' >ddd  </label>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(173, 'The announcement of Git 01 will take day off on Wed, 25 Jul 2018. Replace learning plan is Mon, 30 Jul 2018, at 15:00-17:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(174, 'The Basic Linux 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  class=\'request_id\' style=\'display: none;\' >72  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >14:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>4B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Bring Latop  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(175, 'The Git 02 at <b>Wed, 25 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >73  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>2B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Bring food  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(176, 'The announcement of Git 01 will take day off on Mon, 30 Jul 2018. Replace learning plan is Mon, 30 Jul 2018, at 09:00-11:00, in 2A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(177, 'The announcement of Git 01 will take day off on Fri, 27 Jul 2018. Replace learning plan is Tue, 24 Jul 2018, at 13:00-15:00, in 2A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(178, 'The announcement of Git 01 will take day off on Fri, 27 Jul 2018. Replace learning plan is Thu, 26 Jul 2018, at 08:00-10:00, in 4A. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(179, 'The announcement of Git 01 will take day off on Fri, 27 Jul 2018. Replace learning plan is Mon, 30 Jul 2018, at 13:00-15:00, in 3B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(180, 'The Java Core 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >78  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Wed, 25 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >14:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>4A  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>vvvv  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(181, 'Java Core 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 14:00-16:00 ,onWed, 25 Jul 2018.\n Room  is Java Core 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Java Core 01', '2017-12-07 00:00:00', 50),
(182, 'Java Core 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 14:00-16:00, onWed, 25 Jul 2018.\n Room  is Java Core 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(183, 'The Java Core 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >79  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>3B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>bbb  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(184, 'The announcement of Git 02 will take day off on Wed, 25 Jul 2018. Replace learning plan is Thu, 26 Jul 2018, at 10:00-12:00, in 4B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', 50),
(185, 'Java Core 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onTue, 24 Jul 2018.\n Room  is Java Core 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Java Core 01', '2017-12-07 00:00:00', 50),
(186, 'Java Core 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onTue, 24 Jul 2018.\n Room  is Java Core 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(187, 'The Java Core 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >81  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Wed, 25 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >14:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>4B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>sx  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(188, 'Java Core 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 14:00-16:00 ,onWed, 25 Jul 2018.\n Room  is Java Core 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Java Core 01', '2017-12-07 00:00:00', 50),
(189, 'Java Core 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 14:00-16:00, onWed, 25 Jul 2018.\n Room  is Java Core 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(190, 'The Git 05 at <b>Fri, 27 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >82  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Wed, 25 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>3B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>ggg  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(191, 'Git 05 will take day off on Fri, 27 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onWed, 25 Jul 2018.\n Room  is Git 05.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 05', '2017-12-07 00:00:00', 50),
(192, 'Git 05 will take day off on Fri, 27 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onWed, 25 Jul 2018.\n Room  is Git 05. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(193, 'The Git 01 at <b>Fri, 27 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >83  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Wed, 25 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>4A  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>sd  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(194, 'Git 01 will take day off on Fri, 27 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onWed, 25 Jul 2018.\n Room  is Git 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Git 01', '2017-12-07 00:00:00', 50),
(195, 'Git 01 will take day off on Fri, 27 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onWed, 25 Jul 2018.\n Room  is Git 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(196, 'The Basic C++ 01 at <b>null</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >84  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Sun, 29 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >10:00-12:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>4B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>ZXzx  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(197, 'Basic C++ 01 will take day off on null. \nReplace learning plan is  at 10:00-12:00 ,onSun, 29 Jul 2018.\n Room  is Basic C++ 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Basic C++ 01', '2017-12-07 00:00:00', 50),
(198, 'Basic C++ 01 will take day off on null. \nReplace learning plan is  at 10:00-12:00, onSun, 29 Jul 2018.\n Room  is Basic C++ 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(199, 'The Basic Linux 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >85  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >15:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>2B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>bbb  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(200, 'The Advance C++ 01 at <b>Tue, 24 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >86  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Wed, 25 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >16:00-17:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>3A  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>bbb  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(201, 'The Basic C++ 02 at <b>Wed, 25 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >87  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Wed, 25 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >14:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>3B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>bbb  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(202, 'The Basic C++ 02 at <b>Wed, 25 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >88  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Fri, 27 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>2B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>kk  </label></div></div></form>', '53', 'Request day off and replace learning plan.', '2017-12-07 00:00:00', 50),
(203, 'Basic C++ 02 will take day off on Wed, 25 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onFri, 27 Jul 2018.\n Room  is Basic C++ 02.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Basic C++ 02', '2017-12-07 00:00:00', 50),
(204, 'Basic C++ 02 will take day off on Wed, 25 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onFri, 27 Jul 2018.\n Room  is Basic C++ 02. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(205, 'Basic C++ 02 will take day off on Wed, 25 Jul 2018. \nReplace learning plan is  at 14:00-16:00 ,onWed, 25 Jul 2018.\n Room  is Basic C++ 02.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Basic C++ 02', '2017-12-07 00:00:00', 50),
(206, 'Basic C++ 02 will take day off on Wed, 25 Jul 2018. \nReplace learning plan is  at 14:00-16:00, onWed, 25 Jul 2018.\n Room  is Basic C++ 02. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', 50),
(207, 'The Basic Linux 01 at <b>Tue, 24 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >89  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Mon, 30 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>4A  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', 50),
(208, 'The Basic Linux 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >90  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Wed, 25 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>4A  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>bbbb  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', NULL),
(209, 'The Advance C++ 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >91  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Mon, 30 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>3B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>hhh  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', NULL),
(210, 'Advance C++ 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onMon, 30 Jul 2018.\n Room  is Advance C++ 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Advance C++ 01', '2017-12-07 00:00:00', NULL),
(211, 'Advance C++ 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onMon, 30 Jul 2018.\n Room  is Advance C++ 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', NULL),
(212, 'Basic Linux 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onWed, 25 Jul 2018.\n Room  is Basic Linux 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Basic Linux 01', '2017-12-07 00:00:00', NULL),
(213, 'Basic Linux 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onWed, 25 Jul 2018.\n Room  is Basic Linux 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', NULL),
(214, 'Basic Linux 01 will take day off on Tue, 24 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onMon, 30 Jul 2018.\n Room  is Basic Linux 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Basic Linux 01', '2017-12-07 00:00:00', NULL),
(215, 'Basic Linux 01 will take day off on Tue, 24 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onMon, 30 Jul 2018.\n Room  is Basic Linux 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', NULL),
(216, 'The announcement of Git 01 will take day off on Mon, 30 Jul 2018. Replace learning plan is Mon, 30 Jul 2018, at 13:00-15:00, in 4B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', NULL),
(217, 'The announcement of Java Core 01 will take day off on Thu, 26 Jul 2018. Replace learning plan is Thu, 26 Jul 2018, at 13:00-15:00, in 5B. If you approve it. Please check List Request of Trainer ', '53', 'Notice about request day off and replace learning plan', '2017-12-07 00:00:00', NULL),
(218, 'The Java Core 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >94  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Thu, 26 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >10:00-12:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>5A  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>TTT  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', NULL),
(219, 'Java Core 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 10:00-12:00 ,onThu, 26 Jul 2018.\n Room  is Java Core 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Java Core 01', '2017-12-07 00:00:00', NULL),
(220, 'Java Core 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 10:00-12:00, onThu, 26 Jul 2018.\n Room  is Java Core 01. \n We inform to know and do it on time ', NULL, 'Notice about The  your Request Take Date Off is approved.', '2017-12-07 00:00:00', NULL),
(221, 'The Basic C++ 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >95  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>2B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>BBB  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', NULL),
(222, 'Basic C++ 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onTue, 24 Jul 2018.\n Room  is Basic C++ 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Basic C++ 01', '2017-12-07 00:00:00', NULL),
(223, 'Basic C++ 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 13:00-15:00, onTue, 24 Jul 2018.\n Room  is Basic C++ 01. \n We inform to know and do it on time The Basic C++ 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Basic C++ 01  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>BBB  </label></div></div></form>', NULL, 'Your request has been approved.', '2017-12-07 00:00:00', NULL),
(224, 'The Java Core 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >96  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Sat, 28 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >14:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>4B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>VVV  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', NULL),
(225, 'Java Core 01 will take day off on Sat, 28 Jul 2018. \nReplace learning plan is  at 14:00-16:00 ,onSat, 28 Jul 2018.\n Room  is Java Core 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Java Core 01', '2017-12-07 00:00:00', NULL),
(226, 'The Java Core 01 at <b>Sat, 28 Jul 2018</b> will be canceled.<br/> This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Sat, 28 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >14:00-16:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Java Core 01  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>VVV  </label></div></div></form>', NULL, 'Your request has been approved.', '2017-12-07 00:00:00', NULL),
(227, 'The Basic Linux 01 at <b>Tue, 24 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >97  </label>This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>3B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Bring laptop.  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', NULL),
(228, 'Basic Linux 01 will take day off on Tue, 24 Jul 2018. \nReplace learning plan is  at 13:00-15:00 ,onTue, 24 Jul 2018.\n Room  is Basic Linux 01.\n We inform  you to know and do it on time.', NULL, 'Notice about Take Date Off : Basic Linux 01', '2017-12-07 00:00:00', NULL),
(229, 'The Basic Linux 01 at <b>Tue, 24 Jul 2018</b> will be canceled.<br/> This class will be move to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Tue, 24 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\' >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Basic Linux 01  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label style=\'background-color: #ffe450;\'>Bring laptop.  </label></div></div></form>', NULL, 'Your request has been approved.', '2017-12-07 00:00:00', NULL),
(230, 'The Git 01 on <b>Mon, 30 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >98  </label>This class will be moved to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label >Wed, 1 Aug 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label  >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label >4A  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label >csdcd  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', NULL),
(231, 'The Git 02 on <b>Mon, 30 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >99  </label>This class will be moved to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label >Tue, 31 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label  >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label >4A  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label >xÃ£  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', NULL),
(232, 'The Git 01 on <b>Fri, 3 Aug 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >100  </label>This class will be moved to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label >Wed, 1 Aug 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label  >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label >2B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label >cacsasc  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', NULL),
(233, 'The Git 02 on <b>Mon, 30 Jul 2018</b> will be canceled.<br/> <label  id=\'request_id\' style=\'display: none;\' >101  </label>This class will be moved to: <br/><form><div class=\'row\'><div class=\'col-15\'><label><b> Date:</b>  </label></div><div class=\'col-50\'><label >Tue, 31 Jul 2018  </label></div></div><div class=\'row\'><div class=\'col-15\'><label> <b>Time:</b>  </label></div><div class=\'col-50\'><label  >13:00-15:00  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Room: </b> </label></div><div class=\'col-50\'><label >4B  </label></div></div><div class=\'row\'><div class=\'col-15\'><label  ><b> Note:</b>  </label></div><div class=\'col-50\'><label >scsdc  </label></div></div></form>', '53', 'Request day off and compensation schedule.', '2017-12-07 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `requestdayoff`
--

CREATE TABLE `requestdayoff` (
  `request_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `date_off` varchar(50) DEFAULT NULL,
  `date_change` varchar(45) DEFAULT NULL,
  `time_change` varchar(45) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `requestdayoff`
--

INSERT INTO `requestdayoff` (`request_id`, `class_id`, `trainer_id`, `date_off`, `date_change`, `time_change`, `room_id`, `status`, `note`) VALUES
(1, 2, 57, 'Wed, 18 Jul 2018', 'Thu, 19 Jul 2018', '8:00-9:00', 4, 1, NULL),
(2, 11, 57, 'Thu, 19 Jul 2018', 'Fri, 20 Jul 2018', '14:00-17:00', 4, 1, NULL),
(3, 7, 57, 'Fri, 20 Jul 2018', 'Tue, 24 Jul 2018', '15:00-17:00', 7, 1, NULL),
(4, 10, 57, 'Thu, 19 Jul 2018', 'Sat, 21 Jul 2018', '13:00-16:00', 4, 1, NULL),
(5, 2, 57, 'Fri, 20 Jul 2018', 'Sun, 22 Jul 2018', '8:00-12:00', 3, 1, NULL),
(6, 2, 57, 'Wed, 18 Jul 2018', 'Sat, 21 Jul 2018', '13:00-15:00', 4, 0, NULL),
(7, 7, 57, 'Fri, 20 Jul 2018', 'Wed, 18 Jul 2018', '9:00-10:00', 3, 0, NULL),
(8, 7, 57, 'Fri, 20 Jul 2018', 'Mon, 23 Jul 2018', '15:00-17:00', 6, 0, NULL),
(9, 7, 57, 'Mon, 23 Jul 2018', 'Fri, 20 Jul 2018', '13:00-15:00', 2, 0, NULL),
(10, 7, 57, 'Mon, 23 Jul 2018', 'Wed, 25 Jul 2018', '9:00-10:00', 3, 0, NULL),
(11, 10, 57, 'Thu, 19 Jul 2018', 'Fri, 20 Jul 2018', '13:00-15:00', 5, 1, NULL),
(12, 7, 57, 'Fri, 20 Jul 2018', 'Tue, 24 Jul 2018', '8:00-9:00', 4, 1, NULL),
(13, 7, 57, 'Mon, 23 Jul 2018', 'Mon, 23 Jul 2018', '15:00-17:00', 8, 0, NULL),
(14, 11, 57, 'Tue, 24 Jul 2018', 'Wed, 25 Jul 2018', '8:00-9:00', 6, 0, NULL),
(15, 11, 57, 'Thu, 19 Jul 2018', 'Sat, 21 Jul 2018', '9:00-12:00', 3, 0, NULL),
(16, 2, 57, 'Wed, 25 Jul 2018', 'Fri, 20 Jul 2018', '8:00-9:00', 4, 0, NULL),
(17, 7, 57, 'Fri, 20 Jul 2018', 'Thu, 19 Jul 2018', '13:00-15:00', 5, 0, NULL),
(18, 2, 57, 'Wed, 25 Jul 2018', 'Wed, 25 Jul 2018', '13:00-15:00', 6, 0, NULL),
(19, 2, 57, 'Wed, 25 Jul 2018', 'Fri, 20 Jul 2018', '10:00-12:00', 1, 0, NULL),
(20, 2, 57, 'Mon, 23 Jul 2018', 'Fri, 20 Jul 2018', '10:00-12:00', 5, 1, NULL),
(21, 7, 57, 'Fri, 20 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 3, 1, NULL),
(22, 7, 57, 'Fri, 20 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 5, 1, NULL),
(23, 10, 57, 'Thu, 19 Jul 2018', 'Sat, 21 Jul 2018', '13:00-15:00', 3, 1, NULL),
(24, 7, 57, 'Mon, 23 Jul 2018', 'Thu, 19 Jul 2018', '13:00-15:00', 2, 1, NULL),
(25, 12, 57, 'Tue, 24 Jul 2018', 'Thu, 19 Jul 2018', '13:00-15:00', 2, 1, NULL),
(26, 7, 57, 'Fri, 20 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 3, 1, NULL),
(27, 11, 57, 'Tue, 24 Jul 2018', 'Mon, 23 Jul 2018', '10:00-12:00', 4, 1, NULL),
(28, 7, 57, 'Fri, 20 Jul 2018', 'Wed, 25 Jul 2018', '13:00-15:00', 5, 1, NULL),
(29, 2, 57, 'Wed, 25 Jul 2018', 'Wed, 25 Jul 2018', '08:00-10:00', 2, 1, NULL),
(30, 2, 57, 'Wed, 25 Jul 2018', 'Thu, 26 Jul 2018', '09:00-11:00', 7, 1, NULL),
(31, 2, 57, 'Mon, 23 Jul 2018', 'Thu, 26 Jul 2018', '14:00-16:00', 4, 1, NULL),
(32, 2, 57, 'Mon, 23 Jul 2018', 'Fri, 20 Jul 2018', '10:00-12:00', 6, 1, NULL),
(33, 2, 57, 'Mon, 23 Jul 2018', 'Mon, 23 Jul 2018', '10:00-12:00', 7, 0, NULL),
(34, 2, 57, 'Wed, 25 Jul 2018', 'Wed, 25 Jul 2018', '10:00-12:00', 6, 0, NULL),
(35, 7, 57, 'Mon, 23 Jul 2018', 'Fri, 27 Jul 2018', '13:00-15:00', 6, 0, NULL),
(36, 7, 57, 'Mon, 23 Jul 2018', 'Fri, 27 Jul 2018', '13:00-15:00', 5, 0, NULL),
(37, 11, 57, 'Thu, 26 Jul 2018', 'Sat, 28 Jul 2018', '13:00-15:00', 3, 0, NULL),
(38, 10, 57, 'Sat, 28 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 3, 0, NULL),
(39, 7, 57, 'Fri, 27 Jul 2018', 'Mon, 23 Jul 2018', '13:00-15:00', 3, 0, NULL),
(40, 11, 57, 'Thu, 26 Jul 2018', 'Mon, 23 Jul 2018', '10:00-12:00', 6, 0, NULL),
(41, 2, 57, 'Fri, 27 Jul 2018', 'Mon, 23 Jul 2018', '13:00-15:00', 3, 0, NULL),
(42, 7, 57, 'Mon, 23 Jul 2018', 'Thu, 26 Jul 2018', '10:00-12:00', 7, 0, NULL),
(43, 11, 57, 'Thu, 26 Jul 2018', 'Mon, 23 Jul 2018', '13:00-15:00', 5, 0, NULL),
(44, 2, 57, 'Fri, 27 Jul 2018', 'Mon, 23 Jul 2018', '13:00-15:00', 5, 0, NULL),
(45, 10, 57, 'Sat, 28 Jul 2018', 'Wed, 25 Jul 2018', '10:00-12:00', 7, 0, NULL),
(46, 7, 57, 'Fri, 27 Jul 2018', 'Tue, 24 Jul 2018', '09:00-11:00', 6, 0, NULL),
(47, 2, 57, 'Wed, 25 Jul 2018', 'Fri, 27 Jul 2018', '13:00-15:00', 6, 0, NULL),
(48, 2, 57, 'Fri, 27 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 5, 0, NULL),
(49, 2, 57, 'Mon, 30 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 7, 0, NULL),
(50, 2, 57, 'Wed, 25 Jul 2018', 'Mon, 30 Jul 2018', '13:00-15:00', 6, 1, NULL),
(51, 2, 57, 'Mon, 30 Jul 2018', 'Tue, 24 Jul 2018', '15:00-17:00', 6, 0, NULL),
(52, 2, 57, 'Mon, 30 Jul 2018', 'Mon, 30 Jul 2018', '13:00-15:00', 2, 0, NULL),
(53, 7, 57, 'Fri, 27 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 7, 0, NULL),
(54, 7, 57, 'Fri, 27 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 7, 0, NULL),
(55, 7, 57, 'Fri, 27 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 7, 0, NULL),
(56, 4, 57, 'Wed, 25 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 5, 0, NULL),
(57, 7, 57, 'Fri, 27 Jul 2018', 'Thu, 26 Jul 2018', '09:00-11:00', 2, 0, NULL),
(58, 11, 57, 'Thu, 26 Jul 2018', 'Sat, 28 Jul 2018', '13:00-15:00', 5, 0, NULL),
(59, 11, 57, 'Thu, 26 Jul 2018', 'Sat, 28 Jul 2018', '13:00-15:00', 5, 0, NULL),
(60, 7, 57, 'Fri, 27 Jul 2018', 'Mon, 30 Jul 2018', '16:00-17:00', 3, 0, NULL),
(61, 2, 57, 'Fri, 27 Jul 2018', 'Wed, 25 Jul 2018', '13:00-15:00', 6, 0, 'Bring laptop.'),
(62, 4, 57, 'Fri, 27 Jul 2018', 'Mon, 30 Jul 2018', '15:00-17:00', 8, 0, 'Bring Laptop.'),
(63, 4, 57, 'Fri, 27 Jul 2018', 'Sun, 29 Jul 2018', '10:00-12:00', 7, 0, 'Bring pen.'),
(64, 4, 57, 'Fri, 27 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 5, 0, 'Bring book.'),
(65, 4, 57, 'Fri, 27 Jul 2018', 'Sat, 28 Jul 2018', '15:00-16:00', 4, 0, 'dss'),
(66, 4, 57, 'Fri, 27 Jul 2018', 'Wed, 25 Jul 2018', '15:00-16:00', 4, 0, 'sdsd'),
(67, 4, 57, 'Fri, 27 Jul 2018', 'Tue, 24 Jul 2018', '15:00-16:00', 3, 0, 'gfvxcbvc'),
(68, 10, 57, 'Sat, 28 Jul 2018', 'Mon, 30 Jul 2018', '15:00-16:00', 3, 0, 'xxxx'),
(69, 4, 57, 'Fri, 27 Jul 2018', 'Mon, 30 Jul 2018', '15:00-17:00', 4, 0, ' cfff'),
(70, 12, 57, 'Sat, 28 Jul 2018', 'Mon, 30 Jul 2018', '13:00-15:00', 6, 0, 'ddd'),
(71, 2, 57, 'Wed, 25 Jul 2018', 'Mon, 30 Jul 2018', '15:00-17:00', 6, 0, NULL),
(72, 11, 57, 'Sat, 28 Jul 2018', 'Tue, 24 Jul 2018', '14:00-16:00', 7, 0, 'Bring Latop'),
(73, 4, 57, 'Wed, 25 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 3, 0, 'Bring food'),
(74, 2, 57, 'Mon, 30 Jul 2018', 'Mon, 30 Jul 2018', '09:00-11:00', 2, 0, NULL),
(75, 2, 57, 'Fri, 27 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 2, 0, NULL),
(76, 2, 57, 'Fri, 27 Jul 2018', 'Thu, 26 Jul 2018', '08:00-10:00', 6, 0, NULL),
(77, 2, 57, 'Fri, 27 Jul 2018', 'Mon, 30 Jul 2018', '13:00-15:00', 5, 0, NULL),
(78, 10, 57, 'Sat, 28 Jul 2018', 'Wed, 25 Jul 2018', '14:00-16:00', 6, 1, 'vvvv'),
(79, 10, 57, 'Sat, 28 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 5, 1, 'bbb'),
(80, 4, 57, 'Wed, 25 Jul 2018', 'Thu, 26 Jul 2018', '10:00-12:00', 7, 0, NULL),
(81, 10, 57, 'Sat, 28 Jul 2018', 'Wed, 25 Jul 2018', '14:00-16:00', 7, 1, 'sx'),
(82, 7, 57, 'Fri, 27 Jul 2018', 'Wed, 25 Jul 2018', '13:00-15:00', 5, 1, 'ggg'),
(83, 2, 57, 'Fri, 27 Jul 2018', 'Wed, 25 Jul 2018', '13:00-15:00', 6, 1, 'sd'),
(84, 13, 57, NULL, 'Sun, 29 Jul 2018', '10:00-12:00', 7, 1, 'ZXzx'),
(85, 11, 57, 'Sat, 28 Jul 2018', 'Tue, 24 Jul 2018', '15:00-16:00', 3, 0, 'bbb'),
(86, 15, 57, 'Tue, 24 Jul 2018', 'Wed, 25 Jul 2018', '16:00-17:00', 4, 0, 'bbb'),
(87, 16, 57, 'Wed, 25 Jul 2018', 'Wed, 25 Jul 2018', '14:00-16:00', 5, 1, 'bbb'),
(88, 16, 57, 'Wed, 25 Jul 2018', 'Fri, 27 Jul 2018', '13:00-15:00', 3, 1, 'kk'),
(89, 11, 57, 'Tue, 24 Jul 2018', 'Mon, 30 Jul 2018', '13:00-15:00', 6, 1, ''),
(90, 11, 57, 'Sat, 28 Jul 2018', 'Wed, 25 Jul 2018', '13:00-15:00', 6, 1, 'bbbb'),
(91, 15, 57, 'Sat, 28 Jul 2018', 'Mon, 30 Jul 2018', '13:00-15:00', 5, 1, 'hhh'),
(92, 2, 57, 'Mon, 30 Jul 2018', 'Mon, 30 Jul 2018', '13:00-15:00', 7, 0, NULL),
(93, 10, 57, 'Thu, 26 Jul 2018', 'Thu, 26 Jul 2018', '13:00-15:00', 9, 0, NULL),
(94, 10, 57, 'Sat, 28 Jul 2018', 'Thu, 26 Jul 2018', '10:00-12:00', 8, 1, 'TTT'),
(95, 13, 57, 'Sat, 28 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 3, 1, 'BBB'),
(96, 10, 57, 'Sat, 28 Jul 2018', 'Sat, 28 Jul 2018', '14:00-16:00', 7, 1, 'VVV'),
(97, 11, 57, 'Tue, 24 Jul 2018', 'Tue, 24 Jul 2018', '13:00-15:00', 5, 1, 'Bring laptop.'),
(98, 2, 57, 'Mon, 30 Jul 2018', 'Wed, 1 Aug 2018', '13:00-15:00', 6, 0, 'csdcd'),
(99, 4, 57, 'Mon, 30 Jul 2018', 'Tue, 31 Jul 2018', '13:00-15:00', 6, 0, 'xÃ£'),
(100, 2, 57, 'Fri, 3 Aug 2018', 'Wed, 1 Aug 2018', '13:00-15:00', 3, 0, 'cacsasc'),
(101, 4, 57, 'Mon, 30 Jul 2018', 'Tue, 31 Jul 2018', '13:00-15:00', 7, 0, 'scsdc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `results`
--

CREATE TABLE `results` (
  `result_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `results`
--

INSERT INTO `results` (`result_id`, `status`, `class_id`, `user_id`) VALUES
(1, 1, 2, 54),
(2, 1, 8, 54),
(3, 0, 12, 54),
(5, 0, 17, 4),
(6, 0, 17, 5),
(7, 0, 17, 6),
(8, 0, 17, 7),
(9, 0, 18, 8),
(10, 0, 18, 9),
(12, 0, 18, 11),
(13, 0, 18, 12),
(14, 0, 17, 8),
(15, 0, 18, 9),
(16, 0, 4, 54),
(17, 0, 4, 5),
(18, 0, 4, 6),
(19, 1, 4, 12),
(20, 0, 4, 19),
(21, 0, 4, 20),
(22, 0, 4, 7),
(23, 1, 7, 25),
(24, 1, 7, 26),
(25, 1, 7, 27),
(26, 1, 7, 28),
(27, 0, 7, 32),
(28, 1, 7, 33),
(29, 1, 7, 24);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `name`) VALUES
(1, 'Trainer'),
(2, 'Trainee'),
(3, 'Training Manager');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`room_id`, `name`, `capacity`, `status`) VALUES
(1, 'Training Room', 20, 0),
(2, '2A', 15, 0),
(3, '2B', 10, 1),
(4, '3A', 10, 0),
(5, '3B', 10, 0),
(6, '4A', 10, 1),
(7, '4B', 10, 1),
(8, '5A', 10, 1),
(9, '5B', 15, 1),
(10, 'English Lab', 5, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `major_id` int(11) DEFAULT NULL,
  `skill_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `skills`
--

INSERT INTO `skills` (`skill_id`, `name`, `major_id`, `skill_status`) VALUES
(1, 'Reading', 2, 1),
(2, 'HTML', 1, 1),
(3, 'Speaking', 2, 1),
(4, 'JSP Servlet', 1, 0),
(5, 'Node JS', 1, 1),
(6, 'CSS', 1, 0),
(7, 'SPRING', 1, 1),
(8, 'Database', 1, 0),
(9, 'JAVA', 1, 1),
(10, 'C++', 1, 0),
(11, 'Skype', 3, 1),
(12, 'Email', 3, 1),
(13, 'Communication Skill', 3, 1),
(14, 'Python', 1, 0),
(39, 'IOS', 1, 0),
(40, 'TOEIC', 2, 1),
(41, 'Listening', 0, 1),
(42, 'Writing', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `timetable`
--

CREATE TABLE `timetable` (
  `time_id` int(11) NOT NULL,
  `time` varchar(45) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `timetable`
--

INSERT INTO `timetable` (`time_id`, `time`, `duration`) VALUES
(1, '08:00-10:00', 2),
(2, '09:00-11:00', 2),
(3, '10:00-12:00', 2),
(4, '13:00-15:00', 2),
(5, '14:00-16:00', 2),
(6, '15:00-17:00', 2),
(7, '08:00-09:00', 1),
(8, '09:00-10:00', 1),
(9, '10:00-11:00', 1),
(10, '11:00-12:00', 1),
(11, '13:00-14:00', 1),
(12, '14:00-15:00', 1),
(13, '15:00-16:00', 2),
(14, '16:00-17:00', 2),
(15, '08:00-11:00', 3),
(16, '09:00-12:00', 3),
(17, '13:00-16:00', 3),
(18, '14:00-17:00', 3),
(19, '08:00-12:00', 4),
(20, '13:00-17:00', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `email` varchar(150) NOT NULL,
  `gender` int(11) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL,
  `notification_id` varchar(1000) NOT NULL,
  `image` varchar(45) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `fullname`, `date_of_birth`, `created_at`, `email`, `gender`, `address`, `phone`, `role_id`, `notification_id`, `image`, `status`) VALUES
(1, 'Matthew', '676081feffbeedf941bb5e57c5fcd094', 'Huynh Dang Hung', '1982-12-07 00:00:00', '2018-06-19 00:00:00', 'huynhdanghung196@gmail.com', 1, '1 Au Co, Da Nang', '01263758127', 2, '1', '1530501406335.jpg', 1),
(4, 'Daisy', 'e034fb6b66aacc1d48f445ddfb08da98', 'Cao Thi Anh Dao', '1996-08-19 22:13:25', '2018-12-24 00:00:00', 'anhdao@gmail.com ', 0, '30 Ly Thai To, Da Nang', '01263758127', 2, '1', '1530501406335.jpg', 1),
(5, 'Nodin', 'e034fb6b66aacc1d48f445ddfb08da98', 'Nguyen Ngoc Nam', '1993-09-13 22:28:47', '2018-12-24 00:00:00', 'nguyenngocnam0@gmail.com ', 1, '126 Ngo Si Lien', '01263758127', 2, '1', '1530501406335.jpg', 1),
(6, 'Kenton', 'e034fb6b66aacc1d48f445ddfb08da98', 'Nguyen Huu Vi', '1982-06-07 05:26:04', '2018-12-24 00:00:00', 'nguyenhuuvi@gmail.com', 1, '123 Ngu Hanh Son, Da Nang', '01263758127', 2, '1', '1530501406335.jpg', 1),
(7, 'Hetty', 'e034fb6b66aacc1d48f445ddfb08da98', 'Pham Thi Huong', '1987-03-09 15:38:15', '2018-12-24 00:00:00', 'phamthimaihuong@gmail.com ', 0, '123 Nguyen Luong Bang, Da Nang', '01263758127', 2, '1', '1530501406335.jpg', 1),
(8, 'Callie', 'e034fb6b66aacc1d48f445ddfb08da98', 'Nguyen Thi Tu', '1987-03-09 15:38:15', '2018-12-14 00:00:00', 'vovanloc@gmail.com', 0, '323 Lac Long Quan, Da Nang', '01263758127', 3, '1', '1530501406335.jpg', 1),
(9, 'Sunny', 'e034fb6b66aacc1d48f445ddfb08da98', 'Nguyen Thi Anh Duong', '1996-06-24 01:58:36', '2018-12-14 00:00:00', 'nguyenthianhduong@gmail.com', 0, '20 Ton Duc Thang', '01263758127', 3, '1', '1530501406335.jpg', 1),
(11, 'Henri', 'e034fb6b66aacc1d48f445ddfb08da98', 'Nguyen Van Anh', '2015-11-01 00:00:00', '2018-12-14 00:00:00', 'nguyenvantung@gmail.com', 0, '30 Ly Thai To, Da Nang', '01263758127', 1, '1', '1530501406335.jpg', 1),
(12, 'Johan', 'e034fb6b66aacc1d48f445ddfb08da98', 'Nguyen Van Bao', '1983-01-31 10:49:31', '2018-06-19 00:00:00', 'johan1996@gmail.com', 0, '323 Lac Long Quan, Da Nang', '01263758127', 2, '1', '1530501406335.jpg', 0),
(13, 'Allen', 'e034fb6b66aacc1d48f445ddfb08da98', 'Tran Van Loc', '2015-11-01 00:00:00', '2018-06-19 00:00:00', 'vanc1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 2, '1', '1530501406335.jpg', 1),
(14, 'Aden', 'e034fb6b66aacc1d48f445ddfb08da98', 'Ta Trung Anh', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'trunganh1996@gmail.com', 1, '1 Au Co, Da Nang', '01263758127', 2, '2', '1530501406335.jpg', 1),
(15, 'Sarah', 'e034fb6b66aacc1d48f445ddfb08da98', 'Sarah Smith', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'sarah@gmail.com', 0, '56 Nguyen Huu Tho, Da Nang', '01263758127', 2, '2', '1530501406335.jpg', 1),
(16, 'Tom', 'e034fb6b66aacc1d48f445ddfb08da98', 'Do Trong Nam', '1982-06-07 05:26:04', '2018-02-12 00:00:00', 'nam1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 2, '2', '1530501406335.jpg', 1),
(17, 'Jake', 'e034fb6b66aacc1d48f445ddfb08da98', 'Ha Xuan Sang', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'sang97@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 2, '2', '1530501406335.jpg', 1),
(18, 'Callie', 'e034fb6b66aacc1d48f445ddfb08da98', 'Nguyen Thi Tu', '1982-06-07 05:26:04', '2018-02-12 00:00:00', 'nguyentu996@gmail.com', 0, '323 Lac Long Quan, Da Nang', '01263758127', 2, '2', '1530501406335.jpg', 1),
(19, 'Charlie', 'e034fb6b66aacc1d48f445ddfb08da98', 'Huynh Van Hung', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'huynhhung1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 2, '2', '1530501406335.jpg', 1),
(20, 'Mia', 'e034fb6b66aacc1d48f445ddfb08da98', 'Nguyen Vi Anh', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'huuvi@gmail.com', 0, '56 Nguyen Huu Tho, Da Nang', '01263758127', 2, '2', '1530501406335.jpg', 1),
(21, 'Barack', 'e034fb6b66aacc1d48f445ddfb08da98', 'Ha Quang Anh', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'quocanh1996@gmail.com', 0, '1 Au Co, Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(22, 'Obama', 'e034fb6b66aacc1d48f445ddfb08da98', 'Ho Quang Hieu', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'hoquanghieu1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(23, 'Donald', 'e034fb6b66aacc1d48f445ddfb08da98', 'Kim Van Tuyen', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'vantuyen1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(24, 'Trump', 'e034fb6b66aacc1d48f445ddfb08da98', 'Ta Quang Hoang', '1982-06-07 05:26:04', '2018-02-12 00:00:00', 'quanghoang1996@gmail.com', 0, '56 Nguyen Huu Tho, Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(25, 'NguyenLy', 'e034fb6b66aacc1d48f445ddfb08da98', 'Tran Ngoc Bao Long', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'baolong996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(26, 'LyNguyen', 'e034fb6b66aacc1d48f445ddfb08da98', 'Ho Ngoc Nam', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'nam1996@gmail.com', 0, '1 Au Co, Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(27, 'NgocAnh', 'e034fb6b66aacc1d48f445ddfb08da98', 'Bui Thi Ngoc Phuc', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'ngocphuc1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(28, 'ngocanh', 'e034fb6b66aacc1d48f445ddfb08da98', 'Huynh Thi Trang', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'huynhtrang1996@gmail.com', 0, '56 Nguyen Huu Tho, Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(29, 'Anhtho', 'e034fb6b66aacc1d48f445ddfb08da98', 'Huynh Thi Dieu Tram', '1982-06-07 05:26:04', '2018-02-12 00:00:00', 'dieutram1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(30, 'AnhTho', 'e034fb6b66aacc1d48f445ddfb08da98', 'Ho Khac Nam Phuc', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'phucnam1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(31, 'HoangLan', 'e034fb6b66aacc1d48f445ddfb08da98', 'La Truc Bang Di', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'bangdi1996@gmail.com', 0, '1 Au Co, Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(32, 'LanKhue', 'e034fb6b66aacc1d48f445ddfb08da98', 'Tran Quoc Bao', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'quocbao1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(33, 'CamLy', 'e034fb6b66aacc1d48f445ddfb08da98', 'Nguyen Van Hong An', '2015-11-01 00:00:00', '2018-02-12 00:00:00', 'hongan1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 1, '2', '1530501406335.jpg', 1),
(34, 'SunnyHaLinh', 'e034fb6b66aacc1d48f445ddfb08da98', 'Hoang Dai', '1981-12-06 00:00:00', '2018-02-12 00:00:00', 'hoang1996@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 1, '2', '1530781504156.jpg', 1),
(37, 'TomJen', 'e034fb6b66aacc1d48f445ddfb08da98', 'Tran Trong Nhan', '2014-11-01 00:00:00', '2017-12-06 00:00:00', 'charliep@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 2, '2', '1530501406335.jpg', 0),
(38, 'Jackson', 'e034fb6b66aacc1d48f445ddfb08da98', 'Peter Nguyen', '2010-11-01 00:00:00', '2017-12-06 00:00:00', 'charlie@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 2, '2', '1532858025002.jpg', 0),
(53, 'Luke', 'a43c27c2babefd68df8a694900f30a1c', 'Luke Vo', '2009-11-01 00:00:00', '2017-12-06 00:00:00', 'admin@gmail.com', 1, '213 Ngu Hanh Son', '01263758127', 3, '2', '1531468150146.jpg', 1),
(54, 'Peter', 'f30ba25797b02353733c95d552d695c4', 'Peter Nguyen', '1966-11-01 00:00:00', '2017-12-07 00:00:00', 'trainee@gmail.com', 0, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758123', 2, '2', '1532793568064.jpg', 1),
(55, 'Helena', 'a43c27c2babefd68df8a694900f30a1c', 'asdas', '2007-11-01 00:00:00', '2017-12-07 00:00:00', 'trainer@gmail.com', 1, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '01263758127', 1, '2', '1531458261209.jpg', 1),
(56, 'Johan', '568c1111908a64cfedeb86a40508187', 'Johan Jark', '1982-06-07 05:26:04', '1982-06-07 05:26:04', 'admin1@gmail.com', 1, '60 Ngo Sy Lien - Lien Chieu - Da Nang', '0987456321', 1, '1', '1530782293359.JPG', 1),
(57, 'Trainer', 'a272bd43cfc84ef6df7fae3bd867336b', 'NamNguyen', '2017-12-07 00:00:00', '2017-12-07 00:00:00', 'trainer1@gmail.com', 1, 'Da Nang', '01234556547', 1, '2', 'default.jpg', 1),
(58, 'asdasd', 'a43c27c2babefd68df8a694900f30a1c', 'asdasd', '1999-12-07 00:00:00', '2017-12-07 00:00:00', 'oliv213123er@gmail.com', 1, 'asdasd', '01263754854', 1, '', 'default.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `waiting`
--

CREATE TABLE `waiting` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `waiting`
--

INSERT INTO `waiting` (`id`, `class_id`, `user_id`) VALUES
(8, 5, 4),
(9, 5, 5),
(10, 5, 6),
(11, 5, 4),
(12, 5, 23),
(13, 5, 12),
(14, 22, 8),
(15, 22, 9),
(16, 22, 12),
(17, 3, 4),
(18, 7, 4),
(19, 8, 4),
(20, 22, 4),
(21, 22, 5),
(22, 15, 4),
(25, 15, 4),
(26, 15, 5),
(27, 15, 6),
(28, 15, 7),
(29, 15, 16),
(30, 15, 9),
(31, 9, 4),
(32, 9, 4),
(33, 9, 4),
(34, 9, 4),
(36, 9, 4),
(51, 22, 54);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ability`
--
ALTER TABLE `ability`
  ADD PRIMARY KEY (`ability_id`),
  ADD KEY `fk_ability_1_idx` (`user_id`),
  ADD KEY `fk_ability_2_idx` (`skill_id`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `fk_classes_1_idx` (`course_id`),
  ADD KEY `fk_classes_2_idx` (`room_id`),
  ADD KEY `fk_classes_3_idx` (`trainer_id`);

--
-- Chỉ mục cho bảng `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `fk_courses_1_idx` (`major_id`);

--
-- Chỉ mục cho bảng `learning`
--
ALTER TABLE `learning`
  ADD PRIMARY KEY (`learning_id`),
  ADD KEY `fk_learning_1_idx` (`user_id`),
  ADD KEY `fk_learning_2_idx` (`class_id`);

--
-- Chỉ mục cho bảng `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`major_id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `fk_messages_1_idx` (`user_id`),
  ADD KEY `fk_messages_2_idx` (`noti_id`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notification_1_idx` (`request_id`);

--
-- Chỉ mục cho bảng `requestdayoff`
--
ALTER TABLE `requestdayoff`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_requestDayOff_1_idx` (`class_id`),
  ADD KEY `fk_requestDayOff_2_idx` (`room_id`),
  ADD KEY `fk_requestDayOff_3_idx` (`trainer_id`);

--
-- Chỉ mục cho bảng `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `fk_results_1_idx` (`class_id`),
  ADD KEY `fk_results_2_idx` (`user_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Chỉ mục cho bảng `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- Chỉ mục cho bảng `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`time_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_users_1_idx` (`role_id`);

--
-- Chỉ mục cho bảng `waiting`
--
ALTER TABLE `waiting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_new_table_1_idx` (`class_id`),
  ADD KEY `fk_new_table_2_idx` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `ability`
--
ALTER TABLE `ability`
  MODIFY `ability_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT cho bảng `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT cho bảng `learning`
--
ALTER TABLE `learning`
  MODIFY `learning_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT cho bảng `majors`
--
ALTER TABLE `majors`
  MODIFY `major_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=448;
--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;
--
-- AUTO_INCREMENT cho bảng `requestdayoff`
--
ALTER TABLE `requestdayoff`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT cho bảng `results`
--
ALTER TABLE `results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT cho bảng `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT cho bảng `timetable`
--
ALTER TABLE `timetable`
  MODIFY `time_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT cho bảng `waiting`
--
ALTER TABLE `waiting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ability`
--
ALTER TABLE `ability`
  ADD CONSTRAINT `fk_ability_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ability_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `fk_classes_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classes_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classes_3` FOREIGN KEY (`trainer_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_courses_1` FOREIGN KEY (`major_id`) REFERENCES `majors` (`major_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `learning`
--
ALTER TABLE `learning`
  ADD CONSTRAINT `fk_learning_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_learning_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_messages_2` FOREIGN KEY (`noti_id`) REFERENCES `notification` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_notification_1` FOREIGN KEY (`request_id`) REFERENCES `requestdayoff` (`request_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `requestdayoff`
--
ALTER TABLE `requestdayoff`
  ADD CONSTRAINT `fk_requestDayOff_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requestDayOff_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requestDayOff_3` FOREIGN KEY (`trainer_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `fk_results_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_results_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `waiting`
--
ALTER TABLE `waiting`
  ADD CONSTRAINT `fk_new_table_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_new_table_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
