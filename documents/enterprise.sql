CREATE DATABASE IF NOT EXISTS enterprise DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

use enterprise;

/*管理员表*/
DROP TABLE IF EXISTS t_admin;
create table t_admin(
  id VARCHAR(36) PRIMARY KEY COMMENT '编号',
  email VARCHAR(50) not null UNIQUE COMMENT '邮箱',
  pwd VARCHAR(30) not null COMMENT '密码',
  name VARCHAR(30) COMMENT '姓名',
  phone varchar(11) comment '手机号',
  created_time datetime DEFAULT current_timestamp comment '创建时间'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO t_admin(id, email, pwd, name, phone) VALUES (uuid(), 'admin@126.com', '6khXbzC+FmmXFpnAmtBclA==', 'admin', '18888888888');

/*公司基本信息表*/
DROP TABLE IF EXISTS t_company;
create table t_company(
  id VARCHAR(36) PRIMARY KEY COMMENT '编号',
  name VARCHAR(50) NOT NULL COMMENT '名称',
  address varchar(100) COMMENT '地址',
  tel_no varchar(12) COMMENT '联系方式',
  email VARCHAR(50) COMMENT '联系邮箱',
  longidute double COMMENT '经度',
  laditude double COMMENT '纬度',
  logo VARCHAR(500) NOT NULL COMMENT 'logo图片',
  org_img VARCHAR(500) COMMENT '组织架构图',
  des text COMMENT '描述',
  culture text COMMENT '公司文化',
  qq_customer VARCHAR(200) COMMENT '客服qq'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/**公司荣誉表*/
DROP TABLE IF EXISTS t_company_honor;
create table t_company_honor(
  id VARCHAR(36) PRIMARY KEY COMMENT '编号',
  title VARCHAR(50) NOT NULL COMMENT '标题',
  des TEXT COMMENT '描述'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*文章类型表，可支持新闻动态，服务项目，成功案例，人才招聘，联系我们*/
DROP TABLE IF EXISTS t_article_type;
create table t_article_type(
  id VARCHAR(36) PRIMARY KEY COMMENT '编号',
  name varchar(30) COMMENT '类型',
  parent_id int COMMENT '父类型',
  visible VARCHAR(2) COMMENT '是否显示到页面'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*文章表*/
DROP TABLE IF EXISTS t_article;
create table t_article(
  id VARCHAR(36) PRIMARY KEY COMMENT '编号',
  type_id VARCHAR(36) COMMENT '类型编号',
  title VARCHAR(50) COMMENT '标题',
  author VARCHAR(50) COMMENT '作者',
  content text COMMENT '内容',
  abstracts VARCHAR(200) COMMENT '摘要',
  pub_time datetime DEFAULT current_timestamp COMMENT '发布时间'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table t_article ADD CONSTRAINT fk_article_type_id FOREIGN KEY (type_id) REFERENCES t_article_type(id);

/*留言表*/
DROP TABLE IF EXISTS t_message;
create table t_message(
  id VARCHAR(36) PRIMARY KEY COMMENT '编号',
  title VARCHAR(50) COMMENT '标题',
  name VARCHAR(50) COMMENT '称呼',
  phone VARCHAR(11) COMMENT '手机号',
  content text COMMENT '内容',
  message_time datetime DEFAULT current_timestamp COMMENT '时间',
  reply_content text COMMENT '回复内容',
  replay_time DATETIME COMMENT '回复时间'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/**图片表*/
DROP TABLE IF EXISTS t_picture;
create table t_picture(
  id VARCHAR(36) PRIMARY KEY COMMENT '编号',
  title VARCHAR(20) COMMENT '标题',
  img VARCHAR(500) COMMENT '图片路径',
  des VARCHAR(500) COMMENT '描述',
  img_location VARCHAR(20) COMMENT '图片位置'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/**友情链接*/
DROP TABLE IF EXISTS t_link;
create table t_link(
  id VARCHAR(36) PRIMARY KEY COMMENT '编号',
  title VARCHAR(20) COMMENT '标题',
  url VARCHAR(500) COMMENT 'url地址'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
