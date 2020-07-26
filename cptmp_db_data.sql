-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cptmp_db
-- ------------------------------------------------------
-- Server version	8.0.19


use cptmp_db;
unlock tables;


LOCK TABLES attachment_file WRITE;
INSERT INTO `cptmp_db`.`attachment_file` (`id`, `gmt_create`, `gmt_modified`,  `uk_file_name`, `uk_file_url`, `uk_file_path`, `origin_name`, `file_size`, `idx_file_type`) VALUES ('1', '2020-07-16 9:56:10', '2020-07-16 10:00:10', '腾讯会议', 'https://support.qq.com/products/42324', 'E:\\\\腾讯会议', '腾讯会议', '145', '应用');
INSERT INTO `cptmp_db`.`attachment_file` (`id`, `gmt_create`, `gmt_modified`,  `uk_file_name`, `uk_file_url`, `uk_file_path`, `origin_name`, `file_size`, `idx_file_type`) VALUES ('2', '2020-07-16 10:00:10', '2020-07-16 10:00:20', '斗鱼视频', 'https://v.douyu.com', 'E:\\\\斗鱼视频', '斗鱼视频', '50', '应用');
INSERT INTO `cptmp_db`.`attachment_file` (`id`, `gmt_create`, `gmt_modified`,  `uk_file_name`, `uk_file_url`, `uk_file_path`, `origin_name`, `file_size`, `idx_file_type`) VALUES ('3', '2020-07-16 10:01:10', '2020-07-16 10:01:10',  '腾讯QQ', 'https://im.qq.com', 'E:\\\\腾讯QQ', 'QQ', '32', '应用');
INSERT INTO `cptmp_db`.`attachment_file` (`id`, `gmt_create`, `gmt_modified`,  `uk_file_name`, `uk_file_url`, `uk_file_path`, `origin_name`, `file_size`, `idx_file_type`) VALUES ('4', '2020-07-16 10:01:50', '2020-07-16 10:01:50',  '百度网盘', 'https://pan.baidu.com', 'D:\\\\百度网盘\\\\BaiduNetdisk', '百度网盘', '48', '应用');
INSERT INTO `cptmp_db`.`attachment_file` (`id`, `gmt_create`, `gmt_modified`,  `uk_file_name`, `uk_file_url`, `uk_file_path`, `origin_name`, `file_size`, `idx_file_type`) VALUES ('5', '2020-07-16 10:04:10', '2020-07-16 10:04:10',  '百度', 'https://www.baidu.com', 'C:\\\\Program Files (x86)\\\\baidu', '百度', '4', '网页');

-- UNLOCK TABLES;

LOCK TABLES cptmp_event WRITE;
INSERT INTO `cptmp_db`.`cptmp_event` (`id`, `gmt_create`, `gmt_modified`, `start_time`, `end_time`, `content`, `person_or_team`) VALUES ('1', '2020-07-16 10:05:10', '2020-07-16 10:05:10', '2020-07-16 10:10:10', '2020-07-16 11:10:10', '注册成功', '0');
INSERT INTO `cptmp_db`.`cptmp_event` (`id`, `gmt_create`, `gmt_modified`, `start_time`, `end_time`, `content`, `person_or_team`) VALUES ('2', '2020-07-16 10:06:10', '2020-07-16 10:06:10', '2020-07-16 10:11:10', '2020-07-16 11:10:10', '选择项目', '0');
INSERT INTO `cptmp_db`.`cptmp_event` (`id`, `gmt_create`, `gmt_modified`, `start_time`, `end_time`, `content`, `person_or_team`) VALUES ('3', '2020-07-16 10:07:40', '2020-07-16 10:07:40', '2020-07-16 10:12:10', '2020-07-16 11:10:10', '团队破冰', '0');
INSERT INTO `cptmp_db`.`cptmp_event` (`id`, `gmt_create`, `gmt_modified`, `start_time`, `end_time`, `content`, `person_or_team`) VALUES ('4', '2020-07-16 10:08:20', '2020-07-16 10:08:20', '2020-07-16 10:13:10', '2020-07-16 11:10:10', '发布项目', '0');
INSERT INTO `cptmp_db`.`cptmp_event` (`id`, `gmt_create`, `gmt_modified`, `start_time`, `end_time`, `content`, `person_or_team`) VALUES ('5', '2020-07-16 10:10:10', '2020-07-16 10:10:10', '2020-07-16 10:14:10', '2020-07-16 11:10:10', '退出团队', '0');
UNLOCK TABLES;

