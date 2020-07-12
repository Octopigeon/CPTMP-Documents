<<<<<<< Updated upstream
unlock tables;

use cptmp_db;

unlock tables;

=======
>>>>>>> Stashed changes
drop table if exists activity_record;

drop table if exists attachment_file;

drop table if exists daily_record;

drop table if exists password_reset_token;

drop table if exists cptmp_user;

drop table if exists cptmp_organization;

drop table if exists student_team;

drop table if exists train_team;

drop table if exists train_project;

drop table if exists train_team;


<<<<<<< Updated upstream
drop table if exists train;



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
  CONSTRAINT enterprise_user_id FOREIGN KEY (uk_user_id) REFERENCES cptmp_user (id) on delete cascade on update cascade
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
  CONSTRAINT password_reset_email FOREIGN KEY (idx_email) REFERENCES cptmp_user (uk_email) on delete cascade on update cascade
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
  CONSTRAINT teacher_user_id FOREIGN KEY (uk_user_id) REFERENCES cptmp_user (id) on delete cascade on update cascade
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
  CONSTRAINT stu_user_id FOREIGN KEY (uk_user_id) REFERENCES cptmp_user (id) on delete cascade on update cascade
) ;






=======
create table if not exists attachment_file
(
    id            bigint unsigned auto_increment
        primary key,
    gmt_create    datetime     not null,
    gmt_modified  datetime     null,
    gmt_deleted   datetime     null,
    uk_file_name  varchar(200) not null,
    uk_file_path  varchar(500) not null,
    origin_name   varchar(200) not null,
    file_size     bigint       not null,
    idx_file_type varchar(50)  not null,
    constraint uk_file_name_UNIQUE
        unique (uk_file_name),
    constraint uk_file_path_UNIQUE
        unique (uk_file_path)
);

create table if not exists cptmp_organization
(
    id                       bigint unsigned auto_increment
        primary key,
    gmt_create               datetime      not null,
    gmt_modified             datetime      null,
    gmt_deleted              datetime      null,
    uk_organization_name     varchar(45)   not null,
    organization_description varchar(5000) null,
    official_website_url     varchar(200)  null,
    invitation_code          varchar(45)   null,
    constraint invitation_code_UNIQUE
        unique (invitation_code),
    constraint uk_name_UNIQUE
        unique (uk_organization_name)
);

create table if not exists cptmp_user
(
    id                      bigint unsigned auto_increment
        primary key,
    gmt_create              datetime         not null,
    gmt_modified            datetime         null,
    gmt_deleted             datetime         null,
    idx_password            varchar(128)     not null,
    uk_username             varchar(200)     not null,
    introduction            text             null,
    uk_email                varchar(200)     not null,
    phone_number            decimal(11)      null,
    gender                  tinyint unsigned null,
    avatar                  varchar(200)     null,
    idx_name                varchar(200)     not null,
    uk_common_id            varchar(200)     not null,
    idx_organization_id     bigint unsigned  not null,
    idx_role_name           varchar(50)      not null,
    enabled                 tinyint          not null,
    account_non_expired     tinyint          not null,
    credentials_non_expired tinyint          not null,
    account_non_locked      tinyint          not null,
    constraint uk_email_UNIQUE
        unique (uk_email),
    constraint uk_username_UNIQUE
        unique (uk_username),
    constraint user_organization_id
        foreign key (idx_organization_id) references cptmp_organization (id)
            on update cascade on delete cascade
);

create table if not exists password_reset_token
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime     not null,
    gmt_modified datetime     null,
    gmt_deleted  datetime     null,
    uk_token     varchar(128) not null,
    idx_email    varchar(200) not null,
    constraint uk_token
        unique (uk_token),
    constraint password_reset_email
        foreign key (idx_email) references cptmp_user (uk_email)
            on update cascade on delete cascade
);

create table if not exists student_team
(
    id            bigint unsigned auto_increment
        primary key,
    gmt_create    datetime not null,
    gmt_modified  datetime null,
    gmt_deleted   datetime null,
    user_id       bigint   not null,
    team_id       bigint   not null,
    student_grade int      null
);

