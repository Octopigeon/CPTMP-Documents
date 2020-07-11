-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cptmp_db
-- ------------------------------------------------------
-- Server version	8.0.19



--
-- Dumping data for table `cptmpuser_user`
--
use cptmp_db;
unlock tables;
LOCK TABLES cptmp_user WRITE;
INSERT IGNORE INTO cptmp_user VALUES 
(1,'2020-07-08 13:27:10',NULL,'test1','test1',"test1",NULL,'test1',NULL,NULL,NULL,'test1',1,1,1,1,NULL),
(2,'2020-07-08 13:27:10',NULL,'test2','test2',"test2",NULL,'test2',NULL,NULL,NULL,'test2',2,2,2,2,NULL);
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



LOCK TABLES train WRITE;
INSERT IGNORE INTO train VALUES 
(1,'2020-07-08 13:27:10',NULL,1,1,'2020-07-08 13:27:10','2020-07-08 13:27:10',"test1","test1","test1"),
(2,'2020-07-08 13:27:10',NULL,2,2,'2020-07-08 13:27:10','2020-07-08 13:27:10',"test2","test2","test2");
UNLOCK TABLES;


LOCK TABLES train_project WRITE;
INSERT IGNORE INTO train_project VALUES 
(1,'2020-07-08 13:27:10',NULL,1,"test1",1,"test1","test1"),
(2,'2020-07-08 13:27:10',NULL,2,"test2",2,"test2","test2");
UNLOCK TABLES;


LOCK TABLES train_team WRITE;
INSERT IGNORE INTO train_team VALUES 
(1,'2020-07-08 13:27:10',NULL,1,"test1",1,1,1,"test1",100.0),
(2,'2020-07-08 13:27:10',NULL,2,"test2",2,2,2,"test2",100.0);
UNLOCK TABLES;

LOCK TABLES daily_record WRITE;
INSERT IGNORE INTO daily_record VALUES 
(1,'2020-07-08 13:27:10',NULL,1,1,"test1",1,'test1',"test1"),
(2,'2020-07-08 13:27:10',NULL,2,2,"test2",2,'test2',"test2");
UNLOCK TABLES;

LOCK TABLES activity_record WRITE;
INSERT IGNORE INTO activity_record VALUES 
(1,'2020-07-08 13:27:10',NULL,1,1,1,'test1'),
(2,'2020-07-08 13:27:10',NULL,2,2,2,'test2');
UNLOCK TABLES;