LOCK TABLES cptmp_organization WRITE;
INSERT INTO `cptmp_db`.`cptmp_organization` (`id`, `gmt_create`, `gmt_modified`, `uk_real_name`, `organization_description`, `official_website_url`, `invitation_code`, `uk_name`) VALUES ('1', '2020-07-16 10:14:10', '2020-07-16 10:14:10', 'E', '知名企业', 'https://www.hao123.com', '1760813a-d802-4fb3-9f29-a2769b57ea02', 'E');
INSERT INTO `cptmp_db`.`cptmp_organization` (`id`, `gmt_create`, `gmt_modified`, `uk_real_name`, `organization_description`, `official_website_url`, `invitation_code`, `uk_name`) VALUES ('2', '2020-07-16 10:15:10', '2020-07-16 10:15:10', 'WHU', '全国知名重点大学', 'https://www.whu.edu.cn', 'e14ddb91-9ecc-4a62-88ec-471230828318', 'WHU');
INSERT INTO `cptmp_db`.`cptmp_organization` (`id`, `gmt_create`, `gmt_modified`, `uk_real_name`, `organization_description`, `official_website_url`, `invitation_code`, `uk_name`) VALUES ('3', '2020-07-16 10:16:10', '2020-07-16 10:18:30', '浙江大学', '全国重点大学', 'http://www.zju.edu.cn', '75f910ec-61fb-494a-8ade-76baf6075c21', 'ZJU');
INSERT INTO `cptmp_db`.`cptmp_organization` (`id`, `gmt_create`, `gmt_modified`, `uk_real_name`, `organization_description`, `official_website_url`, `invitation_code`, `uk_name`) VALUES ('4', '2020-07-16 10:18:30', '2020-07-16 10:20:30', '百度', '知名搜索引擎公司', 'https://www.baidu.com', '0832988f-d801-4f8c-a65c-7c71b587eab0', 'BaiDu');
INSERT INTO `cptmp_db`.`cptmp_organization` (`id`, `gmt_create`, `gmt_modified`, `uk_real_name`, `organization_description`, `official_website_url`, `invitation_code`, `uk_name`) VALUES ('5', '2020-07-16 10:19:30', '2020-07-16 10:21:30', 'HUST', '全国一流大学', 'www.hust.edu.cn', '4d8978e1-b88a-4730-9947-22ae3ae24b8b', 'HUST');
UNLOCK TABLES;