>>>>>>> Stashed changes
create table if not exists train
(
    id               bigint unsigned auto_increment
        primary key,
    gmt_create       datetime        not null,
    gmt_modified     datetime        null,
    gmt_deleted      datetime        null,
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
<<<<<<< Updated upstream
    idx_train_id         bigint unsigned  not null,
    uk_project_name  varchar(100)     not null,
    project_level    tinyint unsigned not null,
    project_content  varchar(5000)    not null,
    resource_library varchar(5000)    not null,
    UNIQUE KEY uk_project_name (uk_project_name),
    CONSTRAINT train_and_project_id FOREIGN KEY (idx_train_id) REFERENCES train (id) on delete cascade on update cascade
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
  CONSTRAINT project_and_team_id FOREIGN KEY (idx_train_project_id) REFERENCES train_project (id) on delete cascade on update cascade,
  PRIMARY KEY (`id`)
=======
    gmt_deleted      datetime         null,
    idx_train_id     bigint unsigned  not null,
    idx_project_name varchar(100)     not null,
    project_level    tinyint unsigned not null,
    project_content  varchar(5000)    not null,
    resource_library varchar(5000)    not null,
    constraint train_and_project_id
        foreign key (idx_train_id) references train (id)
            on update cascade on delete cascade
);

create table if not exists train_team
(
    id                   bigint unsigned auto_increment
        primary key,
    gmt_create           datetime        not null,
    gmt_modified         datetime        null,
    gmt_deleted          datetime        null,
    idx_train_project_id bigint unsigned not null,
    idx_team_name        varchar(100)    not null,
    idx_master_user_id   bigint unsigned not null,
    idx_pm_user_id       bigint unsigned not null,
    idx_po_user_id       bigint unsigned not null,
    code_base_url        text            not null,
    team_grade           decimal(5, 2)   not null,
    constraint project_and_team_id
        foreign key (idx_train_project_id) references train_project (id)
            on update cascade on delete cascade
>>>>>>> Stashed changes
);
create table if not exists activity_record
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime        not null,
    gmt_modified datetime        null,
    gmt_deleted  datetime        null,
    idx_user_id  bigint unsigned not null,
    idx_team_id  bigint unsigned not null,
    state_record int unsigned    not null,
    event_record varchar(2000)   not null,
<<<<<<< Updated upstream
    constraint activity_user_id
        foreign key (idx_user_id) references cptmp_user (id) on delete cascade on update cascade,
	constraint activity_team_id 
        foreign key (idx_team_id) references train_team (id) on delete cascade on update cascade
=======
    constraint activity_team_id
        foreign key (idx_team_id) references train_team (id)
            on update cascade on delete cascade,
    constraint activity_user_id
        foreign key (idx_user_id) references cptmp_user (id)
            on update cascade on delete cascade
>>>>>>> Stashed changes
);

create table if not exists daily_record
(
    id            bigint unsigned auto_increment
        primary key,
    gmt_create    datetime        not null,
    gmt_modified  datetime        null,
    gmt_deleted   datetime        null,
    idx_user_id   bigint unsigned not null,
    idx_team_id   bigint unsigned not null,
    document_path varchar(200)    not null,
    record_type   int unsigned    not null,
    title         varchar(100)    not null,
    content       text            not null,
<<<<<<< Updated upstream
    CONSTRAINT daily_user_id FOREIGN KEY (idx_user_id) REFERENCES cptmp_user (id) on delete cascade on update cascade ,
    CONSTRAINT daily_team_id FOREIGN KEY (idx_team_id) REFERENCES train_team (id) on delete cascade on update cascade
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
  CONSTRAINT file_team_id FOREIGN KEY (idx_team_id) REFERENCES train_team (id) on delete cascade on update cascade,
  CONSTRAINT file_user_id FOREIGN KEY (idx_user_id) REFERENCES cptmp_user (id) on delete cascade on update cascade
=======
    constraint daily_team_id
        foreign key (idx_team_id) references train_team (id)
            on update cascade on delete cascade,
    constraint daily_user_id
        foreign key (idx_user_id) references cptmp_user (id)
            on update cascade on delete cascade
>>>>>>> Stashed changes
);

