/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.1_3306
Source Server Version : 50173
Source Host           : 192.168.1.1:3306
Source Database       : chatroom

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-28 17:25:48
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add user', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('17', 'Can change user', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete user', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('19', 'Can add web group', '7', 'add_webgroup');
INSERT INTO `auth_permission` VALUES ('20', 'Can change web group', '7', 'change_webgroup');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete web group', '7', 'delete_webgroup');

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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-05-28 07:54:04', '2', 'Mitsuha', '1', 'Added.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2017-05-28 07:54:45', '3', 'Taki', '1', 'Added.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2017-05-28 07:55:00', '2', 'Mitsuha', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2017-05-28 07:55:30', '1', 'ywh', '2', 'Changed name, gender and friends.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2017-05-28 07:56:06', '4', 'Mitsuha', '1', 'Added.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2017-05-28 07:56:46', '3', 'Taki', '2', 'Changed image and friends.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2017-05-28 07:56:53', '4', 'Mitsuha', '2', 'No fields changed.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2017-05-28 07:59:33', '3', 'Taki', '2', 'Changed is_staff.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2017-05-28 07:59:39', '4', 'Mitsuha', '2', 'Changed is_staff.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2017-05-28 08:00:27', '3', 'Taki', '2', 'Changed is_superuser.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2017-05-28 08:00:34', '3', 'Taki', '2', 'No fields changed.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2017-05-28 08:00:57', '4', 'Mitsuha', '2', 'Changed is_superuser and image.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2017-05-28 08:02:43', '3', 'Taki', '2', 'No fields changed.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2017-05-28 08:04:13', '3', 'Taki', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2017-05-28 08:05:48', '4', 'Mitsuha', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2017-05-28 08:06:33', '6', 'Mitsuha', '2', 'Changed name, gender, image and friends.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2017-05-28 08:07:02', '5', 'Taki', '2', 'Changed name and gender.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2017-05-28 08:07:09', '6', 'Mitsuha', '2', 'No fields changed.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2017-05-28 08:07:32', '6', 'Mitsuha', '2', 'Changed image.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2017-05-28 08:07:44', '5', 'Taki', '2', 'Changed image.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2017-05-28 08:26:38', '5', 'Taki', '2', 'Changed image.', '6', '5');
INSERT INTO `django_admin_log` VALUES ('22', '2017-05-28 08:26:47', '6', 'Mitsuha', '2', 'Changed image.', '6', '5');
INSERT INTO `django_admin_log` VALUES ('23', '2017-05-28 08:40:30', '1', 'group1', '1', 'Added.', '7', '5');
INSERT INTO `django_admin_log` VALUES ('24', '2017-05-28 08:40:50', '2', 'group2', '1', 'Added.', '7', '5');
INSERT INTO `django_admin_log` VALUES ('25', '2017-05-28 08:41:01', '2', 'group3', '2', 'Changed name, brief and owner.', '7', '5');
INSERT INTO `django_admin_log` VALUES ('26', '2017-05-28 08:41:32', '3', 'group2', '1', 'Added.', '7', '5');
INSERT INTO `django_admin_log` VALUES ('27', '2017-05-28 08:42:20', '5', 'Taki', '2', 'Changed friends.', '6', '5');
INSERT INTO `django_admin_log` VALUES ('28', '2017-05-28 08:42:27', '6', 'Mitsuha', '2', 'Changed friends.', '6', '5');
INSERT INTO `django_admin_log` VALUES ('29', '2017-05-28 08:42:33', '1', 'ywh', '2', 'No fields changed.', '6', '5');
INSERT INTO `django_admin_log` VALUES ('30', '2017-05-28 09:17:19', '1', 'ywh', '2', 'Changed image.', '6', '5');
INSERT INTO `django_admin_log` VALUES ('31', '2017-05-28 09:19:18', '1', 'ywh', '2', 'Changed image.', '6', '5');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'webchat', 'userprofile');
INSERT INTO `django_content_type` VALUES ('7', 'webchat', 'webgroup');

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('2', 'admin', '0001_initial', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0002_logentry_remove_auto_add', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0001_initial', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-05-28 07:40:24');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2017-05-28 07:40:25');
INSERT INTO `django_migrations` VALUES ('13', 'webchat', '0001_initial', '2017-05-28 07:43:51');
INSERT INTO `django_migrations` VALUES ('14', 'webchat', '0002_userprofile_name', '2017-05-28 07:47:28');
INSERT INTO `django_migrations` VALUES ('15', 'webchat', '0003_auto_20170528_1625', '2017-05-28 08:25:46');

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
INSERT INTO `django_session` VALUES ('eyzhplwah6iochvfsrjt1cge6jictywb', 'OTQ4ZjJhYzgwYmM2YmU4OWI0ZjdiYWYxN2EzMWZjMWNiM2M4NGEzNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyMmY5N2Q3MTFlOWYxYzgyNTZkNWJhNjcwOTE4OTg2MWUyMTYwYzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=', '2017-06-11 08:08:26');
INSERT INTO `django_session` VALUES ('kkewry12dnt8s3r70trcsr05y8h93or9', 'OTUxZmFhNDliZmVhYzEwYjI0YzlhMjdmZjFhMDMzZWZlM2U3ZDY2ZDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc1YzZhYzhiMTc5Yjk1ZTQ0NmQyY2E0ZWMxM2I3ZmU1MWE2NjhmMmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=', '2017-06-11 08:16:24');
INSERT INTO `django_session` VALUES ('ks9acioije5w9ffrce5lz3l0uz0nxgae', 'NjUwYWY1Y2JlMzE4YTc5MzhlNmNkOTg1MzYyZDg0NWZlMjcwOGFiMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI0ZWRiNjEwN2FhMzM5ODhkNzZhN2IyNDUyZDg5OGE1ODU4MmM1ZjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-06-11 09:15:04');