LOCK TABLES cptmp_user WRITE;
INSERT INTO `cptmp_db`.`cptmp_user` (`id`, `gmt_create`, `gmt_modified`, `idx_password`, `uk_username`, `introduction`, `uk_email`, `phone_number`, `gender`, `avatar`, `idx_name`, `uk_common_id`, `idx_organization_id`, `idx_role_name`, `enabled`, `account_non_expired`, `credentials_non_expired`, `account_non_locked`) VALUES ('1', '2020-07-16 10:30:30', '2020-07-16 10:30:30', '$2a$10$RN8UzdavkKto.FUpQANidOUlWQcaznok2yKFa40vFKNl9.NF5YN3O', 'E-2018302060342', '来自南京邮电大学大三学生', 'lh@qq.com', '16382993027', '1', '', '李豪', '2018302060342', '1', 'ROLE_ENTERPRISE_ADMIN', '1', '1', '1', '0');
INSERT INTO `cptmp_db`.`cptmp_user` (`id`, `gmt_create`, `gmt_modified`, `idx_password`, `uk_username`, `introduction`, `uk_email`, `phone_number`, `gender`, `avatar`, `idx_name`, `uk_common_id`, `idx_organization_id`, `idx_role_name`, `enabled`, `account_non_expired`, `credentials_non_expired`, `account_non_locked`) VALUES ('2', '2020-07-16 10:32:30', '2020-07-16 10:32:30', '$2a$10$deNadOiPqjxNCBWekB2lhuOLizP4kb9bftdQ.0v4h0d0jF.nY/6lu', 'WHU-1000302060342', '来自武汉大学大二学生', 'lhl@qq.com', '16372893619', '1', '', '刘恒', '1000302060342', '2', 'ROLE_SCHOOL_TEACHER', '1', '1', '1', '0');
INSERT INTO `cptmp_db`.`cptmp_user` (`id`, `gmt_create`, `gmt_modified`, `idx_password`, `uk_username`, `introduction`, `uk_email`, `phone_number`, `gender`, `avatar`, `idx_name`, `uk_common_id`, `idx_organization_id`, `idx_role_name`, `enabled`, `account_non_expired`, `credentials_non_expired`, `account_non_locked`) VALUES ('3', '2020-07-16 10:40:30', '2020-07-16 10:40:30', '$2a$10$Q.dc57o2fvlK0eScxK1xyeY48cLS/foMosP1wsybfk3Ntvk15vQu.', 'HUST-1000432423552', '来自华中科技大学大四学生', 'tzl@qq.com', '16382903846', '1', '', '谭泽龙', '1000432423552', '5', 'ROLE_SCHOOL_TEACHER', '1', '1', '1', '0');
INSERT INTO `cptmp_db`.`cptmp_user` (`id`, `gmt_create`, `gmt_modified`, `idx_password`, `uk_username`, `introduction`, `uk_email`, `phone_number`, `gender`, `avatar`, `idx_name`, `uk_common_id`, `idx_organization_id`, `idx_role_name`, `enabled`, `account_non_expired`, `credentials_non_expired`, `account_non_locked`) VALUES ('4', '2020-07-16 10:45:20', '2020-07-16 10:45:20', '$2a$10$8X837Fxqs0gu3h/iO9DEpOE3Y3zlgx4ulS4xrIXCoVcBRJIvf8a7y', 'WHU-1000332363342', '来自武汉大学大四学生', 'lyy@qq.com', '17302739203', '0', '', '李媛媛', '1000332363342', '2', 'ROLE_SCHOOL_ADMIN', '1', '1', '1', '0');
INSERT INTO `cptmp_db`.`cptmp_user` (`id`, `gmt_create`, `gmt_modified`, `idx_password`, `uk_username`, `introduction`, `uk_email`, `phone_number`, `gender`, `avatar`, `idx_name`, `uk_common_id`, `idx_organization_id`, `idx_role_name`, `enabled`, `account_non_expired`, `credentials_non_expired`, `account_non_locked`) VALUES ('5', '2020-07-16 10:50:10', '2020-07-16 10:50:10', '$2a$10$ACroMgpBXaJp3so4qfEUDO1uRXDAwyae30gzaqXZ.48kJImLD.Ipy', 'HUST-1000555423552', '来自华中科技大学大一学生', 'dxy@qq.com', '16328930153', '0', '', '段心玉', 'HUST-1000555423552', '5', 'ROLE_SCHOOL_ADMIN', '1', '1', '1', '0');

UNLOCK TABLES;

LOCK TABLES password_reset_token WRITE;
INSERT INTO `cptmp_db`.`password_reset_token` (`id`, `gmt_create`, `gmt_modified`, `uk_token`, `idx_email`) VALUES ('1', '2020-07-16 11:27:10', '2020-07-016 11:27:10', '3b58b5a7-ecbc-4a47-9e05-2c467436342c', 'lgp@qq.com');
INSERT INTO `cptmp_db`.`password_reset_token` (`id`, `gmt_create`, `gmt_modified`, `uk_token`, `idx_email`) VALUES ('2', '2020-07-16 11:27:20', '2020-07-16 11:27:20', 'aff074ae-f8f8-40cb-86ca-2ca1aec6ae49', 'lh@qq.com');
INSERT INTO `cptmp_db`.`password_reset_token` (`id`, `gmt_create`, `gmt_modified`, `uk_token`, `idx_email`) VALUES ('3', '2020-07-16 11:28:20', '2020-07-16 11:28:20', 'd2cbab06-067e-46b5-865e-8503a4405efa', 'tzl@qq.com');
INSERT INTO `cptmp_db`.`password_reset_token` (`id`, `gmt_create`, `gmt_modified`, `uk_token`, `idx_email`) VALUES ('4', '2020-07-16 11:27:20', '2020-07-16 11:27:20', 'e6aac84d-c678-4a94-85a9-1363120e415d', 'dxy@qq.com');
INSERT INTO `cptmp_db`.`password_reset_token` (`id`, `gmt_create`, `gmt_modified`, `uk_token`, `idx_email`) VALUES ('5', '2020-07-16 11:30:20', '2020-07-16 11:30:20', '6a38cfc9-2f6e-40db-a274-23e8f56f24a4', 'zjz@qq.com');
UNLOCK TABLES;



