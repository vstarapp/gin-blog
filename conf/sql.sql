/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 10.4.11-MariaDB : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `blog`;

/*Table structure for table `blog_article` */

DROP TABLE IF EXISTS `blog_article`;

CREATE TABLE `blog_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tag_id` int(10) unsigned DEFAULT 0 COMMENT '标签id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '文章标题',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '简述',
  `content` text DEFAULT NULL COMMENT '内容',
  `create_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL DEFAULT '' COMMENT '创建人',
  `modified_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `modified_by` varchar(100) NOT NULL DEFAULT '' COMMENT '修改人',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '状态0-禁用，1-启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章管理';

/*Data for the table `blog_article` */

/*Table structure for table `blog_auth` */

DROP TABLE IF EXISTS `blog_auth`;

CREATE TABLE `blog_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '文章标题',
  `create_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL DEFAULT '' COMMENT '创建人',
  `modified_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `modified_by` varchar(100) NOT NULL DEFAULT '' COMMENT '修改人',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '状态0-禁用，1-启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户管理';

/*Data for the table `blog_auth` */

/*Table structure for table `blog_tag` */

DROP TABLE IF EXISTS `blog_tag`;

CREATE TABLE `blog_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '标签名称',
  `create_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL DEFAULT '' COMMENT '创建人',
  `modified_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `modified_by` varchar(100) NOT NULL DEFAULT '' COMMENT '修改人',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '状态0-禁用，1-启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章标签管理';

/*Data for the table `blog_tag` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
