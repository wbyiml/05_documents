/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/3/27 14:35:22                           */
/*==============================================================*/


drop table if exists tb_dict;

drop table if exists tb_permission;

drop table if exists tb_role;

drop table if exists tb_role_permission;

drop table if exists tb_user;

drop table if exists tb_user_role;

/*==============================================================*/
/* Table: tb_dict                                               */
/*==============================================================*/
create table tb_dict
(
   Id                   int not null,
   dict_id              varchar(32) not null,
   dict_number          int(11) default NULL comment '字典编号',
   dict_name            varchar(60) not null comment '字典名称',
   dict_value           varchar(10) default NULL comment '字典',
   dict_category        varchar(30) default NULL comment '字典类别',
   parent_id            varchar(32) default NULL comment '父类id',
   description          varchar(255) default NULL comment '字典描述',
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

/*==============================================================*/
/* Table: tb_permission                                         */
/*==============================================================*/
create table tb_permission
(
   Id                   int not null,
   menu_id              varchar(32) not null comment '记录标识',
   parent_id            varchar(32) default NULL comment '父类菜单id',
   menu_name            varchar(100) default NULL comment '菜单名称',
   menu_number          int(255) default NULL comment '菜单编号',
   level                int(11) default NULL comment '菜单级别',
   menu_url             varchar(255) default NULL comment '菜单地址',
   is_leaf              int(1) default NULL comment '是否叶节点（0：是；1：否）',
   menu_icon_path       varchar(255) default NULL comment '菜单图标路径',
   is_valid             int(1) default 0 comment '是否有效（0：是；1否）',
   create_time          datetime default NULL comment '创建时间',
   create               varchar(20) default NULL comment '样式',
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*==============================================================*/
/* Table: tb_role                                               */
/*==============================================================*/
create table tb_role
(
   Id                   int not null,
   role_id              varchar(32) not null comment '记录标识',
   parent_id            varchar(32) default NULL comment '父级角色id',
   role_name            varchar(32) not null comment '角色名称',
   description          varchar(255) default NULL comment '角色描述',
   create_time          datetime default NULL comment '创建时间',
   create               varchar(29) binary,
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

/*==============================================================*/
/* Table: tb_role_permission                                    */
/*==============================================================*/
create table tb_role_permission
(
   Id                   int not null,
   role_id              varchar(32) default NULL comment '角色id',
   permi_id             varchar(32) default NULL comment '权限id',
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

/*==============================================================*/
/* Table: tb_user                                               */
/*==============================================================*/
create table tb_user
(
   Id                   int not null,
   user_id              varchar(32) not null comment '记录标识',
   user_number          bigint(20) not null comment '用户编号',
   user_name            varchar(50) not null comment '用户名',
   pwd                  varchar(50) not null comment '密码',
   phone                varchar(11) default NULL comment '手机号码',
   email                varchar(64) default NULL comment '电子邮箱',
   login_way            varchar(0) binary,
   login_time           datetime default NULL comment '登陆时间',
   last_login_time      datetime default NULL comment '上次登陆时间',
   count                bigint(20) default NULL comment '登陆次数',
   status               int(1) default 0 comment '用户状态（0：有效；1：挂起：2：注销）',
   create               varchar(10),
   create_time          datetime default NULL comment '创建时间',
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*==============================================================*/
/* Table: tb_user_role                                          */
/*==============================================================*/
create table tb_user_role
(
   Id                   int not null,
   user_id              varchar(32) default NULL comment '用户',
   role_id              varchar(32) default NULL comment '角色',
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

alter table tb_permission add constraint FK_Reference_1 foreign key (parent_id)
      references tb_permission (Id) on delete restrict on update restrict;

alter table tb_role_permission add constraint FK_Reference_2 foreign key (permi_id)
      references tb_permission (Id) on delete restrict on update restrict;

alter table tb_role_permission add constraint FK_Reference_3 foreign key (role_id)
      references tb_role (Id) on delete restrict on update restrict;

alter table tb_user_role add constraint FK_Reference_4 foreign key (role_id)
      references tb_role (Id) on delete restrict on update restrict;

alter table tb_user_role add constraint FK_Reference_5 foreign key (user_id)
      references tb_user (Id) on delete restrict on update restrict;