LOCK TABLES train WRITE;
INSERT INTO `cptmp_db`.`train` (`id`, `gmt_create`, `gmt_modified`, `idx_name`, `organization_id`, `start_time`, `end_time`, `content`, `accept_standard`, `resource_library`, `gps_info`) VALUES ('1', '2020-07-16 11:50:30', '2020-07-16 11:50:30', '初级项目实训', '1', '2018-07-08 11:50:30', '2018-07-20 11:50:30', '武汉大学大一实训', '完成基础项目', 'https://www.baidu.com/', 'http://www.boorgeel.com/');
INSERT INTO `cptmp_db`.`train` (`id`, `gmt_create`, `gmt_modified`, `idx_name`, `organization_id`, `start_time`, `end_time`, `content`, `accept_standard`, `resource_library`, `gps_info`) VALUES ('2', '2020-07-16 11:52:30', '2020-07-16 11:52:30', '中级项目实训', '2', '2019-07-16 11:50:30', '2019-08-06 11:50:30', '武汉大学大二实训', '完成基础项目', 'https://www.baidu.com/', 'http://www.boorgeel.com/');
INSERT INTO `cptmp_db`.`train` (`id`, `gmt_create`, `gmt_modified`, `idx_name`, `organization_id`, `start_time`, `end_time`, `content`, `accept_standard`, `resource_library`, `gps_info`) VALUES ('3', '2020-07-16 11:53:30', '2020-07-16 11:53:30', '高级项目实训', '3', '2020-07-16 11:50:30', '2020-08-16 11:50:30', '武汉大学综合实训', '完成基础项目', 'https://www.baidu.com/', 'http://www.boorgeel.com/');
INSERT INTO `cptmp_db`.`train` (`id`, `gmt_create`, `gmt_modified`, `idx_name`, `organization_id`, `start_time`, `end_time`, `content`, `accept_standard`, `resource_library`, `gps_info`) VALUES ('4', '2020-07-16 11:56:30', '2020-07-16 11:56:30', '大三合作实训', '4', '2021-07-16 11:50:30', '2021-09-16 11:50:30', '武汉大学大三实训', '完成拓展项目', 'https://www.baidu.com/', 'http://www.boorgeel.com/');
INSERT INTO `cptmp_db`.`train` (`id`, `gmt_create`, `gmt_modified`, `idx_name`, `organization_id`, `start_time`, `end_time`, `content`, `accept_standard`, `resource_library`, `gps_info`) VALUES ('5', '2020-07-16 11:57:30', '2020-07-16 11:57:30', '大四合作实训', '5', '2022-07-16 11:50:30', '2022-10-16 11:50:30', '武汉大学大四实训', '完成所有项目', 'https://www.baidu.com/', 'http://www.boorgeel.com/');

UNLOCK TABLES;




LOCK TABLES cptmp_process WRITE;
INSERT INTO `cptmp_db`.`cptmp_process` (`id`, `gmt_create`, `gmt_modified`, `train_id`, `start_time`, `end_time`) VALUES ('1', '2020-07-16 11:56:30', '2020-07-16 11:56:30', '1', '2020-07-16 11:56:30', '2020-07-26 11:56:30');
INSERT INTO `cptmp_db`.`cptmp_process` (`id`, `gmt_create`, `gmt_modified`, `train_id`, `start_time`, `end_time`) VALUES ('2', '2020-07-16 11:57:30', '2020-07-16 11:57:30', '2', '2020-07-17 11:56:30', '2020-07-27 11:56:30');
INSERT INTO `cptmp_db`.`cptmp_process` (`id`, `gmt_create`, `gmt_modified`, `train_id`, `start_time`, `end_time`) VALUES ('3', '2020-07-16 11:58:30', '2020-07-16 11:58:30', '3', '2020-07-18 11:56:30', '2020-07-28 11:56:30');
INSERT INTO `cptmp_db`.`cptmp_process` (`id`, `gmt_create`, `gmt_modified`, `train_id`, `start_time`, `end_time`) VALUES ('4', '2020-07-16 11:59:30', '2020-07-16 11:59:30', '4', '2020-07-19 11:56:30', '2020-07-22 11:56:30');
INSERT INTO `cptmp_db`.`cptmp_process` (`id`, `gmt_create`, `gmt_modified`, `train_id`, `start_time`, `end_time`) VALUES ('5', '2020-07-16 12:02:30', '2020-07-16 12:02:30', '5', '2020-07-20 11:56:30', '2020-07-24 11:56:30');
UNLOCK TABLES;




