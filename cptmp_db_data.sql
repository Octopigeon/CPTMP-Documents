-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cptmp_db
-- ------------------------------------------------------
-- Server version	8.0.19



--
-- Dumping data for table `cptmpuser_user`
--

LOCK TABLES cptmp_user WRITE;
INSERT IGNORE INTO cptmp_user VALUES 
(3,'2020-07-08 13:27:10',NULL,'123','rea',"lalal",NULL,'1290959722@qq.com',NULL,NULL,NULL,'ROLE_ENTERPRISE_ADMIN',1,1,1,1,NULL),
(4,'2020-07-08 13:29:10',NULL,'123','rsa',"lalal",NULL,'123@qq.com',NULL,NULL,NULL,'ROLE_SCHOOL_ADMIN',1,1,1,1,NULL),
(5,'2020-07-08 13:29:10',NULL,'123','rst',"lalal",NULL,'234@qq.com',NULL,NULL,NULL,'ROLE_SCHOOL_TEACHER',1,1,1,1,NULL),
(6,'2020-07-08 13:29:10',NULL,'123','rsm',"lalal",NULL,'345@qq.com',NULL,NULL,NULL,'ROLE_STUDENT_MEMBER',1,1,1,1,NULL),
(7,'2020-07-08 13:29:10',NULL,'123','rsma',"lalal",NULL,'456@qq.com',NULL,NULL,NULL,'ROLE_STUDENT_MASTER',1,1,1,1,NULL),
(8,'2020-07-08 13:29:10',NULL,'123','rsp',"lalal",NULL,'567@qq.com',NULL,NULL,NULL,'ROLE_STUDENT_PM',1,1,1,1,NULL),
(9,'2020-07-08 13:29:10',NULL,'123','rspo',"lalal",NULL,'678@qq.com',NULL,NULL,NULL,'ROLE_STUDENT_PO',1,1,1,1,NULL);
select id from cptmp_user where id not in(3);
UNLOCK TABLES;

--
-- Dumping data for table `enterprise_admin`
--

LOCK TABLES enterprise_admin WRITE;

UNLOCK TABLES;

--
-- Dumping data for table `school_instructor`
--

LOCK TABLES school_instructor WRITE;

UNLOCK TABLES;

--
-- Dumping data for table `school_student`
--

LOCK TABLES school_student WRITE;

UNLOCK TABLES;

--
-- Dumping data for table `test_tb`
--

LOCK TABLES test_tb WRITE;


LOCK TABLES train WRITE;
INSERT IGNORE INTO train VALUES 
(3,'2020-07-08 13:27:10',NULL,3,3,'2020-07-08 13:27:10','2020-07-08 13:27:10',"test3","test3","test3");
UNLOCK TABLES;

LOCK TABLES train_project WRITE;
INSERT IGNORE INTO train_project VALUES 
(3,'2020-07-08 13:27:10',NULL,3,"test3",3,"test3","test3");
UNLOCK TABLES;

LOCK TABLES train_team WRITE;
INSERT IGNORE INTO train_team VALUES 
(3,'2020-07-08 13:27:10',NULL,3,"test3",3,3,3,"test3",100.0);
UNLOCK TABLES;

LOCK TABLES activity_record WRITE;
INSERT IGNORE INTO activity_record VALUES 
(3,'2020-07-08 13:27:10',NULL,3,3,0,'test3');
UNLOCK TABLES;



