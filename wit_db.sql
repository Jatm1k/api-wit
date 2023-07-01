-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 13 2023 г., 07:26
-- Версия сервера: 8.0.29
-- Версия PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wit_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `age_categories`
--

CREATE TABLE `age_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `age_categories`
--

INSERT INTO `age_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Школьники', '2023-05-10 02:46:36', '2023-05-10 02:46:36'),
(2, 'Студенты', '2023-05-10 02:46:49', '2023-05-10 02:46:49'),
(3, 'Взрослые', '2023-05-10 02:46:54', '2023-05-10 02:46:54');

-- --------------------------------------------------------

--
-- Структура таблицы `courses`
--

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction_id` bigint UNSIGNED DEFAULT NULL,
  `author_id` bigint UNSIGNED DEFAULT NULL,
  `age_category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `direction_id`, `author_id`, `age_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Учим React за 10 минут', 'Я Junior-FullStack-Senior+Backend-Developer и я покажу вам как выучить React уделяя этому всего 10 минут в день!', 2, 2, 2, '2023-05-10 03:13:23', '2023-05-10 03:18:08'),
(2, 'Переходим с лучшего языка(python) на самый худший(html)', 'Почему я выбираю html? Сам не знаю, но это мой выбор и вы не можете его осуждать', 1, 1, 1, '2023-05-10 03:25:58', '2023-05-10 03:25:58');

-- --------------------------------------------------------

--
-- Структура таблицы `course_user`
--

CREATE TABLE `course_user` (
  `id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `course_user`
--