LOCK TABLES process_event WRITE;
INSERT INTO `cptmp_db`.`process_event` (`id`, `gmt_create`, `gmt_modified`, `process_id`, `event_id`) VALUES ('1', '2020-07-16 12:03:30', '2020-07-16 12:03:30', '1', '1');
INSERT INTO `cptmp_db`.`process_event` (`id`, `gmt_create`, `gmt_modified`, `process_id`, `event_id`) VALUES ('2', '2020-07-16 12:04:30', '2020-07-16 12:04:30', '2', '2');
INSERT INTO `cptmp_db`.`process_event` (`id`, `gmt_create`, `gmt_modified`, `process_id`, `event_id`) VALUES ('3', '2020-07-16 12:05:30', '2020-07-16 12:05:30', '3', '3');
INSERT INTO `cptmp_db`.`process_event` (`id`, `gmt_create`, `gmt_modified`, `process_id`, `event_id`) VALUES ('4', '2020-07-16 12:06:30', '2020-07-16 12:06:30', '4', '4');
INSERT INTO `cptmp_db`.`process_event` (`id`, `gmt_create`, `gmt_modified`, `process_id`, `event_id`) VALUES ('5', '2020-07-16 12:07:30', '2020-07-16 12:07:30', '5', '5');

UNLOCK TABLES;

LOCK TABLES train_project WRITE;
INSERT INTO `cptmp_db`.`train_project` (`id`, `gmt_create`, `gmt_modified`, `project_level`, `project_content`, `resource_library`, `idx_name`) VALUES ('1', '2020-07-16 12:08:30', '2020-07-16 12:08:30', '1', '坦克大战', 'https://www.baidu.com/', '大一实训');
INSERT INTO `cptmp_db`.`train_project` (`id`, `gmt_create`, `gmt_modified`, `project_level`, `project_content`, `resource_library`, `idx_name`) VALUES ('2', '2020-07-16 12:09:30', '2020-07-16 12:09:30', '2', '飞机大战', 'https://www.baidu.com/', '大二实训');
INSERT INTO `cptmp_db`.`train_project` (`id`, `gmt_create`, `gmt_modified`, `project_level`, `project_content`, `resource_library`, `idx_name`) VALUES ('3', '2020-07-16 12:10:30', '2020-07-16 12:10:30', '3', '实训管理平台', 'https://www.baidu.com/', '大三实训');
INSERT INTO `cptmp_db`.`train_project` (`id`, `gmt_create`, `gmt_modified`, `project_level`, `project_content`, `resource_library`, `idx_name`) VALUES ('4', '2020-07-16 12:11:30', '2020-07-16 12:11:30', '4', '教务系统', 'https://www.baidu.com/', '大三实习');
INSERT INTO `cptmp_db`.`train_project` (`id`, `gmt_create`, `gmt_modified`, `project_level`, `project_content`, `resource_library`, `idx_name`) VALUES ('5', '2020-07-16 12:12:34', '2020-07-16 12:12:34', '5', '选课系统', 'https://www.baidu.com/', '大四实习');

UNLOCK TABLES;

LOCK TABLES project_train WRITE;

INSERT INTO `cptmp_db`.`project_train` (`id`, `gmt_create`, `gmt_modified`, `project_id`, `train_id`) VALUES ('1', '2020-07-16 12:13:34', '2020-07-16 12:13:34', '1', '1');
INSERT INTO `cptmp_db`.`project_train` (`id`, `gmt_create`, `gmt_modified`, `project_id`, `train_id`) VALUES ('2', '2020-07-16 12:14:54', '	2020-07-16 12:13:34', '2', '2');
INSERT INTO `cptmp_db`.`project_train` (`id`, `gmt_create`, `gmt_modified`, `project_id`, `train_id`) VALUES ('3', '2020-07-16 12:17:34', '2020-07-16 12:17:34', '3', '3');
INSERT INTO `cptmp_db`.`project_train` (`id`, `gmt_create`, `gmt_modified`, `project_id`, `train_id`) VALUES ('4', '2020-07-16 12:19:34', '2020-07-16 12:19:34', '4', '4');
INSERT INTO `cptmp_db`.`project_train` (`id`, `gmt_create`, `gmt_modified`, `project_id`, `train_id`) VALUES ('5', '2020-07-16 12:21:34', '2020-07-16 12:21:34', '5', '5');

