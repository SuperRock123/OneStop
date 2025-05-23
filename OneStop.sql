-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: onestop
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='地址信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,6,'张三',' 1','13531744059'),(2,10,'lzy','西华大学德馨苑','17790282089'),(3,13,'刘驰恒','西华大学','123456789');
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
INSERT INTO `admin` VALUES (1,'admin','admin','管理员','http://127.0.0.1:9000/files/1747916764302-user5.webp','ADMIN','13677889922','admin@onestop.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商家信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (2,'联想电脑','123','联想电脑官方旗舰店','http://localhost:9090/files/联想logo.jpg','BUSINESS','18877776666','lx@onestop.com','联想电脑','审核通过'),(3,'yonex','123','尤尼克斯','http://localhost:9090/files/尤尼克斯logo.jpg','BUSINESS','18899990000','perfume@xm.com','尤尼克斯（YONEX） 是世界著名的羽毛球品牌。为了统治羽拍市场，也为了尽量满足不同使用需求，尤尼克斯研发了大量的型号的羽毛球用品。作为世界知名的羽拍专业制造商，羽拍牢牢占据世界第一的地位，同时网球拍也得到许多知名球星的喜爱。','审核不通过'),(4,'华为','123','华为','http://localhost:9090/files/华为logo.jpg','BUSINESS','18892390030','xiaomi@coestop','','审核通过'),(5,'xiaomi','123','小米旗舰店','http://localhost:9090/files/小米logo.webp','BUSINESS','18899992200','xiaomi@onestop.com','','审核通过'),(6,'apple','123','苹果旗舰店','http://localhost:9090/files/苹果logo.jpg','BUSINESS','18899990023','apple@onestop.com','','审核通过'),(8,'onestop生鲜','onestop','官方生鲜专卖店','http://127.0.0.1:9000/files/1747966818129-logo1.png','BUSINESS','12345678910','freshfood@onestop.com',NULL,'审核通过'),(9,'onestop电器','onestop','官方电器专卖店','http://127.0.0.1:9000/files/1747966818129-logo1.png','BUSINESS','12345678910','appliance@onestop.com',NULL,'审核中'),(10,'onestop时装','onestop','官方时装专卖店','http://127.0.0.1:9000/files/1747966818129-logo1.png','BUSINESS','12345678910','fashion@onestop.com',NULL,'审核通过');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (13,9,1,2,1),(15,9,11,4,1),(16,9,14,4,1),(20,9,47,NULL,1),(22,13,52,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='收藏信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (1,6,10,2),(6,6,1,2),(7,6,9,2),(11,6,13,4),(12,9,47,NULL),(13,13,57,NULL),(14,13,52,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='评论信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (3,6,9,2,'真好看','2024-09-12 02:20:07'),(4,6,1,2,'1111','2025-05-18 13:55:46'),(5,13,57,NULL,'很流畅','2025-05-23 10:26:43');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'1','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2025-05-21 01:25:34',0,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (19,'iPhone 15 Pro','https://img13.360buyimg.com/n7/jfs/t1/262550/20/23097/43293/67b9ae6fF446ce40b/860efaa1179dbb72.png','最新款苹果手机，搭载A17芯片，4800万像素主摄',999.99,'台',44,5,6),(20,'MacBook Air M2','https://img12.360buyimg.com/n7/jfs/t1/250376/23/38559/87300/67c977c4F5bd7fe53/181299e1cb9766af.png.avif','搭载M2芯片的轻薄笔记本，续航持久',1299.99,'台',783,4,6),(21,'AirPods Pro','https://img11.360buyimg.com/n7/jfs/t1/255802/31/15901/60447/67934e56F9124722e/81404a54534a74b0.jpg.avif','主动降噪无线耳机，空间音频',249.99,'台',100,5,6),(22,'女士连衣裙','https://img13.360buyimg.com/n7/jfs/t1/181291/19/44288/63244/6641ece6Fc1f47023/5efb09a8be67a0dc.jpg.avif','夏季碎花连衣裙，舒适透气',159.99,NULL,60,6,10),(23,'运动休闲裤','https://img11.360buyimg.com/n7/jfs/t1/205394/37/44013/44592/6700b805F5bbc9328/11aa5fb081235769.jpg.avif','弹力面料，适合运动休闲',89.99,NULL,120,2,10),(25,'有机水果礼盒','https://img11.360buyimg.com/babel/s480x480_jfs/t1/108833/13/48920/131051/66e4f3deF124a8dce/8079bf5481cfcd0d.jpg.avif','精选当季水果，营养美味',99.99,NULL,40,7,8),(26,'进口零食大礼包','https://img11.360buyimg.com/n7/jfs/t1/5541/29/23429/356203/66908599Fae97eeb7/9fba75d97571c2c6.jpg.avif','多种进口零食组合',149.99,NULL,70,7,8),(27,'坚果混合包','https://img10.360buyimg.com/babel/s480x480_jfs/t1/219554/39/42455/81559/665e75c2F5b540b05/939d4d27ad8f39bb.jpg.avif','每日坚果，营养均衡',79.99,NULL,90,7,8),(28,'智能台灯','https://img13.360buyimg.com/n7/jfs/t1/278710/19/198/104440/67ce3edaFc726b47c/e28c8d230c40fe27.png.avif','可调节亮度色温，护眼设计',129.99,NULL,45,11,4),(29,'空调被','https://img13.360buyimg.com/n1/s450x450_jfs/t1/270697/13/831/112005/67ce7b23F90565f11/bf7fd680c1d62dd4.jpg.avif','北欧风格，舒适耐用',90.99,NULL,15,13,NULL),(30,'富氢净饮机','https://img10.360buyimg.com/n1/s450x450_jfs/t1/253978/28/18937/89230/67a73968F841041a0/1a7f404b38350eb4.jpg.avif','碧云泉N9【国家补贴】富氢净饮机免安装净煮速热茶饮水一体机台...',12899.99,NULL,60,11,9),(31,'Python编程入门','https://img14.360buyimg.com/n7/jfs/t1/187536/31/42622/92600/65091a77F49dc7229/497f6d631fc7a7c2.jpg.avif','零基础入门Python编程',79.99,NULL,40,1,NULL),(32,'世界名著全集','https://img12.360buyimg.com/n7/jfs/t1/155991/6/21574/119035/61760a9fEbe11a970/a55c4c38d77aca93.jpg.avif','精装版世界文学名著',299.99,NULL,25,1,NULL),(33,'儿童绘本套装','https://img13.360buyimg.com/n7/jfs/t1/105429/24/49393/138931/66c543e4Fdce54fd2/78722a530fd1ea9a.jpg.avif','趣味性强的儿童绘本',129.99,NULL,50,1,NULL),(34,'瑜伽垫','https://img11.360buyimg.com/n7/jfs/t1/256864/33/24416/63278/67bbc627Fca65c95b/3282887e0ddd6880.jpg.avif','环保材质，防滑耐用',49.99,NULL,100,2,10),(35,'哑铃套装','https://img11.360buyimg.com/n7/jfs/t1/2537/38/25241/103203/670dd6b9F03292ae3/830392608642b32c.jpg.avif','可调节重量，家用健身',199.99,NULL,30,2,NULL),(36,'跑步机','https://img11.360buyimg.com/n7/jfs/t1/264425/9/29453/149965/67ca9e7cFd77301b8/eb416c26d357eff1.jpg.avif','静音设计，多功能显示',2999.99,NULL,10,11,9),(37,'护肤套装','https://img11.360buyimg.com/n7/jfs/t1/263408/19/30831/70123/67ccf0e3Fc6ff853c/ef7a6ac7147c2672.jpg.avif','补水保湿，改善肤质',299.99,NULL,39,3,NULL),(38,'口红礼盒','https://img11.360buyimg.com/n7/jfs/t1/173721/39/47697/97235/6734d015F96dddc87/ac171e77deed66d3.jpg.avif','多色号组合，持久显色',199.99,NULL,50,3,10),(39,'香水套装','https://img11.360buyimg.com/n7/jfs/t1/260404/11/25146/52927/67bfd212Fa1566138/05dc209ebbd1ae2f.jpg.avif','淡雅香型，持久留香',399.99,NULL,30,3,NULL),(40,'智能手表','https://img14.360buyimg.com/n7/jfs/t1/260564/36/30200/42874/67cc2bbdF7477ead0/2c18272022af83e1.png.avif','心率监测，运动追踪',399.99,NULL,35,5,4),(41,'休闲运动鞋','https://img14.360buyimg.com/n7/jfs/t1/260703/16/26125/131816/67c2cd77Fa23a94b5/c38c0d6c70ec5928.jpg.avif','轻便舒适，时尚百搭',159.99,NULL,75,2,10),(42,'苹果 Watch Series 10','https://img14.360buyimg.com/n7/jfs/t1/260564/36/30200/42874/67cc2bbdF7477ead0/2c18272022af83e1.png.avif','智能手表',388.88,'台',200,5,6),(43,'海尔KFR-35GW','https://img14.360buyimg.com/n7/jfs/t1/264452/18/29895/110326/67cbd205F992b235b/1e954b974c21b76c.jpg.avif','【小红花套系】 劲爽1.5匹一级能效',888.99,NULL,20,11,9),(44,'京东京造JS-383','https://img12.360buyimg.com/n7/jfs/t1/254602/40/29526/115914/67c8fb4bF0ed815b4/9f4dd24d8786b5cb.jpg.avif','京东京造汽车应急启动电源充气泵一体机搭电宝电瓶充电器户外电源...',229.99,NULL,22,11,9),(45,'饭小馋小馄饨','https://img11.360buyimg.com/n7/jfs/t1/240021/1/6379/160896/661cd8dcFae64edcb/8b2f54a5632be618.jpg.avif',' 饭小馋混合口味小馄饨抄手 6桶362g 鸡汤虾米红油整箱馄饨...',20.23,NULL,299,7,8),(46,'手工老面小笼包','https://img11.360buyimg.com/n7/jfs/t1/256294/36/12464/186262/678487caF3d2706a9/bf944652233053a5.jpg.avif','皇家小虎嵊州风味手工老面小笼包1000g约40个儿童早餐半成...',19.98,NULL,209,7,8),(47,'厄瓜多尔白虾','https://img11.360buyimg.com/n7/jfs/t1/262779/20/6748/152056/6775e67dFe6af2c55/14d367d3f34d1296.jpg.avif','<p>鲜京采 厄瓜多尔白虾 净重3斤/盒 特大号20-30规格 ...</p><p><img src=\"https://img14.360buyimg.com/n5/s720x720_jfs/t1/239407/36/24610/133006/675ad16dF87bf9598/3f95e1157baec135.png.avif\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"https://img14.360buyimg.com/n5/s720x720_jfs/t1/231156/23/34063/283246/675ab61bFe1d5bd92/011621109b740673.png.avif\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',39.88,NULL,4000,7,8),(48,'巴西进口原切胸部牛肋肉','https://img14.360buyimg.com/n7/jfs/t1/258746/3/4025/100179/676e41e1Fb2a96ab2/611ccf47c191122b.jpg.avif','鲜京采 巴西进口原切胸部牛肋肉 2斤 牛肋条 炖煮烧烤 京东...',88.88,NULL,679,7,8),(49,'广西武鸣沃柑','https://img13.360buyimg.com/babel/s480x480_jfs/t20251202/246953/39/26431/78366/674d2ce3F6192d37c/d07ed508595838e4.jpg.avif','京鲜生 广西武鸣沃柑 净重5斤装 单果110g+ 生鲜水果 ...',28.99,NULL,889,7,8),(50,'蛋白面包棒','https://img10.360buyimg.com/babel/s480x480_jfs/t20270711/237195/34/19836/57612/668f3fffF23c65dc1/bd0fc5e324ef6b29.jpg.avif','良品铺子乳清蛋白面包棒500g学生营养早餐整箱吐司夹心零食牛...',34.99,NULL,600,7,8),(51,'变频洗衣机','https://img11.360buyimg.com/n1/s450x450_jfs/t1/8859/22/26964/162000/66ebf3e4F6a93634a/6700071498070b3d.jpg.avif','小天鹅（LittleSwan）直驱变频洗衣机全自动波轮大容量...',1599.00,NULL,399,11,9),(52,'胜利NS3000','https://img12.360buyimg.com/n1/jfs/t1/68809/32/21285/56775/62d7827eE77e18a76/2b03272436cd28de.jpg.avif','塑料羽毛球耐打稳定6只装尼龙羽毛球',39.98,NULL,308,2,NULL),(53,'YY耐打AS9','https://img13.360buyimg.com/n1/jfs/t1/229656/14/4536/95541/6562ce3aF831e859e/f0103ee387f489ae.jpg.avif','YONEX 尤尼克斯羽毛球',45.54,NULL,401,2,NULL),(54,'均衡之刃','https://img12.360buyimg.com/n1/jfs/t1/252619/22/25427/150046/67c3ce1aFe80b6400/516514977a2bb130.jpg.avif','<p>的幸（DRACAENA）黄厂均衡之刃全碳素纤维材质羽毛球进攻耐打初学者新手耐用单拍 皓月白 成品拍</p><p><img src=\"https://img12.360buyimg.com/n5/s720x720_jfs/t1/58038/30/18060/194122/641a5884F41259d39/89b301aeac53714e.jpg.avif\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"https://img12.360buyimg.com/n5/s720x720_jfs/t1/205612/6/31512/169592/641a5885F41c8c006/480c04428425e567.jpg.avif\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"https://img12.360buyimg.com/n5/s720x720_jfs/t1/160658/19/31499/201629/641a5885F68b8fbf7/729d165145a84c75.jpg.avif\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',99.00,NULL,892,2,NULL),(55,'川崎羽毛球拍','https://img12.360buyimg.com/n1/jfs/t1/238101/10/22203/85329/66b39d6bF400f5339/094f613dd9337751.jpg.avif','女武神-紫(紫色线)6u进攻拍 22-23磅',219.99,NULL,321,2,NULL),(56,'华为MateBook','https://img12.360buyimg.com/n1/s450x450_jfs/t1/267696/32/19782/76569/67aeef39F7da14ad6/2ba915a571167f0f.jpg.avif','<p>华为MateBook D 14 SE 2023笔记本电脑 国家补贴20% 12代酷睿/14英寸护眼屏i5 16G 512G 皓月银</p><p><img src=\"https://img11.360buyimg.com/n5/s720x720_jfs/t1/311920/2/1444/126753/6826fda5F5a7f826b/a747f25cbe1c3e5b.png.avif\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"https://img11.360buyimg.com/n5/s720x720_jfs/t1/228223/16/17099/22554/6646d3edFafac28d0/ee1c57d7398c006f.jpg.avif\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>',3299.00,NULL,489,4,4),(57,'联想拯救者Y9000P','https://img11.360buyimg.com/n1/jfs/t1/235389/30/36371/585535/67c7f029F91906271/49780473c1501f75.png.avif','<p>可选RTX4060满血独显电竞游戏笔记本电脑 大学生商务设计本 i7-13700H 标压蓝光护眼屏</p><img src=\"https://img11.360buyimg.com/n5/s720x720_jfs/t1/286400/9/6521/541941/682b4540F0accbce6/9cff2db353d05253.png.avif\" style=\"max-width:100%;\" contenteditable=\"false\"/><p><img src=\"https://img11.360buyimg.com/n5/s720x720_jfs/t1/67486/19/28281/111989/66cacd10F08010275/cd942eb9f59aed5c.png.avif\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><div style=\"display: flex; gap: 20px; justify-content: center; margin: 20px;\">   <!-- 竖屏视频 (9:16 比例) -->   <img src=\"https://img11.360buyimg.com/n5/s720x720_jfs/t1/10319/5/26026/114850/66cacd26F93c613ab/a51839ef7b38c1bd.png.avif\" style=\"max-width:100%;\" contenteditable=\"false\"/> </div>',6399.20,NULL,897,4,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='公告信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (4,'beta内测','beta v1.0','2025-05-18','admin'),(5,'v1.0','添加缓存系统','2025-05-20','admin'),(6,'v1.1','添加对象管理系统','2025-05-21','admin'),(7,'v1.2','优化界面','2025-05-22','admin'),(8,'v1.3','优化数据库','2025-05-23','admin');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,'20240912015521',9,2,1,1,88.00,1,'待收货'),(4,'20240912021845',9,2,1,6,88.00,1,'已评价'),(5,'20240912021845',1,2,1,6,59.00,1,'已评价'),(6,'20240912021845',10,2,1,6,188.00,1,'已完成'),(8,'20250517155946',12,4,1,10,39.00,2,'待发货'),(9,'20250518135258',13,4,1,6,4999.00,1,'待发货'),(10,'20250518135339',1,2,1,6,59.00,1,'待发货'),(11,'20250523101345',57,NULL,1,13,6399.20,3,'已评价');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'zhangsan','123','张三','http://127.0.0.1:9000/files/1747916280936-user1.webp','USER','10086','zhangsan@onestop.com'),(9,'zfy','zfy','张飞扬','http://127.0.0.1:9000/files/1747916287172-user2.webp','USER','1289234213','zfy@onestop.com'),(13,'lch','lch','lch','http://127.0.0.1:9000/files/1747916293679-user3.webp','USER',NULL,NULL),(14,'msy','msy','msy','http://127.0.0.1:9000/files/1747916300344-user4.webp','USER',NULL,NULL),(15,'lh','lh','lh','http://127.0.0.1:9000/files/1747916384719-user5.webp','USER',NULL,NULL),(16,'wyt','wyt','wyt','http://127.0.0.1:9000/files/1747916394083-user6.webp','USER',NULL,NULL),(17,'ck','ck','ck','http://127.0.0.1:9000/files/1747916400089-user1.webp','USER',NULL,NULL);
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

-- Dump completed on 2025-05-23 10:39:57