INSERT INTO `course_user` (`id`, `course_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 1, '2023-05-11 02:27:42', '2023-05-11 02:27:42'),
(3, 1, 2, '2023-05-11 02:35:52', '2023-05-11 02:35:52'),
(4, 2, 2, '2023-05-11 02:36:02', '2023-05-11 02:36:02');

-- --------------------------------------------------------

--
-- Структура таблицы `directions`
--

CREATE TABLE `directions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `directions`
--

INSERT INTO `directions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Программирование', '2023-05-10 02:27:14', '2023-05-10 02:27:14'),
(2, 'Web-дизайн', '2023-05-10 02:27:26', '2023-05-10 02:28:06');

-- --------------------------------------------------------

--
-- Структура таблицы `exercises`
--

CREATE TABLE `exercises` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_id` bigint UNSIGNED NOT NULL,
  `exercise_type_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exercises`
--

INSERT INTO `exercises` (`id`, `title`, `text`, `video`, `level_id`, `exercise_type_id`, `created_at`, `updated_at`) VALUES
(1, 'Реакт это - ...', 'Тут должно быть определение реакта', NULL, 1, 1, '2023-05-11 20:03:09', '2023-05-11 20:03:09'),
(2, 'Ну все пишем сайт на реакте', 'Удачи', NULL, 1, 2, '2023-05-11 20:04:29', '2023-05-11 20:04:29'),
(3, 'Тест', 'текст', NULL, 1, 1, '2023-05-11 21:08:37', '2023-05-11 21:08:37'),
(4, 'Тест', 'текст', NULL, 1, 1, '2023-05-11 21:08:59', '2023-05-11 21:08:59'),
(5, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 03:51:30', '2023-05-12 03:51:30'),
(6, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 03:52:21', '2023-05-12 03:52:21'),
(7, 'Тест', 'текст', 'http://wit/storage/uploads/videos/1683890854_yourdream.mp4', 1, 1, '2023-05-12 04:27:34', '2023-05-12 04:27:34'),
(8, 'Тест2', 'Текст', 'http://wit/storage/uploads/videos/1683891842_moscow-russia-neon-women-night-hd-wallpaper-preview.jpg', 1, 1, '2023-05-12 04:29:55', '2023-05-12 04:44:02'),
(9, 'Тест', 'текст', 'http://wit/videos/hCLj3W9ob55PiOdY0Fa3VUj9Y0rKX7MlSYgKjrOj.mp4', 1, 1, '2023-05-12 04:51:55', '2023-05-12 04:51:55'),
(10, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 23:10:10', '2023-05-12 23:10:10'),
(11, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 23:11:42', '2023-05-12 23:11:42'),
(12, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 23:12:20', '2023-05-12 23:12:20'),
(13, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 23:12:45', '2023-05-12 23:12:45'),
(14, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 23:13:37', '2023-05-12 23:13:37'),
(15, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 23:18:48', '2023-05-12 23:18:48'),
(16, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 23:20:39', '2023-05-12 23:20:39'),
(17, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 23:25:02', '2023-05-12 23:25:02'),
(18, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 23:26:27', '2023-05-12 23:26:27'),
(19, 'Тест', 'текст', NULL, 1, 1, '2023-05-12 23:35:42', '2023-05-12 23:35:42');

-- --------------------------------------------------------

--
-- Структура таблицы `exercise_answers`
--

CREATE TABLE `exercise_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `exercise_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exercise_answers`
--

INSERT INTO `exercise_answers` (`id`, `exercise_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 2, '2023-05-13 01:16:38', '2023-05-13 01:16:38');

-- --------------------------------------------------------

--
-- Структура таблицы `exercise_answer_files`
--

CREATE TABLE `exercise_answer_files` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exercise_answer_id` bigint UNSIGNED NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exercise_answer_files`
--

INSERT INTO `exercise_answer_files` (`id`, `name`, `exercise_answer_id`, `link`, `created_at`, `updated_at`) VALUES
(6, 'button_7.png', 2, 'http://wit/storage/uploads/answers/1683951398_button_7.png', '2023-05-13 01:16:38', '2023-05-13 01:16:38');

-- --------------------------------------------------------

--
-- Структура таблицы `exercise_files`
--

CREATE TABLE `exercise_files` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exercise_id` bigint UNSIGNED NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exercise_files`
--

INSERT INTO `exercise_files` (`id`, `name`, `exercise_id`, `link`, `created_at`, `updated_at`) VALUES
(7, 'Курсак.docx', 10, 'http://wit/storage/uploads/files/1683943810_Курсак.docx', '2023-05-12 23:10:10', '2023-05-12 23:10:10'),
(8, 'Курсак.docx', 11, 'http://withttp://wit/storage/public/uploads/files/1683943902_Курсак.docx', '2023-05-12 23:11:42', '2023-05-12 23:11:42'),
(9, 'Курсак.docx', 12, 'http://wit/storage/public/uploads/files/1683943940_Курсак.docx', '2023-05-12 23:12:20', '2023-05-12 23:12:20'),
(10, 'image_5.png', 13, 'http://wit/storage/public/uploads/files/1683943965_image_5.png', '2023-05-12 23:12:45', '2023-05-12 23:12:45'),
(11, 'image_5.png', 14, 'http://wit/storage/uploads/files/1683944017_image_5.png', '2023-05-12 23:13:37', '2023-05-12 23:13:37'),
(12, 'image_5.png', 15, 'http://wit/storage/uploads/files/1683944328_image_5.png', '2023-05-12 23:18:48', '2023-05-12 23:18:48');

-- --------------------------------------------------------

--
-- Структура таблицы `exercise_types`
--

CREATE TABLE `exercise_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exercise_types`
--

INSERT INTO `exercise_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Теория', '2023-05-11 05:40:34', '2023-05-11 05:40:34'),
(2, 'Практика', '2023-05-11 05:40:40', '2023-05-11 05:40:40');

-- --------------------------------------------------------

--
-- Структура таблицы `levels`
--

CREATE TABLE `levels` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `levels`
--

INSERT INTO `levels` (`id`, `name`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 'Что такое реакт', 1, '2023-05-11 03:14:33', '2023-05-11 05:19:51'),
(2, 'Реакт для жунов', 1, '2023-05-11 05:01:50', '2023-05-11 05:01:50');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_05_05_020054_create_roles_table', 1),
(4, '2023_05_05_020234_add_role_id_field_to_users_table', 1),
(5, '2023_05_05_020845_create_courses_table', 2),
(6, '2023_05_05_022018_create_directions_table', 3),
(7, '2023_05_05_022117_create_age_categories_table', 3),
(8, '2023_05_05_022207_add_fields_to_courses_table', 3),
(9, '2023_05_05_022550_create_levels_table', 4),
(10, '2023_05_05_022833_create_exercise_types_table', 5),
(11, '2023_05_05_022921_create_exercises_table', 6),
(12, '2023_05_05_023242_create_exercise_files_table', 7),
(13, '2023_05_05_023750_create_exercise_videos_table', 8),
(14, '2023_05_05_024000_create_exercise_answers_table', 9),
(15, '2023_05_05_024108_create_exercise_answer_files_table', 10),
(16, '2023_05_05_032157_create_course_user_table', 11),
(18, '2023_05_12_110251_add_video_field_to_exercises_table', 12),
(19, '2023_05_12_110842_drop_exercise_videos_table', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User\\User', 1, 'auth_token', '29a9422068aa20bc2e6b6c97ae81b339f97ee292759dc2f4a854504a7914a0b3', '[\"*\"]', NULL, NULL, '2023-05-05 01:33:20', '2023-05-05 01:33:20'),
(2, 'App\\Models\\User\\User', 1, 'auth_token', '15dc7407a628728b561db7b58b3c94334d35ffe18bc039e77e0f87c2d54bf375', '[\"*\"]', NULL, NULL, '2023-05-05 01:33:44', '2023-05-05 01:33:44'),
(3, 'App\\Models\\User\\User', 1, 'auth_token', 'c9789cc4ce55fb96f69bdceff1137a2b6f4bdcb690f6c74c45cda93fc380d4de', '[\"*\"]', '2023-05-10 02:24:30', NULL, '2023-05-05 01:34:07', '2023-05-10 02:24:30'),
(4, 'App\\Models\\User\\User', 2, 'auth_token', 'dcb21f250a7fc49f8e2c125de500b74c65a5c152f5576437bb0796b8db2628e0', '[\"*\"]', '2023-05-10 02:47:03', NULL, '2023-05-10 02:25:38', '2023-05-10 02:47:03'),
(5, 'App\\Models\\User\\User', 2, 'auth_token', '8f0ea51e696dbb03960c1c167066c5debbed83b46a849b8fd88bd83ca7b7d6b5', '[\"*\"]', '2023-05-10 04:55:53', NULL, '2023-05-10 04:55:41', '2023-05-10 04:55:53'),
(6, 'App\\Models\\User\\User', 1, 'auth_token', '3f60c80c2afe52176a2e96bd619b9674c3d1b4ed9c8f5d51428dad5a2402ba14', '[\"*\"]', '2023-05-10 04:58:12', NULL, '2023-05-10 04:56:17', '2023-05-10 04:58:12'),
(7, 'App\\Models\\User\\User', 2, 'auth_token', 'c84dcba837f6ae8b360cd901f10dd21127a5b9061b5620f24a4d70cf41db9ddc', '[\"*\"]', '2023-05-10 04:59:14', NULL, '2023-05-10 04:58:24', '2023-05-10 04:59:14'),
(8, 'App\\Models\\User\\User', 1, 'auth_token', 'ca45ae326b6543000509c033720936cca16e608f99ae964ded283f9f4c2ff26b', '[\"*\"]', '2023-05-12 22:44:37', NULL, '2023-05-10 04:59:23', '2023-05-12 22:44:37'),
(9, 'App\\Models\\User\\User', 1, 'auth_token', 'ce557ae0988e713f3a794b1be89f3c725edcbf8ae456f10947b0babb94025d0a', '[\"*\"]', '2023-05-11 02:20:51', NULL, '2023-05-11 02:20:44', '2023-05-11 02:20:51'),
(10, 'App\\Models\\User\\User', 1, 'auth_token', 'fb5cbc1c4bd0a019624f4526e20ae2d8dcf164cd299b3bdb7b349571fb6300e8', '[\"*\"]', '2023-05-11 02:21:26', NULL, '2023-05-11 02:21:20', '2023-05-11 02:21:26'),
(11, 'App\\Models\\User\\User', 3, 'auth_token', '77dfe7eaade47a4143a6a9841427806b0e788300c41370e6dfc2750558b56bba', '[\"*\"]', '2023-05-11 05:39:30', NULL, '2023-05-11 02:21:51', '2023-05-11 05:39:30'),
(12, 'App\\Models\\User\\User', 2, 'auth_token', 'ecbbbfe3432566f4d2216c03ff6111f13ee5558b40bd32fa59b5bb3639638a4b', '[\"*\"]', '2023-05-12 04:51:55', NULL, '2023-05-11 05:40:03', '2023-05-12 04:51:55'),
(13, 'App\\Models\\User\\User', 2, 'auth_token', 'd6a25e44adff1a4981a0f09ec05f8968b9453b3172628b8b5c880601f2e3387d', '[\"*\"]', '2023-05-13 01:18:55', NULL, '2023-05-12 22:44:59', '2023-05-13 01:18:55');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Студент', '2023-05-05 01:12:20', '2023-05-05 01:12:20'),
(2, 'Преподаватель', '2023-05-05 01:24:45', '2023-05-05 01:24:45'),
(3, 'Администратор', '2023-05-05 01:24:51', '2023-05-05 01:24:51');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `role_id`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Иван', 'Иванов', 'ivan@mail.ru', 1, '$2y$10$NX/NntCGadF/r4It40K6MuInakaqIVlUgpxh/TAEWr1H5yc0t6MTq', NULL, '2023-05-05 01:23:56', '2023-05-05 01:23:56'),
(2, 'Админ', 'Админов', 'admin@mail.ru', 3, '$2y$10$G24wu/snUozH2Z4Xj1shs.q98zk6fybJw4tr.cY2aAeVHO5ohpAtq', NULL, '2023-05-10 02:25:34', '2023-05-10 02:25:34'),
(3, 'Препод', 'Преподов', 'teach@mail.ru', 2, '$2y$10$jE.fPg2wLg8rqSdPMgGxCePOqHVpeIO3LK3We9tA1a2uZw7OsACMa', NULL, '2023-05-11 02:21:16', '2023-05-11 02:21:16');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `age_categories`
--
ALTER TABLE `age_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `age_categories_name_unique` (`name`);

--
-- Индексы таблицы `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_author_id_foreign` (`author_id`),
  ADD KEY `courses_direction_id_foreign` (`direction_id`),
  ADD KEY `courses_age_category_id_foreign` (`age_category_id`);

--
-- Индексы таблицы `course_user`
--
ALTER TABLE `course_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_user_course_id_foreign` (`course_id`),
  ADD KEY `course_user_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `directions`
--
ALTER TABLE `directions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `directions_name_unique` (`name`);

--
-- Индексы таблицы `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercises_level_id_foreign` (`level_id`),
  ADD KEY `exercises_exercise_type_id_foreign` (`exercise_type_id`);

--
-- Индексы таблицы `exercise_answers`
--
ALTER TABLE `exercise_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercise_answers_exercise_id_foreign` (`exercise_id`),
  ADD KEY `exercise_answers_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `exercise_answer_files`
--
ALTER TABLE `exercise_answer_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercise_answer_files_exercise_answer_id_foreign` (`exercise_answer_id`);

--
-- Индексы таблицы `exercise_files`
--
ALTER TABLE `exercise_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercise_files_exercise_id_foreign` (`exercise_id`);

--
-- Индексы таблицы `exercise_types`
--
ALTER TABLE `exercise_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exercise_types_name_unique` (`name`);

--
-- Индексы таблицы `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `levels_course_id_foreign` (`course_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `age_categories`
--
ALTER TABLE `age_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `course_user`
--
ALTER TABLE `course_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `directions`
--
ALTER TABLE `directions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `exercise_answers`
--
ALTER TABLE `exercise_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `exercise_answer_files`
--
ALTER TABLE `exercise_answer_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `exercise_files`
--
ALTER TABLE `exercise_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `exercise_types`
--
ALTER TABLE `exercise_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_age_category_id_foreign` FOREIGN KEY (`age_category_id`) REFERENCES `age_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `courses_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `courses_direction_id_foreign` FOREIGN KEY (`direction_id`) REFERENCES `directions` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `course_user`
--
ALTER TABLE `course_user`
  ADD CONSTRAINT `course_user_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercises_exercise_type_id_foreign` FOREIGN KEY (`exercise_type_id`) REFERENCES `exercise_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `exercises_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `exercise_answers`
--
ALTER TABLE `exercise_answers`
  ADD CONSTRAINT `exercise_answers_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exercise_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `exercise_answer_files`
--
ALTER TABLE `exercise_answer_files`
  ADD CONSTRAINT `exercise_answer_files_exercise_answer_id_foreign` FOREIGN KEY (`exercise_answer_id`) REFERENCES `exercise_answers` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `exercise_files`
--
ALTER TABLE `exercise_files`
  ADD CONSTRAINT `exercise_files_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `levels_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
