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
  `created_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `created_by` varchar(100) NOT NULL DEFAULT '' COMMENT '创建人',
  `modified_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `modified_by` varchar(100) NOT NULL DEFAULT '' COMMENT '修改人',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '状态0-禁用，1-启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章管理';

/*Data for the table `blog_article` */

insert  into `blog_article`(`id`,`tag_id`,`title`,`desc`,`content`,`created_on`,`created_by`,`modified_on`,`modified_by`,`state`) values (2,1,'我的第一篇博客111','我的博客','//参数含义:数据库用户名、密码、主机ip、连接的数据库、端口号\nfunc dbConn(User, Password, Host, Db string, Port int) *gorm.DB {\n    connArgs := fmt.Sprintf(\"%s:%s@(%s:%d)/%s?charset=utf8&parseTime=True&loc=Local\", User, Password, Host, Port, Db)\n    db, err := gorm.Open(\"mysql\", connArgs)\n    if err != nil {\n        return nil\n    }\n    db.SingularTable(true)          //如果使用gorm来帮忙创建表时，这里填写false的话gorm会给表添加s后缀，填写true则不会\n    db.LogMode(true)                //打印sql语句\n    //开启连接池 \n    db.DB().SetMaxIdleConns(100)        //最大空闲连接\n    db.DB().SetMaxOpenConns(10000)      //最大连接数\n    db.DB().SetConnMaxLifetime(30)      //最大生存时间(s)\n\n    return db\n}\n\nfunc GetDb() (conn *gorm.DB) {\n    for {\n        conn = dbConn(\"root\", \"123456\", \"127.0.0.1\", \"test\", 3306)\n        if conn != nil {\n            break\n        }\n        fmt.Println(\"本次未获取到mysql连接\")\n    }\n    return conn\n}',1628071593,'全超林',0,'alam',0);

/*Table structure for table `blog_auth` */

DROP TABLE IF EXISTS `blog_auth`;

CREATE TABLE `blog_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `created_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `created_by` varchar(100) NOT NULL DEFAULT '' COMMENT '创建人',
  `modified_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `modified_by` varchar(100) NOT NULL DEFAULT '' COMMENT '修改人',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '状态0-禁用，1-启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户管理';

/*Data for the table `blog_auth` */

insert  into `blog_auth`(`id`,`username`,`password`,`created_on`,`created_by`,`modified_on`,`modified_by`,`state`) values (1,'zhangsan','123456',0,'',0,'',1),(2,'quanchaolin','$2a$04$49rKFOuAQ9.IVSuqQBcG5uwS71P2hrHamaVGP1/A11d',1628154846,'',0,'',1),(3,'tangmin','$2a$04$HfsilslvKv/4UJKer85op.Z6uTBGMk548f1hw0S0mxsKptRmsflrm',1628155202,'',0,'',1);

/*Table structure for table `blog_tag` */

DROP TABLE IF EXISTS `blog_tag`;

CREATE TABLE `blog_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '标签名称',
  `created_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `created_by` varchar(100) NOT NULL DEFAULT '' COMMENT '创建人',
  `modified_on` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `modified_by` varchar(100) NOT NULL DEFAULT '' COMMENT '修改人',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '状态0-禁用，1-启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文章标签管理';

/*Data for the table `blog_tag` */

insert  into `blog_tag`(`id`,`name`,`created_on`,`created_by`,`modified_on`,`modified_by`,`state`) values (1,'golang',1627972137,'alam',1627972137,'alam',1),(2,'C语言',1627972137,'admin',0,'',1),(3,'C++',1627972137,'',0,'',1),(4,'PHP',1627972137,'',0,'',1),(5,'Javascript',1627972137,'',0,'',1),(6,'Java',0,'alam',1628150806,'alam',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
