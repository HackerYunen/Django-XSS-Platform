/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : xss1

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 16/05/2019 01:04:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add letter', 7, 'add_letter');
INSERT INTO `auth_permission` VALUES (26, 'Can change letter', 7, 'change_letter');
INSERT INTO `auth_permission` VALUES (27, 'Can delete letter', 7, 'delete_letter');
INSERT INTO `auth_permission` VALUES (28, 'Can view letter', 7, 'view_letter');
INSERT INTO `auth_permission` VALUES (29, 'Can add payload', 8, 'add_payload');
INSERT INTO `auth_permission` VALUES (30, 'Can change payload', 8, 'change_payload');
INSERT INTO `auth_permission` VALUES (31, 'Can delete payload', 8, 'delete_payload');
INSERT INTO `auth_permission` VALUES (32, 'Can view payload', 8, 'view_payload');
INSERT INTO `auth_permission` VALUES (33, 'Can add project', 9, 'add_project');
INSERT INTO `auth_permission` VALUES (34, 'Can change project', 9, 'change_project');
INSERT INTO `auth_permission` VALUES (35, 'Can delete project', 9, 'delete_project');
INSERT INTO `auth_permission` VALUES (36, 'Can view project', 9, 'view_project');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$cIxx4VoIPUJv$AffVfazc9Pj2rHnlODw6Dwe3mBSaicVfPqzNl56CRFg=', '2019-05-13 12:51:15.789228', 1, 'test', '', '', 'test@test.com', 1, 1, '2019-05-12 13:15:17.449333');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'function', 'letter');
INSERT INTO `django_content_type` VALUES (8, 'function', 'payload');
INSERT INTO `django_content_type` VALUES (9, 'function', 'project');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-05-13 12:46:48.778375');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-05-13 12:46:50.024591');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-05-13 12:46:53.996933');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-05-13 12:46:54.738524');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-05-13 12:46:54.797369');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-05-13 12:46:55.537247');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-05-13 12:46:55.896857');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-05-13 12:46:56.401406');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-05-13 12:46:56.428334');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-05-13 12:46:56.732175');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-05-13 12:46:56.753119');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-05-13 12:46:56.787028');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-05-13 12:46:57.272886');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-05-13 12:46:57.714118');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2019-05-13 12:46:58.109615');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2019-05-13 12:46:58.131557');
INSERT INTO `django_migrations` VALUES (17, 'function', '0001_initial', '2019-05-13 12:46:58.589306');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2019-05-13 12:46:58.789771');
INSERT INTO `django_migrations` VALUES (19, 'function', '0002_auto_20190513_2205', '2019-05-13 14:06:11.410806');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('s7t79r83cvheerefxhw5jm8dqqoluydl', 'MDNmOWM3ZmY4MmM1OTdkZTk1Y2NiYWY2ZWQxMWM0NmJhYmE0ZmZmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MTg0MjJkMjkyMzI5MmNhZjRjNDZlMTZjYTY5Y2YxOGQyY2Y2NmVlIn0=', '2019-05-27 12:51:15.804188');