UNLOCK TABLES;

LOCK TABLES team WRITE;
INSERT INTO `cptmp_db`.`team` (`id`, `gmt_create`, `gmt_modified`, `idx_team_name`, `team_grade`, `repo_url`, `evaluation`, `uk_project_train_id`) VALUES ('1', '2020-07-16 12:23:34', '2020-07-16 12:23:34', '章鱼鸽', '99', 'https://www.baidu.com/', '优秀', '1');
INSERT INTO `cptmp_db`.`team` (`id`, `gmt_create`, `gmt_modified`, `idx_team_name`, `team_grade`, `repo_url`, `evaluation`, `uk_project_train_id`) VALUES ('2', '2020-07-16 12:25:34', '	2020-07-16 12:23:34', '小章鱼', '94', 'https://www.baidu.com/', '良好', '2');
INSERT INTO `cptmp_db`.`team` (`id`, `gmt_create`, `gmt_modified`, `idx_team_name`, `team_grade`, `repo_url`, `evaluation`, `uk_project_train_id`) VALUES ('3', '2020-07-16 12:26:34', '2020-07-16 12:26:34', '大章鱼', '97', 'https://www.baidu.com/', '良好', '3');
INSERT INTO `cptmp_db`.`team` (`id`, `gmt_create`, `gmt_modified`, `idx_team_name`, `team_grade`, `repo_url`, `evaluation`, `uk_project_train_id`) VALUES ('4', '2020-07-16 12:27:34', '	2020-07-16 12:26:34', '小鸽子', '98', 'https://www.baidu.com/', '及格', '4');
INSERT INTO `cptmp_db`.`team` (`id`, `gmt_create`, `gmt_modified`, `idx_team_name`, `team_grade`, `repo_url`, `evaluation`, `uk_project_train_id`) VALUES ('5', '2020-07-16 12:30:34', '2020-07-16 12:30:34', '大鸽子', '96', 'https://www.baidu.com/', '优秀', '5');

UNLOCK TABLES;


LOCK TABLES assignment WRITE;
INSERT INTO `cptmp_db`.`assignment` (`id`, `gmt_create`, `gmt_modified`, `document_path`, `is_file`, `title`, `content`) VALUES ('1', '2020-07-16 12:31:34', '2020-07-16 12:31:34', 'E:\\DataGrip', '1', '数据库1.0', '完成数据库设计');
INSERT INTO `cptmp_db`.`assignment` (`id`, `gmt_create`, `gmt_modified`, `document_path`, `is_file`, `title`, `content`) VALUES ('2', '2020-07-16 12:32:34', '2020-07-16 12:32:34', 'E:\\DataGrip', '1', '数据库2.0', '完成数据库实现');
INSERT INTO `cptmp_db`.`assignment` (`id`, `gmt_create`, `gmt_modified`, `document_path`, `is_file`, `title`, `content`) VALUES ('3', '2020-07-16 12:33:34', '2020-07-16 12:33:34', 'E:\\IDEA', '1', '网页设计1.0', '完成网页设计框架');
INSERT INTO `cptmp_db`.`assignment` (`id`, `gmt_create`, `gmt_modified`, `document_path`, `is_file`, `title`, `content`) VALUES ('4', '2020-07-16 12:37:34', '2020-07-16 12:37:34', 'E:\\IDEA', '1', '网页设计12.0', '完成网页设计');
INSERT INTO `cptmp_db`.`assignment` (`id`, `gmt_create`, `gmt_modified`, `document_path`, `is_file`, `title`, `content`) VALUES ('5', '2020-07-16 12:41:34', '2020-07-16 12:41:34', 'E:\\IDEA', '1', '准备发布工作', '完成项目发布所需要的准备工作');

UNLOCK TABLES;


