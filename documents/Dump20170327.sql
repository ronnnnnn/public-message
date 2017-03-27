-- MySQL dump 10.13  Distrib 5.7.12, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: pm
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `hh_category`
--

DROP TABLE IF EXISTS `hh_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  `category_code` varchar(45) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_ids` varchar(45) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `topic` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_category`
--

LOCK TABLES `hh_category` WRITE;
/*!40000 ALTER TABLE `hh_category` DISABLE KEYS */;
INSERT INTO `hh_category` VALUES (1,'类别','0',0,'0/',1,'根类别',NULL),(7,'服务中心','10',1,'0/1/',10,'类别','0'),(10,'企业介绍','01',1,'0/1/',NULL,'推送标识为0,为根目录,无文章关联','0'),(11,'公司动态','02',1,'0/1/',NULL,'类别','0'),(12,'投资品种','03',1,'0/1/',NULL,'类别','0'),(13,'大连再生','04',1,'0/1/',NULL,'类别','0'),(14,'东北品种','05',1,'0/1/',NULL,'类别','0'),(15,'融汇盈学院','06',1,'0/1/',NULL,'类别','0'),(19,'关于我们','0101',10,'0/1/10/',NULL,'目录标识为1,关联1篇文章','1'),(20,'企业文化','0102',10,'0/1/10/',NULL,'子目录','1'),(21,'合作伙伴','0103',10,'0/1/10/',NULL,'子目录','1'),(22,'投资保障','0104',10,'0/1/10/',NULL,'子目录','1'),(23,'交易大事件','0105',10,'0/1/10/',NULL,'子目录','1'),(24,'联系我们','0106',10,'0/1/10/',NULL,'子目录','1'),(25,'企业公告','0201',11,'0/1/11/',NULL,'子目录','1'),(26,'公司新闻','0202',11,'0/1/11/',NULL,'目录标识为2.表示目录关联文章列表','2'),(27,'常见问题','0203',11,'0/1/11/',NULL,'子目录','1'),(28,'政策法规','0204',11,'0/1/11/',NULL,'子目录','1'),(29,'大连再生品种','0301',12,'0/1/12/',NULL,'子目录','1'),(30,'交易所简介','0401',13,'0/1/13/',NULL,'子目录','1'),(31,'在线开户','0501',14,'0/1/14/',NULL,'子目录','1'),(32,'财经咨询','0601',15,'0/1/15/',NULL,'子目录','2'),(33,'服务体系','1001',7,'0/1/7/',NULL,'子目录','1');
/*!40000 ALTER TABLE `hh_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_h5_manage`
--

DROP TABLE IF EXISTS `hh_h5_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_h5_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `h5_name` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `h5_url` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_h5_manage`
--

LOCK TABLES `hh_h5_manage` WRITE;
/*!40000 ALTER TABLE `hh_h5_manage` DISABLE KEYS */;
INSERT INTO `hh_h5_manage` VALUES (2,'2342','werwer','2017-03-25 14:04:12');
/*!40000 ALTER TABLE `hh_h5_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_new_article`
--

DROP TABLE IF EXISTS `hh_new_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_new_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `create_time` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `click_times` int(11) DEFAULT NULL,
  `hh_category_id` int(11) DEFAULT NULL,
  `is_show` tinyint(4) DEFAULT '1',
  `paper` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_new_article`
--

LOCK TABLES `hh_new_article` WRITE;
/*!40000 ALTER TABLE `hh_new_article` DISABLE KEYS */;
INSERT INTO `hh_new_article` VALUES (1,'题目3','<p>内容</p>',NULL,'article',NULL,7,1,NULL),(2,'33','<p class=\"pcenter\" style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;\">　　辞旧迎新之时，你最牵挂的人是谁？</p><p class=\"pcenter\" style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;\">　　也许是父母、儿女、爱人……</p><p><img src=\"/ueditor/jsp/upload/image/20170108/1483864846190029283.jpg\" alt=\"然而有这样一位“黄土地的儿子”，\"/></p><p><br/></p>',NULL,'news',NULL,7,1,NULL),(3,'we','<p class=\"pcenter\" style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;\">　　辞旧迎新之时，你最牵挂的人是谁？</p><p class=\"pcenter\" style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;\">　　也许是父母、儿女、爱人……</p><p><img src=\"http://n.sinaimg.cn/news/transform/20170108/8mKW-fxzkfvn0827610.jpg\" alt=\"然而有这样一位“黄土地的儿子”，\"/></p><p><br/></p>','2017-01-08 16:54:19.711','news',NULL,7,1,NULL),(4,'tes','<p>大法官<br/></p>','2017-01-08 16:56:49.553','news',NULL,7,1,NULL),(5,'额','<pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:&#39;Ubuntu Mono&#39;;font-size:14.3pt;\">/Images/{time}{rand:6}</pre><p><br/></p>','2017-01-08 17:05:27.645','news',NULL,7,1,NULL),(6,'士大夫','<p></p><pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:&#39;Ubuntu Mono&#39;;font-size:14.3pt;\">/Images/{time}{rand:6}</pre><p><br/></p>','2017-01-08 17:06:06.529','news',NULL,7,1,NULL),(7,'未','<p>士大夫</p>','2017-01-08 17:08:59.909','news',NULL,7,1,NULL),(8,'大法官','<p>大法官</p>','2017-01-08 17:10:15.621','news',NULL,7,1,NULL),(9,'1','<p>1</p>','2017-01-08 17:10:49.177','news',NULL,7,1,NULL),(10,'士大夫','<p>士大夫</p>','2017-01-08 17:12:21.522','news',NULL,7,1,NULL),(11,'2','<p>2</p>','2017-01-08 17:15:27.302','news',NULL,7,1,NULL),(12,'RTR','<p style=\"box-sizing: border-box; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">aOS 2017.01 发布了，KaOS 是一份桌面 Linux 发行，其特色在于最新版本的 KDE 桌面环境及其他流行的使用 Qt 工具包的软件程序。它最初基于 Arch Linux，但从 2013 年四月起，开发者们开始创建他们自己的软件包，现在这些软件包可以从 KaOS 自己的软件仓库里获得。KaOS 采用滚动发布开发模式，并且只面向 64 位计算机系统。<a href=\"http://teiid.jboss.org/downloads/\" target=\"_self\" style=\"box-sizing: border-box; background-color: transparent; text-decoration: none; outline: 0px; color: rgb(61, 177, 88);\"></a></p><p style=\"box-sizing: border-box; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://static.oschina.net/uploads/space/2016/1108/080715_wGYN_2720166.png\" width=\"641\" height=\"360\" title=\"\"/></p><p><br/></p>','2017-01-08 17:24:14.467','news',NULL,7,1,NULL),(13,'aa','<p style=\"box-sizing: border-box; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">aOS 2017.01 发布了，KaOS 是一份桌面 Linux 发行，其特色在于最新版本的 KDE 桌面环境及其他流行的使用 Qt 工具包的软件程序。它最初基于 Arch Linux，但从 2013 年四月起，开发者们开始创建他们自己的软件包，现在这些软件包可以从 KaOS 自己的软件仓库里获得。KaOS 采用滚动发布开发模式，并且只面向 64 位计算机系统。<a href=\"http://teiid.jboss.org/downloads/\" target=\"_self\" style=\"box-sizing: border-box; background-color: transparent; text-decoration: none; outline: 0px; color: rgb(61, 177, 88);\"></a></p><p style=\"box-sizing: border-box; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://static.oschina.net/uploads/space/2016/1108/080715_wGYN_2720166.png\" width=\"641\" height=\"360\" title=\"\"/></p><p><br/></p>','2017-01-08 17:24:56.204','news',NULL,7,1,NULL),(14,'sdf ','<p>fsd&nbsp;<img src=\"/ueditor/jsp/upload/image/20170108/1483867761182040158.jpg\" title=\"1483867761182040158.jpg\" alt=\"404.jpg\"/></p>','2017-01-08 17:29:35.253','news',NULL,7,1,NULL),(15,'re','<p><img src=\"http://localhost:8080/ps/ueditor/jsp/upload/image/20170108/1483873771048085993.jpg\" title=\"1483873771048085993.jpg\" alt=\"21.jpg\"/></p>','2017-01-08 19:10:32.044','news',NULL,7,1,NULL),(16,'test','<p><img src=\"/pic/ueditor/jsp/upload/image/20170108/1483876574015095133.jpg\" title=\"1483876574015095133.jpg\" alt=\"21.jpg\"/></p>','2017-01-08 19:59:54.624','news',NULL,7,1,NULL),(17,'特4','<h1 style=\"box-sizing: border-box; margin: 20px 0px 10px; font-size: 36px; font-family: ff-tisa-web-pro-1, ff-tisa-web-pro-2, &quot;Lucida Grande&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">Get Started</h1><h2 style=\"box-sizing: border-box; font-family: ff-tisa-web-pro-1, ff-tisa-web-pro-2, &quot;Lucida Grande&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 30px; padding-bottom: 9px; border-bottom: 1px solid rgb(238, 238, 238); white-space: normal; background-color: rgb(255, 255, 255);\">UEditor 介绍</h2><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-align: justify; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Myriad Pro&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Calibri, Helvetica, tahoma, arial, simsun, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">UEditor 是由百度「FEX前端研发团队」开发的所见即所得富文本web编辑器，具有轻量，可定制，注重用户体验等特点，开源基于MIT协议，允许自由使用和修改代码。</p><h2 style=\"box-sizing: border-box; font-family: ff-tisa-web-pro-1, ff-tisa-web-pro-2, &quot;Lucida Grande&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 30px; padding-bottom: 9px; border-bottom: 1px solid rgb(238, 238, 238); white-space: normal; background-color: rgb(255, 255, 255);\">1 入门部署和体验</h2><h3 style=\"box-sizing: border-box; font-family: ff-tisa-web-pro-1, ff-tisa-web-pro-2, &quot;Lucida Grande&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">1.1 下载编辑器</h3><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-align: justify; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Myriad Pro&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Calibri, Helvetica, tahoma, arial, simsun, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">到官网下载 UEditor 最新版：<a href=\"http://ueditor.baidu.com/website/download.html#ueditor\" title=\"官网下载地址\" style=\"box-sizing: border-box; background: transparent; color: rgb(66, 139, 202); text-decoration: none;\">[官网地址]</a></p><h3 style=\"box-sizing: border-box; font-family: ff-tisa-web-pro-1, ff-tisa-web-pro-2, &quot;Lucida Grande&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">1.2 创建demo文件</h3><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-align: justify; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Myriad Pro&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Calibri, Helvetica, tahoma, arial, simsun, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">解压下载的包，在解压后的目录创建 demo.html 文件，填入下面的html代码</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-align: justify; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Myriad Pro&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Calibri, Helvetica, tahoma, arial, simsun, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><pre class=\"prettyprint lang-html prettyprinted\" style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; white-space: pre-wrap; padding: 10px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; background-color: rgb(51, 51, 51); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">&lt;!DOCTYPE&nbsp;HTML&gt;&lt;html&nbsp;lang=&quot;en-US&quot;&gt;&lt;head&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta&nbsp;charset=&quot;UTF-8&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;title&gt;ueditor&nbsp;demo&lt;/title&gt;&lt;/head&gt;&lt;body&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;!--&nbsp;加载编辑器的容器&nbsp;--&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;script&nbsp;id=&quot;container&quot;&nbsp;name=&quot;content&quot;&nbsp;type=&quot;text/plain&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这里写你的初始化内容\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/script&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;!--&nbsp;配置文件&nbsp;--&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;script&nbsp;type=&quot;text/javascript&quot;&nbsp;src=&quot;ueditor.config.js&quot;&gt;&lt;/script&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;!--&nbsp;编辑器源码文件&nbsp;--&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;script&nbsp;type=&quot;text/javascript&quot;&nbsp;src=&quot;ueditor.all.js&quot;&gt;&lt;/script&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;!--&nbsp;实例化编辑器&nbsp;--&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;script&nbsp;type=&quot;text/javascript&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;ue&nbsp;=&nbsp;UE.getEditor(&#39;container&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/script&gt;&lt;/body&gt;&lt;/html&gt;</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-align: justify; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Myriad Pro&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Calibri, Helvetica, tahoma, arial, simsun, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><h3 style=\"box-sizing: border-box; font-family: ff-tisa-web-pro-1, ff-tisa-web-pro-2, &quot;Lucida Grande&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">1.3 在浏览器打开demo.html</h3><p><br/></p>','2017-01-08 20:49:23.885','news',NULL,11,1,NULL),(18,'合作伙伴','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 15px; color: rgb(68, 68, 68); font-size: 14px; line-height: 28px; font-family: Arial, SimSun; white-space: normal;\"><img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051712525.png\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051713209.png\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051714295.png\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051715829.png\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051716316.png\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 15px; color: rgb(68, 68, 68); font-size: 14px; line-height: 28px; font-family: Arial, SimSun; white-space: normal;\"><img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051717226.png\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051718360.png\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051719490.png\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051719731.png\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051720761.png\"/></p><p><img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051757246.png\"/><span style=\"color: rgb(51, 51, 51); font-family: Arial, SimSun; font-size: 12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><img src=\"http://www.xrh66.com/uploadfile/2016/0419/20160419051758599.png\"/></p><p><br/></p>','2017-01-09 14:27:43.86','article',NULL,21,1,'合作伙伴'),(21,'中合圣达供应链服务有限公司在天津举行揭牌仪式','<p><br/></p><p><span style=\"font-family: 宋体, SimSun; font-size: 14px; line-height: 1.75em; text-indent: 2em;\">3月30日，大连再生资源交易所（以下简称大交所）核心企业中合圣达投资控股(大连)股份有限公司与国际物流公司共同出资设立的天津中合圣达供应链服务有限公司在天津自贸实验区东疆片区举行揭牌仪式。</span><span style=\"color: rgb(51, 51, 51); font-family: Arial, SimSun; font-size: 12px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 2em; text-align: justify; font-size: 14px; line-height: 1.75em; white-space: normal; color: rgb(153, 153, 153); font-family: 微软雅黑, 宋体, Verdana, Geneva, sans-serif;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 2em; text-align: justify; font-size: 14px; line-height: 1.75em; white-space: normal; color: rgb(153, 153, 153); font-family: 微软雅黑, 宋体, Verdana, Geneva, sans-serif;\"><span style=\"margin: 0px; padding: 0px; font-family: 宋体, SimSun; color: rgb(0, 0, 0);\">该公司将以大交所大宗商品现货交易平台为基础，探索构建具有天津自贸区特色的“互联网+金融+产业+港口”的全新生态模式；同时依托中国供销集团和天津港的行业优势与地域优势，努力建设中国北方功能最全、服务最优、竞争力最强的国际陆港物流与大宗商品现货交易中心，更好地服务于京津冀实体经济集约化高效发展。</span></p><p><br/>天津港集团公司副总裁赵明奎和大交所总经理王忠祥为该公司揭牌&nbsp;</p><p>大交所副总经理兼财务总监毕秀丽在会上发言</p><p><br/></p>','2017-01-09 16:35:02.954','news',NULL,26,1,'大交所核心企业中合圣达投资控股(大连)股份有限公司与国际物流公司共同出资设立的天津中合圣达供应链服务有限公司在天津举行揭牌仪式'),(22,'三星“太子”卷入韩国“干政门”','<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px; font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">　　新浪科技讯 北京时间1月11日下午消息， 因三星卷入韩国总统朴槿惠“闺蜜干政”事件，三星电子副会长李在镕最早于周四将被检方传唤。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px; font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">　　据韩联社报道，负责调查总统亲信门的独立检察组一位负责人透露，独检组将于12日或13日对李在镕进行传唤调，并将重点调查三星向总统“亲信门”核心涉案人崔顺实提供的资金性质、是否以此为代价谋取利益等。李在镕将以何种身份到案尚未确定，不过《华尔街日报》报道提及，李在镕将被视为行贿嫌疑人。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px; font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">　　1月9日，独检组以案件相关人身份传唤了三星集团未来战略室室长崔志成和次长张忠基。独检组相关人士当天暗示有可能针对两人申请逮捕令。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px; font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">　　当时独检组相关人士表示，虽以案件相关人身份传唤了两人，但在调查过程中，两人的身份有可能发生改变。此番表态被解读为，独检组若发现张忠基和崔志成介入崔顺实和三星之间幕后交易的迹象，将把两人视为嫌疑人开展调查，在传唤三星集团副会长李在镕前向三星施加压力。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px; font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">　　独检组怀疑政府大力支持三星物产与第一毛织合并，三星以此为代价向崔顺实之女、马术选手郑某提供资金援助。在此过程中，朴槿惠多次与李在镕单独面谈，对三星施加压力。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px; font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">　　2015年，三星物产和第一毛织推进合并时，外资对冲基金公司——埃利奥特管理公司表示反对，但拥有三星物产10%股权的国民年金公团站在三星一边，使合并得以促成。国民年金公团就两家公司合并投出赞成票仅半个月之后，朴槿惠和李在镕又进行单独面谈，朴槿惠强烈谴责三星对马术方面的援助不到位。之后，三星决定向崔顺实提供220亿韩元（约合人民币1.2亿元）的资金援助。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px; font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">　　不过三星方面强烈否认相关指控并主张，因总统朴槿惠施加压力，不得不向崔顺实方面提供资金支持。李在镕去年12月在国会举行的“朴槿惠政府亲信弄权干政案国政调查特别委员会”听证会上表示，三星从未以捐赠或资助为代价享受优惠。</p><p><br/></p>','2017-01-09 17:15:08.525','news',NULL,26,1,'北京时间1月11日下午消息， 因三星卷入韩国总统朴槿惠“闺蜜干政”事件，三星电子副会长李在镕最早于周四将被检方传唤。'),(23,'关于我们','<p>融汇通</p>','2017-01-11 19:06:28.779','article',NULL,19,1,'关于我们'),(24,'比特币交易资金链调查','<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">本报记者&nbsp;何晓晴&nbsp;广州报道</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　导读</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　作为一个虚拟商品，比特币交易过程中亦引入了杠杆配资交易，最高杠杆可达5倍。与此同时，市场一直存在对比特币交易洗钱的质疑。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　比特币异常波动已引起监管层高度关注。继上周五央行北京、上海总部分别约三家比特币交易平台负责人之后，有消息称，监管部门将讨论设立第三方比特币托管平台，确保比特币交易的安全。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　21世纪经济报道记者了解到，上周五被约谈的三家比特币平台包括“火币网”、“币行”以及“比特币中国”。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　不过，1月10日，火币网一位内部人士回应21世纪经济报道记者称，“平台暂时没有接到相关第三方托管的通知。”</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　雷盈企业副总裁张华对21世纪经济报道记者表示，“数字资产交易行业尚处于新兴阶段，比特币交易资金还没有形成规范的三方托管体系。我个人预计在未来两到三年内，或许会有实质性的监管措施出台。”</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　值得一提的是，作为一个虚拟商品，比特币交易过程中亦引入了杠杆配资交易。此外，在比特币交易火爆背后，借比特币交易洗钱的质疑声亦未中断过。那么，比特币交易资金链背后的真相到底如何？21世纪经济报道记者就此展开了调查。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　<strong>配资交易普遍</strong></p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　“目前，比特币杠杆交易比较普及。交易中有投资者会采取杠杆交易方式，包括做多、做空，行业内普遍杠杆倍数约在3倍左右。具体会根据交易活跃度等进行动态调整。”张华告诉21世纪经济报道记者。“1月5日，比特币价格大幅波动，全天震幅高达32.55%。当天，一些杠杆操作的投资者就出现爆仓，这主要是因为全天价格波动急促、剧烈所致。”</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　当天，火币网一位内部人士确认，其所在的平台提供部分配资交易，而且，平台会收取千分之一的配资费用。除了平台以外，第三方机构也会参与配资。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　“最大杠杆为5倍左右。不过，平台会根据交易情况适时进行调整。像1月5日当天，火币进行了风控调整，杠杆倍数就下调到了2倍，主要是为了控制投资者风险。尽管如此，还是有投资者被打爆、强平了。”该人士称。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　“具体来看，假设当前比特币价格是6000元，一位用户自有资金6000元，并对行情看涨，借了4倍资金，一共是3万元买了5枚比特币。结果比特币价格下跌，当他的实际资产快到平台借出资金的110%时，平台会提醒用户平仓止损或者提高保证金。”前述火币网内部人士表示。“因此，当该用户实际资产达到110%时，平台会强制平仓，将其资产挂单按市价卖出。原理与其他金融市场相同。也就是说，按照这位用户的价格，当比特币价格跌到5280元时，若用户自己不进行止损或者提高保证金，平台就会强制平仓。”</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　OKCoin币行网创始人兼CEO徐明星当天回应21世纪经济报道记者称，“我们平台的杠杆倍数是比较小的，当价格波动比较大的时候，我们一般会暂停杠杆业务，所以我们平台的爆仓用户挺少的。”</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　阔悦科技联合创始人陈刚则表示，“对平台而言，核心风控在于内部管理，做好资产保存工作，注意风控和清算，日清日结，每日对账。”</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　<strong>跨境套利风险</strong></p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　除了暴涨暴跌市场风险外，市场也一直存在比特币交易洗钱的质疑。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　对此，徐明星强调，五部委在早在2013年发布的《关于防范比特币的风险通知》里面就有明确提过，平台应该严格遵守反洗钱。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　“举例说，用户从我们OKCoin币行平台购买的比特币，首先我们OKCoin币行会做相关认证，资金来源的审查，资产额度多少等等。”&nbsp;徐明星称。“另外，国外银行和交易平台的‘反洗钱’程序更加复杂，凭空来了一笔钱或比特币，国外没有一个机构会给你提现，需要提供资金的合法来源证明，同时比特币的价格也在不断波动，通过比特币换汇是一种假想，其操作难度远大于传统手段。”</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　前述火币网内部人士也称，用户资金在平台进、出都有严格的管理规定。开户时，平台会对用户身份进行识别，要求用户使用实名注册，登记姓名、身份证号码等信息。而且，人民币账户和美元账户只能二选其一。一旦作出决定，就不能再进行更改。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　“在资金进出方面，用户绑定银行卡后，通过转账的方式充值进平台。而且，充值银行卡和认证用户名称必须保持一致，才能完成充值和提现。”该人士表示。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　当天，火币COO朱嘉伟也回应称，“火币会按照央行及其他监管部门的要求、对照相关法律法规进行严格自查，也计划与行业各企业一起成立行业联盟进行行业自律，推动行业标准的建立。”</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　对此，张华亦认为，比特币跨境套利实际操作上有难度。理论上，可以通过国内平台交易实现跨境套利。但从实际操作上看，跨境套利也需要支付成本，各交易平台都有相应的现行费率政策，包括交易手续费及提现手续费等费用，目前，国内交易平台的提现手续费标准大约在千分之三到千分之五之间。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　此外，比特币价格并无涨跌幅限制，持币期间也可能会面对由于剧烈的价格波动引起的汇兑风险。从交易所合规管理来讲，国外交易平台已有较为完整的投资者准入管理规则。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　“如果真的有用比特币进行换汇的情况，就会导致供需不平衡，会导致国内比特币的价格比国外比特币的价格高很多。但目前国内的比特币价格跟国外价格差不多，有的时候国外价格甚至高于国内价格。”&nbsp;徐明星如是说。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　“从交易特征来说，可以对一些以洗钱为目的的购币行为进行辨别，这类投资者的交易特征在于平常很少交易，而且，单次交易量也非常大。”&nbsp;张华则称。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\">　　不过，张华同时表示，“无法避免的是，在数字资产野蛮生长期，一些交易平台为了吸引流量对此把关不严。但一些合规平台则会严格遵守国家反洗钱的相关规定，对异常交易进行严密监控。”（编辑：巫燕玲）</p><p class=\"art_keywords\" style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-size-adjust: 100%; line-height: 32px; font-size: 18px;\"><span class=\"art_keywords_tt\" style=\"margin-right: 10px; font-size: 15px; color: rgb(46, 142, 217);\">标签:</span>&nbsp;<a href=\"http://tags.tech.sina.com.cn/%E6%AF%94%E7%89%B9%E5%B8%81\" target=\"_blank\" style=\"text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-right: 10px; font-size: 15px; color: rgb(51, 51, 51);\">比特币</a><a href=\"http://tags.tech.sina.com.cn/%E5%B9%B3%E5%8F%B0\" target=\"_blank\" style=\"text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-right: 10px; font-size: 15px; color: rgb(51, 51, 51);\">平台</a><a href=\"http://tags.tech.sina.com.cn/%E9%85%8D%E8%B5%84\" target=\"_blank\" style=\"text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-right: 10px; font-size: 15px; color: rgb(51, 51, 51);\">配资</a></p><p><br/></p>','2017-01-11 19:12:32.062','news',NULL,26,1,'作为一个虚拟商品，比特币交易过程中亦引入了杠杆配资交易，最高杠杆可达5倍。与此同时，市场一直存在对比特币交易洗钱的质疑。'),(26,'1','<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><img src=\"http://www.it610.com/r/cms/smilies/m1.gif\" alt=\"开心\"/></p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">开心</p></li><li><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">0</span>票</p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><img src=\"http://www.it610.com/r/cms/smilies/m2.gif\" alt=\"板砖\"/></p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">板砖</p></li><li><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">0</span>票</p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><img src=\"http://www.it610.com/r/cms/smilies/m3.gif\" alt=\"感动\"/></p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">感动</p></li><li><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">0</span>票</p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><img src=\"http://www.it610.com/r/cms/smilies/m4.gif\" alt=\"有用\"/></p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">有用</p></li><li><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">0</span>票</p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><img src=\"http://www.it610.com/r/cms/smilies/m5.gif\" alt=\"疑问\"/></p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">疑问</p></li><li><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">0</span>票</p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><img src=\"http://www.it610.com/r/cms/smilies/m6.gif\" alt=\"难过\"/></p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">难过</p></li><li><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">0</span>票</p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><img src=\"http://www.it610.com/r/cms/smilies/m7.gif\" alt=\"无聊\"/></p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">无聊</p></li><li><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">0</span>票</p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\"><img src=\"http://www.it610.com/r/cms/smilies/m8.gif\" alt=\"震惊\"/></p><p style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; background: transparent;\">震惊</p></li></ul><p><br/></p>','2017-02-11 14:33:50.961','news',NULL,19,1,'1');
/*!40000 ALTER TABLE `hh_new_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_public_message`
--

DROP TABLE IF EXISTS `hh_public_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_public_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_public_message`
--

LOCK TABLES `hh_public_message` WRITE;
/*!40000 ALTER TABLE `hh_public_message` DISABLE KEYS */;
INSERT INTO `hh_public_message` VALUES (3,'test测试','test测试v大法官的','2017-03-19 19:53:03'),(4,'sdf','sf','2017-03-19 19:53:13'),(7,'sdfs','sdf','2017-03-19 19:53:03');
/*!40000 ALTER TABLE `hh_public_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_resource`
--

DROP TABLE IF EXISTS `hh_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(45) DEFAULT NULL,
  `mtype` varchar(45) DEFAULT NULL,
  `priority` varchar(45) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `is_available` int(1) DEFAULT '1',
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_resource`
--

LOCK TABLES `hh_resource` WRITE;
/*!40000 ALTER TABLE `hh_resource` DISABLE KEYS */;
INSERT INTO `hh_resource` VALUES (1,'资源','menu','0',0,'0/','',1,''),(40,'用户资源管理','menu','01',1,'0/1/','',1,''),(41,'管理员管理','menu','0101',40,'0/1/40/','superuser:*',1,'/user/superuser/list'),(42,'管理员新增','button','010101',41,'0/1/40/41','superuser:create',1,' '),(43,'管理员修改','button','010102',41,'0/1/40/41','superuser:update',1,' '),(44,'管理员删除','button','010103',41,'0/1/40/41','superuser:delete',1,' '),(45,'管理员查看','button','010104',41,'0/1/40/41','superuser:view',1,' '),(50,'用户管理','menu','0102',40,'0/1/40','user:*',1,'/user/normaluser/list'),(51,'用户新增','button','010201',50,'0/1/40/50/','user:create',1,''),(52,'用户修改','button','010202',50,'0/1/40/50/','user:update',1,''),(53,'用户删除','button','010203',50,'0/1/40/50/','user:delete',1,''),(54,'用户查看','button','010204',50,'0/1/40/50/','user:view',1,''),(55,'资源管理','menu','0103',40,'0/1/40/','resource:*',1,'/resources'),(56,'资源新增','button','010301',55,'0/1/40/55/','resource:create',1,''),(57,'资源修改','button','010302',55,'0/1/40/55/','resource:update',1,''),(58,'资源删除','button','010303',55,'0/1/40/55/','resource:delete',1,''),(59,'资源查看','button','010304',55,'0/1/40/55/','resource:view',1,''),(60,'角色管理','menu','0104',40,'0/1/40/','role:*',1,'/role'),(61,'角色新增','button','010401',60,'0/1/40/60/','role:create',1,''),(62,'角色修改','button','010402',60,'0/1/40/60/','role:update',1,''),(63,'角色删除','button','010403',60,'0/1/40/60/','role:delete',1,''),(64,'角色查看','button','010404',60,'0/1/40/60/','role:view',1,''),(78,'系统设置','menu','12',1,'0/1/','',1,''),(79,'图片设置','menu','1201',78,'0/1/78/','show:*',1,'/show/list/panel'),(80,'查看图片','button','120101',79,'0/1/78/79/','show:view',1,''),(81,'添加图片','button','120102',79,'0/1/78/79/','show:create',1,''),(82,'修改图片','button','120103',79,'0/1/78/79/','show:update',1,''),(83,'删除图片','button','120104',79,'0/1/78/79/','show:delete',1,''),(98,'类别管理','menu','04',1,'0/1/','',1,''),(99,'类别维护','menu','0401',98,'0/1/98/','category:*',1,'/category/list-panel'),(101,'添加类别','button','040101',99,'0/1/98/99/','category:create',1,''),(102,'删除类别','button','040102',99,'0/1/98/99/','category:delete',1,''),(103,'修改类别','button','040103',99,'0/1/98/99/','category:update',1,''),(104,'查看类别','button','040104',99,'0/1/98/99/','category:view',1,''),(153,'内容管理','menu','05',1,'0/1/','article:*',1,''),(154,'内容管理','menu','0501',153,'0/1/153/','article:*',1,'/newArticle/content-panel'),(155,'公告管理','menu','02',1,'0/1/','message:*',1,''),(156,'公告内容','menu','0201',155,'0/1/155/','message:*',1,'/public-message/list-panel'),(157,'H5管理','menu','03',1,'0/1/','h5:*',1,''),(158,'H5内容','menu','0301',157,'0/1/157/','h5:*',1,'/h5/list-panel');
/*!40000 ALTER TABLE `hh_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_role`
--

DROP TABLE IF EXISTS `hh_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(450) DEFAULT NULL,
  `description` varchar(450) DEFAULT NULL,
  `resource_ids` varchar(450) DEFAULT NULL,
  `is_available` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_role`
--

LOCK TABLES `hh_role` WRITE;
/*!40000 ALTER TABLE `hh_role` DISABLE KEYS */;
INSERT INTO `hh_role` VALUES (1,'admin','超级管理员','41,55,60,155,157',1);
/*!40000 ALTER TABLE `hh_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_role_resource`
--

DROP TABLE IF EXISTS `hh_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_role_resource` (
  `hh_role_id` int(11) NOT NULL,
  `hh_resource_id` int(11) NOT NULL,
  PRIMARY KEY (`hh_role_id`,`hh_resource_id`),
  KEY `fk_hh_role_resource_hh_resource1_idx` (`hh_resource_id`),
  CONSTRAINT `fk_hh_role_resource_hh_resource1` FOREIGN KEY (`hh_resource_id`) REFERENCES `hh_resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_role_resource_hh_role1` FOREIGN KEY (`hh_role_id`) REFERENCES `hh_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_role_resource`
--

LOCK TABLES `hh_role_resource` WRITE;
/*!40000 ALTER TABLE `hh_role_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_show`
--

DROP TABLE IF EXISTS `hh_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(45) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `mtype` varchar(45) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_use` tinyint(4) DEFAULT '0',
  `relate_url` varchar(450) DEFAULT NULL,
  `relate_article_title` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_show`
