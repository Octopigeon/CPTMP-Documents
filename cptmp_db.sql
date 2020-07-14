drop table if exists activity_record;

drop table if exists attachment_file;

drop table if exists daily_record;

drop table if exists cptmp_user;

drop table if exists event;

drop table if exists password_reset_token;

drop table if exists process;

drop table if exists student_team;

drop table if exists train_team;

drop table if exists train_project;

drop table if exists train;

drop table if exists cptmp_organization;


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
    uk_real_name             varchar(45)   not null,
    organization_description varchar(5000) null,
    official_website_url     varchar(200)  null,
    invitation_code          varchar(200)  null,
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
    uk_email                varchar(200)     null,
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
    constraint uk_email
        unique (uk_email),
    constraint uk_email_UNIQUE
        unique (uk_email),
    constraint uk_username_UNIQUE
        unique (uk_username),
    constraint user_organization_id
        foreign key (idx_organization_id) references cptmp_organization (id)
            on update cascade on delete cascade
);

create table if not exists event
(
    id             bigint unsigned auto_increment
        primary key,
    gmt_create     datetime         not null,
    gmt_modified   datetime         null,
    gmt_deleted    datetime         null,
    start_time     datetime         not null,
    end_time       datetime         not null,
    content        varchar(5000)    not null,
    person_or_team tinyint unsigned not null
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
        unique (uk_token)
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

create table if not exists train
(
    id               bigint unsigned auto_increment
        primary key,
    gmt_create       datetime        not null,
    gmt_modified     datetime        null,
    gmt_deleted      datetime        null,
    idx_name         varchar(50)     not null,
    organization_id  bigint unsigned not null,
    start_time       datetime        not null,
    end_time         datetime        not null,
    content          varchar(3000)   not null,
    accept_standard  varchar(3000)   not null,
    resource_library varchar(5000)   not null,
    gps_info         varchar(3000)   not null,
    constraint train_and_organization
        foreign key (organization_id) references cptmp_organization (id)
            on update cascade on delete cascade
);

create table if not exists process
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime        not null,
    gmt_modified datetime        null,
    gmt_deleted  datetime        null,
    train_id     bigint unsigned not null,
    start_time   datetime        not null,
    end_time     datetime        not null,
    constraint process_and_train
        foreign key (train_id) references train (id)
            on update cascade on delete cascade
);

create table if not exists train_project
(
    id               bigint unsigned auto_increment
        primary key,
    gmt_create       datetime          not null,
    gmt_modified     datetime          null,
    gmt_deleted      datetime          null,
    idx_train_id     bigint unsigned   not null,
    idx_project_name varchar(100)      not null,
    project_level    smallint unsigned not null,
    project_content  varchar(5000)     not null,
    resource_library varchar(5000)     not null,
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
    constraint activity_team_id
        foreign key (idx_team_id) references train_team (id)
            on update cascade on delete cascade,
    constraint activity_user_id
        foreign key (idx_user_id) references cptmp_user (id)
            on update cascade on delete cascade
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
    constraint daily_team_id
        foreign key (idx_team_id) references train_team (id)
            on update cascade on delete cascade,
    constraint daily_user_id
        foreign key (idx_user_id) references cptmp_user (id)
            on update cascade on delete cascade
);

