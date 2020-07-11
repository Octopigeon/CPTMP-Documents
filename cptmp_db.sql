drop table if exists activity_record;

drop table if exists daily_record;

drop table if exists enterprise_admin;

drop table if exists password_reset_token;

drop table if exists school_instructor;

drop table if exists school_student;

drop table if exists cptmp_user;

drop table if exists test_tb;

drop table if exists train;

drop table if exists train_project;

drop table if exists train_team;

create table if not exists activity_record
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime        not null,
    gmt_modified datetime        null,
    idx_user_id  bigint unsigned not null,
    idx_team_id  bigint unsigned not null,
    state_record int unsigned    not null,
    event_record varchar(2000)   not null
);

create table if not exists cptmp_user
(
    id                      bigint unsigned auto_increment
        primary key,
    gmt_create              datetime         not null,
    gmt_modified            datetime         null,
    idx_password            varchar(128)     not null,
    uk_username             varchar(20)      not null,
    introduction            text             null,
    uk_email                varchar(200)     not null,
    phone_number            decimal(11)      null,
    gender                  tinyint unsigned null,
    avatar                  varchar(200)     null,
    idx_role_name           varchar(25)      not null,
    enabled                 tinyint          not null,
    account_non_expired     tinyint          not null,
    credentials_non_expired tinyint          not null,
    account_non_locked      tinyint          not null,
    invitation_code         varchar(6)       null,
    constraint invitation_code_UNIQUE
        unique (invitation_code),
    constraint uk_email
        unique (uk_email)
);

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
    content       text            not null
);

create table if not exists enterprise_admin
(
    id             bigint unsigned auto_increment
        primary key,
    gmt_create     datetime        not null,
    gmt_modified   datetime        null,
    idx_name       varchar(20)     not null,
    uk_user_id     bigint unsigned not null,
    uk_employee_id bigint          not null,
    constraint uk_employee_id
        unique (uk_employee_id),
    constraint uk_user_id
        unique (uk_user_id),
    constraint enterprise_user_id
        foreign key (uk_user_id) references cptmp_user (id)
);

create table if not exists password_reset_token
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime     not null,
    gmt_modified datetime     null,
    token        varchar(128) not null,
    idx_email    varchar(200) not null,
    constraint token
        unique (token),
    constraint password_reset_email
        foreign key (idx_email) references cptmp_user (uk_email)
);

create table if not exists school_instructor
(
    id              bigint unsigned auto_increment
        primary key,
    gmt_create      datetime        not null,
    gmt_modified    datetime        null,
    idx_name        varchar(20)     not null,
    uk_user_id      bigint unsigned not null,
    uk_employee_id  bigint          null,
    idx_school_name varchar(20)     not null,
    constraint uk_employee_id
        unique (uk_employee_id),
    constraint uk_user_id
        unique (uk_user_id),
    constraint teacher_user_id
        foreign key (uk_user_id) references cptmp_user (id)
);

create table if not exists school_student
(
    id              bigint unsigned auto_increment
        primary key,
    gmt_create      datetime        not null,
    gmt_modified    datetime        null,
    idx_name        varchar(20)     not null,
    idx_school_name varchar(20)     not null,
    uk_user_id      bigint unsigned not null,
    uk_student_id   bigint          null,
    uk_student_face varchar(200)    null,
    constraint uk_student_id
        unique (uk_student_id),
    constraint uk_user_id
        unique (uk_user_id),
    constraint stu_user_id
        foreign key (uk_user_id) references cptmp_user (id)
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
    train_id         bigint unsigned  not null,
    uk_project_name  varchar(100)     not null,
    project_level    tinyint unsigned not null,
    finish_date      datetime         null,
    project_content  varchar(5000)    not null,
    resource_library varchar(5000)    not null
);

create table if not exists train_team
(
    id               bigint unsigned auto_increment
        primary key,
    gmt_create       datetime        not null,
    gmt_modified     datetime        null,
    train_project_id bigint unsigned not null,
    idx_team_name    varchar(100)    not null,
    team_manager_id  bigint unsigned not null,
    code_base_url    text            not null,
    team_grade       decimal(5, 2)   not null
);

