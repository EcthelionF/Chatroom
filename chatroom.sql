/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.1_3306
Source Server Version : 50173
Source Host           : 192.168.1.1:3306
Source Database       : chatroom

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-27 23:16:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add user profile', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('20', 'Can change user profile', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete user profile', '7', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can add web group', '8', 'add_webgroup');
INSERT INTO `auth_permission` VALUES ('23', 'Can change web group', '8', 'change_webgroup');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete web group', '8', 'delete_webgroup');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$24000$kJHnOsMGN68k$I0mgqbPDEueTA+L9VRNQH8k0R0a3AjWo/FM08B+el4g=', '2017-05-26 08:41:13', '1', 'yipwinghong@outlook.com', '', '', 'yipwinghong@outlook.com', '1', '1', '2017-05-26 06:47:08');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$24000$B3ImtHYgf36l$eyoervA2qFyQFIe+PhTx828ojjBzBbKFqY/wvm0j1HY=', '2017-05-26 11:06:11', '0', 'ywh', '', '', '', '1', '1', '2017-05-26 07:47:46');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$24000$mXIZ0evLKf2r$oAGu7xcXqRcuA1D++EixHtUlwz3loDmQi9+e8A7oS8w=', '2017-05-26 17:32:42', '0', 'hwy', '', '', '', '1', '1', '2017-05-26 07:55:38');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-05-26 07:39:23', '1', 'ywh', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2017-05-26 07:47:46', '2', 'ywh', '1', 'Added.', '4', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2017-05-26 07:48:58', '2', 'ywh', '2', 'No fields changed.', '4', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2017-05-26 07:54:16', '1', 'ywh', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2017-05-26 07:54:44', '2', 'yipwinghong', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2017-05-26 07:54:56', '3', 'ywh', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2017-05-26 07:55:38', '3', 'hwy', '1', 'Added.', '4', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2017-05-26 07:55:43', '3', 'hwy', '2', 'No fields changed.', '4', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2017-05-26 07:56:02', '4', 'hwy', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2017-05-26 07:57:06', '3', 'hwy', '2', 'Changed is_staff.', '4', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2017-05-26 07:57:14', '2', 'ywh', '2', 'Changed is_staff.', '4', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2017-05-26 08:04:42', '3', 'hwy', '2', 'Changed is_superuser.', '4', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2017-05-26 08:04:49', '2', 'ywh', '2', 'Changed is_superuser.', '4', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2017-05-26 08:08:27', '3', 'hwy', '2', 'Changed is_superuser.', '4', '3');
INSERT INTO `django_admin_log` VALUES ('15', '2017-05-26 08:08:59', '2', 'ywh', '2', 'Changed is_superuser.', '4', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2017-05-26 08:11:29', '4', 'hwy', '2', 'Changed friends.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2017-05-26 08:17:46', '1', 'group1', '1', 'Added.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2017-05-26 08:33:34', '1', 'group1', '2', 'No fields changed.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2017-05-26 08:35:12', '1', 'group1', '2', 'Changed owner and admins.', '8', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'webchat', 'userprofile');
INSERT INTO `django_content_type` VALUES ('8', 'webchat', 'webgroup');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-05-26 04:48:46');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-05-26 04:48:46');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-05-26 04:48:46');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-05-26 04:48:46');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-05-26 04:48:46');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-05-26 04:48:46');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-05-26 04:48:47');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-05-26 04:48:47');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-05-26 04:48:47');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-05-26 04:48:47');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-05-26 04:48:47');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2017-05-26 04:48:47');
INSERT INTO `django_migrations` VALUES ('13', 'webchat', '0001_initial', '2017-05-26 04:48:47');
INSERT INTO `django_migrations` VALUES ('14', 'webchat', '0002_auto_20170526_0901', '2017-05-26 04:48:47');
INSERT INTO `django_migrations` VALUES ('15', 'webchat', '0003_remove_userprofile_name', '2017-05-26 04:48:47');
INSERT INTO `django_migrations` VALUES ('16', 'webchat', '0004_userprofile_name', '2017-05-26 04:48:47');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('8fs8xqv08k8po6syex8cgixkke2lximu', 'NTNhMzg0MmNkODFhNDk0MzIyY2I0NTliMmI4NjA4M2FkMWMwZWEwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMxZjU3OTYyMDg5ZWY5OGRmYTZhM2ViOWQ2OTJkMDk2YTQyNDNjYzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=', '2017-06-09 17:32:42');
INSERT INTO `django_session` VALUES ('3s3bjc0t5hqy8w39wub6esvua8mlh2k8', 'OGVhZTM4MmI0Y2EzY2VlODJiOTExYzM2ZWVlZGVkOGRmYTJlZGM5NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ1Zjc3MmM1MDEyMGE4YjdjMzBiZjgzZmFhNmYwMGZkNWM4ZjYwMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-06-09 11:06:11');

