-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--

use csdl_medsul
-- Host: 127.0.0.1    Database: csdl_medsul
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `ADMIN_ID` int NOT NULL AUTO_INCREMENT,
  `ADMIN_HOTEN` varchar(300) NOT NULL,
  `ADMIN_EMAIL` varchar(300) NOT NULL,
  `ADMIN_GIOITINH` varchar(100) NOT NULL,
  `ADMIN_USERNAME` varchar(300) NOT NULL,
  `ADMIN_PASSWORD` varchar(300) NOT NULL,
  `ADMIN_DIACHI` longtext NOT NULL,
  `ADMIN_CMND` varchar(100) NOT NULL,
  `ADMIN_CMNDNGAYCAP` date NOT NULL,
  `ADMIN_CMNDNOICAP` longtext NOT NULL,
  `ADMIN_CMNDMATTRUOC` longtext NOT NULL,
  `ADMIN_CMNDMATSAU` longtext NOT NULL,
  `ADMIN_AVATAR` longtext,
  `ADMIN_TINHTRANG` int NOT NULL,
  `ADMIN_SDT` varchar(100) NOT NULL,
  `ADMIN_CHUCVU` tinyint DEFAULT NULL,
  `ADMIN_NGAYSINH` date DEFAULT NULL,
  PRIMARY KEY (`ADMIN_ID`),
  UNIQUE KEY `ADMIN_EMAIL_UNIQUE` (`ADMIN_EMAIL`),
  UNIQUE KEY `ADMIN_USERNAME_UNIQUE` (`ADMIN_USERNAME`),
  UNIQUE KEY `ADMIN_SDT_UNIQUE` (`ADMIN_SDT`),
  UNIQUE KEY `ADMIN_CMND_UNIQUE` (`ADMIN_CMND`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (4,'Tr???n Thanh Quy','thanhquy0164@gmail.com','Nam','quy','quy123','Long An','301634259','2013-10-15','LA','chuaco','chuaco','chuaco',1,'0375250024',0,NULL),(5,'L?? Ng???c H???u','hau@gmail.com','Nam','hau','hau123','LA','012345678','2013-10-15','LA','chuaco','chuaco','chuaco',1,'0123456789',1,NULL),(6,'Nguy???n Lan','lan@gmail.com','Nam','lan','lan123','LA','032165489','2013-10-15','LA','chuaco','chuaco','chuaco',1,'0123456852',1,NULL),(7,'Nguy???n Tr???ng D????ng','duon@gmail.com','Nam','duong','duong123','LA','258963123','2013-10-15','LA','chuaco','chuaco','chuaco',1,'0123526325',1,NULL),(8,'L?? Anh Ki???t','ket@gmail.com','Nam','kiet','kiet123','LA','254123652','2013-10-15','LA','chuaco','chuaco','chuaco',1,'2541203215',1,NULL),(9,'Nguy???n Ng???c Kha','kha@gmail.com','Nam','kha','kha123','LA','215236521','2013-10-15','LA','chuaco','chuaco','chuaco',1,'2512355625',1,NULL),(10,'Tr???n V??n Ba','quym@gmail.com','Nam','ba','ba123','123 HCM','012352102','2013-02-03','HCM','chua co 2','chua co2','chua co 2',1,'012352145201',1,'1995-03-01');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietdat`
--

DROP TABLE IF EXISTS `chitietdat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdat` (
  `CTD_ID` int NOT NULL AUTO_INCREMENT,
  `DV_ID` int NOT NULL,
  `DL_ID` int NOT NULL,
  `CTD_NGAYBATDAU` date NOT NULL,
  `CTD_DONGIA` double NOT NULL,
  `CTD_GIOBATDAU` time NOT NULL,
  PRIMARY KEY (`CTD_ID`),
  KEY `FK_CHITIETDAT_CO_DICHVU` (`DV_ID`),
  KEY `FK_CO_CHITIETDAT` (`DL_ID`),
  CONSTRAINT `FK_CHITIETDAT_CO_DICHVU` FOREIGN KEY (`DV_ID`) REFERENCES `dichvu` (`DV_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CO_CHITIETDAT` FOREIGN KEY (`DL_ID`) REFERENCES `datlich` (`DL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdat`
--

LOCK TABLES `chitietdat` WRITE;
/*!40000 ALTER TABLE `chitietdat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitietdat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chungchi`
--

DROP TABLE IF EXISTS `chungchi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chungchi` (
  `cnganh_id` int NOT NULL AUTO_INCREMENT,
  `cnganh_anhmatsau` varchar(255) DEFAULT NULL,
  `cnganh_anhmattruoc` varchar(255) DEFAULT NULL,
  `dd_id` int DEFAULT NULL,
  `cnganh_ghichu` varchar(255) DEFAULT NULL,
  `cnganh_loai` varchar(255) DEFAULT NULL,
  `cnganh_ngaytotnghiep` date DEFAULT NULL,
  `cnganh_sohieu` varchar(255) DEFAULT NULL,
  `cnganh_tencn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cnganh_id`),
  KEY `FKflg6ukqfocueaexkvaedpvoo` (`dd_id`),
  CONSTRAINT `FKflg6ukqfocueaexkvaedpvoo` FOREIGN KEY (`dd_id`) REFERENCES `dieuduong` (`DD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chungchi`
--

LOCK TABLES `chungchi` WRITE;
/*!40000 ALTER TABLE `chungchi` DISABLE KEYS */;
/*!40000 ALTER TABLE `chungchi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chuyennganh`
--

DROP TABLE IF EXISTS `chuyennganh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyennganh` (
  `CNGANH_ID` int NOT NULL AUTO_INCREMENT,
  `DD_ID` int DEFAULT NULL,
  `CNGANH_TENCN` longtext,
  `CNGANH_LOAI` varchar(100) DEFAULT NULL,
  `CNGANH_NGAYTOTNGHIEP` date DEFAULT NULL,
  `CNGANH_SOHIEU` varchar(300) DEFAULT NULL,
  `CNGANH_ANHMATTRUOC` longtext,
  `CNGANH_ANHMATSAU` longtext,
  `CNGANH_GHICHU` longtext,
  PRIMARY KEY (`CNGANH_ID`),
  KEY `FK_DD_CO_CN` (`DD_ID`),
  CONSTRAINT `FK_DD_CO_CN` FOREIGN KEY (`DD_ID`) REFERENCES `dieuduong` (`DD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyennganh`
--

LOCK TABLES `chuyennganh` WRITE;
/*!40000 ALTER TABLE `chuyennganh` DISABLE KEYS */;
INSERT INTO `chuyennganh` VALUES (1,1,'K??? thu???t vi??n ph???c h???i ch???c n??ng','Kh??','2019-12-10','1524152156','chua co','chua co',NULL),(2,1,'Y s???.','TB','2019-10-10','21536215','chua co','chua co',NULL),(3,2,'K??? thu???t vi??n ph???c h???i ch???c n??ng','Gi???i ','2019-12-29','1524256322','chuaco','cchua co',NULL);
/*!40000 ALTER TABLE `chuyennganh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmnd_dieuduong`
--

DROP TABLE IF EXISTS `cmnd_dieuduong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cmnd_dieuduong` (
  `CMND_ID` int NOT NULL AUTO_INCREMENT,
  `SOCMND` varchar(30) NOT NULL,
  `DD_ID` int DEFAULT NULL,
  `CMND_HOTEN` varchar(300) DEFAULT NULL,
  `CMND_QUOCTICH` varchar(100) DEFAULT NULL,
  `CMND_NOICAP` varchar(100) DEFAULT NULL,
  `CMND_DIACHITT` varchar(400) DEFAULT NULL,
  `CMND_QUEQUAN` varchar(300) DEFAULT NULL,
  `CMND_NGAYCAP` date DEFAULT NULL,
  `CMND_DACDIEMNHANDANG` varchar(400) DEFAULT NULL,
  `CMND_ANHMATTRUOC` longtext,
  `CMND_ANHMATSAU` longtext,
  PRIMARY KEY (`CMND_ID`),
  UNIQUE KEY `SOCMND_UNIQUE` (`SOCMND`),
  UNIQUE KEY `DD_ID_UNIQUE` (`DD_ID`),
  CONSTRAINT `FK_DD_CO_CMND` FOREIGN KEY (`DD_ID`) REFERENCES `dieuduong` (`DD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKcckt2qle68fjkasilwdatb0p0` FOREIGN KEY (`DD_ID`) REFERENCES `dieuduong` (`DD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmnd_dieuduong`
--

LOCK TABLES `cmnd_dieuduong` WRITE;
/*!40000 ALTER TABLE `cmnd_dieuduong` DISABLE KEYS */;
INSERT INTO `cmnd_dieuduong` VALUES (1,'12541235hkbhj',2,'LE NGOC HAU[','Vi???t Nam','HN','123 G','long an 1','2013-10-10','@@ QWE','CH??A C??','CH??A C??'),(3,'301634259lolo',1,'TRAN THANH QUY','Vi???t Nam','LA','phuoc tan hung , chau thanh, long an','long an','2013-10-15','?????p trai nh???t v?? tr??? ','ch??a c??','ch??a c??'),(4,'963245126',3,'NGUYEN LAN','Vi???t Nam','LA','341DA','long an 2','2013-10-10','@@ QWE','CH??A C??','CH??A C??'),(5,'965896325',4,'NGUYEN NGOC KHA','Vi???t Nam','HCM','ASD12','long an 3','2013-10-11','@@ QWE','CH??A C??','CH??A C??');
/*!40000 ALTER TABLE `cmnd_dieuduong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datlich`
--

DROP TABLE IF EXISTS `datlich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datlich` (
  `DL_ID` int NOT NULL AUTO_INCREMENT,
  `MGG_ID` int DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `NB_ID` int DEFAULT NULL,
  `DD_ID` int DEFAULT NULL,
  `TINHT_ID` int NOT NULL,
  `DL_NGAYDAT` datetime NOT NULL,
  `DL_TONGTIEN` double NOT NULL,
  `DL_SDT` varchar(100) NOT NULL,
  `DL_HOTEN` varchar(30) NOT NULL,
  `DL_EMAIL` varchar(50) NOT NULL,
  `DL_GHICHU` varchar(300) DEFAULT NULL,
  `DL_DIACHI` varchar(300) NOT NULL,
  `DL_TINHTRANG` int NOT NULL,
  PRIMARY KEY (`DL_ID`),
  KEY `FK_CO_MAGGIAMGIA` (`MGG_ID`),
  KEY `FK_DIEUDUONG_CO_LICH` (`DD_ID`),
  KEY `FK_LICH_THUOC_TINHTHANH` (`TINHT_ID`),
  KEY `FK_NGUOIBENH_CO_LICHDAT` (`NB_ID`),
  KEY `FK_USER_DAT_LICH` (`USER_ID`),
  CONSTRAINT `FK_CO_MAGGIAMGIA` FOREIGN KEY (`MGG_ID`) REFERENCES `magiamgia` (`MGG_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_DIEUDUONG_CO_LICH` FOREIGN KEY (`DD_ID`) REFERENCES `dieuduong` (`DD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_LICH_THUOC_TINHTHANH` FOREIGN KEY (`TINHT_ID`) REFERENCES `tinhthanh` (`TINHT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_NGUOIBENH_CO_LICHDAT` FOREIGN KEY (`NB_ID`) REFERENCES `nguoibenh` (`NB_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_USER_DAT_LICH` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datlich`
--

LOCK TABLES `datlich` WRITE;
/*!40000 ALTER TABLE `datlich` DISABLE KEYS */;
/*!40000 ALTER TABLE `datlich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dichvu`
--

DROP TABLE IF EXISTS `dichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvu` (
  `DV_ID` int NOT NULL AUTO_INCREMENT,
  `LOAIDV_ID` int NOT NULL,
  `DV_MA` varchar(100) NOT NULL,
  `DV_TEN` varchar(300) NOT NULL,
  `DV_MOTA` longtext,
  `DV_YEUCAUCV` longtext,
  `DV_KHONGBAOGOM` longtext,
  `DV_THOIGIANUOCTINH` double DEFAULT NULL,
  `DV_GIADICHVU` double NOT NULL,
  `DV_TINHTRANG` int NOT NULL,
  PRIMARY KEY (`DV_ID`),
  UNIQUE KEY `DV_MA_UNIQUE` (`DV_MA`),
  UNIQUE KEY `DV_TEN_UNIQUE` (`DV_TEN`),
  KEY `FK_CO` (`LOAIDV_ID`),
  CONSTRAINT `FK_CO` FOREIGN KEY (`LOAIDV_ID`) REFERENCES `loaidichvu` (`LOAIDV_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdp6lttqajuvpddao48037hqag` FOREIGN KEY (`LOAIDV_ID`) REFERENCES `loaidichvu` (`LOAIDV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dichvu`
--

LOCK TABLES `dichvu` WRITE;
/*!40000 ALTER TABLE `dichvu` DISABLE KEYS */;
INSERT INTO `dichvu` VALUES (1,4,'PHCN STB','Ph???c H???i Ch???c N??ng Sau Tai Bi???n','Tai bi???n ??? ?????t qu??? c?? th??? g???p ??? b???t k??? l???a tu???i n??o, t??? l??? cao nh???t ??? ng?????i l???n tu???i nh??ng ??ang c?? xu h?????ng tr??? h??a. H???u qu??? th?????ng g???p nh???t sau tai bi???n l?? b???nh nh??n m???t kh??? n??ng v???n ?????ng, li???t n???a ng?????i kh??ng t??? ch??m s??c ???????c b???n th??n v?? sinh ho???t kh?? kh??n.','Ch??m s??c to??n di???n cho b???nh nh??n t???i nh?? v?? b???nh vi???n thay cho ng?????i nh?? b???nh nh??n b???ng c??c ??i???u d?????ng vi??n ???????c ????o t???o b??i b???n, ch??nh quy','- Thay b??ng c???t ch??? cho v???t th????ng.',3,399000,1),(2,4,'PHCN STN','Ph???c H???i Ch???c N??ng Sau Tai N???n','V???t l?? tr??? li???u v?? v???n ?????ng ph???c h???i ch???c n??ng l?? ho???t ?????ng r???t quang tr???ng quy???t ?????nh ?????n s??? th??nh c??ng c???a ca ph???u thu???t v?? kh??? n??ng ph???c h???i c???a b???nh nh??n. Tuy nhi??n sau khi ph???u thu???t ??i???u tr??? b???nh nh??n v???n c??n r???t ??au, vi???c di chuy???n ??i l???i r???t kh?? kh??n, nhi???u r???i ro, t???n th???i gian v?? chi ph??. Hi???u ???????c ??i???u ???? ch??ng t??i s??? c??? c??c chuy??n vi??n PHCN nhi???u n??m kinh nghi???m ?????n th???c hi???n c??c th??? thu???t v???t l?? tr??? li???u v?? ho???t ?????ng tr??? li???u cho b???n ho???c ng?????i th??n t???i nh?? ho???c b???t k??? ?????a ch??? n??o b???n y??u c???u.','Ch??m s??c to??n di???n cho b???nh nh??n t???i nh?? v?? b???nh vi???n thay cho ng?????i nh?? b???nh nh??n b???ng c??c ??i???u d?????ng vi??n ???????c ????o t???o b??i b???n, ch??nh quy.','- Thay b??ng c???t ch??? cho v???t th????ng.',4,399000,1),(3,5,'CCTM','C???t Ch??? Th???m M???','Khi ??ang b??? ??au ???m th?? vi???c di chuy???n ?????n c??c c?? s??? y t??? ????? th???c hi???n c??c th??? thu???t ????n gi???n nh??ng r???t quan tr???ng nh?? thay b??ng, c???t ch???, r???a v???t th????ng l?? vi???c kh?? kh??n. Hi???u ???????c ??i???u ???? ch??ng t??i s??? c??? c??c ??i???u d?????ng vi??n c?? k??? thu???t cao v?? nhi???u n??m kinh nghi???m ?????n th???c hi???n c??c th??? thu???t t???i nh?? ho???c b???t k??? ?????a ch??? n??o b???n y??u c???u th???c hi???n m???t ho???c m???t nh??m c??c th??? thu???t ch??m s??c b???nh nh??n b???ng k??? thu???t','Ch??m s??c to??n di???n cho b???nh nh??n t???i nh?? v?? b???nh vi???n thay cho ng?????i nh?? b???nh nh??n b???ng c??c ??i???u d?????ng vi??n ???????c ????o t???o b??i b???n, ch??nh quy','- Tr??ng nom, ch??m s??c b???nh nh??n',2,199000,1);
/*!40000 ALTER TABLE `dichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieuduong`
--

DROP TABLE IF EXISTS `dieuduong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieuduong` (
  `DD_ID` int NOT NULL AUTO_INCREMENT,
  `TINHT_ID` int NOT NULL,
  `DD_MA` varchar(100) NOT NULL,
  `DD_HOTEN` varchar(300) NOT NULL,
  `DD_MAGIOITHIEU` varchar(100) DEFAULT NULL,
  `DD_GIOITINH` varchar(100) NOT NULL,
  `DD_NGAYSINH` date DEFAULT NULL,
  `DD_SDT` varchar(100) NOT NULL,
  `DD_EMAIL` varchar(100) NOT NULL,
  `DD_DIACHI` longtext,
  `DD_AVARTAR` longtext,
  `DD_PASSWORD` varchar(100) NOT NULL,
  `DD_LADAOTAOVIEN` tinyint(1) NOT NULL,
  `DD_TRANGTHAI` int NOT NULL,
  PRIMARY KEY (`DD_ID`),
  UNIQUE KEY `DD_MA_UNIQUE` (`DD_MA`),
  UNIQUE KEY `DD_EMAIL_UNIQUE` (`DD_EMAIL`),
  UNIQUE KEY `DD_SDT_UNIQUE` (`DD_SDT`),
  UNIQUE KEY `DD_MAGIOITHIEU_UNIQUE` (`DD_MAGIOITHIEU`),
  KEY `FK_DIEUDUONG_THUOC_TINHTHANH` (`TINHT_ID`),
  CONSTRAINT `FK_DIEUDUONG_THUOC_TINHTHANH` FOREIGN KEY (`TINHT_ID`) REFERENCES `tinhthanh` (`TINHT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKius6pw410pmtcxf4eoloa2onu` FOREIGN KEY (`TINHT_ID`) REFERENCES `tinhthanh` (`TINHT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieuduong`
--

LOCK TABLES `dieuduong` WRITE;
/*!40000 ALTER TABLE `dieuduong` DISABLE KEYS */;
INSERT INTO `dieuduong` VALUES (1,1,'DD0001','Tr???n Thanh Quy',NULL,'Nam','1999-08-02','0375250024','thanhquy0164@gmail.com','911 quang trung ','chua co','quy123',1,1),(2,2,'DD0002','L?? Ng???c H???u',NULL,'Nam','1999-08-02','0122456789','hau@gmail.com','tr??i ?????t','chua co','hau123',0,1),(3,1,'DD0003','Nguy???n Lan',NULL,'Nam','1999-05-03','012352525421','lan@gmail.com','vi???t nam','chua co','lan123',1,1),(4,3,'DD0004','Nguy???n Ng???c Kha',NULL,'Nam','1999-01-01','1235214520','kha@gmail.com','HCM','chua co','kha123',0,1);
/*!40000 ALTER TABLE `dieuduong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giayphephanhnghe`
--

DROP TABLE IF EXISTS `giayphephanhnghe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giayphephanhnghe` (
  `GIAYPHEP_ID` int NOT NULL AUTO_INCREMENT,
  `DV_ID` int NOT NULL,
  `DD_ID` int NOT NULL,
  `DD_DAOTAOVIEN_ID` int NOT NULL,
  `GIAYPHEP_THONGTIN` longtext NOT NULL,
  `GIAYPHEP_XEPLOAI` varchar(300) DEFAULT NULL,
  `GIAYPHEP_TRANGTHAI` int NOT NULL,
  `GIAYPHEP_GHICHU` longtext,
  PRIMARY KEY (`GIAYPHEP_ID`),
  KEY `FK_CO_CTCN` (`DD_ID`),
  KEY `FK_CO_THE_THUC_HIEN` (`DV_ID`),
  KEY `FK_DD_DAOTAO_DDMOI` (`DD_DAOTAOVIEN_ID`),
  CONSTRAINT `FK1kuk1xn3febvpih89dc0weqek` FOREIGN KEY (`DD_ID`) REFERENCES `dieuduong` (`DD_ID`),
  CONSTRAINT `FK_CO_CTCN` FOREIGN KEY (`DD_ID`) REFERENCES `dieuduong` (`DD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CO_THE_THUC_HIEN` FOREIGN KEY (`DV_ID`) REFERENCES `dichvu` (`DV_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_DD_DAOTAO_DDMOI` FOREIGN KEY (`DD_DAOTAOVIEN_ID`) REFERENCES `dieuduong` (`DD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbevbrdr3p0o2ui4fwtvx1s61` FOREIGN KEY (`DD_DAOTAOVIEN_ID`) REFERENCES `dieuduong` (`DD_ID`),
  CONSTRAINT `FKet67072osfh4iwl7xoqe6e1xg` FOREIGN KEY (`DV_ID`) REFERENCES `dichvu` (`DV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giayphephanhnghe`
--

LOCK TABLES `giayphephanhnghe` WRITE;
/*!40000 ALTER TABLE `giayphephanhnghe` DISABLE KEYS */;
INSERT INTO `giayphephanhnghe` VALUES (1,1,2,1,'Gi???y ph??p ph???c h???i ch???c n??ng sau tai bi???n','ch??a c???p',0,NULL),(2,2,4,3,'Gi???y ph??p Ph???c H???i Ch???c N??ng Sau Tai N???n','kh??',1,NULL),(3,2,2,1,'Gi???y ph??p Ph???c H???i Ch???c N??ng Sau Tai N???n','TB',1,NULL),(4,1,4,1,'Gi???y ph??p ph???c h???i ch???c n??ng sau tai bi???n','kh??',2,NULL),(6,3,2,3,'Gi???y Ph??p C???t Ch??? Th???m M???','Kh??',1,NULL),(7,2,2,1,'Gi???y Ph??p Ph???c H???i Ch???c N??ng Sau Tai N???n','R???t',0,NULL),(8,2,3,1,'Gi???y Ph??p Ph???c H???i Ch???c N??ng Sau Tai N???n','Gi???i',1,NULL),(9,1,4,1,'Gi???y ph??p ph???c h???i ch???c n??ng sau tai bi???n','Kh??',1,NULL);
/*!40000 ALTER TABLE `giayphephanhnghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaidichvu`
--

DROP TABLE IF EXISTS `loaidichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaidichvu` (
  `LOAIDV_ID` int NOT NULL AUTO_INCREMENT,
  `LOAIDV_MA` varchar(100) NOT NULL,
  `LOAIDV_TEN` varchar(300) DEFAULT NULL,
  `LOAIDV_TINHTRANG` int NOT NULL,
  PRIMARY KEY (`LOAIDV_ID`),
  UNIQUE KEY `LOAIDV_MA_UNIQUE` (`LOAIDV_MA`),
  UNIQUE KEY `LOAIDV_TEN_UNIQUE` (`LOAIDV_TEN`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaidichvu`
--

LOCK TABLES `loaidichvu` WRITE;
/*!40000 ALTER TABLE `loaidichvu` DISABLE KEYS */;
INSERT INTO `loaidichvu` VALUES (4,'PHCN','Ph???c H???i Ch???c N??ng',1),(5,'TTDD','Th??? Thu???t ??i???u D?????ng',1),(7,'CS-DD','Ch??m S??c ??i???u D?????ng',0);
/*!40000 ALTER TABLE `loaidichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magiamgia`
--

DROP TABLE IF EXISTS `magiamgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magiamgia` (
  `MGG_ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `MGG_MA` varchar(300) DEFAULT NULL,
  `MGG_THONGTIN` varchar(300) DEFAULT NULL,
  `MGG_HESOGIAM` varchar(30) DEFAULT NULL,
  `MGG_TINHTRANG` int DEFAULT NULL,
  PRIMARY KEY (`MGG_ID`),
  UNIQUE KEY `MGG_MA_UNIQUE` (`MGG_MA`),
  KEY `FK_USER_CO_MAGIAMGIA` (`USER_ID`),
  CONSTRAINT `FK_USER_CO_MAGIAMGIA` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magiamgia`
--

LOCK TABLES `magiamgia` WRITE;
/*!40000 ALTER TABLE `magiamgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `magiamgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoibenh`
--

DROP TABLE IF EXISTS `nguoibenh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoibenh` (
  `NB_ID` int NOT NULL AUTO_INCREMENT,
  `TINHT_ID` int NOT NULL,
  `NB_HOTEN` varchar(300) NOT NULL,
  `NB_GIOITINH` varchar(100) DEFAULT NULL,
  `NB_SDT` varchar(100) NOT NULL,
  `NB_NGAYSINH` date DEFAULT NULL,
  `NB_DIACHI` varchar(300) NOT NULL,
  `NB_NHOMMAU` varchar(100) DEFAULT NULL,
  `NB_HUYETAP` varchar(100) DEFAULT NULL,
  `NB_DUONGHUYET` varchar(100) DEFAULT NULL,
  `NB_TIENSUBENH` longtext,
  `NB_AVARTAR` longtext,
  PRIMARY KEY (`NB_ID`),
  KEY `FK_NGUOIBENH_THUOC_TINHTHANH` (`TINHT_ID`),
  CONSTRAINT `FK_NGUOIBENH_THUOC_TINHTHANH` FOREIGN KEY (`TINHT_ID`) REFERENCES `tinhthanh` (`TINHT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoibenh`
--

LOCK TABLES `nguoibenh` WRITE;
/*!40000 ALTER TABLE `nguoibenh` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguoibenh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quanhe`
--

DROP TABLE IF EXISTS `quanhe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quanhe` (
  `QH_ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `NB_ID` int DEFAULT NULL,
  `QH_TENQH` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`QH_ID`),
  KEY `FK_NGUOIBENH_CO_QUANHE` (`NB_ID`),
  KEY `FK_USER_CO_QUANHE` (`USER_ID`),
  CONSTRAINT `FK_NGUOIBENH_CO_QUANHE` FOREIGN KEY (`NB_ID`) REFERENCES `nguoibenh` (`NB_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_USER_CO_QUANHE` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quanhe`
--

LOCK TABLES `quanhe` WRITE;
/*!40000 ALTER TABLE `quanhe` DISABLE KEYS */;
/*!40000 ALTER TABLE `quanhe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quytrinhthuchiendichvu`
--

DROP TABLE IF EXISTS `quytrinhthuchiendichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quytrinhthuchiendichvu` (
  `QUYTRINH_ID` int NOT NULL AUTO_INCREMENT,
  `DV_ID` int NOT NULL,
  `QUYTRINH_THUTU` varchar(100) DEFAULT NULL,
  `QUYTRINH_MOTA` longtext,
  PRIMARY KEY (`QUYTRINH_ID`),
  KEY `FK_DICHVU_CO_QUYTRINH` (`DV_ID`),
  CONSTRAINT `FK_DICHVU_CO_QUYTRINH` FOREIGN KEY (`DV_ID`) REFERENCES `dichvu` (`DV_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbycbeq8jtlw9121wd0y2t83gw` FOREIGN KEY (`DV_ID`) REFERENCES `dichvu` (`DV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quytrinhthuchiendichvu`
--

LOCK TABLES `quytrinhthuchiendichvu` WRITE;
/*!40000 ALTER TABLE `quytrinhthuchiendichvu` DISABLE KEYS */;
INSERT INTO `quytrinhthuchiendichvu` VALUES (19,1,'B?????c 1','Xem h??? s?? b???nh ??n (n???u c??)'),(20,1,'B?????c 2','Ki???m tra c??c ch???c n??ng.'),(21,1,'B?????c 3','L??n ph????ng ??n t???p.'),(22,1,'B?????c 4','H?????ng d???n t???p luy???n'),(23,2,'B?????c 1','Xem h??? s?? b???nh ??n.'),(24,2,'B?????c 2','Ki???m tra c??c ch???c n??ng.'),(25,2,'B?????c 3','L??n ph????ng ??n t???p.'),(26,2,'B?????c 4','H?????ng d???n t???p luy???n.'),(27,3,'B?????c 1','?????c h??? s?? b???nh ??n, ????n thu???c'),(28,3,'B?????c 2','H???i b???nh nh??n, ng?????i nh?? v??? t??nh tr???ng s???c kh???e, kh??m s???c kh???e, ??o nh???p tim, ph???i, huy???t ??p, ki???m tra v???t th????ng'),(29,3,'B?????c 3','H???i b???nh nh??n, ng?????i nh?? v??? t??nh tr???ng s???c kh???e, kh??m s???c kh???e'),(30,3,'B?????c 4','L???p ph????ng ??n ch??m s??c, Th???c hi???n c??c ho???t ?????ng ch??m s??c'),(31,3,'B?????c 5','Kh??m s?? b???, ??o huy???t ??p, nh???p tim, ph???i, ki???m tra v???t th????ng tr?????c khi k???t th??c ca l??m');
/*!40000 ALTER TABLE `quytrinhthuchiendichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinhthanh`
--

DROP TABLE IF EXISTS `tinhthanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinhthanh` (
  `TINHT_ID` int NOT NULL AUTO_INCREMENT,
  `TINHT_MATINHTHANH` varchar(100) NOT NULL,
  `TINHT_TENTINH` varchar(300) DEFAULT NULL,
  `TINHT_HESOGIAMDD` varchar(100) DEFAULT NULL,
  `TINHT_HESOGIAMUSER` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TINHT_ID`),
  UNIQUE KEY `TINHT_MATINHTHANH_UNIQUE` (`TINHT_MATINHTHANH`),
  UNIQUE KEY `TINHT_TENTINH_UNIQUE` (`TINHT_TENTINH`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinhthanh`
--

LOCK TABLES `tinhthanh` WRITE;
/*!40000 ALTER TABLE `tinhthanh` DISABLE KEYS */;
INSERT INTO `tinhthanh` VALUES (1,'LA','Long An','5','1'),(2,'HCM','H??? Ch?? Minh','1','1'),(3,'HN','H?? N???i','2','3'),(4,'DN','???? N???ng','3','4'),(5,'BT','B???n Tre','2','3'),(7,'CM','C?? Mau','3','2'),(9,'DL','???? L???t','3','2');
/*!40000 ALTER TABLE `tinhthanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `USER_ID` int NOT NULL AUTO_INCREMENT,
  `TINHT_ID` int NOT NULL,
  `USER_EMAIL` varchar(100) NOT NULL,
  `USER_HOTEN` varchar(300) DEFAULT NULL,
  `USER_SDT` varchar(100) DEFAULT NULL,
  `USER_PASSWORD` varchar(100) NOT NULL,
  `USER_MAGIOITHIEU` varchar(100) DEFAULT NULL,
  `USER_GIOITINH` varchar(100) DEFAULT NULL,
  `USER_DIACHI` longtext,
  `USER_NGAYSINH` date DEFAULT NULL,
  `USER_AVARTAR` longtext,
  `USER_TINHTRANG` int NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_EMAIL_UNIQUE` (`USER_EMAIL`),
  UNIQUE KEY `USER_SDT_UNIQUE` (`USER_SDT`),
  KEY `FK_USER_THUOC_TINHTHANH` (`TINHT_ID`),
  CONSTRAINT `FK_USER_THUOC_TINHTHANH` FOREIGN KEY (`TINHT_ID`) REFERENCES `tinhthanh` (`TINHT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vidientu`
--

DROP TABLE IF EXISTS `vidientu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vidientu` (
  `VI_ID` int NOT NULL AUTO_INCREMENT,
  `DD_ID` int NOT NULL,
  `VI_TONGTIEN` double NOT NULL,
  `VI_NGANGHANGLIENKET` varchar(300) DEFAULT NULL,
  `VI_SOTAIKHOANNGANHANG` varchar(300) DEFAULT NULL,
  `VI_TENTKNGANHANG` varchar(300) DEFAULT NULL,
  `VI_GHICHU` longtext,
  PRIMARY KEY (`VI_ID`),
  UNIQUE KEY `DD_ID_UNIQUE` (`DD_ID`),
  CONSTRAINT `FK_DD_CO_VI` FOREIGN KEY (`DD_ID`) REFERENCES `dieuduong` (`DD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKs8h18b7mby88vy71kur9xkrgc` FOREIGN KEY (`DD_ID`) REFERENCES `dieuduong` (`DD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vidientu`
--

LOCK TABLES `vidientu` WRITE;
/*!40000 ALTER TABLE `vidientu` DISABLE KEYS */;
INSERT INTO `vidientu` VALUES (7,1,100000000,'VIETTINBANK','1234568987978','TRAN THANH QUY',NULL),(8,2,0,NULL,NULL,NULL,NULL),(9,3,0,NULL,NULL,NULL,NULL),(10,4,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vidientu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-19  8:06:58
