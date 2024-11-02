/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - baoxianyewu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`baoxianyewu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `baoxianyewu`;

/*Table structure for table `baoxian` */

DROP TABLE IF EXISTS `baoxian`;

CREATE TABLE `baoxian` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bxname` varchar(200) DEFAULT NULL COMMENT '保险名称 Search111 ',
  `bxmoney` decimal(10,4) DEFAULT NULL COMMENT '保险费用  Search111 ',
  `bxamountpaid` decimal(10,4) DEFAULT NULL COMMENT '赔偿金额  Search111 ',
  `leixing_types` int(11) DEFAULT NULL COMMENT '保险类型  Search111 ',
  `neirong_content` varchar(200) DEFAULT NULL COMMENT '保险详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='保险';

/*Data for the table `baoxian` */

insert  into `baoxian`(`id`,`bxname`,`bxmoney`,`bxamountpaid`,`leixing_types`,`neirong_content`,`create_time`) values (1,'保险1','10000.0000','100000.0000',2,'保险详情1\r\n','2021-03-24 09:27:36'),(2,'保险2','2000.0000','20000.0000',1,'保险详情2\r\n','2021-03-24 10:56:07'),(3,'保险3','3000.0000','300000.0000',3,'保险详情3\r\n','2021-03-24 10:59:57');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/gongchengcailiao/upload/1614999756013.jpg'),(2,'picture2','http://localhost:8080/gongchengcailiao/upload/1614999769770.jpg'),(3,'picture3','http://localhost:8080/gongchengcailiao/upload/1614999778981.jpg'),(6,'homepage',NULL);

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别',1,'男',NULL,'2021-03-24 09:21:16'),(2,'sex_types','性别',2,'女',NULL,'2021-03-24 09:21:16'),(3,'leixing_types','保险类型',1,'医疗保险',NULL,'2021-03-24 09:21:16'),(4,'leixing_types','保险类型',2,'意外保险',NULL,'2021-03-24 09:21:16'),(5,'leixing_types','保险类型',3,'养老保险',NULL,'2021-03-24 09:21:16'),(6,'leixing_types','保险类型',4,'其他保险',NULL,'2021-03-24 09:21:16'),(7,'jieguo_types','申请结果',1,'同意',NULL,'2021-03-24 09:21:16'),(8,'jieguo_types','申请结果',2,'拒绝',NULL,'2021-03-24 09:21:16');

/*Table structure for table `gaoumai` */

DROP TABLE IF EXISTS `gaoumai`;

CREATE TABLE `gaoumai` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '购买人',
  `baoxian_id` int(11) DEFAULT NULL COMMENT '购买保险',
  `goumai_time` timestamp NULL DEFAULT NULL COMMENT '购买时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='已有保险';

/*Data for the table `gaoumai` */

insert  into `gaoumai`(`id`,`yonghu_id`,`baoxian_id`,`goumai_time`,`create_time`) values (2,2,2,'2021-03-24 10:57:20','2021-03-24 10:57:20'),(3,3,3,'2021-03-24 11:00:25','2021-03-24 11:00:25');

/*Table structure for table `shenqing` */

DROP TABLE IF EXISTS `shenqing`;

CREATE TABLE `shenqing` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '申请人',
  `baoxian_id` int(11) DEFAULT NULL COMMENT '购买保险',
  `amountpaid` decimal(10,4) DEFAULT NULL COMMENT '赔偿金额',
  `jieguo_types` int(11) DEFAULT NULL COMMENT '申请结果 Search111',
  `shenqing_content` varchar(200) DEFAULT NULL COMMENT '申请原因',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='赔偿申请';

/*Data for the table `shenqing` */

insert  into `shenqing`(`id`,`yonghu_id`,`baoxian_id`,`amountpaid`,`jieguo_types`,`shenqing_content`,`create_time`) values (2,2,2,'20000.0000',1,'没钱了','2021-03-24 10:57:36'),(3,3,3,'300000.0000',2,'缺钱','2021-03-24 11:00:51');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (5,1,'admin','users','管理员','sndssw17i8zenvw60grbgxssyaifn7s4','2021-03-23 14:15:15','2021-03-24 12:02:03'),(6,1,'111','yonghu','用户','tzys29yu6n24jv54qok6oxbjwsaawcx4','2021-03-23 16:55:29','2021-03-24 11:52:31'),(7,2,'222','yonghu','用户','c5infg3ncb3twrz6lvtjj7u67nnfmepa','2021-03-23 16:58:43','2021-03-24 11:57:07'),(8,3,'333','yonghu','用户','nit67hukqqq7n5xjq3lr6d32k1zw4vl8','2021-03-23 17:22:11','2021-03-24 12:00:14');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-02-25 15:59:12');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '名称  Search111',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` tinyint(4) DEFAULT NULL COMMENT '性别  Search111',
  `phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `id_number` varchar(255) DEFAULT NULL COMMENT '身份证',
  `role` varchar(255) DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`name`,`username`,`password`,`img_photo`,`sex_types`,`phone`,`id_number`,`role`) values (2,'小札','222','222','http://localhost:8080/baoxianyewu/file/download?fileName=1616554529173.jpg',2,'17754548971','410882200011274855','用户'),(3,'小张','333','333','http://localhost:8080/baoxianyewu/file/download?fileName=1616554519862.jpg',1,'17796688956','410882200011264544','用户');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