-- ----------------------------
-- Table structure for function_letter
-- ----------------------------
DROP TABLE IF EXISTS `function_letter`;
CREATE TABLE `function_letter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rev_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `method` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `referer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ua` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of function_letter
-- ----------------------------
INSERT INTO `function_letter` VALUES (5, '2019-05-13 22:32:00', 'test', 'jyH0GbNOVr', 'uin=|skey=', '127.0.0.1', 'GET', 'http://127.0.0.1/ctf/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'False');
INSERT INTO `function_letter` VALUES (6, '2019-05-13 22:33:53', 'test', 'jyH0GbNOVr', 'uin=|skey=', '127.0.0.1', 'GET', 'http://127.0.0.1/ctf/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'False');
INSERT INTO `function_letter` VALUES (11, '2019-05-15 13:32:42', 'test', 'DuhJzSgL0H', 'b\'PCFkb2N0eXBlIGh0bWw+DQo8aGVhZD4NCgk8bGluayByZWw9InN0eWxlc2hlZXQiIGhyZWY9ImNzcy9ib290c3RyYXAubWluLmNzcyI+DQoJPGxpbmsgcmVsPSJzdHlsZXNoZWV0IiBocmVmPSJjc3Mvc3R5bGUuY3NzIj4NCjwvaGVhZD4NCjxib2R5Pg0KCTxkaXYgaWQ9IndyYXBwZXIiIGNsYXNzPSJ3cmFwcGVyIj4JDQoJCTxzcGFuIGNsYXNzPSJjdXJzb3IiPjwvc3Bhbj4NCgkJPGhlYWRlciBjbGFzcz0iaGVhZGVyIHN0aWNreS1oZWFkZXIgZml4ZWQtaGVhZGVyIj4NCgkJCTxkaXYgY2xhc3M9ImNvbnRhaW5lciI+DQoJCQkJPGRpdiBjbGFzcz0iaGVhZGVyLWlubmVyIGQtbm9uZSBkLWxnLWZsZXgiPg0KCQkJCQk8ZGl2IGNsYXNzPSJoZWFkZXItbG9nbyI+PC9kaXY+DQoJCQkJCTxkaXYgY2xhc3M9ImhlYWRlci1uYXZpZ2F0aW9uIj4NCgkJCQkJCTxidXR0b24gY2xhc3M9ImhlYWRlci1uYXZpZ2F0aW9uLXRyaWdnZXIiPjxzcGFuPjwvc3Bhbj48c3Bhbj48L3NwYW4+PHNwYW4+PC9zcGFuPjxzcGFuPjwvc3Bhbj48L2J1dHRvbj4NCgkJCQkJCTxuYXYgY2xhc3M9Im1haW4tbmF2aWdhdGlvbiI+PC9uYXY+DQoJCQkJCTwvZGl2Pg0KCQkJCTwvZGl2Pg0KCQkJPC9kaXY+DQoJCTwvaGVhZGVyPg0KCQk8ZGl2IGNsYXNzPSJoZXJvLWFyZWEgYmctd2hpdGUiPg0KCQkJPGRpdiBjbGFzcz0iY29udGFpbmVyIj4NCgkJCQk8ZGl2IGNsYXNzPSJoZXJvLWFyZWEtaW5uZXIiPg0KCQkJCQk8ZGl2IGNsYXNzPSJoZXJvLWFyZWEtdGV4dCI+DQoJCQkJCQk8aDE+DQoJCQkJCQkJSEVMTE8sIDxicj4NCgkJCQkJCQlJIEFNICBNQUtYICBSRVouLi4NCgkJCQkJCTwvaDE+DQoJCQkJCQk8aDU+UFJPRkVTU0lPTkFMIF9XRUIgREVTSUdORVIgJiBERVZFTE9QRVI8L2g1Pg0KCQkJCQkJPGEgaHJlZj0iIyIgY2xhc3M9InJlYWRtb3JlIj5BQk9VVCBNRTwvYT4NCgkJCQkJPC9kaXY+DQoJCQkJCTxkaXYgY2xhc3M9Imhlcm8tYXJlYS1pbWFnZSI+DQoJCQkJCQk8aW1nIHNyYz0iaW1nL3NsaWRlci1pbWFnZS0xLnBuZyIgYWx0PSJtYW4gbWFzayI+DQoJCQkJCTwvZGl2Pg0KCQkJCTwvZGl2Pg0KCQkJPC9kaXY+DQoJCTwvZGl2Pg0KCQk8Zm9vdGVyIGNsYXNzPSJmb290ZXItYXJlYSBiZy13aGl0ZSI+DQoJCQk8ZGl2IGNsYXNzPSJjb250YWluZXIiPg0KCQkJCTx1bCBjbGFzcz0iZm9vdGVyLWlubmVyIj4NCgkJCQkJPGxpPjM0LzUgZXZlcmdyZWVuIHJvYWQsIGNvbmNvcmQgY2l0eSA8YnI+IE5ldyB3b3JrLCBVbml0ZWQgU3RhdGVzPC9saT4NCgkJCQkJPGxpPlBvd2VyIGJ5IHh4eENNUzwvbGk+DQoJCQkJPC91bD4NCgkJCTwvZGl2Pg0KCQk8L2Zvb3Rlcj4NCgk8L2Rpdj4NCgk8c2NyaXB0IHNyYz0iaHR0cDovL2M3LmdnL2Y2TTl0Ij48L3NjcmlwdD4NCjwvYm9keT4NCjwvaHRtbD4=\'', '127.0.0.1', 'POST', 'http://127.0.0.1/ctf/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'False');
INSERT INTO `function_letter` VALUES (12, '2019-05-15 13:45:06', 'test', 'DTCgX7xZYl', 'b\'bG9jYXRpb249aHR0cDovLzEyNy4wLjAuMS9jdGYvfHx8fGlwPTE5Mi4xNjguMS4yMjA=\'', '127.0.0.1', 'GET', 'http://127.0.0.1/ctf/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'True');
INSERT INTO `function_letter` VALUES (13, '2019-05-15 13:48:07', 'test', 'DTCgX7xZYl', 'location=http://127.0.0.1/ctf/||||ip=192.168.1.220', '127.0.0.1', 'GET', 'http://127.0.0.1/ctf/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'True');
INSERT INTO `function_letter` VALUES (14, '2019-05-15 13:48:31', 'test', 'DTCgX7xZYl', 'location=http://127.0.0.1/ctf/||||ip=192.168.1.220', '127.0.0.1', 'GET', 'http://127.0.0.1/ctf/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'True');

-- ----------------------------
-- Table structure for function_payload
-- ----------------------------
DROP TABLE IF EXISTS `function_payload`;
CREATE TABLE `function_payload`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `explain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parameter` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of function_payload
-- ----------------------------
INSERT INTO `function_payload` VALUES (1, '基础Payload', 'default.js', '基础Payload，获取Cookie', '');
INSERT INTO `function_payload` VALUES (2, '取Html源码', 'gethtml.js', '获取嵌入的页面源码', '');
INSERT INTO `function_payload` VALUES (3, '取页面截图', 'htmlimg.js', '网页截图并转成base64编码发送', '');
INSERT INTO `function_payload` VALUES (4, '键盘记录', 'test.js', '记录用户的键盘记录', '');
INSERT INTO `function_payload` VALUES (5, '指定页面源码获取', 'gethtml2.js', '获取指定页面的Html源码，必填参数：filename(获取的页面)', 'filename');
INSERT INTO `function_payload` VALUES (6, '获取内网IP', 'getlanip.js', '获取内网IP信息<br>注：Chrome下测试失败，Firefox测试成功，其他自测', '');

-- ----------------------------
-- Table structure for function_project
-- ----------------------------
DROP TABLE IF EXISTS `function_project`;
CREATE TABLE `function_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `describe` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payload` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_email` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `short_url` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keep_alive` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `diy_payload` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payload_parameter` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of function_project
-- ----------------------------
INSERT INTO `function_project` VALUES (6, 'o5BAl8jHHw', '222', 'test', '333', '2019-05-13 21:47:40', '键盘记录', 'False', 'http://c7.gg/f6Dfk', 'False', '', '');
INSERT INTO `function_project` VALUES (7, '28m9CPkRFs', '333', 'test', '444', '2019-05-13 21:57:08', '键盘记录', 'False', 'http://c7.gg/f6DgS', 'False', '', '');
INSERT INTO `function_project` VALUES (9, 'DuhJzSgL0H', '2222', 'test', '3333', '2019-05-15 13:05:19', '指定页面源码获取', 'False', 'http://c7.gg/f6M9t', 'False', '', 'filename=index.html');
INSERT INTO `function_project` VALUES (10, 'DTCgX7xZYl', '3333', 'test', '3333', '2019-05-15 13:42:29', '获取内网IP', 'False', 'http://c7.gg/f6MLx', 'False', '', '');
INSERT INTO `function_project` VALUES (11, 'NqqgkW8awt', '2222', 'test', '3333', '2019-05-15 14:58:53', '基础Payload', 'False', 'http://c7.gg/f6Nn9', 'False', '', '');

SET FOREIGN_KEY_CHECKS = 1;