--

LOCK TABLES `hh_show` WRITE;
/*!40000 ALTER TABLE `hh_show` DISABLE KEYS */;
INSERT INTO `hh_show` VALUES (3,'轮播图1','/pic/Images/show/71b6804b-214e-48b1-b69e-53472f9c23e2.jpg','2016-11-15 15:31:06','轮播图',1,1,'nono','test'),(4,'轮播图2','/pic/Images/show/135f44d5-8935-48b9-8e85-6de9f36a0e3f.jpg','2017-01-11 21:46:59','轮播图',2,1,'',''),(5,'轮播图3','/pic/Images/show/43c07a71-2544-4c1d-8ef9-98587ae8317a.jpg','2017-01-11 21:47:20','轮播图',3,1,'','');
/*!40000 ALTER TABLE `hh_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_user`
--

DROP TABLE IF EXISTS `hh_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `role_ids` varchar(45) DEFAULT '2',
  `organization` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT '昵称',
  `real_name` varchar(45) DEFAULT '名字',
  `user_identify` varchar(100) DEFAULT NULL,
  `current_area` varchar(45) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `account` double DEFAULT '0',
  `contribute_score` double DEFAULT '0',
  `honer_score` double DEFAULT '0',
  `grade_total` varchar(45) DEFAULT '0',
  `grade_times` int(11) DEFAULT '0',
  `withdraw_account` varchar(100) DEFAULT NULL,
  `wirhdraw_accont_type` varchar(45) DEFAULT NULL,
  `regId` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `topic` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `photo` varchar(300) DEFAULT '/happy-help/productImages/moren.jpg',
  `cookie` varchar(450) DEFAULT NULL,
  `description` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user`
--

LOCK TABLES `hh_user` WRITE;
/*!40000 ALTER TABLE `hh_user` DISABLE KEYS */;
INSERT INTO `hh_user` VALUES (1,'admin','12345678901','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'1',NULL,'nick1','张三','350000199909091345','东肖北路1号',1,1,NULL,1000,22,22,'18.0',4,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','e727be49-504b-4816-ba48-dd6cb60f97e1','测试账号'),(6,'admin2','12345678902','1a1b54e1e8a1413acb541b9d3f400690','c6e98be2437e0c8d199321abad3562eb',0,'2',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,21,21,'12.0',4,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','3125a057-0cad-4739-b54b-f90e1e481990','测试账号'),(7,'admin3','12345678903','2a053192d01761925e25991f112ae286','e5d6902cc9421a3ec65345abc95f301b',0,'3,4',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,20,20,'10.0',2,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','f657f9ff-f2f3-40cc-adaa-db12fff20d35','测试账号'),(8,'admin4','12345678904','d698aa30530af381a82ce34332996ee5','12ae991ac129fb7683f86f2158b25763',0,'1',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,19,19,'12',3,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(9,'admin5','12345678905','ac64868c8d9ce37fae3ff057ef89e4c0','9cbcc0b6592b9a0a247925eade93dc49',0,'1',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,18,18,'12',4,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(10,'admin6','12345678906','b1bba3b073c062ca3af5ba8c4bc9b8c2','f5e718ee6a98b87c79dce45e64a5ca61',0,'1',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,17,17,'12',6,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(20,'8482064','18159801260','e5ce8cc8181c877e5d44a88be8a7c845','18fffee607f3f8b16bfd6c6ec328d669',0,'2',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',0,1,NULL,3054,11,11,'20.0',4,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(42,'8482063','18159801259','8dd89c1c8c6e31c67469f19607e5e3ba','6c9bd72402e8ac7289c883bb0daedfe1',0,'2',NULL,'nick1','真实名字','350000199909091234','东肖北路1号',0,0,NULL,2112,10,10,'10.0',2,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/pic/Images/head/a301722d-393d-4dd0-86ba-dd3389de98cf.jpg','97733f7e-a09a-416a-a73c-71795881672d','测试账号'),(43,'6069140','18159801211','123d491444893e62ed6a093a9078c231','4aabb821a28d8be9a74c8d024422a2f8',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,200,17,29,'28.0',11,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(44,'1698680','18159801212','0933d95785cb6ce84d69fffa1a739441','f2e6e4561b038f83e893abfb8958e6d1',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,8,8,'24',6,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(45,'8757791','18159801001','5836dc60d258b5b463ed87bccb68656d','58d54da521457c74423917b048007af2',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,7,7,'24',24,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','19686147-1130-4f7b-8ce7-6e13d166891d','测试账号'),(46,'2303546','18159801002','3ebbfd647566f9f88954921125bd2ba8','8b3a8f3341b6046a9ad45f0b2e530978',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,6,6,'24',8,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','8a457520-752e-4f9c-8eaa-e2a0887a0da7','测试账号'),(47,'9272096','18159801003','c0bba4c3f7cb5c891a93f2bdf6989c08','fc034420bfd98c320e909d96a5fee7ea',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,5,5,'24',12,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','ee76605b-8b99-4340-9fa1-6da726f3e121','测试账号'),(48,'3682860','18159801004','5987531c33375ec9a3ba88703e14d67f','099c5fcf960e0ec33f3117f44ae0c782',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,4,4,'24',6,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','915394f5-2d78-4e4d-ad96-10db8fc806b9','测试账号'),(49,'2831978','18159800001','c64a666a58bfdf1eeaeb6785c84ec57d','6ec8cc8dc75f7c575fa0de9a2abdec66',0,'2',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,3,3,'24',6,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(50,'1875892','18159800003','1df30f8e88d613c9cdeaab13ef8dbe75','051c23ee68286015c68a5ae90d78deac',0,'2',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,2,2,'24',8,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','833f3299-7812-4092-8bea-56bcf2f22695','测试账号'),(52,'admin1','12332123123','a20b279521e20953233b5da6796a5b92','219b5372c38901e1b329be128e968f14',0,'1',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,1,1,'24',8,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号');
/*!40000 ALTER TABLE `hh_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_user_role`
--

DROP TABLE IF EXISTS `hh_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_user_role` (
  `hh_user_id` int(11) NOT NULL,
  `hh_role_id` int(11) NOT NULL,
  PRIMARY KEY (`hh_user_id`,`hh_role_id`),
  KEY `fk_hh_user_role_hh_role1_idx` (`hh_role_id`),
  CONSTRAINT `fk_hh_user_role_hh_role1` FOREIGN KEY (`hh_role_id`) REFERENCES `hh_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_user_role_hh_user` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user_role`
--

LOCK TABLES `hh_user_role` WRITE;
/*!40000 ALTER TABLE `hh_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-27 21:47:08
