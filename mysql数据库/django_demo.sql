/*
Navicat MySQL Data Transfer

Source Server         : mysql5.6
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : django_demo

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2020-06-29 01:18:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `app_goods`
-- ----------------------------
DROP TABLE IF EXISTS `app_goods`;
CREATE TABLE `app_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sale_price` double NOT NULL,
  `cost_price` double NOT NULL,
  `weight` double NOT NULL,
  `sort` int(11) NOT NULL,
  `produce_date` date NOT NULL,
  `limit_date` date NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `lower` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_goods_provider_id_bc0ce48f_fk_app_provider_id` (`provider_id`),
  CONSTRAINT `app_goods_provider_id_bc0ce48f_fk_app_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `app_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_goods
-- ----------------------------
INSERT INTO `app_goods` VALUES ('1', '5L菜籽油', '78', '55', '4.8', '2', '2020-06-02', '2021-01-15', '0', '1', '0');
INSERT INTO `app_goods` VALUES ('2', '东北珍珠米', '65', '48', '10', '2', '2020-06-13', '2021-03-19', '0', '1', '0');
INSERT INTO `app_goods` VALUES ('3', '娃哈哈100G*24瓶', '30', '20', '2.4', '0', '2020-06-03', '2021-05-06', '0', '2', '0');
INSERT INTO `app_goods` VALUES ('4', '苏泊尔电饭煲', '230', '180', '4.9', '4', '2020-06-04', '2021-09-25', '0', '2', '0');

-- ----------------------------
-- Table structure for `app_manager`
-- ----------------------------
DROP TABLE IF EXISTS `app_manager`;
CREATE TABLE `app_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `pwd` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` int(11) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `authority` int(11) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_manager
-- ----------------------------
INSERT INTO `app_manager` VALUES ('1', 'admin', 'admin', '王中涛', '1', '13508029834', '0', '0');
INSERT INTO `app_manager` VALUES ('2', 'manager', '123456', '李经理', '1', '13085081034', '1', '0');
INSERT INTO `app_manager` VALUES ('3', 'buyer', '123456', '王采购', '0', '13508180834', '2', '0');
INSERT INTO `app_manager` VALUES ('4', 'seller', '123456', '张销售', '0', '13508120834', '3', '0');

-- ----------------------------
-- Table structure for `app_message`
-- ----------------------------
DROP TABLE IF EXISTS `app_message`;
CREATE TABLE `app_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime(6) NOT NULL,
  `type` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `contact` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_message
-- ----------------------------
INSERT INTO `app_message` VALUES ('1', '2020-06-29 00:35:03.069204', '0', '各位同仁，加倍努力，争取再创佳绩！', '13508029834', '王中涛', '0');

-- ----------------------------
-- Table structure for `app_provider`
-- ----------------------------
DROP TABLE IF EXISTS `app_provider`;
CREATE TABLE `app_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_provider
-- ----------------------------
INSERT INTO `app_provider` VALUES ('1', '四川天天生鲜厂家', '成都市双流区航天路10号', '028-8294293', '0');
INSERT INTO `app_provider` VALUES ('2', '四川农产品供应总代理', '成都市双流区飞霞路10号', '028-8298293', '0');

-- ----------------------------
-- Table structure for `app_record`
-- ----------------------------
DROP TABLE IF EXISTS `app_record`;
CREATE TABLE `app_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) NOT NULL,
  `sale_num` int(11) DEFAULT NULL,
  `goods_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `purchase_num` int(11) DEFAULT NULL,
  `withdraw_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_record_goods_id_03d75759_fk_app_goods_id` (`goods_id`),
  CONSTRAINT `app_record_goods_id_03d75759_fk_app_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `app_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_record
-- ----------------------------
INSERT INTO `app_record` VALUES ('1', '1', null, '1', '2020-06-28', '10', null);
INSERT INTO `app_record` VALUES ('2', '2', null, '2', '2020-06-28', '15', null);
INSERT INTO `app_record` VALUES ('3', '1', null, '3', '2020-06-28', '30', null);
INSERT INTO `app_record` VALUES ('4', '1', '1', '1', '2020-06-28', null, null);
INSERT INTO `app_record` VALUES ('5', '1', '2', '3', '2020-06-28', null, null);
INSERT INTO `app_record` VALUES ('6', '2', null, '4', '2020-06-28', '25', null);
INSERT INTO `app_record` VALUES ('7', '2', '2', '2', '2020-06-28', null, null);
INSERT INTO `app_record` VALUES ('8', '2', '1', '4', '2020-06-28', null, null);
INSERT INTO `app_record` VALUES ('9', '4', null, '1', '2020-06-29', '22', null);
INSERT INTO `app_record` VALUES ('10', '1', '1', '1', '2020-06-29', null, null);
INSERT INTO `app_record` VALUES ('11', '1', '2', '3', '2020-06-29', null, null);
INSERT INTO `app_record` VALUES ('12', '1', '1', '1', '2020-06-29', null, null);
INSERT INTO `app_record` VALUES ('13', '1', '2', '3', '2020-06-29', null, null);

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add goods', '7', 'add_goods');
INSERT INTO `auth_permission` VALUES ('26', 'Can change goods', '7', 'change_goods');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete goods', '7', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('28', 'Can view goods', '7', 'view_goods');
INSERT INTO `auth_permission` VALUES ('29', 'Can add manager', '8', 'add_manager');
INSERT INTO `auth_permission` VALUES ('30', 'Can change manager', '8', 'change_manager');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete manager', '8', 'delete_manager');
INSERT INTO `auth_permission` VALUES ('32', 'Can view manager', '8', 'view_manager');
INSERT INTO `auth_permission` VALUES ('33', 'Can add message', '9', 'add_message');
INSERT INTO `auth_permission` VALUES ('34', 'Can change message', '9', 'change_message');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete message', '9', 'delete_message');
INSERT INTO `auth_permission` VALUES ('36', 'Can view message', '9', 'view_message');
INSERT INTO `auth_permission` VALUES ('37', 'Can add provider', '10', 'add_provider');
INSERT INTO `auth_permission` VALUES ('38', 'Can change provider', '10', 'change_provider');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete provider', '10', 'delete_provider');
INSERT INTO `auth_permission` VALUES ('40', 'Can view provider', '10', 'view_provider');
INSERT INTO `auth_permission` VALUES ('41', 'Can add record', '11', 'add_record');
INSERT INTO `auth_permission` VALUES ('42', 'Can change record', '11', 'change_record');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete record', '11', 'delete_record');
INSERT INTO `auth_permission` VALUES ('44', 'Can view record', '11', 'view_record');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('7', 'app', 'goods');
INSERT INTO `django_content_type` VALUES ('8', 'app', 'manager');
INSERT INTO `django_content_type` VALUES ('9', 'app', 'message');
INSERT INTO `django_content_type` VALUES ('10', 'app', 'provider');
INSERT INTO `django_content_type` VALUES ('11', 'app', 'record');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-06-28 14:28:15.491149');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2020-06-28 14:28:16.255338');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2020-06-28 14:28:16.883978');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2020-06-28 14:28:17.035278');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2020-06-28 14:28:17.048811');
INSERT INTO `django_migrations` VALUES ('6', 'app', '0001_initial', '2020-06-28 14:28:17.369267');
INSERT INTO `django_migrations` VALUES ('7', 'app', '0002_auto_20190116_2010', '2020-06-28 14:28:17.669803');
INSERT INTO `django_migrations` VALUES ('8', 'app', '0003_auto_20190117_0132', '2020-06-28 14:28:17.747782');
INSERT INTO `django_migrations` VALUES ('9', 'app', '0004_auto_20190117_0147', '2020-06-28 14:28:18.552826');
INSERT INTO `django_migrations` VALUES ('10', 'app', '0005_auto_20190117_1154', '2020-06-28 14:28:18.644683');
INSERT INTO `django_migrations` VALUES ('11', 'app', '0006_auto_20190117_2127', '2020-06-28 14:28:18.666289');
INSERT INTO `django_migrations` VALUES ('12', 'app', '0007_goods_preserve', '2020-06-28 14:28:18.754585');
INSERT INTO `django_migrations` VALUES ('13', 'app', '0008_auto_20190119_2103', '2020-06-28 14:28:18.889952');
INSERT INTO `django_migrations` VALUES ('14', 'app', '0009_auto_20190119_2136', '2020-06-28 14:28:19.020462');
INSERT INTO `django_migrations` VALUES ('15', 'app', '0010_auto_20190121_0026', '2020-06-28 14:28:19.160825');
INSERT INTO `django_migrations` VALUES ('16', 'app', '0011_message_isread', '2020-06-28 14:28:19.236089');
INSERT INTO `django_migrations` VALUES ('17', 'contenttypes', '0002_remove_content_type_name', '2020-06-28 14:28:19.377388');
INSERT INTO `django_migrations` VALUES ('18', 'auth', '0002_alter_permission_name_max_length', '2020-06-28 14:28:19.492919');
INSERT INTO `django_migrations` VALUES ('19', 'auth', '0003_alter_user_email_max_length', '2020-06-28 14:28:19.564837');
INSERT INTO `django_migrations` VALUES ('20', 'auth', '0004_alter_user_username_opts', '2020-06-28 14:28:19.580413');
INSERT INTO `django_migrations` VALUES ('21', 'auth', '0005_alter_user_last_login_null', '2020-06-28 14:28:19.656830');
INSERT INTO `django_migrations` VALUES ('22', 'auth', '0006_require_contenttypes_0002', '2020-06-28 14:28:19.669256');
INSERT INTO `django_migrations` VALUES ('23', 'auth', '0007_alter_validators_add_error_messages', '2020-06-28 14:28:19.687803');
INSERT INTO `django_migrations` VALUES ('24', 'auth', '0008_alter_user_username_max_length', '2020-06-28 14:28:19.771183');
INSERT INTO `django_migrations` VALUES ('25', 'auth', '0009_alter_user_last_name_max_length', '2020-06-28 14:28:19.851394');
INSERT INTO `django_migrations` VALUES ('26', 'auth', '0010_alter_group_name_max_length', '2020-06-28 14:28:19.932173');
INSERT INTO `django_migrations` VALUES ('27', 'auth', '0011_update_proxy_permissions', '2020-06-28 14:28:19.953732');
INSERT INTO `django_migrations` VALUES ('28', 'sessions', '0001_initial', '2020-06-28 14:28:20.005549');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('yoakib5hvfvphmu1t3ncpatxbzyi6dkl', 'ZGVhNmFkMDE4YjQ0NjI5ZWY2OWFjN2ZkMTI4OWYzYmVlOWEwMDM0OTp7ImlzX2xvZ2luIjoiMSIsImFjY291bnRfaWQiOjQsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2020-07-13 01:13:14.390013');
