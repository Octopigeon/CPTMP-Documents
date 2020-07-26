use cptmp_db;

unlock tables;


drop table if exists record;

drop table if exists attachment_file;

drop table if exists assignment;

drop table if exists password_reset_token;

drop table if exists process_event;

drop table if exists cptmp_event;

drop table if exists cptmp_process;

drop table if exists personal_grade;

drop table if exists team_person;

drop table if exists team;

drop table if exists cptmp_user;

drop table if exists project_train;

drop table if exists train;

drop table if exists cptmp_organization;

drop table if exists train_project;




create table if not exists attachment_file
(
    id            bigint unsigned auto_increment
        primary key,
    gmt_create    datetime     not null,
    gmt_modified  datetime     null,
    gmt_deleted   datetime     null,
    uk_file_name  varchar(200) not null,
    uk_file_url  varchar(200) not null,
    uk_file_path  varchar(500) not null,
    origin_name   varchar(200) not null,
    file_size     bigint       not null,
    idx_file_type varchar(100)  not null,
    constraint uk_file_name_UNIQUE
        unique (uk_file_name),
    constraint uk_file_path_UNIQUE
        unique (uk_file_path),
        constraint uk_file_url_UNIQUE
        unique (uk_file_url)
);

create table if not exists cptmp_event
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

create table if not exists cptmp_organization
(
    id                       bigint unsigned auto_increment
        primary key,
    gmt_create               datetime      not null,
    gmt_modified             datetime      null,
    gmt_deleted              datetime      null,
    uk_real_name             varchar(45)   not null,
    organization_description varchar(5000) null,
    official_website_url     varchar(200)  null,
    invitation_code          varchar(200)  null,
    uk_name                  varchar(45)   not null,
    constraint invitation_code_UNIQUE
        unique (invitation_code),
    constraint uk_name
        unique (uk_name)
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

create table if not exists cptmp_process
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

create table if not exists process_event
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime        not null,
    gmt_modified datetime        null,
    gmt_deleted  datetime        null,
    process_id   bigint unsigned not null,
    event_id     bigint unsigned not null,
    constraint process_event_and_event
        foreign key (event_id) references cptmp_event (id)
            on update cascade on delete cascade,
    constraint process_event_and_process
        foreign key (process_id) references cptmp_process (id)
            on update cascade on delete cascade
);

create table if not exists train_project
(
    id               bigint unsigned auto_increment
        primary key,
    gmt_create       datetime          not null,
    gmt_modified     datetime          null,
    gmt_deleted      datetime          null,
    project_level    smallint unsigned not null,
    project_content  varchar(5000)     not null,
    resource_library varchar(5000)     not null,
    idx_name         varchar(100)      not null
);

create table if not exists project_train
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime        not null,
    gmt_modified datetime        null,
    gmt_deleted  datetime        null,
    project_id   bigint unsigned not null,
    train_id     bigint unsigned not null,
    constraint project_train_project
        foreign key (project_id) references train_project (id)
            on update cascade on delete cascade,
    constraint project_train_train
        foreign key (train_id) references train (id)
            on update cascade on delete cascade
);

create table if not exists team
(
    id                  bigint unsigned auto_increment
        primary key,
    gmt_create          datetime          not null,
    gmt_modified        datetime          null,
    gmt_deleted         datetime          null,
    idx_team_name       varchar(100)      not null,
    team_grade          smallint unsigned not null,
    avatar              varchar(200)      null,
    repo_url            varchar(200)      null,
    evaluation          varchar(5000)     null,
    uk_project_train_id bigint unsigned   not null,
    constraint team_ibfk_1
        foreign key (uk_project_train_id) references project_train (id)
            on update cascade on delete cascade,
	constraint uk_project_train_id
		unique(uk_project_train_id)
);



create table if not exists assignment
(
    id            bigint unsigned auto_increment
        primary key,
    gmt_create    datetime        not null,
    gmt_modified  datetime        null,
    gmt_deleted   datetime        null,
    document_path varchar(200)    not null,
    is_file   	  boolean    not null,
    title         varchar(100)    not null,
    content       text            not null
);

create table if not exists record
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime        not null,
    gmt_modified datetime        null,
    gmt_deleted  datetime        null,
    idx_user_id  bigint unsigned not null,
    idx_team_id  bigint unsigned not null,
    idx_train_id  bigint unsigned not null,
    idx_process_event_id  bigint unsigned not null,
    assignments_lib  varchar(5000)  null,
    constraint record_team_id
        foreign key (idx_team_id) references team (id)
            on update cascade on delete cascade,
    constraint record_user_id
        foreign key (idx_user_id) references cptmp_user (id)
            on update cascade on delete cascade,
	constraint record_train_id
        foreign key (idx_train_id) references train (id)
            on update cascade on delete cascade,
    constraint record_process_id
        foreign key (idx_process_event_id) references process_event (id)
            on update cascade on delete cascade
);

create table if not exists team_person
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime        not null,
    gmt_modified datetime        null,
    gmt_deleted  datetime        null,
    team_id      bigint unsigned not null,
    user_id      bigint unsigned not null,
    constraint team_person_and_team
        foreign key (team_id) references team (id)
            on update cascade on delete cascade,
    constraint team_person_and_user
        foreign key (user_id) references cptmp_user (id)
            on update cascade on delete cascade
);

create table if not exists personal_grade
(
    id                bigint unsigned auto_increment
        primary key,
    gmt_create        datetime          not null,
    gmt_modified      datetime          null,
    gmt_deleted       datetime          null,
    uk_team_person_id bigint unsigned   not null,
    personal_grade    smallint unsigned null,
    evaluation        varchar(5000)     null,
    constraint personal_grade_team_person
        foreign key (uk_team_person_id) references team_person (id)
            on update cascade on delete cascade,
	constraint uk_team_person_id
        unique (uk_team_person_id)
);