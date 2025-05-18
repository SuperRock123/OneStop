-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: xm_shopping_manager
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人',
  `useraddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='地址信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,6,'张三',' 1','13531744059'),(2,10,'lzy','西华大学德馨苑','17790282089');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin','管理员','http://localhost:9090/files/1697438073596-avatar.png','ADMIN','13677889922','admin@xm.com');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家介绍',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商家信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (2,'meshe','123','ifashion','http://localhost:9090/files/1725555726576-avatar.png','BUSINESS','18877776666','meshe@xm.com','MsShe(慕姗.诗怡)--始创于2010年，定义“欧美简约、奢华风格 致力传播丰盈女性自信优雅之美 诠释现代丰盈女性独立自主，淡然优雅的淑女气 享受生活，拒绝平庸，于时尚与生活中挥洒自如，淡淡演绎完美生活','审核通过'),(3,'perfume','123','香水之家','http://localhost:9090/files/1725569094268-鞋_箱包.png','BUSINESS','18899990000','perfume@xm.com','成立于2010年，陌陌集团旗下大型香水批发户。倡导「便捷 廉价」的生活方式，提升消费者的生活品质。截至2023年7月，已遍布全国31个省级行政区，220+个城市，近 2000家门店。','审核通过'),(4,'computer','123','启航电脑配件','http://localhost:9090/files/1725568992004-1.png','BUSINESS','18899990000','computer@xm.com','成立于2010年，鹿鹿集团旗下大型批发户。倡导「便捷 廉价」的生活方式，提升消费者的生活品质。截至2023年7月，已遍布全国31个省级行政区，220+个城市，近 2000家门店。','审核通过'),(5,'123456','123456','123456',NULL,'BUSINESS',NULL,NULL,NULL,'审核中'),(6,'米家','123123','米家专卖店','http://localhost:9090/files/1747548766255-屏幕截图 2025-01-15 233154.png','BUSINESS',NULL,NULL,'米家','审核通过');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `goods_id` int DEFAULT NULL COMMENT '商品ID',
  `business_id` int DEFAULT NULL COMMENT '店铺ID',
  `num` int DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (13,9,1,2,1),(15,9,11,4,1),(16,9,14,4,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collect` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `goods_id` int DEFAULT NULL COMMENT '商品ID',
  `business_id` int DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='收藏信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (1,6,10,2),(6,6,1,2),(7,6,9,2),(8,9,1,2),(9,9,11,4),(10,9,14,4),(11,6,13,4);
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `goods_id` int DEFAULT NULL COMMENT '商品ID',
  `business_id` int DEFAULT NULL COMMENT '店铺ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='评论信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (3,6,9,2,'真好看','2024-09-12 02:20:07'),(4,6,1,2,'1111','2025-05-18 13:55:46');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品主图',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '商品介绍',
  `price` double(10,2) DEFAULT NULL COMMENT '商品价格',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '计件单位',
  `count` int DEFAULT '0' COMMENT '商品销量',
  `type_id` int DEFAULT NULL COMMENT '分类ID',
  `business_id` int DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'设计感修身短款t恤女夏季新款圆领薄款短袖白色高腰紧身露脐上衣','https://img13.360buyimg.com/n7/jfs/t1/262550/20/23097/43293/67b9ae6fF446ce40b/860efaa1179dbb72.png','<p>1<img src=\"http://localhost:9090/files/1725617680698-d1.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/><img src=\"http://localhost:9090/files/1725617689769-d2.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725617693315-d3.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725617699718-d4.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725617703118-d5.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',59.00,'件',1,6,2),(9,'美式复古短袖T恤女纯棉夏ins潮半袖2023年新款设计感小众v领体桖','https://img12.360buyimg.com/n7/jfs/t1/250376/23/38559/87300/67c977c4F5bd7fe53/181299e1cb9766af.png.avif','<p><img src=\"http://localhost:9090/files/1725647624123-d1.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725647627676-d2.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725647637520-d3.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725647640646-d4.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725647643803-d5.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',88.00,'件',0,6,2),(10,'加绒加厚MsShe大码女装2023新款秋装胖mm多巴胺V领宽松卫衣上衣冬','https://img11.360buyimg.com/n7/jfs/t1/255802/31/15901/60447/67934e56F9124722e/81404a54534a74b0.jpg.avif','<p><img src=\"http://localhost:9090/files/1725654562440-d1.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725654565686-d2.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725654570596-d3.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725654591744-d4.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725654596170-d5.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725654602007-d6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725654607373-d7.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1725654609904-d8.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',188.00,'件',0,6,2),(11,'联想台式电脑主机商务办公采购高配游戏设计学习全套六核电脑整机','https://img13.360buyimg.com/n7/jfs/t1/181291/19/44288/63244/6641ece6Fc1f47023/5efb09a8be67a0dc.jpg.avif','<p><img src=\"http://localhost:9090/files/1727093810285-2.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727093814264-3.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727093819584-4.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727093823421-5.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727093830489-6.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',3699.00,'台',1,4,4),(12,'雷柏M650无线鼠标三模蓝牙鼠标办公静音小巧台式笔记本电脑可爱女','https://img11.360buyimg.com/n7/jfs/t1/205394/37/44013/44592/6700b805F5bbc9328/11aa5fb081235769.jpg.avif','<p><img src=\"http://localhost:9090/files/1727093933644-2.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727093938295-3.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727093941644-4.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727093949971-5.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727093986063-手淘网页版_主图_1.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',39.00,'个',1,4,4),(13,'Xiaomi_小米笔记本电脑办公商务大学生网课超轻薄i7游戏本手提i5','https://img11.360buyimg.com/babel/s480x480_jfs/t1/108833/13/48920/131051/66e4f3deF124a8dce/8079bf5481cfcd0d.jpg.avif','<p><img src=\"http://localhost:9090/files/1727096151747-1.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727096154971-2.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727096158508-3.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727096179747-4.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',4999.00,'台',1,4,4),(14,'honor_荣耀笔记本电脑商务办公大学生i7吃鸡游戏本剪辑设计i5便携','https://img11.360buyimg.com/n7/jfs/t1/5541/29/23429/356203/66908599Fae97eeb7/9fba75d97571c2c6.jpg.avif','<p><img src=\"http://localhost:9090/files/1727098989203-2.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727098995176-3.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727098999286-4.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727099001879-5.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',4999.00,'台',0,4,4),(15,'i7高配独显一体机电脑台式全套整机主机八核商务办公家用游戏吃鸡','https://img10.360buyimg.com/babel/s480x480_jfs/t1/219554/39/42455/81559/665e75c2F5b540b05/939d4d27ad8f39bb.jpg.avif','<p><img src=\"http://localhost:9090/files/1727100614323-1.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727100618268-2.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727100621336-3.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727100624422-4.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727100628173-5.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',3999.00,'台',0,4,4),(16,'Dell_戴尔灵越15.6英寸轻薄笔记本电脑英特尔学习游戏办公商务手提剪辑PS设计pr高性能本官方旗舰店','https://img13.360buyimg.com/n7/jfs/t1/278710/19/198/104440/67ce3edaFc726b47c/e28c8d230c40fe27.png.avif','<p><img src=\"http://localhost:9090/files/1727100707358-2.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727100710198-3.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727100716898-4.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727100719571-5.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',4000.00,'台',0,4,4),(17,'2023款13代酷睿i3_i5 联想台式电脑天逸510S主机 家用办公台式机设计游戏学习小主机全套 官方旗舰正品原装','https://img13.360buyimg.com/n1/s450x450_jfs/t1/270697/13/831/112005/67ce7b23F90565f11/bf7fd680c1d62dd4.jpg.avif','<p><img src=\"http://localhost:9090/files/1727100822481-2.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727100827324-3.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727100843500-4.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:9090/files/1727100857177-5.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',5999.00,'台',0,4,4),(18,'小米电视','http://localhost:9090/files/1747548863920-屏幕截图 2024-02-19 101520.png','',144.00,'1',0,11,6);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='公告信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (4,'beta内测','beta v1.0','2025-05-18','admin');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单ID',
  `goods_id` int DEFAULT NULL COMMENT '商品ID',
  `business_id` int DEFAULT NULL COMMENT '商家ID',
  `num` int DEFAULT NULL COMMENT '商品数量',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `price` double(10,2) DEFAULT NULL COMMENT '订单价格',
  `address_id` int DEFAULT NULL COMMENT '地址ID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,'20240912015521',9,2,1,1,88.00,1,'待收货'),(4,'20240912021845',9,2,1,6,88.00,1,'已评价'),(5,'20240912021845',1,2,1,6,59.00,1,'已评价'),(6,'20240912021845',10,2,1,6,188.00,1,'已完成'),(8,'20250517155946',12,4,1,10,39.00,2,'待发货'),(9,'20250518135258',13,4,1,6,4999.00,1,'待发货'),(10,'20250518135339',1,2,1,6,59.00,1,'待发货');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类描述',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'母婴玩具','这是母婴玩具类商品','http://localhost:9090/files/1725484062139-母婴玩具.png'),(2,'精品男装/户外运动','这是男装类商品','http://localhost:9090/files/1725484032186-男装.png'),(3,'珠宝/饰品/护肤','这是珠宝饰品','http://localhost:9090/files/1725484086574-珠宝饰品.png'),(4,'电脑/电子办公/配件',NULL,'http://localhost:9090/files/1725487543901-电脑.png'),(5,'手机/数码/配件',NULL,'http://localhost:9090/files/1725487552271-数码手机.png'),(6,'女装/内衣',NULL,'http://localhost:9090/files/1725487618875-女装内衣.png'),(7,'零食/茶酒/进口食品',NULL,'http://localhost:9090/files/1725487656738-食品.png'),(8,'医药/保健品',NULL,'http://localhost:9090/files/1725487828220-医药保健.png'),(9,'水果生鲜',NULL,'http://localhost:9090/files/1725487875700-喵鲜生.png'),(10,'汽车配件',NULL,'http://localhost:9090/files/1725487941434-汽车配件.png'),(11,'家用电器',NULL,'http://localhost:9090/files/1725487977270-家用电器.png'),(12,'家具/灯具',NULL,'http://localhost:9090/files/1725488019219-家具建材.png'),(13,'家纺/家饰',NULL,'http://localhost:9090/files/1725488073720-家纺家饰.png');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'zhangsan','123','张三','http://localhost:9090/files/1725572353284-logo.png','USER','10086','zhangsan@xm.com'),(9,'lisi','123','lisi',NULL,'USER',NULL,NULL),(10,'123456','123456','123456',NULL,'USER',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 14:58:26
