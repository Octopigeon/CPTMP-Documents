unlock tables;

drop table if exists activity_record;

drop table if exists daily_record;

drop table if exists enterprise_admin;

drop table if exists password_reset_token;

drop table if exists school_instructor;

drop table if exists school_student;

drop table if exists attachment_file;

drop table if exists cptmp_user;

drop table if exists test_tb;

drop table if exists train;

drop table if exists train_project;

drop table if exists train_team;



CREATE TABLE cptmp_user (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  gmt_create datetime NOT NULL,
  gmt_modified datetime DEFAULT NULL,
  idx_password varchar(128) NOT NULL,
  uk_username varchar(200) NOT NULL,
  nickname varchar(200) NOT NULL,
  introduction text,
  uk_email varchar(200) NOT NULL,
  phone_number decimal(11,0) DEFAULT NULL,
  gender tinyint unsigned DEFAULT NULL,
  avatar varchar(200) DEFAULT NULL,
  idx_role_name varchar(25) NOT NULL,
  enabled tinyint NOT NULL,
  account_non_expired tinyint NOT NULL,
  credentials_non_expired tinyint NOT NULL,
  account_non_locked tinyint NOT NULL,
  invitation_code varchar(6) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_email_UNIQUE (uk_email),
  UNIQUE KEY uk_username_UNIQUE (uk_username),
  UNIQUE KEY invitation_code_UNIQUE (invitation_code)
) ;


CREATE TABLE enterprise_admin (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  gmt_create datetime NOT NULL,
  gmt_modified datetime DEFAULT NULL,
  idx_name varchar(20) NOT NULL,
  uk_user_id bigint unsigned NOT NULL,
  idx_employee_id varchar(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_user_id (uk_user_id),
  CONSTRAINT enterprise_user_id FOREIGN KEY (uk_user_id) REFERENCES cptmp_user (id)
) ;



CREATE TABLE password_reset_token (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  gmt_create datetime NOT NULL,
  gmt_modified datetime DEFAULT NULL,
  token varchar(128) NOT NULL,
  idx_email varchar(200) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY token (token),
  KEY password_reset_email (idx_email),
  CONSTRAINT password_reset_email FOREIGN KEY (idx_email) REFERENCES cptmp_user (uk_email)
) ;



CREATE TABLE school_instructor (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  gmt_create datetime NOT NULL,
  gmt_modified datetime DEFAULT NULL,
  idx_name varchar(20) NOT NULL,
  uk_user_id bigint unsigned NOT NULL,
  idx_employee_id varchar(50) DEFAULT NULL,
  idx_school_name varchar(20) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_user_id (uk_user_id),
  CONSTRAINT teacher_user_id FOREIGN KEY (uk_user_id) REFERENCES cptmp_user (id)
) ;



CREATE TABLE school_student (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  gmt_create datetime NOT NULL,
  gmt_modified datetime DEFAULT NULL,
  idx_name varchar(20) NOT NULL,
  idx_school_name varchar(20) NOT NULL,
  uk_user_id bigint unsigned NOT NULL,
  idx_student_id varchar(50) NOT NULL,
  uk_student_face varchar(200) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_user_id (uk_user_id),
  UNIQUE KEY uk_student_face_UNIQUE (uk_student_face),
  CONSTRAINT stu_user_id FOREIGN KEY (uk_user_id) REFERENCES cptmp_user (id)
) ;


create table if not exists daily_record
(
    id            bigint unsigned auto_increment
        primary key,
    gmt_create    datetime        not null,
    gmt_modified  datetime        null,
    idx_user_id   bigint unsigned not null,
    idx_team_id   bigint unsigned not null,
    document_path varchar(200)    not null,
    record_type   int unsigned    not null,
    title         varchar(100)    not null,
    content       text            not null,
    CONSTRAINT daily_user_id FOREIGN KEY (idx_user_id) REFERENCES cptmp_user (id),
    CONSTRAINT daily_team_id FOREIGN KEY (idx_team_id) REFERENCES train_team (id)
);









create table if not exists test_tb
(
    id          int unsigned auto_increment
        primary key,
    pigeon_name varchar(20) not null
)
    charset = utf8;

create table if not exists train
(
    id               bigint unsigned auto_increment
        primary key,
    gmt_create       datetime        not null,
    gmt_modified     datetime        null,
    school_id        bigint unsigned not null,
    process_id       bigint unsigned not null,
    start_date       datetime        null,
    finish_date      datetime        null,
    content          varchar(5000)   not null,
    accept_standard  varchar(3000)   not null,
    resource_library varchar(5000)   not null
);

create table if not exists train_project
(
    id               bigint unsigned auto_increment
        primary key,
    gmt_create       datetime         not null,
    gmt_modified     datetime         null,
    idx_train_id         bigint unsigned  not null,
    uk_project_name  varchar(100)     not null,
    project_level    tinyint unsigned not null,
    project_content  varchar(5000)    not null,
    resource_library varchar(5000)    not null,
    UNIQUE KEY uk_project_name (uk_project_name),
    CONSTRAINT train_and_project_id FOREIGN KEY (idx_train_id) REFERENCES train (id)
);

CREATE TABLE if not exists train_team (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  gmt_create datetime NOT NULL,
  gmt_modified datetime DEFAULT NULL,
  idx_train_project_id bigint unsigned NOT NULL,
  idx_team_name varchar(100) NOT NULL,
  idx_master_user_id bigint unsigned NOT NULL,
  idx_pm_user_id bigint unsigned NOT NULL,
  idx_po_user_id bigint unsigned NOT NULL,
  code_base_url Text NOT NULL,
  team_grade decimal(5,2) NOT NULL,
  CONSTRAINT project_and_team_id FOREIGN KEY (idx_train_project_id) REFERENCES train_project (id),
  PRIMARY KEY (`id`)
);
create table if not exists activity_record
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime        not null,
    gmt_modified datetime        null,
    idx_user_id  bigint unsigned not null,
    idx_team_id  bigint unsigned not null,
    state_record int unsigned    not null,
    event_record varchar(2000)   not null,
    constraint activity_user_id
        foreign key (idx_user_id) references cptmp_user (id),
	constraint activity_team_id
        foreign key (idx_team_id) references train_team (id)
);


CREATE TABLE attachment_file (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  gmt_create datetime NOT NULL,
  gmt_modified datetime DEFAULT NULL,
  uk_file_name varchar(200) NOT NULL,
  uk_file_path varchar(500) NOT NULL,
  origin_name varchar(200) NOT NULL,
  file_size bigint NOT NULL,
  idx_file_type varchar(50) NOT NULL,
  idx_user_id bigint unsigned NOT NULL,
  idx_team_id bigint unsigned DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY idx_file_name_UNIQUE (uk_file_name),
  UNIQUE KEY uk_file_path_UNIQUE (uk_file_path),
  KEY file_user_id_idx (idx_user_id),
  KEY file_team_id_idx (idx_team_id),
  CONSTRAINT file_team_id FOREIGN KEY (idx_team_id) REFERENCES train_team (id),
  CONSTRAINT file_user_id FOREIGN KEY (idx_user_id) REFERENCES cptmp_user (id)
);