-- ----------------------------
-- Table structure for `webchat_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `webchat_userprofile`;
CREATE TABLE `webchat_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `signature` varchar(255) DEFAULT NULL,
  `head_img` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(64),
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_userprofile
-- ----------------------------
INSERT INTO `webchat_userprofile` VALUES ('2', 'test', '', '1', 'yipwinghong');
INSERT INTO `webchat_userprofile` VALUES ('3', 'test', '', '2', 'ywh');
INSERT INTO `webchat_userprofile` VALUES ('4', 'test', '', '3', 'hwy');

-- ----------------------------
-- Table structure for `webchat_userprofile_friends`
-- ----------------------------
DROP TABLE IF EXISTS `webchat_userprofile_friends`;
CREATE TABLE `webchat_userprofile_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_userprofile_id` int(11) NOT NULL,
  `to_userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webchat_userprofile_friends_from_userprofile_id_b8948f74_uniq` (`from_userprofile_id`,`to_userprofile_id`),
  KEY `webchat_userprofile_friends_6c3c534c` (`from_userprofile_id`),
  KEY `webchat_userprofile_friends_257192e2` (`to_userprofile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_userprofile_friends
-- ----------------------------
INSERT INTO `webchat_userprofile_friends` VALUES ('1', '3', '2');
INSERT INTO `webchat_userprofile_friends` VALUES ('2', '2', '3');
INSERT INTO `webchat_userprofile_friends` VALUES ('3', '4', '3');
INSERT INTO `webchat_userprofile_friends` VALUES ('4', '3', '4');
INSERT INTO `webchat_userprofile_friends` VALUES ('5', '4', '2');
INSERT INTO `webchat_userprofile_friends` VALUES ('6', '4', '4');
INSERT INTO `webchat_userprofile_friends` VALUES ('7', '2', '4');

-- ----------------------------
-- Table structure for `webchat_webgroup`
-- ----------------------------
DROP TABLE IF EXISTS `webchat_webgroup`;
CREATE TABLE `webchat_webgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `max_members` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webchat_webgroup_5e7b1936` (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_webgroup
-- ----------------------------
INSERT INTO `webchat_webgroup` VALUES ('1', 'group1', 'group1', '200', '2');

-- ----------------------------
-- Table structure for `webchat_webgroup_admins`
-- ----------------------------
DROP TABLE IF EXISTS `webchat_webgroup_admins`;
CREATE TABLE `webchat_webgroup_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webgroup_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webchat_webgroup_admins_webgroup_id_dea5fffb_uniq` (`webgroup_id`,`userprofile_id`),
  KEY `webchat_webgroup_admins_639bd386` (`webgroup_id`),
  KEY `webchat_webgroup_admins_9c2a73e9` (`userprofile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_webgroup_admins
-- ----------------------------
INSERT INTO `webchat_webgroup_admins` VALUES ('2', '1', '2');

-- ----------------------------
-- Table structure for `webchat_webgroup_members`
-- ----------------------------
DROP TABLE IF EXISTS `webchat_webgroup_members`;
CREATE TABLE `webchat_webgroup_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webgroup_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webchat_webgroup_members_webgroup_id_41f78962_uniq` (`webgroup_id`,`userprofile_id`),
  KEY `webchat_webgroup_members_639bd386` (`webgroup_id`),
  KEY `webchat_webgroup_members_9c2a73e9` (`userprofile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_webgroup_members
-- ----------------------------
INSERT INTO `webchat_webgroup_members` VALUES ('1', '1', '2');
INSERT INTO `webchat_webgroup_members` VALUES ('2', '1', '3');
INSERT INTO `webchat_webgroup_members` VALUES ('3', '1', '4');
