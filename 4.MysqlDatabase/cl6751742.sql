-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl6751742
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cl6751742`
--

/*!40000 DROP DATABASE IF EXISTS `cl6751742`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl6751742` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl6751742`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussjingdianxinxi`
--

DROP TABLE IF EXISTS `discussjingdianxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussjingdianxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='景点信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussjingdianxinxi`
--

LOCK TABLES `discussjingdianxinxi` WRITE;
/*!40000 ALTER TABLE `discussjingdianxinxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussjingdianxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussjiudianxinxi`
--

DROP TABLE IF EXISTS `discussjiudianxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussjiudianxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='酒店信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussjiudianxinxi`
--

LOCK TABLES `discussjiudianxinxi` WRITE;
/*!40000 ALTER TABLE `discussjiudianxinxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussjiudianxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jingdianleixing`
--

DROP TABLE IF EXISTS `jingdianleixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jingdianleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jingdianleixing` varchar(200) NOT NULL COMMENT '景点类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jingdianleixing` (`jingdianleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='景点类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jingdianleixing`
--

LOCK TABLES `jingdianleixing` WRITE;
/*!40000 ALTER TABLE `jingdianleixing` DISABLE KEYS */;
INSERT INTO `jingdianleixing` VALUES (41,'2024-02-17 08:41:42','景点类型1'),(42,'2024-02-17 08:41:42','景点类型2'),(43,'2024-02-17 08:41:42','景点类型3'),(44,'2024-02-17 08:41:42','景点类型4'),(45,'2024-02-17 08:41:42','景点类型5'),(46,'2024-02-17 08:41:42','景点类型6');
/*!40000 ALTER TABLE `jingdianleixing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jingdianxinxi`
--

DROP TABLE IF EXISTS `jingdianxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jingdianxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jingdianmingcheng` varchar(200) NOT NULL COMMENT '景点名称',
  `jingdiantupian` longtext COMMENT '景点图片',
  `menpiaojiage` double NOT NULL COMMENT '门票价格',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `jingdianleixing` varchar(200) DEFAULT NULL COMMENT '景点类型',
  `kaifangshijian` varchar(200) DEFAULT NULL COMMENT '开放时间',
  `luxiantuijian` longtext COMMENT '路线推荐',
  `jingdianjieshao` longtext COMMENT '景点介绍',
  `jingdiandizhi` varchar(200) DEFAULT NULL COMMENT '景点地址',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT NULL COMMENT '点击次数',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  `shangjiamingcheng` varchar(200) DEFAULT NULL COMMENT '商家名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='景点信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jingdianxinxi`
--

LOCK TABLES `jingdianxinxi` WRITE;
/*!40000 ALTER TABLE `jingdianxinxi` DISABLE KEYS */;
INSERT INTO `jingdianxinxi` VALUES (51,'2024-02-17 08:41:42','景点名称1','file/jingdianxinxiJingdiantupian1.jpg,file/jingdianxinxiJingdiantupian2.jpg,file/jingdianxinxiJingdiantupian3.jpg',1,1,'景点类型1','开放时间1','路线推荐1','景点介绍1','景点地址1',1,'2024-02-17 16:41:42',1,'商家账号1','商家名称1'),(52,'2024-02-17 08:41:42','景点名称2','file/jingdianxinxiJingdiantupian2.jpg,file/jingdianxinxiJingdiantupian3.jpg,file/jingdianxinxiJingdiantupian4.jpg',2,2,'景点类型2','开放时间2','路线推荐2','景点介绍2','景点地址2',2,'2024-02-17 16:41:42',2,'商家账号2','商家名称2'),(53,'2024-02-17 08:41:42','景点名称3','file/jingdianxinxiJingdiantupian3.jpg,file/jingdianxinxiJingdiantupian4.jpg,file/jingdianxinxiJingdiantupian5.jpg',3,3,'景点类型3','开放时间3','路线推荐3','景点介绍3','景点地址3',3,'2024-02-17 16:41:42',3,'商家账号3','商家名称3'),(54,'2024-02-17 08:41:42','景点名称4','file/jingdianxinxiJingdiantupian4.jpg,file/jingdianxinxiJingdiantupian5.jpg,file/jingdianxinxiJingdiantupian6.jpg',4,4,'景点类型4','开放时间4','路线推荐4','景点介绍4','景点地址4',4,'2024-02-17 16:41:42',4,'商家账号4','商家名称4'),(55,'2024-02-17 08:41:42','景点名称5','file/jingdianxinxiJingdiantupian5.jpg,file/jingdianxinxiJingdiantupian6.jpg,file/jingdianxinxiJingdiantupian7.jpg',5,5,'景点类型5','开放时间5','路线推荐5','景点介绍5','景点地址5',5,'2024-02-17 16:41:42',5,'商家账号5','商家名称5'),(56,'2024-02-17 08:41:42','景点名称6','file/jingdianxinxiJingdiantupian6.jpg,file/jingdianxinxiJingdiantupian7.jpg,file/jingdianxinxiJingdiantupian8.jpg',6,6,'景点类型6','开放时间6','路线推荐6','景点介绍6','景点地址6',6,'2024-02-17 16:41:42',6,'商家账号6','商家名称6');
/*!40000 ALTER TABLE `jingdianxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiudianleixing`
--

DROP TABLE IF EXISTS `jiudianleixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiudianleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiudianleixing` varchar(200) NOT NULL COMMENT '酒店类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiudianleixing` (`jiudianleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='酒店类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiudianleixing`
--

LOCK TABLES `jiudianleixing` WRITE;
/*!40000 ALTER TABLE `jiudianleixing` DISABLE KEYS */;
INSERT INTO `jiudianleixing` VALUES (71,'2024-02-17 08:41:42','酒店类型1'),(72,'2024-02-17 08:41:42','酒店类型2'),(73,'2024-02-17 08:41:42','酒店类型3'),(74,'2024-02-17 08:41:42','酒店类型4'),(75,'2024-02-17 08:41:42','酒店类型5'),(76,'2024-02-17 08:41:42','酒店类型6');
/*!40000 ALTER TABLE `jiudianleixing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiudianxinxi`
--

DROP TABLE IF EXISTS `jiudianxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiudianxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fangjianmingcheng` varchar(200) NOT NULL COMMENT '房间名称',
  `jiudianleixing` varchar(200) DEFAULT NULL COMMENT '酒店类型',
  `fangjianleixing` varchar(200) NOT NULL COMMENT '房间类型',
  `fangjiantupian` longtext COMMENT '房间图片',
  `fangjiandizhi` varchar(200) DEFAULT NULL COMMENT '房间地址',
  `yiwanjiage` int(11) NOT NULL COMMENT '一晚价格',
  `fuwudianhua` varchar(200) DEFAULT NULL COMMENT '服务电话',
  `fangneisheshi` longtext COMMENT '房内设施',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  `fangjianzhuangtai` varchar(200) DEFAULT NULL COMMENT '房间状态',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT NULL COMMENT '点击次数',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  `shangjiamingcheng` varchar(200) DEFAULT NULL COMMENT '商家名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='酒店信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiudianxinxi`
--

LOCK TABLES `jiudianxinxi` WRITE;
/*!40000 ALTER TABLE `jiudianxinxi` DISABLE KEYS */;
INSERT INTO `jiudianxinxi` VALUES (81,'2024-02-17 08:41:42','房间名称1','酒店类型1','单人间','file/jiudianxinxiFangjiantupian1.jpg,file/jiudianxinxiFangjiantupian2.jpg,file/jiudianxinxiFangjiantupian3.jpg','房间地址1',1,'19819881111','房内设施1',1,'已预定','2024-02-17 16:41:42',1,'商家账号1','商家名称1'),(82,'2024-02-17 08:41:42','房间名称2','酒店类型2','单人间','file/jiudianxinxiFangjiantupian2.jpg,file/jiudianxinxiFangjiantupian3.jpg,file/jiudianxinxiFangjiantupian4.jpg','房间地址2',2,'19819881112','房内设施2',2,'已预定','2024-02-17 16:41:42',2,'商家账号2','商家名称2'),(83,'2024-02-17 08:41:42','房间名称3','酒店类型3','单人间','file/jiudianxinxiFangjiantupian3.jpg,file/jiudianxinxiFangjiantupian4.jpg,file/jiudianxinxiFangjiantupian5.jpg','房间地址3',3,'19819881113','房内设施3',3,'已预定','2024-02-17 16:41:42',3,'商家账号3','商家名称3'),(84,'2024-02-17 08:41:42','房间名称4','酒店类型4','单人间','file/jiudianxinxiFangjiantupian4.jpg,file/jiudianxinxiFangjiantupian5.jpg,file/jiudianxinxiFangjiantupian6.jpg','房间地址4',4,'19819881114','房内设施4',4,'已预定','2024-02-17 16:41:42',4,'商家账号4','商家名称4'),(85,'2024-02-17 08:41:42','房间名称5','酒店类型5','单人间','file/jiudianxinxiFangjiantupian5.jpg,file/jiudianxinxiFangjiantupian6.jpg,file/jiudianxinxiFangjiantupian7.jpg','房间地址5',5,'19819881115','房内设施5',5,'已预定','2024-02-17 16:41:42',5,'商家账号5','商家名称5'),(86,'2024-02-17 08:41:42','房间名称6','酒店类型6','单人间','file/jiudianxinxiFangjiantupian6.jpg,file/jiudianxinxiFangjiantupian7.jpg,file/jiudianxinxiFangjiantupian8.jpg','房间地址6',6,'19819881116','房内设施6',6,'已预定','2024-02-17 16:41:42',6,'商家账号6','商家名称6');
/*!40000 ALTER TABLE `jiudianxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiudianyuding`
--

DROP TABLE IF EXISTS `jiudianyuding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiudianyuding` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fangjianmingcheng` varchar(200) NOT NULL COMMENT '房间名称',
  `fangjianleixing` varchar(200) NOT NULL COMMENT '房间类型',
  `jiudianleixing` varchar(200) DEFAULT NULL COMMENT '酒店类型',
  `fangjiandizhi` varchar(200) DEFAULT NULL COMMENT '房间地址',
  `yiwanjiage` double NOT NULL COMMENT '一晚价格',
  `yudingtianshu` int(11) DEFAULT NULL COMMENT '预定天数',
  `zongjia` varchar(200) DEFAULT NULL COMMENT '总价',
  `fuwudianhua` varchar(200) DEFAULT NULL COMMENT '服务电话',
  `yudingshijian` datetime DEFAULT NULL COMMENT '预定时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `ispay` varchar(200) DEFAULT NULL COMMENT '是否支付',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  `shangjiamingcheng` varchar(200) DEFAULT NULL COMMENT '商家名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='酒店预定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiudianyuding`
--

LOCK TABLES `jiudianyuding` WRITE;
/*!40000 ALTER TABLE `jiudianyuding` DISABLE KEYS */;
INSERT INTO `jiudianyuding` VALUES (91,'2024-02-17 08:41:42','房间名称1','房间类型1','酒店类型1','房间地址1',1,1,'总价1','19819881111','2024-02-17 16:41:42','用户账号1','用户姓名1','未支付','是','','商家账号1','商家名称1'),(92,'2024-02-17 08:41:42','房间名称2','房间类型2','酒店类型2','房间地址2',2,2,'总价2','19819881112','2024-02-17 16:41:42','用户账号2','用户姓名2','未支付','是','','商家账号2','商家名称2'),(93,'2024-02-17 08:41:42','房间名称3','房间类型3','酒店类型3','房间地址3',3,3,'总价3','19819881113','2024-02-17 16:41:42','用户账号3','用户姓名3','未支付','是','','商家账号3','商家名称3'),(94,'2024-02-17 08:41:42','房间名称4','房间类型4','酒店类型4','房间地址4',4,4,'总价4','19819881114','2024-02-17 16:41:42','用户账号4','用户姓名4','未支付','是','','商家账号4','商家名称4'),(95,'2024-02-17 08:41:42','房间名称5','房间类型5','酒店类型5','房间地址5',5,5,'总价5','19819881115','2024-02-17 16:41:42','用户账号5','用户姓名5','未支付','是','','商家账号5','商家名称5'),(96,'2024-02-17 08:41:42','房间名称6','房间类型6','酒店类型6','房间地址6',6,6,'总价6','19819881116','2024-02-17 16:41:42','用户账号6','用户姓名6','未支付','是','','商家账号6','商家名称6');
/*!40000 ALTER TABLE `jiudianyuding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menpiaogoumai`
--

DROP TABLE IF EXISTS `menpiaogoumai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menpiaogoumai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanbianhao` varchar(200) DEFAULT NULL COMMENT '订单编号',
  `jingdianmingcheng` varchar(200) DEFAULT NULL COMMENT '景点名称',
  `menpiaojiage` double DEFAULT NULL COMMENT '门票价格',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `dingdanjine` double DEFAULT NULL COMMENT '订单金额',
  `goumaishijian` datetime DEFAULT NULL COMMENT '购买时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `ispay` varchar(200) DEFAULT NULL COMMENT '是否支付',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  `shangjiamingcheng` varchar(200) DEFAULT NULL COMMENT '商家名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dingdanbianhao` (`dingdanbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='门票购买';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menpiaogoumai`
--

LOCK TABLES `menpiaogoumai` WRITE;
/*!40000 ALTER TABLE `menpiaogoumai` DISABLE KEYS */;
INSERT INTO `menpiaogoumai` VALUES (101,'2024-02-17 08:41:42','1111111111','景点名称1',1,1,1,'2024-02-17 16:41:42','用户账号1','用户姓名1','手机号码1','未支付','商家账号1','商家名称1'),(102,'2024-02-17 08:41:42','2222222222','景点名称2',2,2,2,'2024-02-17 16:41:42','用户账号2','用户姓名2','手机号码2','未支付','商家账号2','商家名称2'),(103,'2024-02-17 08:41:42','3333333333','景点名称3',3,3,3,'2024-02-17 16:41:42','用户账号3','用户姓名3','手机号码3','未支付','商家账号3','商家名称3'),(104,'2024-02-17 08:41:42','4444444444','景点名称4',4,4,4,'2024-02-17 16:41:42','用户账号4','用户姓名4','手机号码4','未支付','商家账号4','商家名称4'),(105,'2024-02-17 08:41:42','5555555555','景点名称5',5,5,5,'2024-02-17 16:41:42','用户账号5','用户姓名5','手机号码5','未支付','商家账号5','商家名称5'),(106,'2024-02-17 08:41:42','6666666666','景点名称6',6,6,6,'2024-02-17 16:41:42','用户账号6','用户姓名6','手机号码6','未支付','商家账号6','商家名称6');
/*!40000 ALTER TABLE `menpiaogoumai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-02-17 08:41:42','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"旅游资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"fontClass\":\"icon-common34\",\"menu\":\"旅游资讯\",\"unicode\":\"&#xee85;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"酒店信息\",\"menuJump\":\"列表\",\"tableName\":\"jiudianxinxi\"},{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"酒店预定\",\"menuJump\":\"列表\",\"tableName\":\"jiudianyuding\"},{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"酒店类型\",\"menuJump\":\"列表\",\"tableName\":\"jiudianleixing\"}],\"fontClass\":\"icon-common31\",\"menu\":\"酒店信息管理\",\"unicode\":\"&#xee48;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"景点信息\",\"menuJump\":\"列表\",\"tableName\":\"jingdianxinxi\"},{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"门票购买\",\"menuJump\":\"列表\",\"tableName\":\"menpiaogoumai\"},{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"景点类型\",\"menuJump\":\"列表\",\"tableName\":\"jingdianleixing\"}],\"fontClass\":\"icon-common4\",\"menu\":\"景点信息管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"商家\",\"menuJump\":\"列表\",\"tableName\":\"shangjia\"}],\"fontClass\":\"icon-user2\",\"menu\":\"商家管理\",\"unicode\":\"&#xef98;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common26\",\"menu\":\"管理员管理\",\"unicode\":\"&#xee2b;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-newshot\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"}],\"fontClass\":\"icon-user7\",\"menu\":\"用户管理\",\"unicode\":\"&#xef9d;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"购买\"],\"menu\":\"景点信息\",\"menuJump\":\"列表\",\"tableName\":\"jingdianxinxi\"}],\"menu\":\"景点信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"预定\"],\"menu\":\"酒店信息\",\"menuJump\":\"列表\",\"tableName\":\"jiudianxinxi\"}],\"menu\":\"酒店信息管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\",\"删除\",\"支付\"],\"menu\":\"酒店预定\",\"menuJump\":\"列表\",\"tableName\":\"jiudianyuding\"}],\"fontClass\":\"icon-common31\",\"menu\":\"酒店信息管理\",\"unicode\":\"&#xee48;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\"],\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common39\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xeeba;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"删除\",\"支付\"],\"menu\":\"门票购买\",\"menuJump\":\"列表\",\"tableName\":\"menpiaogoumai\"}],\"fontClass\":\"icon-common4\",\"menu\":\"景点信息管理\",\"unicode\":\"&#xedab;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"购买\"],\"menu\":\"景点信息\",\"menuJump\":\"列表\",\"tableName\":\"jingdianxinxi\"}],\"menu\":\"景点信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"预定\"],\"menu\":\"酒店信息\",\"menuJump\":\"列表\",\"tableName\":\"jiudianxinxi\"}],\"menu\":\"酒店信息管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"酒店预定\",\"menuJump\":\"列表\",\"tableName\":\"jiudianyuding\"},{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"酒店类型\",\"menuJump\":\"列表\",\"tableName\":\"jiudianleixing\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"酒店信息\",\"menuJump\":\"列表\",\"tableName\":\"jiudianxinxi\"}],\"fontClass\":\"icon-common31\",\"menu\":\"酒店信息管理\",\"unicode\":\"&#xee48;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"门票购买\",\"menuJump\":\"列表\",\"tableName\":\"menpiaogoumai\"},{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"景点类型\",\"menuJump\":\"列表\",\"tableName\":\"jingdianleixing\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"景点信息\",\"menuJump\":\"列表\",\"tableName\":\"jingdianxinxi\"}],\"fontClass\":\"icon-common4\",\"menu\":\"景点信息管理\",\"unicode\":\"&#xedab;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"购买\"],\"menu\":\"景点信息\",\"menuJump\":\"列表\",\"tableName\":\"jingdianxinxi\"}],\"menu\":\"景点信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"预定\"],\"menu\":\"酒店信息\",\"menuJump\":\"列表\",\"tableName\":\"jiudianxinxi\"}],\"menu\":\"酒店信息管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"商家\",\"tableName\":\"shangjia\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='旅游资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (111,'2024-02-17 08:41:42','青花瓷','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起','file/newsPicture1.jpg','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起， 隔江千万里，在瓶底书前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起， 晕开了局，如传世的青花瓷自顾自美丽，你眼带笑意，色白花青的锦鲤跃然于碗底，临摹宋体落款时却惦记着你，你隐藏在窑烧里千年的秘密，极细腻犹如绣花针落地，帘外芭蕉惹骤雨门环惹铜绿，而我路过那江南小镇惹了你，在泼墨山水画里，你从墨色深处被隐去，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天色等烟雨 ，而我在等你，月色被打捞起， 晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起 ，晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意。'),(112,'2024-02-17 08:41:42','理想三旬','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在','file/newsPicture2.jpg','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在，青春又醉倒在，籍籍无名的怀，靠嬉笑来虚度，聚散得慷慨，辗转却去不到，对的站台，如果漂泊是成长，必经的路牌，你迷醒岁月中，那贫瘠的未来，像遗憾季节里，未结果的爱，弄脏了每一页诗，吻最疼痛的告白，而风声吹到这，已不需要释怀，就老去吧，孤独别醒来，渴望的离开只是无处停摆就歌唱吧，眼睛眯起来而热泪的崩坏，只是没抵达的存在，就甜蜜地忍耐，繁星润湿窗台，光影跳动着像在，困倦里说爱，再无谓的感慨，以为明白，梦倒塌的地方，今已爬满青苔。'),(113,'2024-02-17 08:41:42','七里香','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠','file/newsPicture3.jpg','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，雨下整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，你是我唯一想要的了解，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，那饱满的稻穗幸福了这个季节，而你的脸颊像田里熟透的番茄，你突然对我说七里香的名字很美，我此刻却只想亲吻你倔强的嘴，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，是我唯一想要的了解。'),(114,'2024-02-17 08:41:42','江南','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸','file/newsPicture4.jpg','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天 抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，相信爱一天抵过永远。在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂。'),(115,'2024-02-17 08:41:42','那些你很冒险的梦','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落','file/newsPicture5.jpg','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心有多执着就加倍心痛，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，我不想放手 你松开的左手，你爱的放纵 我白不回天空，我输了 累了，但你再也 不回头，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，你真的不懂 我的爱已降落。'),(116,'2024-02-17 08:41:42','孤勇者','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望','file/newsPicture6.jpg','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望，不肯哭一场，爱你破烂的衣裳，却敢堵命运的枪，爱你和我那么像，缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，他们说 要戒了你的狂，就像擦掉了污垢，他们说 要顺台阶而上，而代价是低头，那就让我 不可 乘风，你一样骄傲着 那种孤勇，谁说对弈平凡的不算英雄，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你破烂的衣裳 却敢堵命运的枪，爱你和我那么像 缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，你的斑驳 与众不同 与众不同，你的沉默 震耳欲聋 震耳欲聋，You Are The Hero，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你来自于蛮荒 一生不借谁的光，你将造你的城邦 在废墟之上，去吗 去啊 以最卑微的梦，战吗 战啊 以最孤高的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shangjia`
--

DROP TABLE IF EXISTS `shangjia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shangjia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangjiazhanghao` varchar(200) NOT NULL COMMENT '商家账号',
  `shangjiamima` varchar(200) NOT NULL COMMENT '商家密码',
  `shangjiamingcheng` varchar(200) NOT NULL COMMENT '商家名称',
  `shangjiadizhi` varchar(200) DEFAULT NULL COMMENT '商家地址',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `lianxiren` varchar(200) DEFAULT NULL COMMENT '联系人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shangjiazhanghao` (`shangjiazhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='商家';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shangjia`
--

LOCK TABLES `shangjia` WRITE;
/*!40000 ALTER TABLE `shangjia` DISABLE KEYS */;
INSERT INTO `shangjia` VALUES (121,'2024-02-17 08:41:42','商家账号1','123456','商家名称1','商家地址1','19819881111','联系人1'),(122,'2024-02-17 08:41:42','商家账号2','123456','商家名称2','商家地址2','19819881112','联系人2'),(123,'2024-02-17 08:41:42','商家账号3','123456','商家名称3','商家地址3','19819881113','联系人3'),(124,'2024-02-17 08:41:42','商家账号4','123456','商家名称4','商家地址4','19819881114','联系人4'),(125,'2024-02-17 08:41:42','商家账号5','123456','商家名称5','商家地址5','19819881115','联系人5'),(126,'2024-02-17 08:41:42','商家账号6','123456','商家名称6','商家地址6','19819881116','联系人6');
/*!40000 ALTER TABLE `shangjia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) DEFAULT NULL COMMENT 'refid',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT NULL COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-02-17 08:41:42','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghumima` varchar(200) NOT NULL COMMENT '用户密码',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (31,'2024-02-17 08:41:42','用户账号1','123456','用户姓名1','file/yonghuTouxiang1.jpg','男','19819881111'),(32,'2024-02-17 08:41:42','用户账号2','123456','用户姓名2','file/yonghuTouxiang2.jpg','男','19819881112'),(33,'2024-02-17 08:41:42','用户账号3','123456','用户姓名3','file/yonghuTouxiang3.jpg','男','19819881113'),(34,'2024-02-17 08:41:42','用户账号4','123456','用户姓名4','file/yonghuTouxiang4.jpg','男','19819881114'),(35,'2024-02-17 08:41:42','用户账号5','123456','用户姓名5','file/yonghuTouxiang5.jpg','男','19819881115'),(36,'2024-02-17 08:41:42','用户账号6','123456','用户姓名6','file/yonghuTouxiang6.jpg','男','19819881116');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23 10:39:06
