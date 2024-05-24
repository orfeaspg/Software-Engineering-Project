DROP DATABASE IF EXISTS recovery_road;
CREATE DATABASE recovery_road;
USE recovery_road;

CREATE TABLE `articles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail_path` text DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `chat_rooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `external_links` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `timestamps` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `img_path` text NOT NULL,
  `sent_ap` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `personal_diary_content` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `roles` (
  `role_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `room_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `room_id` bigint NOT NULL,
  `message_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_room_messages_room` (`room_id`),
  KEY `fk_room_messages_messages` (`message_id`),
  CONSTRAINT `fk_room_messages_messages` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_room_messages_room` FOREIGN KEY (`room_id`) REFERENCES `chat_rooms` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `timestamps` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_roles` (`role_id`),
  CONSTRAINT `fk_user_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `streak_counter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_streak_counter_user` (`user_id`),
  CONSTRAINT `fk_streak_counter_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



CREATE TABLE `users_diary_contents` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `personal_diary_id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_diary_user` (`user_id`),
  KEY `fk_user_diary_personal` (`personal_diary_id`),
  CONSTRAINT `fk_user_diary_personal` FOREIGN KEY (`personal_diary_id`) REFERENCES `personal_diary_content` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_diary_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `user_chat_rooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `room_id` bigint NOT NULL,
  `join_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_rooms_user` (`user_id`),
  KEY `fk_user_rooms_rooms` (`room_id`),
  CONSTRAINT `fk_user_rooms_rooms` FOREIGN KEY (`room_id`) REFERENCES `chat_rooms` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_rooms_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `user_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `message_id` bigint NOT NULL,
  `timestamps` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_messages_user` (`user_id`),
  KEY `fk_user_messages_messages` (`message_id`),
  CONSTRAINT `fk_user_messages_messages` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_messages_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;