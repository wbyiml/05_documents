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
   dict_number          int(11) default NULL comment '�ֵ���',
   dict_name            varchar(60) not null comment '�ֵ�����',
   dict_value           varchar(10) default NULL comment '�ֵ�',
   dict_category        varchar(30) default NULL comment '�ֵ����',
   parent_id            varchar(32) default NULL comment '����id',
   description          varchar(255) default NULL comment '�ֵ�����',
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֵ��';

/*==============================================================*/
/* Table: tb_permission                                         */
/*==============================================================*/
create table tb_permission
(
   Id                   int not null,
   menu_id              varchar(32) not null comment '��¼��ʶ',
   parent_id            varchar(32) default NULL comment '����˵�id',
   menu_name            varchar(100) default NULL comment '�˵�����',
   menu_number          int(255) default NULL comment '�˵����',
   level                int(11) default NULL comment '�˵�����',
   menu_url             varchar(255) default NULL comment '�˵���ַ',
   is_leaf              int(1) default NULL comment '�Ƿ�Ҷ�ڵ㣨0���ǣ�1����',
   menu_icon_path       varchar(255) default NULL comment '�˵�ͼ��·��',
   is_valid             int(1) default 0 comment '�Ƿ���Ч��0���ǣ�1��',
   create_time          datetime default NULL comment '����ʱ��',
   create               varchar(20) default NULL comment '��ʽ',
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�˵���';

/*==============================================================*/
/* Table: tb_role                                               */
/*==============================================================*/
create table tb_role
(
   Id                   int not null,
   role_id              varchar(32) not null comment '��¼��ʶ',
   parent_id            varchar(32) default NULL comment '������ɫid',
   role_name            varchar(32) not null comment '��ɫ����',
   description          varchar(255) default NULL comment '��ɫ����',
   create_time          datetime default NULL comment '����ʱ��',
   create               varchar(29) binary,
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫ��';

/*==============================================================*/
/* Table: tb_role_permission                                    */
/*==============================================================*/
create table tb_role_permission
(
   Id                   int not null,
   role_id              varchar(32) default NULL comment '��ɫid',
   permi_id             varchar(32) default NULL comment 'Ȩ��id',
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫȨ�ޱ�';

/*==============================================================*/
/* Table: tb_user                                               */
/*==============================================================*/
create table tb_user
(
   Id                   int not null,
   user_id              varchar(32) not null comment '��¼��ʶ',
   user_number          bigint(20) not null comment '�û����',
   user_name            varchar(50) not null comment '�û���',
   pwd                  varchar(50) not null comment '����',
   phone                varchar(11) default NULL comment '�ֻ�����',
   email                varchar(64) default NULL comment '��������',
   login_way            varchar(0) binary,
   login_time           datetime default NULL comment '��½ʱ��',
   last_login_time      datetime default NULL comment '�ϴε�½ʱ��',
   count                bigint(20) default NULL comment '��½����',
   status               int(1) default 0 comment '�û�״̬��0����Ч��1������2��ע����',
   create               varchar(10),
   create_time          datetime default NULL comment '����ʱ��',
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û���';

/*==============================================================*/
/* Table: tb_user_role                                          */
/*==============================================================*/
create table tb_user_role
(
   Id                   int not null,
   user_id              varchar(32) default NULL comment '�û�',
   role_id              varchar(32) default NULL comment '��ɫ',
   primary key (Id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û���ɫ��';

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

