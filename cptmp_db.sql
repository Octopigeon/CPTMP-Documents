create table if not exists authority
(
    id             bigint unsigned auto_increment
        primary key,
    gmt_create     datetime    not null,
    gmt_modified   datetime    null,
    uk_name        varchar(45) not null,
    operation      varchar(45) not null comment '''不同权限之间用英文逗号隔开''',
    idx_table_name varchar(20) not null,
    constraint uk_name_UNIQUE
        unique (uk_name)
)
    comment '对数据库所有表的权限管理';

create table if not exists cptmp_user
(
    id           bigint unsigned auto_increment
        primary key,
    gmt_create   datetime         not null,
    gmt_modified datetime         null,
    password     varchar(20)      not null,
    nickname     varchar(20)      not null,
    introduction text             null,
    contact_info varchar(200)     null,
    gender       tinyint unsigned null,
    avatar       varchar(200)     null
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
    constraint enterprise_admin_ibfk_1
        foreign key (uk_user_id) references cptmp_user (id)
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
    constraint school_instructor_ibfk_1
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
    constraint school_student_ibfk_1
        foreign key (uk_user_id) references cptmp_user (id)
);

create table if not exists test_tb
(
    id          int unsigned auto_increment
        primary key,
    pigeon_name varchar(20) not null
)
    charset = utf8;

create table if not exists user_authority
(
    id            bigint unsigned auto_increment
        primary key,
    gmt_create    datetime        not null,
    gmt_modified  datetime        null,
    uk_user_id    bigint unsigned not null,
    authority_ids varchar(200)    null,
    constraint uk_user_id_UNIQUE
        unique (uk_user_id),
    constraint user_authority_ibfk_1
        foreign key (uk_user_id) references cptmp_user (id)
)
    comment '用户权限表，主要处理异常情况，剥夺某一用户的权限';

create table if not exists user_role
(
    id            bigint unsigned auto_increment
        primary key,
    gmt_create    datetime        not null,
    gmt_modified  datetime        null,
    uk_user_id    bigint unsigned not null,
    idx_role_name varchar(20)     not null,
    authority_ids varchar(200)    not null,
    constraint uk_user_id
        unique (uk_user_id),
    constraint user_role_ibfk_1
        foreign key (uk_user_id) references cptmp_user (id)
);

