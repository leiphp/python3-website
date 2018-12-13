/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : awesome

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-12-13 15:41:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_image` varchar(500) NOT NULL,
  `name` varchar(50) NOT NULL,
  `summary` varchar(200) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_at` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogs
-- ----------------------------
INSERT INTO `blogs` VALUES ('0015446683171721794a2a44b7c434f948260a7425ad3d9000', '0015446660083266c28f05d90e940f2ba7ce265e17ec002000', '雷小天', 'http://www.gravatar.com/avatar/15f66cb7c1f999dc9ad8634343a85d78?d=mm&s=120', '雷小天Python博客系统', '雷小天Python博客系统', '雷小天Python博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容博客内容', '1544668317.17213');
INSERT INTO `blogs` VALUES ('001544668870975263e604a2b664c6abb68dff75a3a0a63000', '0015446660083266c28f05d90e940f2ba7ce265e17ec002000', '雷小天', 'http://www.gravatar.com/avatar/15f66cb7c1f999dc9ad8634343a85d78?d=mm&s=120', '测试Python日志', '测试Python日志测试Python日志测试Python日志', '测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志测试Python日志', '1544668870.9758');
INSERT INTO `blogs` VALUES ('001544669153659b26edbbc9afd4901b02ddf7ae5656ab6000', '001544666466008f2ec37b2961949598d8eedd25c7a36a3000', '张三', 'http://www.gravatar.com/avatar/d8769148cb4258974821edd7856172ea?d=mm&s=120', '张三写的日志other', '张三写的日志张三写的日志张三写的日志张三写的日志', '张三写的日志张三写的日志张三写的日志张三写的日志张三写的日志张三写的日志张三写的日志张三写的日志张三写的日志张三写的日志张三写的日志张三写的日志', '1544669153.65997');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` varchar(50) NOT NULL,
  `blog_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_image` varchar(500) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_at` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('001544685977933fe560d4d9446437593c54e447a143077000', '0015446683171721794a2a44b7c434f948260a7425ad3d9000', '0015446660083266c28f05d90e940f2ba7ce265e17ec002000', '雷小天', 'http://www.gravatar.com/avatar/15f66cb7c1f999dc9ad8634343a85d78?d=mm&s=120', '测试评论', '1544685977.93227');
INSERT INTO `comments` VALUES ('001544686019581cc2c11ed051840519d6cd682cf27563f000', '0015446683171721794a2a44b7c434f948260a7425ad3d9000', '001544666466008f2ec37b2961949598d8eedd25c7a36a3000', '张三', 'http://www.gravatar.com/avatar/d8769148cb4258974821edd7856172ea?d=mm&s=120', '我想说点什么', '1544686019.58165');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(500) NOT NULL,
  `created_at` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_email` (`email`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('0015446010760568a4a9e15e7aa4d378f059ab7728caf4c000', 'test3148957@example.com', 'abc123456', '0', 'leixiaotian', 'about:blank', '1544601076.05542');
INSERT INTO `users` VALUES ('001544601106718c52cfb097e4b4011af073ee218c615ac000', 'test8597177@example.com', 'abc123456', '0', 'leixiaotian', 'about:blank', '1544601106.71817');
INSERT INTO `users` VALUES ('001544601109089ac65654476cd47e6b83f707a39a1717c000', 'test4429333@example.com', 'abc123456', '0', 'leixiaotian', 'about:blank', '1544601109.08931');
INSERT INTO `users` VALUES ('0015446660083266c28f05d90e940f2ba7ce265e17ec002000', '1124378213@qq.com', '2e4cb3504c2826d750224e7b0d4f371e39baa493', '1', '雷小天', 'http://www.gravatar.com/avatar/15f66cb7c1f999dc9ad8634343a85d78?d=mm&s=120', '1544666008.32662');
INSERT INTO `users` VALUES ('001544666466008f2ec37b2961949598d8eedd25c7a36a3000', '1124378214@qq.com', 'cd3cf64da4441dbcbd85836a764eb79b9f02636e', '1', '张三', 'http://www.gravatar.com/avatar/d8769148cb4258974821edd7856172ea?d=mm&s=120', '1544666466.00825');
INSERT INTO `users` VALUES ('001544669186058ace70c07b13144ee9de7de252b29a3cd000', '1124378215@qq.com', 'b47b56d7ef879baa526246004e17aaedfae0f875', '0', '测试', 'http://www.gravatar.com/avatar/e77e8e83982c7a0d60bf02001fc2c529?d=mm&s=120', '1544669186.05883');