-- ----------------------------
-- Table structure for `webchat_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `webchat_userprofile`;
CREATE TABLE `webchat_userprofile` (
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
  `gender` varchar(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `name` varchar(64),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_userprofile
-- ----------------------------
INSERT INTO `webchat_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$Cp3LXtG7lXT9$Ii77W5co58AQ4XDhUaigwjYFnm422GwLCIycTy+pZ30=', '2017-05-28 09:15:04', '1', 'ywh', '', '', 'yipwinghong@outlook.com', '1', '1', '2017-05-28 07:45:23', 'male', 'image/ywh_y1tkVBv.jpg', 'ywh');
INSERT INTO `webchat_userprofile` VALUES ('6', 'pbkdf2_sha256$24000$TZGJT51gI4Jj$JiNjg7aFEZx3rZHpRAbTFOflmnw3ZAh3RLrJf026/gE=', '2017-05-28 08:16:24', '1', 'Mitsuha', '', '', '', '1', '1', '2017-05-28 08:06:03', 'female', 'image/Mitsuha.jpg', 'Mitsuha');
INSERT INTO `webchat_userprofile` VALUES ('5', 'pbkdf2_sha256$24000$HaR9P5w0EENd$4SyKbiq8iEaGd7nm5GfA4ehIN0KTPXoAt/jrmc+O3RY=', '2017-05-28 08:08:26', '1', 'Taki', '', '', '', '1', '1', '2017-05-28 08:05:10', 'male', 'image/Taki.jpg', 'Taki');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_userprofile_friends
-- ----------------------------
INSERT INTO `webchat_userprofile_friends` VALUES ('11', '5', '1');
INSERT INTO `webchat_userprofile_friends` VALUES ('9', '6', '5');
INSERT INTO `webchat_userprofile_friends` VALUES ('10', '5', '6');
INSERT INTO `webchat_userprofile_friends` VALUES ('12', '1', '5');
INSERT INTO `webchat_userprofile_friends` VALUES ('13', '6', '1');
INSERT INTO `webchat_userprofile_friends` VALUES ('14', '1', '6');

-- ----------------------------
-- Table structure for `webchat_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `webchat_userprofile_groups`;
CREATE TABLE `webchat_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webchat_userprofile_groups_userprofile_id_33f92c0a_uniq` (`userprofile_id`,`group_id`),
  KEY `webchat_userprofile_groups_9c2a73e9` (`userprofile_id`),
  KEY `webchat_userprofile_groups_0e939a4f` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `webchat_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `webchat_userprofile_user_permissions`;
CREATE TABLE `webchat_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webchat_userprofile_user_permission_userprofile_id_bfb7adee_uniq` (`userprofile_id`,`permission_id`),
  KEY `webchat_userprofile_user_permissions_9c2a73e9` (`userprofile_id`),
  KEY `webchat_userprofile_user_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_userprofile_user_permissions
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_webgroup
-- ----------------------------
INSERT INTO `webchat_webgroup` VALUES ('1', 'group1', 'group1', '200', '1');
INSERT INTO `webchat_webgroup` VALUES ('2', 'group3', 'group3', '200', '6');
INSERT INTO `webchat_webgroup` VALUES ('3', 'group2', 'group2', '200', '5');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_webgroup_admins
-- ----------------------------
INSERT INTO `webchat_webgroup_admins` VALUES ('1', '1', '5');
INSERT INTO `webchat_webgroup_admins` VALUES ('2', '1', '6');
INSERT INTO `webchat_webgroup_admins` VALUES ('3', '2', '5');
INSERT INTO `webchat_webgroup_admins` VALUES ('4', '2', '6');
INSERT INTO `webchat_webgroup_admins` VALUES ('5', '3', '5');
INSERT INTO `webchat_webgroup_admins` VALUES ('6', '3', '6');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webchat_webgroup_members
-- ----------------------------
INSERT INTO `webchat_webgroup_members` VALUES ('1', '1', '1');
INSERT INTO `webchat_webgroup_members` VALUES ('2', '1', '5');
INSERT INTO `webchat_webgroup_members` VALUES ('3', '1', '6');
INSERT INTO `webchat_webgroup_members` VALUES ('4', '2', '1');
INSERT INTO `webchat_webgroup_members` VALUES ('5', '2', '5');
INSERT INTO `webchat_webgroup_members` VALUES ('6', '2', '6');
INSERT INTO `webchat_webgroup_members` VALUES ('7', '3', '1');
INSERT INTO `webchat_webgroup_members` VALUES ('8', '3', '5');
INSERT INTO `webchat_webgroup_members` VALUES ('9', '3', '6');
