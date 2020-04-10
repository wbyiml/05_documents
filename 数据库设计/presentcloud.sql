/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/4/9 21:02:28                            */
/*==============================================================*/


drop table if exists activity;

drop table if exists class;

drop table if exists dictionary;

drop table if exists dictionary_detail;

drop table if exists experience_log;

drop table if exists experience_setting;

drop table if exists faculty;

drop table if exists homework;

drop table if exists level_setting;

drop table if exists login;

drop table if exists major;

drop table if exists notification;

drop table if exists permission;

drop table if exists role;

drop table if exists role_permission;

drop table if exists school;

drop table if exists signin;

drop table if exists signin_setting;

drop table if exists user;

drop table if exists user_class;

drop table if exists user_homework;

drop table if exists user_notification;

drop table if exists user_role;

drop table if exists vote;

drop table if exists vote_feedback;

drop table if exists vote_item;

drop table if exists vote_question;

/*==============================================================*/
/* Table: activity                                              */
/*==============================================================*/
create table activity
(
   id                   int not null auto_increment,
   type                 varchar(100) not null,
   sort                 int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: class                                                 */
/*==============================================================*/
create table class
(
   id                   int not null auto_increment,
   class_image          varchar(200),
   name                 varchar(100) not null,
   course               varchar(100),
   semester             varchar(20),
   user_id              int not null,
   shcool_id            int,
   faculty_id           int,
   major_id             int,
   is_school_plan       bool,
   extend_json          varchar(2000),
   primary key (id)
);

/*==============================================================*/
/* Table: dictionary                                            */
/*==============================================================*/
create table dictionary
(
   id                   int not null auto_increment,
   name                 varchar(100) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: dictionary_detail                                     */
/*==============================================================*/
create table dictionary_detail
(
   id                   int not null auto_increment,
   dictionary_id        int not null,
   keyword              varchar(20) not null,
   value                varchar(200) not null,
   is_default           bool not null,
   sort                 int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: experience_log                                        */
/*==============================================================*/
create table experience_log
(
   id                   int not null auto_increment,
   class_id             int,
   user_id              int not null,
   experience_id        int not null,
   experience           int,
   time                 timestamp,
   extend_json          varchar(2000),
   primary key (id)
);

/*==============================================================*/
/* Table: experience_setting                                    */
/*==============================================================*/
create table experience_setting
(
   id                   int not null auto_increment,
   name                 varchar(50) not null,
   experience           int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: faculty                                               */
/*==============================================================*/
create table faculty
(
   id                   int not null auto_increment,
   name                 varchar(50) not null,
   school_id            int,
   primary key (id)
);

/*==============================================================*/
/* Table: homework                                              */
/*==============================================================*/
create table homework
(
   id                   int not null auto_increment,
   class_id             int not null,
   title                varchar(100) not null,
   content              varchar(3000) not null,
   file                 varchar(200),
   deadline             timestamp,
   create_time          timestamp not null,
   creator              varchar(20) not null,
   experience_id        int,
   experience           int,
   primary key (id)
);

/*==============================================================*/
/* Table: level_setting                                         */
/*==============================================================*/
create table level_setting
(
   id                   int not null auto_increment,
   level                int not null,
   name                 varchar(50),
   experience           int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: login                                                 */
/*==============================================================*/
create table login
(
   id                   int not null auto_increment,
   user_id              int not null,
   phone                varchar(20) not null,
   phone_password       varchar(50) not null,
   email                varchar(50),
   emain_password       varchar(50),
   create_time          timestamp,
   extend_json          varchar(2000),
   primary key (id)
);

/*==============================================================*/
/* Table: major                                                 */
/*==============================================================*/
create table major
(
   id                   int not null auto_increment,
   name                 varchar(50) not null,
   faculty_id           int,
   primary key (id)
);

/*==============================================================*/
/* Table: notification                                          */
/*==============================================================*/
create table notification
(
   id                   int not null auto_increment,
   class_id             int not null,
   content              varchar(3000) not null,
   create_time          timestamp not null,
   creator              varchar(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: permission                                            */
/*==============================================================*/
create table permission
(
   id                   int not null auto_increment,
   parent_id            int,
   sort                 int not null,
   name                 varchar(100) not null,
   url                  varchar(1000),
   icon                 varchar(200),
   is_menu              bool,
   is_page              bool,
   is_button            bool,
   description          varchar(500),
   create_time          timestamp,
   creator              varchar(20),
   update_time          timestamp,
   updater              varchar(20),
   is_delete            bool not null,
   extend_json          varchar(2000),
   primary key (id)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   id                   int not null auto_increment,
   name                 char(10) not null,
   create_time          timestamp,
   creator              varchar(20),
   update_time          timestamp,
   updater              varchar(20),
   is_delete            bool not null,
   primary key (id)
);

/*==============================================================*/
/* Table: role_permission                                       */
/*==============================================================*/
create table role_permission
(
   id                   int not null auto_increment,
   role_id              int not null,
   permission_id        int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: school                                                */
/*==============================================================*/
create table school
(
   id                   int not null auto_increment,
   name                 varchar(50) not null,
   location             varchar(100),
   primary key (id)
);

/*==============================================================*/
/* Table: signin                                                */
/*==============================================================*/
create table signin
(
   id                   int not null auto_increment,
   class_id             int not null,
   experience_id        int,
   experience           int,
   create_time          timestamp not null,
   creator              varchar(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: signin_setting                                        */
/*==============================================================*/
create table signin_setting
(
   id                   int not null auto_increment,
   level                int,
   name                 varchar(50) not null,
   rate                 real not null,
   primary key (id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   int not null auto_increment,
   name                 varchar(20) not null,
   sex                  varchar(10),
   birthday             timestamp,
   phone                varchar(20) not null,
   email                varchar(50),
   identity             varchar(20) not null,
   shcool_id            int,
   faculty_id           int,
   major_id             int,
   user_name            varchar(50),
   head_image           varchar(200),
   experience           int not null,
   extend_json          varchar(2000),
   primary key (id)
);

/*==============================================================*/
/* Table: user_class                                            */
/*==============================================================*/
create table user_class
(
   id                   int not null auto_increment,
   user_id              int not null,
   class_id             int not null,
   grade                real,
   primary key (id)
);

/*==============================================================*/
/* Table: user_homework                                         */
/*==============================================================*/
create table user_homework
(
   id                   int not null auto_increment,
   clas_id              int,
   homework_id          int,
   user_id              int,
   time                 timestamp,
   content              varchar(3000),
   file                 varchar(200),
   experience           int,
   primary key (id)
);

/*==============================================================*/
/* Table: user_notification                                     */
/*==============================================================*/
create table user_notification
(
   id                   int not null auto_increment,
   notification_id      int not null,
   user_id              int not null,
   is_read              bool not null,
   read_time            timestamp not null,
   primary key (id)
);

/*==============================================================*/
/* Table: user_role                                             */
/*==============================================================*/
create table user_role
(
   id                   int not null auto_increment,
   user_id              int not null,
   role_id              int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: vote                                                  */
/*==============================================================*/
create table vote
(
   id                   int not null auto_increment,
   title                varchar(100) not null,
   experience_id        int,
   experience           int,
   is_show_now          bool not null,
   create_time          timestamp not null,
   creator              varchar(20) not null,
   class_id             int,
   primary key (id)
);

/*==============================================================*/
/* Table: vote_feedback                                         */
/*==============================================================*/
create table vote_feedback
(
   id                   int not null auto_increment,
   vote_id              int,
   question_id          int not null,
   item_id              int,
   user_id              int,
   time                 timestamp,
   primary key (id)
);

/*==============================================================*/
/* Table: vote_item                                             */
/*==============================================================*/
create table vote_item
(
   id                   int not null auto_increment,
   question_id          int not null,
   sort                 int not null,
   content              varchar(1000) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: vote_question                                         */
/*==============================================================*/
create table vote_question
(
   id                   int not null auto_increment,
   vote_id              int not null,
   sort                 int not null,
   content              varchar(1000) not null,
   type                 varchar(10) not null,
   primary key (id)
);

