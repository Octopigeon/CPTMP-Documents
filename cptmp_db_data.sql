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

LOCK TABLES attachment_file WRITE;
INSERT INTO attachment_file VALUES 
(1,'2020-07-08 13:27:10',NULL,NULL,'test1','test1',"test1",1,'test1'),
(2,'2020-07-08 13:27:10',NULL,NULL,'test2','test2',"test2",2,'test2');
UNLOCK TABLES;

LOCK TABLES cptmp_organization WRITE;
INSERT INTO cptmp_organization VALUES 
(1,'2020-07-08 13:27:10',NULL,NULL,'test1',"test1",'test1',"test1","test1"),
(2,'2020-07-08 13:27:10',NULL,NULL,'test2',"test2",'test2',"test2","test2");
UNLOCK TABLES;

LOCK TABLES cptmp_user WRITE;
INSERT INTO cptmp_user VALUES 
(1,'2020-07-08 13:27:10',NULL,NULL,'test1','test1',NULL,NULL,NULL,NULL,NULL,'test1','test1',1,'test1',1,1,1,1),
(2,'2020-07-08 13:27:10',NULL,NULL,'test2','test2',NULL,NULL,NULL,NULL,NULL,'test2','test2',2,'test2',2,2,2,2);
UNLOCK TABLES;

LOCK TABLES password_reset_token WRITE;
INSERT INTO password_reset_token VALUES 
(1,'2020-07-08 13:27:10',NULL,NULL,'test1','test1'),
(2,'2020-07-08 13:27:10',NULL,NULL,'test2','test2');
UNLOCK TABLES;



LOCK TABLES train WRITE;
INSERT INTO train VALUES 
(1,'2020-07-08 13:27:10',NULL,NULL,1,1,'2020-07-08 13:27:10','2020-07-08 13:27:10',"test1","test1","test1"),
(2,'2020-07-08 13:27:10',NULL,NULL,2,2,'2020-07-08 13:27:10','2020-07-08 13:27:10',"test2","test2","test2");
UNLOCK TABLES;


LOCK TABLES train_project WRITE;
INSERT INTO train_project VALUES 
(1,'2020-07-08 13:27:10',NULL,NULL,"test1",1,"test1","test1"),
(2,'2020-07-08 13:27:10',NULL,NULL,"test2",2,"test2","test2");
UNLOCK TABLES;


LOCK TABLES train_team WRITE;
INSERT INTO train_team VALUES 
(1,'2020-07-08 13:27:10',NULL,NULL,1,"test1",1,1,1,"test1",100.0),
(2,'2020-07-08 13:27:10',NULL,NULL,2,"test2",2,2,2,"test2",100.0);
UNLOCK TABLES;

LOCK TABLES daily_record WRITE;
INSERT INTO daily_record VALUES 
(1,'2020-07-08 13:27:10',NULL,NULL,1,1,"test1",1,'test1',"test1"),
(2,'2020-07-08 13:27:10',NULL,NULL,2,2,"test2",2,'test2',"test2");
UNLOCK TABLES;

LOCK TABLES activity_record WRITE;
INSERT INTO activity_record VALUES 
(1,'2020-07-08 13:27:10',NULL,NULL,1,1,1,'test1'),
(2,'2020-07-08 13:27:10',NULL,NULL,2,2,2,'test2');
UNLOCK TABLES;

LOCK TABLES student_team WRITE;
INSERT INTO student_team VALUES 
(1,'2020-07-08 13:27:10',NULL,NULL,1,1,1),
(2,'2020-07-08 13:27:10',NULL,NULL,2,2,2);
UNLOCK TABLES;


