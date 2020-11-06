-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Час створення: Лис 06 2020 р., 19:14
-- Версія сервера: 8.0.22-0ubuntu0.20.04.2
-- Версія PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `bdetect`
--

-- --------------------------------------------------------

--
-- Структура таблиці `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '2020-11-05 08:16:54', '2020-11-05 08:16:54');

-- --------------------------------------------------------

--
-- Структура таблиці `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int UNSIGNED DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
(1, 'Broker', 'Detect', 'admin', 'admin@broker.local', '$2y$10$7PGHRJkkwwasaKNwNh8N0.UxM82aEhS2TD/XbACrqA/KFVnTm6hRi', NULL, '$2y$10$C.g6kynB3CJakG4N7C/XSOTyCyMJx.YN4KuO4eN6YfxJpIC4gl6ee', NULL, '', 1, 2, NULL, '2020-11-05 08:16:54', '2020-11-05 08:02:30', '2020-11-05 08:16:54', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int UNSIGNED NOT NULL,
  `user_group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', '2020-11-05 08:02:30', '2020-11-05 08:02:30', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `backend_user_preferences`
--

INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 1, 'backend', 'backend', 'preferences', '{\"locale\":\"ru\",\"fallback_locale\":\"en\",\"timezone\":\"Europe\\/Kiev\",\"editor_font_size\":\"12\",\"editor_word_wrap\":\"fluid\",\"editor_code_folding\":\"manual\",\"editor_tab_size\":\"4\",\"editor_theme\":\"twilight\",\"editor_show_invisibles\":\"0\",\"editor_highlight_active_line\":\"1\",\"editor_use_hard_tabs\":\"0\",\"editor_show_gutter\":\"1\",\"editor_auto_closing\":\"0\",\"editor_autocompletion\":\"manual\",\"editor_enable_snippets\":\"0\",\"editor_display_indent_guides\":\"0\",\"editor_show_print_margin\":\"0\",\"user_id\":1}');

-- --------------------------------------------------------

--
-- Структура таблиці `backend_user_roles`
--

CREATE TABLE `backend_user_roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `backend_user_roles`
--

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2020-11-05 08:02:30', '2020-11-05 08:02:30'),
(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2020-11-05 08:02:30', '2020-11-05 08:02:30');

-- --------------------------------------------------------

--
-- Структура таблиці `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int UNSIGNED NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `cms_theme_templates`
--

CREATE TABLE `cms_theme_templates` (
  `id` int UNSIGNED NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int UNSIGNED NOT NULL,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `martin_forms_records`
--

CREATE TABLE `martin_forms_records` (
  `id` int UNSIGNED NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(Empty)',
  `form_data` text COLLATE utf8mb4_unicode_ci,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
(2, '2013_10_01_000002_Db_System_Files', 1),
(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
(5, '2013_10_01_000005_Db_System_Settings', 1),
(6, '2013_10_01_000006_Db_System_Parameters', 1),
(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
(10, '2014_10_01_000010_Db_Jobs', 1),
(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
(13, '2014_10_01_000013_Db_System_Sessions', 1),
(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
(16, '2015_10_01_000016_Db_Cache', 1),
(17, '2015_10_01_000017_Db_System_Revisions', 1),
(18, '2015_10_01_000018_Db_FailedJobs', 1),
(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
(25, '2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field', 1),
(26, '2013_10_01_000001_Db_Backend_Users', 2),
(27, '2013_10_01_000002_Db_Backend_User_Groups', 2),
(28, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
(29, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
(30, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
(31, '2014_10_01_000006_Db_Backend_Access_Log', 2),
(32, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
(33, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
(34, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
(35, '2017_10_01_000010_Db_Backend_User_Roles', 2),
(36, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
(37, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
(38, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
(39, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
(40, '2018_11_01_000001_Db_Cms_Theme_Templates', 3);

-- --------------------------------------------------------

--
-- Структура таблиці `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int UNSIGNED NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"string\" of value \"head\" (\"name\" expected) in \"/home/eugene/projects/broker-detect/themes/bdetect/layouts/default.htm\" at line 4. in /home/eugene/projects/broker-detect/vendor/twig/twig/src/TokenStream.php:76\nStack trace:\n#0 /home/eugene/projects/broker-detect/modules/cms/twig/PlaceholderTokenParser.php(33): Twig\\TokenStream->expect()\n#1 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(185): Cms\\Twig\\PlaceholderTokenParser->parse()\n#2 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(98): Twig\\Parser->subparse()\n#3 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(563): Twig\\Parser->parse()\n#4 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(595): Twig\\Environment->parse()\n#5 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(408): Twig\\Environment->compileSource()\n#6 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(381): Twig\\Environment->loadClass()\n#7 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(434): Twig\\Environment->loadTemplate()\n#8 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(225): Cms\\Classes\\Controller->runPage()\n#9 /home/eugene/projects/broker-detect/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#10 [internal function]: Cms\\Classes\\CmsController->run()\n#11 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array()\n#12 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#13 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#14 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#15 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#16 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#17 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#19 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#21 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#23 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#25 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#27 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#29 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#30 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#31 /home/eugene/projects/broker-detect/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#32 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch()\n#33 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#34 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#35 /home/eugene/projects/broker-detect/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#36 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#37 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#39 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#40 /home/eugene/projects/broker-detect/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#41 /home/eugene/projects/broker-detect/server.php(17): require_once(\'/home/eugene/pr...\')\n#42 {main}', NULL, '2020-11-05 10:15:00', '2020-11-05 10:15:00'),
(2, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"string\" of value \"head\" (\"name\" expected) in \"/home/eugene/projects/broker-detect/themes/bdetect/layouts/default.htm\" at line 4. in /home/eugene/projects/broker-detect/vendor/twig/twig/src/TokenStream.php:76\nStack trace:\n#0 /home/eugene/projects/broker-detect/modules/cms/twig/PlaceholderTokenParser.php(33): Twig\\TokenStream->expect()\n#1 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(185): Cms\\Twig\\PlaceholderTokenParser->parse()\n#2 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(98): Twig\\Parser->subparse()\n#3 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(563): Twig\\Parser->parse()\n#4 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(595): Twig\\Environment->parse()\n#5 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(408): Twig\\Environment->compileSource()\n#6 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(381): Twig\\Environment->loadClass()\n#7 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(434): Twig\\Environment->loadTemplate()\n#8 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(225): Cms\\Classes\\Controller->runPage()\n#9 /home/eugene/projects/broker-detect/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#10 [internal function]: Cms\\Classes\\CmsController->run()\n#11 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array()\n#12 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#13 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#14 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#15 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#16 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#17 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#19 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#21 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#23 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#25 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#27 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#29 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#30 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#31 /home/eugene/projects/broker-detect/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#32 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch()\n#33 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#34 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#35 /home/eugene/projects/broker-detect/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#36 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#37 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#39 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#40 /home/eugene/projects/broker-detect/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#41 /home/eugene/projects/broker-detect/server.php(17): require_once(\'/home/eugene/pr...\')\n#42 {main}', NULL, '2020-11-05 10:17:05', '2020-11-05 10:17:05'),
(3, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"string\" of value \"head\" (\"name\" expected) in \"/home/eugene/projects/broker-detect/themes/bdetect/layouts/default.htm\" at line 4. in /home/eugene/projects/broker-detect/vendor/twig/twig/src/TokenStream.php:76\nStack trace:\n#0 /home/eugene/projects/broker-detect/modules/cms/twig/PlaceholderTokenParser.php(33): Twig\\TokenStream->expect()\n#1 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(185): Cms\\Twig\\PlaceholderTokenParser->parse()\n#2 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(98): Twig\\Parser->subparse()\n#3 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(563): Twig\\Parser->parse()\n#4 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(595): Twig\\Environment->parse()\n#5 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(408): Twig\\Environment->compileSource()\n#6 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(381): Twig\\Environment->loadClass()\n#7 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(434): Twig\\Environment->loadTemplate()\n#8 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(225): Cms\\Classes\\Controller->runPage()\n#9 /home/eugene/projects/broker-detect/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#10 [internal function]: Cms\\Classes\\CmsController->run()\n#11 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array()\n#12 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#13 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#14 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#15 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#16 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#17 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#19 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#21 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#23 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#25 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#27 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#29 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#30 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#31 /home/eugene/projects/broker-detect/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#32 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch()\n#33 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#34 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#35 /home/eugene/projects/broker-detect/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#36 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#37 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#39 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#40 /home/eugene/projects/broker-detect/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#41 /home/eugene/projects/broker-detect/server.php(17): require_once(\'/home/eugene/pr...\')\n#42 {main}', NULL, '2020-11-05 10:20:26', '2020-11-05 10:20:26'),
(4, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"string\" of value \"placeholder/head\" (\"name\" expected) in \"/home/eugene/projects/broker-detect/themes/bdetect/layouts/default.htm\" at line 4. in /home/eugene/projects/broker-detect/vendor/twig/twig/src/TokenStream.php:76\nStack trace:\n#0 /home/eugene/projects/broker-detect/modules/cms/twig/PlaceholderTokenParser.php(33): Twig\\TokenStream->expect()\n#1 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(185): Cms\\Twig\\PlaceholderTokenParser->parse()\n#2 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(98): Twig\\Parser->subparse()\n#3 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(563): Twig\\Parser->parse()\n#4 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(595): Twig\\Environment->parse()\n#5 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(408): Twig\\Environment->compileSource()\n#6 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(381): Twig\\Environment->loadClass()\n#7 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(434): Twig\\Environment->loadTemplate()\n#8 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(225): Cms\\Classes\\Controller->runPage()\n#9 /home/eugene/projects/broker-detect/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#10 [internal function]: Cms\\Classes\\CmsController->run()\n#11 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array()\n#12 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#13 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#14 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#15 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#16 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#17 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#19 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#21 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#23 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#25 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#27 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#29 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#30 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#31 /home/eugene/projects/broker-detect/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#32 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch()\n#33 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#34 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#35 /home/eugene/projects/broker-detect/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#36 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#37 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#39 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#40 /home/eugene/projects/broker-detect/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#41 /home/eugene/projects/broker-detect/server.php(17): require_once(\'/home/eugene/pr...\')\n#42 {main}', NULL, '2020-11-05 10:21:17', '2020-11-05 10:21:17'),
(5, 'error', 'Cms\\Classes\\CmsException: The partial \'footer\' is not found. in /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php:1030\nStack trace:\n#0 /home/eugene/projects/broker-detect/modules/cms/twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial()\n#1 /home/eugene/projects/broker-detect/storage/cms/twig/65/6544b22026220cfe1172f0cb5a360c1d90fc72bb258d91f32fff5caa6f9f0fbc.php(131): Cms\\Twig\\Extension->partialFunction()\n#2 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Template.php(405): __TwigTemplate_95981289e8178d2d742931c0fe57b34ad87dc0e77779a6e3ac8dbb9c5091e642->doDisplay()\n#3 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Template.php(378): Twig\\Template->displayWithErrorHandling()\n#4 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Template.php(390): Twig\\Template->display()\n#5 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(435): Twig\\Template->render()\n#6 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(225): Cms\\Classes\\Controller->runPage()\n#7 /home/eugene/projects/broker-detect/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#8 [internal function]: Cms\\Classes\\CmsController->run()\n#9 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array()\n#10 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#11 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#12 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#13 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#14 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#15 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#16 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#17 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#19 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#21 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#23 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#25 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#28 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#29 /home/eugene/projects/broker-detect/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#30 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch()\n#31 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#32 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#33 /home/eugene/projects/broker-detect/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#34 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#35 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#36 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#37 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#38 /home/eugene/projects/broker-detect/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#39 /home/eugene/projects/broker-detect/server.php(17): require_once(\'/home/eugene/pr...\')\n#40 {main}\n\nNext Twig\\Error\\RuntimeError: An exception has been thrown during the rendering of a template (\"The partial \'footer\' is not found.\") in \"/home/eugene/projects/broker-detect/themes/bdetect/layouts/default.htm\" at line 42. in /home/eugene/projects/broker-detect/vendor/twig/twig/src/Template.php:419\nStack trace:\n#0 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Template.php(378): Twig\\Template->displayWithErrorHandling()\n#1 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Template.php(390): Twig\\Template->display()\n#2 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(435): Twig\\Template->render()\n#3 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(225): Cms\\Classes\\Controller->runPage()\n#4 /home/eugene/projects/broker-detect/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#5 [internal function]: Cms\\Classes\\CmsController->run()\n#6 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array()\n#7 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#8 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#9 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#10 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#11 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#12 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#14 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#16 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#18 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#19 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#20 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#22 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#24 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#25 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#26 /home/eugene/projects/broker-detect/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#27 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch()\n#28 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#29 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#30 /home/eugene/projects/broker-detect/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#31 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#32 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#33 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#34 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#35 /home/eugene/projects/broker-detect/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#36 /home/eugene/projects/broker-detect/server.php(17): require_once(\'/home/eugene/pr...\')\n#37 {main}', NULL, '2020-11-05 10:21:52', '2020-11-05 10:21:52'),
(6, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"string\" of value \"home\" (\"end of statement block\" expected) in \"/home/eugene/projects/broker-detect/themes/bdetect/layouts/default.htm\" at line 23. in /home/eugene/projects/broker-detect/vendor/twig/twig/src/TokenStream.php:76\nStack trace:\n#0 /home/eugene/projects/broker-detect/modules/cms/twig/PageTokenParser.php(25): Twig\\TokenStream->expect()\n#1 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(185): Cms\\Twig\\PageTokenParser->parse()\n#2 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(98): Twig\\Parser->subparse()\n#3 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(563): Twig\\Parser->parse()\n#4 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(595): Twig\\Environment->parse()\n#5 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(408): Twig\\Environment->compileSource()\n#6 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(381): Twig\\Environment->loadClass()\n#7 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(434): Twig\\Environment->loadTemplate()\n#8 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(225): Cms\\Classes\\Controller->runPage()\n#9 /home/eugene/projects/broker-detect/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#10 [internal function]: Cms\\Classes\\CmsController->run()\n#11 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array()\n#12 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#13 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#14 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#15 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#16 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#17 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#19 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#21 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#23 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#25 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#27 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#29 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#30 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#31 /home/eugene/projects/broker-detect/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#32 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch()\n#33 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#34 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#35 /home/eugene/projects/broker-detect/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#36 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#37 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#39 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#40 /home/eugene/projects/broker-detect/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#41 /home/eugene/projects/broker-detect/server.php(17): require_once(\'/home/eugene/pr...\')\n#42 {main}', NULL, '2020-11-06 08:05:28', '2020-11-06 08:05:28');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(7, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"string\" of value \"home\" (\"end of statement block\" expected) in \"/home/eugene/projects/broker-detect/themes/bdetect/layouts/default.htm\" at line 23. in /home/eugene/projects/broker-detect/vendor/twig/twig/src/TokenStream.php:76\nStack trace:\n#0 /home/eugene/projects/broker-detect/modules/cms/twig/PageTokenParser.php(25): Twig\\TokenStream->expect()\n#1 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(185): Cms\\Twig\\PageTokenParser->parse()\n#2 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(98): Twig\\Parser->subparse()\n#3 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(563): Twig\\Parser->parse()\n#4 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(595): Twig\\Environment->parse()\n#5 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(408): Twig\\Environment->compileSource()\n#6 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(381): Twig\\Environment->loadClass()\n#7 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(434): Twig\\Environment->loadTemplate()\n#8 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(225): Cms\\Classes\\Controller->runPage()\n#9 /home/eugene/projects/broker-detect/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#10 [internal function]: Cms\\Classes\\CmsController->run()\n#11 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array()\n#12 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#13 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#14 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#15 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#16 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#17 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#19 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#21 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#23 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#25 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#27 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#29 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#30 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#31 /home/eugene/projects/broker-detect/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#32 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch()\n#33 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#34 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#35 /home/eugene/projects/broker-detect/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#36 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#37 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#39 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#40 /home/eugene/projects/broker-detect/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#41 /home/eugene/projects/broker-detect/server.php(17): require_once(\'/home/eugene/pr...\')\n#42 {main}', NULL, '2020-11-06 08:05:28', '2020-11-06 08:05:28'),
(8, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"name\" of value \"home\" (\"end of statement block\" expected) in \"/home/eugene/projects/broker-detect/themes/bdetect/layouts/default.htm\" at line 23. in /home/eugene/projects/broker-detect/vendor/twig/twig/src/TokenStream.php:76\nStack trace:\n#0 /home/eugene/projects/broker-detect/modules/cms/twig/PageTokenParser.php(25): Twig\\TokenStream->expect()\n#1 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(185): Cms\\Twig\\PageTokenParser->parse()\n#2 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(98): Twig\\Parser->subparse()\n#3 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(563): Twig\\Parser->parse()\n#4 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(595): Twig\\Environment->parse()\n#5 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(408): Twig\\Environment->compileSource()\n#6 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(381): Twig\\Environment->loadClass()\n#7 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(434): Twig\\Environment->loadTemplate()\n#8 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(225): Cms\\Classes\\Controller->runPage()\n#9 /home/eugene/projects/broker-detect/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#10 [internal function]: Cms\\Classes\\CmsController->run()\n#11 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array()\n#12 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#13 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#14 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#15 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#16 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#17 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#19 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#21 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#23 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#25 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#27 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#29 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#30 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#31 /home/eugene/projects/broker-detect/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#32 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch()\n#33 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#34 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#35 /home/eugene/projects/broker-detect/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#36 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#37 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#39 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#40 /home/eugene/projects/broker-detect/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#41 /home/eugene/projects/broker-detect/server.php(17): require_once(\'/home/eugene/pr...\')\n#42 {main}', NULL, '2020-11-06 08:05:59', '2020-11-06 08:05:59'),
(9, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"name\" of value \"page\" (\"end of statement block\" expected) in \"/home/eugene/projects/broker-detect/themes/bdetect/layouts/default.htm\" at line 23. in /home/eugene/projects/broker-detect/vendor/twig/twig/src/TokenStream.php:76\nStack trace:\n#0 /home/eugene/projects/broker-detect/modules/cms/twig/PageTokenParser.php(25): Twig\\TokenStream->expect()\n#1 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(185): Cms\\Twig\\PageTokenParser->parse()\n#2 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Parser.php(98): Twig\\Parser->subparse()\n#3 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(563): Twig\\Parser->parse()\n#4 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(595): Twig\\Environment->parse()\n#5 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(408): Twig\\Environment->compileSource()\n#6 /home/eugene/projects/broker-detect/vendor/twig/twig/src/Environment.php(381): Twig\\Environment->loadClass()\n#7 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(434): Twig\\Environment->loadTemplate()\n#8 /home/eugene/projects/broker-detect/modules/cms/classes/Controller.php(225): Cms\\Classes\\Controller->runPage()\n#9 /home/eugene/projects/broker-detect/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#10 [internal function]: Cms\\Classes\\CmsController->run()\n#11 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array()\n#12 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#13 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#14 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#15 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#16 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#17 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#19 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#21 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#23 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#25 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#27 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#29 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#30 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#31 /home/eugene/projects/broker-detect/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#32 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch()\n#33 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#34 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#35 /home/eugene/projects/broker-detect/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#36 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#37 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#39 /home/eugene/projects/broker-detect/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#40 /home/eugene/projects/broker-detect/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#41 /home/eugene/projects/broker-detect/server.php(17): require_once(\'/home/eugene/pr...\')\n#42 {main}', NULL, '2020-11-06 08:06:13', '2020-11-06 08:06:13');

-- --------------------------------------------------------

--
-- Структура таблиці `system_files`
--

CREATE TABLE `system_files` (
  `id` int UNSIGNED NOT NULL,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `system_files`
--

INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
(5, '5fa3dccc38217172112515.png', 'favicon.png', 840, 'image/png', NULL, NULL, 'favicon', '1', 'Backend\\Models\\BrandSetting', 1, 5, '2020-11-05 09:06:52', '2020-11-05 09:06:53'),
(7, '5fa3df24cd706605177283.png', 'logo.png', 38040, 'image/png', NULL, NULL, 'logo', '1', 'Backend\\Models\\BrandSetting', 1, 7, '2020-11-05 09:16:52', '2020-11-05 09:16:55');

-- --------------------------------------------------------

--
-- Структура таблиці `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2020-11-05 08:02:30', '2020-11-05 08:02:30'),
(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2020-11-05 08:02:30', '2020-11-05 08:02:30');

-- --------------------------------------------------------

--
-- Структура таблиці `system_mail_partials`
--

CREATE TABLE `system_mail_partials` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '0'),
(2, 'system', 'update', 'retry', '1604657815'),
(3, 'cms', 'theme', 'active', '\"bdetect\"');

-- --------------------------------------------------------

--
-- Структура таблиці `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2020-11-05 08:02:30'),
(2, 'RainLab.Pages', 'comment', '1.0.1', 'Implemented the static pages management and the Static Page component.', '2020-11-06 07:39:50'),
(3, 'RainLab.Pages', 'comment', '1.0.2', 'Fixed the page preview URL.', '2020-11-06 07:39:50'),
(4, 'RainLab.Pages', 'comment', '1.0.3', 'Implemented menus.', '2020-11-06 07:39:50'),
(5, 'RainLab.Pages', 'comment', '1.0.4', 'Implemented the content block management and placeholder support.', '2020-11-06 07:39:50'),
(6, 'RainLab.Pages', 'comment', '1.0.5', 'Added support for the Sitemap plugin.', '2020-11-06 07:39:50'),
(7, 'RainLab.Pages', 'comment', '1.0.6', 'Minor updates to the internal API.', '2020-11-06 07:39:50'),
(8, 'RainLab.Pages', 'comment', '1.0.7', 'Added the Snippets feature.', '2020-11-06 07:39:50'),
(9, 'RainLab.Pages', 'comment', '1.0.8', 'Minor improvements to the code.', '2020-11-06 07:39:50'),
(10, 'RainLab.Pages', 'comment', '1.0.9', 'Fixes issue where Snippet tab is missing from the Partials form.', '2020-11-06 07:39:50'),
(11, 'RainLab.Pages', 'comment', '1.0.10', 'Add translations for various locales.', '2020-11-06 07:39:50'),
(12, 'RainLab.Pages', 'comment', '1.0.11', 'Fixes issue where placeholders tabs were missing from Page form.', '2020-11-06 07:39:50'),
(13, 'RainLab.Pages', 'comment', '1.0.12', 'Implement Media Manager support.', '2020-11-06 07:39:50'),
(14, 'RainLab.Pages', 'script', '1.1.0', 'snippets_rename_viewbag_properties.php', '2020-11-06 07:39:50'),
(15, 'RainLab.Pages', 'comment', '1.1.0', 'Adds meta title and description to pages. Adds |staticPage filter.', '2020-11-06 07:39:50'),
(16, 'RainLab.Pages', 'comment', '1.1.1', 'Add support for Syntax Fields.', '2020-11-06 07:39:50'),
(17, 'RainLab.Pages', 'comment', '1.1.2', 'Static Breadcrumbs component now respects the hide from navigation setting.', '2020-11-06 07:39:50'),
(18, 'RainLab.Pages', 'comment', '1.1.3', 'Minor back-end styling fix.', '2020-11-06 07:39:50'),
(19, 'RainLab.Pages', 'comment', '1.1.4', 'Minor fix to the StaticPage component API.', '2020-11-06 07:39:50'),
(20, 'RainLab.Pages', 'comment', '1.1.5', 'Fixes bug when using syntax fields.', '2020-11-06 07:39:50'),
(21, 'RainLab.Pages', 'comment', '1.1.6', 'Minor styling fix to the back-end UI.', '2020-11-06 07:39:50'),
(22, 'RainLab.Pages', 'comment', '1.1.7', 'Improved menu item form to include CSS class, open in a new window and hidden flag.', '2020-11-06 07:39:50'),
(23, 'RainLab.Pages', 'comment', '1.1.8', 'Improved the output of snippet partials when saved.', '2020-11-06 07:39:50'),
(24, 'RainLab.Pages', 'comment', '1.1.9', 'Minor update to snippet inspector internal API.', '2020-11-06 07:39:50'),
(25, 'RainLab.Pages', 'comment', '1.1.10', 'Fixes a bug where selecting a layout causes permanent unsaved changes.', '2020-11-06 07:39:50'),
(26, 'RainLab.Pages', 'comment', '1.1.11', 'Add support for repeater syntax field.', '2020-11-06 07:39:50'),
(27, 'RainLab.Pages', 'comment', '1.2.0', 'Added support for translations, UI updates.', '2020-11-06 07:39:50'),
(28, 'RainLab.Pages', 'comment', '1.2.1', 'Use nice titles when listing the content files.', '2020-11-06 07:39:50'),
(29, 'RainLab.Pages', 'comment', '1.2.2', 'Minor styling update.', '2020-11-06 07:39:50'),
(30, 'RainLab.Pages', 'comment', '1.2.3', 'Snippets can now be moved by dragging them.', '2020-11-06 07:39:50'),
(31, 'RainLab.Pages', 'comment', '1.2.4', 'Fixes a bug where the cursor is misplaced when editing text files.', '2020-11-06 07:39:50'),
(32, 'RainLab.Pages', 'comment', '1.2.5', 'Fixes a bug where the parent page is lost upon changing a page layout.', '2020-11-06 07:39:50'),
(33, 'RainLab.Pages', 'comment', '1.2.6', 'Shared view variables are now passed to static pages.', '2020-11-06 07:39:50'),
(34, 'RainLab.Pages', 'comment', '1.2.7', 'Fixes issue with duplicating properties when adding multiple snippets on the same page.', '2020-11-06 07:39:50'),
(35, 'RainLab.Pages', 'comment', '1.2.8', 'Fixes a bug where creating a content block without extension doesn\'t save the contents to file.', '2020-11-06 07:39:50'),
(36, 'RainLab.Pages', 'comment', '1.2.9', 'Add conditional support for translating page URLs.', '2020-11-06 07:39:50'),
(37, 'RainLab.Pages', 'comment', '1.2.10', 'Streamline generation of URLs to use the new Cms::url helper.', '2020-11-06 07:39:50'),
(38, 'RainLab.Pages', 'comment', '1.2.11', 'Implements repeater usage with translate plugin.', '2020-11-06 07:39:50'),
(39, 'RainLab.Pages', 'comment', '1.2.12', 'Fixes minor issue when using snippets and switching the application locale.', '2020-11-06 07:39:50'),
(40, 'RainLab.Pages', 'comment', '1.2.13', 'Fixes bug when AJAX is used on a page that does not yet exist.', '2020-11-06 07:39:50'),
(41, 'RainLab.Pages', 'comment', '1.2.14', 'Add theme logging support for changes made to menus.', '2020-11-06 07:39:50'),
(42, 'RainLab.Pages', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2020-11-06 07:39:50'),
(43, 'RainLab.Pages', 'comment', '1.2.16', 'Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).', '2020-11-06 07:39:50'),
(44, 'RainLab.Pages', 'comment', '1.2.17', 'Changes locations of custom fields to secondary tabs instead of the primary Settings area. New menu search ability on adding menu items', '2020-11-06 07:39:50'),
(45, 'RainLab.Pages', 'comment', '1.2.18', 'Fixes cache-invalidation issues when RainLab.Translate is not installed. Added Greek & Simplified Chinese translations. Removed deprecated calls. Allowed saving HTML in snippet properties. Added support for the MediaFinder in menu items.', '2020-11-06 07:39:50'),
(46, 'RainLab.Pages', 'comment', '1.2.19', 'Catch exception with corrupted menu file.', '2020-11-06 07:39:50'),
(47, 'RainLab.Pages', 'comment', '1.2.20', 'StaticMenu component now exposes menuName property; added pages.menu.referencesGenerated event.', '2020-11-06 07:39:50'),
(48, 'RainLab.Pages', 'comment', '1.2.21', 'Fixes a bug where last Static Menu item cannot be deleted. Improved Persian, Slovak and Turkish translations.', '2020-11-06 07:39:50'),
(49, 'RainLab.Pages', 'comment', '1.3.0', 'Added support for using Database-driven Themes when enabled in the CMS configuration.', '2020-11-06 07:39:50'),
(50, 'RainLab.Pages', 'comment', '1.3.1', 'Added ChildPages Component, prevent hidden pages from being returned via menu item resolver.', '2020-11-06 07:39:50'),
(51, 'RainLab.Pages', 'comment', '1.3.2', 'Fixes error when creating a subpage whose parent has no layout set.', '2020-11-06 07:39:50'),
(52, 'RainLab.Pages', 'comment', '1.3.3', 'Improves user experience for users with only partial access through permissions', '2020-11-06 07:39:50'),
(53, 'RainLab.Pages', 'comment', '1.3.4', 'Fix error where large menus were being truncated due to the PHP \"max_input_vars\" configuration value. Improved Slovenian translation.', '2020-11-06 07:39:50'),
(54, 'RainLab.Pages', 'comment', '1.3.5', 'Minor fix to bust the browser cache for JS assets. Prevent duplicate property fields in snippet inspector.', '2020-11-06 07:39:50'),
(55, 'RainLab.Pages', 'comment', '1.3.6', 'ChildPages component now displays localized page titles from Translate plugin.', '2020-11-06 07:39:50'),
(56, 'Martin.Forms', 'script', '1.0.0', 'create_records_table.php', '2020-11-06 09:15:44'),
(57, 'Martin.Forms', 'comment', '1.0.0', 'First version of Magic Forms', '2020-11-06 09:15:44'),
(58, 'Martin.Forms', 'comment', '1.0.1', 'Added CSRF protection', '2020-11-06 09:15:44'),
(59, 'Martin.Forms', 'comment', '1.1.0', 'Added reCAPTCHA', '2020-11-06 09:15:44'),
(60, 'Martin.Forms', 'comment', '1.1.1', 'Fix when using reCAPTCHA + allowed fields', '2020-11-06 09:15:44'),
(61, 'Martin.Forms', 'script', '1.1.2', 'add_group_field.php', '2020-11-06 09:15:44'),
(62, 'Martin.Forms', 'comment', '1.1.2', 'Filter forms records', '2020-11-06 09:15:44'),
(63, 'Martin.Forms', 'comment', '1.1.2', 'Search inside stored data', '2020-11-06 09:15:44'),
(64, 'Martin.Forms', 'comment', '1.1.2', 'Organize your forms on custom groups', '2020-11-06 09:15:44'),
(65, 'Martin.Forms', 'comment', '1.2.0', 'Export stored data in CSV format', '2020-11-06 09:15:44'),
(66, 'Martin.Forms', 'comment', '1.2.1', 'Auto-response email on form submit', '2020-11-06 09:15:44'),
(67, 'Martin.Forms', 'comment', '1.2.1', 'Added Turkish language', '2020-11-06 09:15:44'),
(68, 'Martin.Forms', 'comment', '1.2.2', 'Override notifications and auto-response email subjects', '2020-11-06 09:15:44'),
(69, 'Martin.Forms', 'comment', '1.2.3', 'New option to reset form after successfully submit', '2020-11-06 09:15:44'),
(70, 'Martin.Forms', 'comment', '1.2.3', 'Fixed Empty AJAX Form template', '2020-11-06 09:15:44'),
(71, 'Martin.Forms', 'comment', '1.2.3', 'Support for Translate plugin', '2020-11-06 09:15:44'),
(72, 'Martin.Forms', 'comment', '1.2.3', 'Added plugin documentation', '2020-11-06 09:15:44'),
(73, 'Martin.Forms', 'comment', '1.2.4', 'Added detailed reCAPTCHA help', '2020-11-06 09:15:44'),
(74, 'Martin.Forms', 'comment', '1.3.0', 'AJAX file uploads', '2020-11-06 09:15:44'),
(75, 'Martin.Forms', 'comment', '1.3.1', 'Added lang pt-br', '2020-11-06 09:15:44'),
(76, 'Martin.Forms', 'comment', '1.3.2', 'Fixed multiples reCAPTCHAs on same page', '2020-11-06 09:15:44'),
(77, 'Martin.Forms', 'comment', '1.3.3', 'Fixed record detail page when form data contains an array', '2020-11-06 09:15:44'),
(78, 'Martin.Forms', 'comment', '1.3.3', 'Updated documentations', '2020-11-06 09:15:44'),
(79, 'Martin.Forms', 'comment', '1.3.4', 'New \"Anonymize IP\" option', '2020-11-06 09:15:44'),
(80, 'Martin.Forms', 'comment', '1.3.5', 'New option \"Redirect on successful submit\"', '2020-11-06 09:15:44'),
(81, 'Martin.Forms', 'comment', '1.3.6', 'French translation', '2020-11-06 09:15:44'),
(82, 'Martin.Forms', 'comment', '1.3.6', 'Support Translate plugin on reCAPTCHA', '2020-11-06 09:15:44'),
(83, 'Martin.Forms', 'comment', '1.3.6', 'reCAPTCHA validation enhancements', '2020-11-06 09:15:44'),
(84, 'Martin.Forms', 'comment', '1.3.7', 'Displaying errors with fields (inline errors)', '2020-11-06 09:15:44'),
(85, 'Martin.Forms', 'comment', '1.3.7', 'Show uploads as list', '2020-11-06 09:15:44'),
(86, 'Martin.Forms', 'comment', '1.3.8', 'Fixed handling arrays (radio inputs) in notification email', '2020-11-06 09:15:44'),
(87, 'Martin.Forms', 'comment', '1.3.9', 'Use custom mail templates', '2020-11-06 09:15:44'),
(88, 'Martin.Forms', 'comment', '1.3.9', 'Execute custom JavaScript on form success or error', '2020-11-06 09:15:44'),
(89, 'Martin.Forms', 'comment', '1.4.0', 'Added Events (please, refer to docs) [thanks to therealkevinard]', '2020-11-06 09:15:44'),
(90, 'Martin.Forms', 'comment', '1.4.1', 'New option \"Reply To\"', '2020-11-06 09:15:44'),
(91, 'Martin.Forms', 'comment', '1.4.2', 'Escape HTML characters on the view records page [thanks to Andre]', '2020-11-06 09:15:44'),
(92, 'Martin.Forms', 'comment', '1.4.2', 'New option to sanitize form data (check security docs for more info)', '2020-11-06 09:15:44'),
(93, 'Martin.Forms', 'comment', '1.4.2', 'Added option to send blind carbon copy in notifications email', '2020-11-06 09:15:44'),
(94, 'Martin.Forms', 'script', '1.4.3', 'add_unread_field.php', '2020-11-06 09:15:45'),
(95, 'Martin.Forms', 'comment', '1.4.3', 'Fixes related to October Build 420', '2020-11-06 09:15:45'),
(96, 'Martin.Forms', 'comment', '1.4.3', 'Added \"Unread Records\" counter', '2020-11-06 09:15:45'),
(97, 'Martin.Forms', 'comment', '1.4.3', 'Fixed errors when only BCC addresses are supplied', '2020-11-06 09:15:45'),
(98, 'Martin.Forms', 'comment', '1.4.3', 'New setting \"hide navigation item\"', '2020-11-06 09:15:45'),
(99, 'Martin.Forms', 'comment', '1.4.4', 'Use custom partials for Success and Error messages', '2020-11-06 09:15:45'),
(100, 'Martin.Forms', 'comment', '1.4.4.1', 'Fix with notifications emails', '2020-11-06 09:15:45'),
(101, 'Martin.Forms', 'comment', '1.4.5', 'Mail class code refactoring', '2020-11-06 09:15:45'),
(102, 'Martin.Forms', 'comment', '1.4.5', 'Access submited data on auto-response email template', '2020-11-06 09:15:45'),
(103, 'Martin.Forms', 'comment', '1.4.5.1', 'Store form data without escaping unicode [thanks to panakour]', '2020-11-06 09:15:45'),
(104, 'Martin.Forms', 'comment', '1.4.6', 'New option to skip saving forms data on database.', '2020-11-06 09:15:45'),
(105, 'Martin.Forms', 'comment', '1.4.6', 'Possibility to change the text on the remove file popup [thanks to ShiroeSama]', '2020-11-06 09:15:45'),
(106, 'Martin.Forms', 'comment', '1.4.6.1', 'Changed database field from json to text to support MySQL 5.5', '2020-11-06 09:15:45'),
(107, 'Martin.Forms', 'comment', '1.4.7', 'you can use your form variables on notification mail subject [thanks to Alex360hd]', '2020-11-06 09:15:45'),
(108, 'Martin.Forms', 'comment', '1.4.7', 'fix custom subject on email template [Thanks to matteotrubini]', '2020-11-06 09:15:45'),
(109, 'Martin.Forms', 'comment', '1.4.7', 'fix email bug when not storing on db [Thanks JurekRaben]', '2020-11-06 09:15:45'),
(110, 'Martin.Forms', 'comment', '1.4.7', 'skip url redirect validation [Thanks to EleRam]', '2020-11-06 09:15:45'),
(111, 'Martin.Forms', 'comment', '1.4.8', 'added GDPR cleanup feature [thanks to Alex360hd]', '2020-11-06 09:15:45'),
(112, 'Martin.Forms', 'comment', '1.4.9', 'fix on replaceToken function when replacement is null [thanks to leonaze]', '2020-11-06 09:15:45'),
(113, 'Martin.Forms', 'comment', '1.4.9.1', 'fix a nullable type error on PHP 7.0', '2020-11-06 09:15:45'),
(114, 'Martin.Forms', 'comment', '1.4.9.2', 'bugfix when a form field array has more than 2 levels of depth', '2020-11-06 09:15:45'),
(115, 'Martin.Forms', 'comment', '1.4.10', 'improvements related to event functionality', '2020-11-06 09:15:45'),
(116, 'Martin.Forms', 'comment', '1.4.11', 'added Laravel custom attributes to form validation [thanks to geekfil]', '2020-11-06 09:15:45'),
(117, 'Martin.Forms', 'comment', '1.4.11', 'updated french translation [thanks to FelixINX]', '2020-11-06 09:15:45'),
(118, 'Martin.Forms', 'comment', '1.4.12', 'use form variables on auto-response mail subject [thanks to jiargei]', '2020-11-06 09:15:45'),
(119, 'Martin.Forms', 'comment', '1.4.13', 'pass an array with form errors to JavaScript [thanks to multiwebinc]', '2020-11-06 09:15:45'),
(120, 'Martin.Forms', 'comment', '1.4.14', 'fixed error with empty auto-response subject', '2020-11-06 09:15:45'),
(121, 'Martin.Forms', 'comment', '1.4.15', 'enhancements related to saving record and events [thanks to boxxroom]', '2020-11-06 09:15:45'),
(122, 'Martin.Forms', 'comment', '1.4.16', 'added chinese translation [thanks to everyx]', '2020-11-06 09:15:45'),
(123, 'Martin.Forms', 'comment', '1.4.17', 'allowing sanitize to work recursively [thanks to multiwebinc]', '2020-11-06 09:15:45'),
(124, 'Martin.Forms', 'comment', '1.4.18', 'export records enhancements [thanks to Fosphatic]', '2020-11-06 09:15:45'),
(125, 'Martin.Forms', 'comment', '1.4.18', 'recaptcha locale fix [thanks to MaTToX3]', '2020-11-06 09:15:45'),
(126, 'Martin.Forms', 'comment', '1.4.19', 'added russian translation [thanks to FlusherDock1]', '2020-11-06 09:15:45'),
(127, 'Martin.Forms', 'comment', '1.4.19', 'sort records by date fix [thanks to mjauvin]', '2020-11-06 09:15:45'),
(128, 'Martin.Forms', 'comment', '1.4.20', 'added invisible reCAPTCHA [thanks to mjauvin]', '2020-11-06 09:15:45'),
(129, 'Martin.Forms', 'comment', '1.4.20', 'new option to set custom date format on emails subject', '2020-11-06 09:15:45'),
(130, 'Martin.Forms', 'comment', '1.5.0', 'fixes related to October Build 469 [thanks to mjauvin]', '2020-11-06 09:15:45'),
(131, 'Martin.Forms', 'comment', '1.5.0', 'fix when CSRF check is disabled [thanks to rechik]', '2020-11-06 09:15:45'),
(132, 'Martin.Forms', 'comment', '1.5.0', 'php linting and cleanup', '2020-11-06 09:15:45');

-- --------------------------------------------------------

--
-- Структура таблиці `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(1, 'October.Demo', '1.0.1', '2020-11-05 08:02:30', 0, 0),
(2, 'RainLab.Pages', '1.3.6', '2020-11-06 07:39:50', 0, 0),
(3, 'Martin.Forms', '1.5.0', '2020-11-06 09:15:45', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int UNSIGNED NOT NULL,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int UNSIGNED NOT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `system_settings`
--

INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
(1, 'backend_brand_settings', '{\"app_name\":\"Broker Detect\",\"app_tagline\":\"\\u0412\\u043e\\u0437\\u0432\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u0435 \\u043a \\u0438\\u0441\\u0442\\u043e\\u043a\\u0430\\u043c\",\"primary_color\":\"#34495e\",\"secondary_color\":\"#4882ba\",\"accent_color\":\"#f01973\",\"menu_mode\":\"tile\",\"custom_css\":\"\"}');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`),
  ADD KEY `admin_role_index` (`role_id`);

--
-- Індекси таблиці `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Індекси таблиці `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Індекси таблиці `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Індекси таблиці `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_unique` (`name`),
  ADD KEY `role_code_index` (`code`);

--
-- Індекси таблиці `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Індекси таблиці `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Індекси таблиці `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Індекси таблиці `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Індекси таблиці `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_templates_source_index` (`source`),
  ADD KEY `cms_theme_templates_path_index` (`path`);

--
-- Індекси таблиці `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`),
  ADD KEY `deferred_bindings_session_key_index` (`session_key`);

--
-- Індекси таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Індекси таблиці `martin_forms_records`
--
ALTER TABLE `martin_forms_records`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Індекси таблиці `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Індекси таблиці `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Індекси таблиці `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Індекси таблиці `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Індекси таблиці `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Індекси таблиці `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Індекси таблиці `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Індекси таблиці `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `martin_forms_records`
--
ALTER TABLE `martin_forms_records`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблиці `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблиці `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблиці `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT для таблиці `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