LOCK TABLES record WRITE;
INSERT INTO `cptmp_db`.`record` (`id`, `gmt_create`, `gmt_modified`, `idx_user_id`, `idx_team_id`, `idx_train_id`, `idx_process_event_id`, `assignments_lib`) VALUES ('1', '2020-07-16 12:41:34', '2020-07-16 12:41:34', '1', '1', '1', '1', 'www.baidu.com');
INSERT INTO `cptmp_db`.`record` (`id`, `gmt_create`, `gmt_modified`, `idx_user_id`, `idx_team_id`, `idx_train_id`, `idx_process_event_id`, `assignments_lib`) VALUES ('2', '2020-07-16 12:42:34', '2020-07-16 12:42:34', '2', '2', '2', '2', 'www.baidu.com');
INSERT INTO `cptmp_db`.`record` (`id`, `gmt_create`, `gmt_modified`, `idx_user_id`, `idx_team_id`, `idx_train_id`, `idx_process_event_id`, `assignments_lib`) VALUES ('3', '2020-07-16 12:43:34', '2020-07-16 12:43:34', '3', '3', '3', '3', 'www.baidu.com');
INSERT INTO `cptmp_db`.`record` (`id`, `gmt_create`, `gmt_modified`, `idx_user_id`, `idx_team_id`, `idx_train_id`, `idx_process_event_id`, `assignments_lib`) VALUES ('4', '2020-07-16 12:43:54', '2020-07-16 12:43:54', '4', '4', '4', '4', 'www.hao123.com');
INSERT INTO `cptmp_db`.`record` (`id`, `gmt_create`, `gmt_modified`, `idx_user_id`, `idx_team_id`, `idx_train_id`, `idx_process_event_id`, `assignments_lib`) VALUES ('5', '2020-07-16 12:44:34', '2020-07-16 12:44:34', '5', '5', '5', '5', 'www.hao123.com');

UNLOCK TABLES;

LOCK TABLES team_person WRITE;
INSERT INTO `cptmp_db`.`team_person` (`id`, `gmt_create`, `gmt_modified`, `team_id`, `user_id`) VALUES ('1', '2020-07-16 12:45:34', '2020-07-16 12:45:34', '1', '1');
INSERT INTO `cptmp_db`.`team_person` (`id`, `gmt_create`, `gmt_modified`, `team_id`, `user_id`) VALUES ('2', '2020-07-16 12:46:34', '2020-07-16 12:46:34', '2', '2');
INSERT INTO `cptmp_db`.`team_person` (`id`, `gmt_create`, `gmt_modified`, `team_id`, `user_id`) VALUES ('3', '2020-07-16 12:47:34', '2020-07-16 12:47:34', '3', '3');
INSERT INTO `cptmp_db`.`team_person` (`id`, `gmt_create`, `gmt_modified`, `team_id`, `user_id`) VALUES ('4', '2020-07-16 12:48:34', '2020-07-16 12:48:34', '4', '4');
INSERT INTO `cptmp_db`.`team_person` (`id`, `gmt_create`, `gmt_modified`, `team_id`, `user_id`) VALUES ('5', '2020-07-16 12:50:34', '2020-07-16 12:50:34', '5', '5');

UNLOCK TABLES;

LOCK TABLES personal_grade WRITE;
INSERT INTO `cptmp_db`.`personal_grade` (`id`, `gmt_create`, `gmt_modified`, `uk_team_person_id`, `personal_grade`, `evaluation`) VALUES ('1', '2020-07-16 12:51:34', '2020-07-16 12:51:34', '1', '98', '优秀');
INSERT INTO `cptmp_db`.`personal_grade` (`id`, `gmt_create`, `gmt_modified`, `uk_team_person_id`, `personal_grade`, `evaluation`) VALUES ('2', '2020-07-16 12:52:34', '2020-07-16 12:52:34', '2', '94', '优秀');
INSERT INTO `cptmp_db`.`personal_grade` (`id`, `gmt_create`, `gmt_modified`, `uk_team_person_id`, `personal_grade`, `evaluation`) VALUES ('3', '2020-07-16 12:53:34', '2020-07-16 12:53:34', '3', '96', '优秀');
INSERT INTO `cptmp_db`.`personal_grade` (`id`, `gmt_create`, `gmt_modified`, `uk_team_person_id`, `personal_grade`, `evaluation`) VALUES ('4', '2020-07-16 12:54:34', '2020-07-16 12:54:34', '4', '95', '优秀');
INSERT INTO `cptmp_db`.`personal_grade` (`id`, `gmt_create`, `gmt_modified`, `uk_team_person_id`, `personal_grade`, `evaluation`) VALUES ('5', '2020-07-16 12:55:34', '2020-07-16 12:55:34', '5', '93', '优秀');

UNLOCK TABLES;

