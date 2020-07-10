create table cptmp_user
(
    id                      bigint unsigned auto_increment
        primary key,
    gmt_create              datetime         not null,
    gmt_modified            datetime         null,
    idx_password            varchar(128)     not null,
    uk_username             varchar(200)     not null,
    nickname                varchar(200)     not null,
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
    constraint uk_email_UNIQUE
        unique (uk_email),
    constraint uk_username_UNIQUE
        unique (uk_username)
);

create table activity_record
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
        foreign key (idx_user_id) references cptmp_user (id)
);

create index activity_user_id_idx
    on activity_record (idx_user_id);

create table daily_record
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
    constraint daily_user_id
        foreign key (idx_user_id) references cptmp_user (id)
);

create index daily_user_id_idx
    on daily_record (idx_user_id);

create table enterprise_admin
(
    id              bigint unsigned auto_increment
        primary key,
    gmt_create      datetime        not null,
    gmt_modified    datetime        null,
    idx_name        varchar(20)     not null,
    uk_user_id      bigint unsigned not null,
    idx_employee_id varchar(50)     not null,
    constraint uk_user_id
        unique (uk_user_id),
    constraint enterprise_user_id
        foreign key (uk_user_id) references cptmp_user (id)
);

create table password_reset_token
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

create table school_instructor
(
    id              bigint unsigned auto_increment
        primary key,
    gmt_create      datetime        not null,
    gmt_modified    datetime        null,
    idx_name        varchar(20)     not null,
    uk_user_id      bigint unsigned not null,
    idx_employee_id varchar(50)     null,
    idx_school_name varchar(20)     not null,
    constraint uk_user_id
        unique (uk_user_id),
    constraint teacher_user_id
        foreign key (uk_user_id) references cptmp_user (id)
);

create table school_student
(
    id              bigint unsigned auto_increment
        primary key,
    gmt_create      datetime        not null,
    gmt_modified    datetime        null,
    idx_name        varchar(20)     not null,
    idx_school_name varchar(20)     not null,
    uk_user_id      bigint unsigned not null,
    idx_student_id  varchar(50)     not null,
    uk_student_face varchar(200)    null,
    constraint uk_student_face_UNIQUE
        unique (uk_student_face),
    constraint uk_user_id
        unique (uk_user_id),
    constraint stu_user_id
        foreign key (uk_user_id) references cptmp_user (id)
);

create table train_project
(
    id               bigint unsigned auto_increment
        primary key,
    gmt_create       datetime     not null,
    gmt_modified     datetime     null,
    uk_project_name  varchar(100) not null,
    start_date       datetime     null,
    finish_date      datetime     null,
    content          text         not null,
    accept_standard  text         not null,
    resource_library text         not null
);

create index uk_project_name
    on train_project (uk_project_name);

create table train_team
(
    id               bigint unsigned auto_increment
        primary key,
    gmt_create       datetime               not null,
    gmt_modified     datetime               null,
    train_project_id bigint unsigned        not null,
    idx_team_name    varchar(100)           not null,
    team_manager_id  bigint unsigned        not null,
    code_base_url    text                   not null,
    team_grade       decimal(3, 2) unsigned null
);

