# $Revision: 762 $
# $Date: 2009-08-03 22:49:52 +0800 (星期一, 03 八月 2009) $

#DROP DATABASE IF EXISTS kello_dev;
#CREATE database kello_dev DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
#GRANT ALL ON kello_dev.* to rain@'%' IDENTIFIED BY 'rain';
#GRANT ALL ON kello_dev.* to rain@'localhost' IDENTIFIED BY 'rain';

CREATE TABLE k_attachment (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  author varchar(255) NOT NULL,
  content_type varchar(255) NOT NULL,
  created_date datetime NOT NULL,
  file_name varchar(255) NOT NULL,
  file_size varchar(255) NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY file_name (file_name)
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_guestbook (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  address varchar(255) NOT NULL,
  author varchar(255) NOT NULL,
  company_address varchar(255) NOT NULL,
  company_name varchar(255) NOT NULL,
  content text NOT NULL,
  created_date datetime NOT NULL,
  email varchar(100) NOT NULL,
  fax varchar(255) NOT NULL,
  postal_code varchar(255) NOT NULL,
  status varchar(255) NOT NULL,
  telephone varchar(50) NOT NULL,
  PRIMARY KEY  ( id )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_lookup (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  code_maximum varchar(255) default NULL,
  code_minimum varchar(255) default NULL,
  code_scale int(11) default NULL,
  code_type varchar(7) NOT NULL,
  date_created datetime NOT NULL,
  internationalize bit(1) NOT NULL,
  last_updated datetime NOT NULL,
  ordering varchar(9) NOT NULL,
  realm varchar(100) NOT NULL,
  value_maximum varchar(255) default NULL,
  value_minimum varchar(255) default NULL,
  value_scale int(11) default NULL,
  value_type varchar(7) NOT NULL,
  PRIMARY KEY  ( id ),
  UNIQUE KEY realm ( realm )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_lookup_value (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  code varchar(255) NOT NULL,
  date_created datetime NOT NULL,
  last_updated datetime NOT NULL,
  lookup_id bigint(20) NOT NULL,
  numeric_sequencer decimal(19,2) NOT NULL,
  sequencer int(11) NOT NULL,
  string_sequencer varchar(255) NOT NULL,
  value varchar(255) NOT NULL,
  PRIMARY KEY  ( id ),
  UNIQUE KEY lookup_id ( lookup_id , code ),
  KEY FK_LOOKUP_ID ( lookup_id ),
  CONSTRAINT FK_LOOKUP_ID FOREIGN KEY ( lookup_id ) REFERENCES k_lookup ( id )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_news (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  content text NOT NULL,
  created_by_user_login varchar(255) NOT NULL,
  created_date datetime NOT NULL,
  is_new bit(1) NOT NULL,
  last_modified_by_user_login varchar(255) NOT NULL,
  last_modified_date datetime NOT NULL,
  title varchar(255) NOT NULL,
  PRIMARY KEY  ( id ),
  UNIQUE KEY title ( title )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_order (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  address varchar(255) default NULL,
  company_name varchar(255) NOT NULL,
  customer varchar(255) NOT NULL,
  email varchar(100) NOT NULL,
  entry_date datetime default NULL,
  fax varchar(50) default NULL,
  handle_user varchar(255) default NULL,
  order_date datetime default NULL,
  postal_code varchar(255) NOT NULL,
  product_name varchar(255) NOT NULL,
  quantity double NOT NULL,
  status varchar(255) NOT NULL,
  telephone varchar(50) NOT NULL,
  PRIMARY KEY  ( id )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_category (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  created_date datetime NOT NULL,
  description varchar(255) default NULL,
  description_en varchar(255) default NULL,
  image_url varchar(255) default NULL,
  last_modified_date datetime NOT NULL,
  name varchar(255) NOT NULL,
  name_en varchar(255) NOT NULL,
  PRIMARY KEY  ( id ),
  UNIQUE KEY name ( name )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_product (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  accessories text,
  category_id bigint(20) NOT NULL,
  created_by_user_login varchar(255) NOT NULL,
  created_date datetime NOT NULL,
  description text,
  detail_image_url varchar(255) default NULL,
  features text,
  sequence int default 99,
  is_new bit(1) NOT NULL,
  large_image_url varchar(255) default NULL,
  last_modified_by_user_login varchar(255) NOT NULL,
  last_modified_date datetime NOT NULL,
  model varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  packaging text,
  small_image_url varchar(255) default NULL,
  specification text,
  certificates text,
  accessories_en text,
  accessories_image_url varchar(255) default NULL,
  certificates_en text,
  certificates_image_url varchar(255) default NULL,
  description_en text,
  name_en varchar(255) default NULL,
  packaging_en text,
  packaging_image_url varchar(255) default NULL,
  specification_en text,
  specification_image_url varchar(255) default NULL,
  function text,
  function_en text,
  function_image_url varchar(255) default NULL,
  PRIMARY KEY  ( id ),
  UNIQUE KEY model ( model ),
  KEY FK_CATEGORY_ID ( category_id ),
  CONSTRAINT FK_CATEGORY_ID FOREIGN KEY ( category_id ) REFERENCES k_category ( id )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_user (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  description varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  email_show bit(1) NOT NULL,
  enabled bit(1) NOT NULL,
  passwd varchar(255) NOT NULL,
  user_real_name varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  PRIMARY KEY  ( id ),
  UNIQUE KEY username ( username )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_role (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  authority varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  PRIMARY KEY  ( id )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_user_role (
  people_id bigint(20) NOT NULL,
  authority_id bigint(20) NOT NULL,
  PRIMARY KEY  ( people_id , authority_id )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_requestmap (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  config_attribute varchar(255) NOT NULL,
  url varchar(255) NOT NULL,
  PRIMARY KEY  ( id ),
  UNIQUE KEY url ( url )
) ENGINE = InnoDB CHARACTER SET utf8;

CREATE TABLE k_setting (
  id bigint(20) NOT NULL auto_increment,
  version bigint(20) NOT NULL,
  code varchar(100) NOT NULL,
  date_created datetime NOT NULL,
  last_updated datetime NOT NULL,
  type varchar(7) NOT NULL,
  value text NOT NULL,
  PRIMARY KEY  ( id ),
  UNIQUE KEY code ( code )
) ENGINE = InnoDB CHARACTER SET utf8;


INSERT INTO k_user(version,username,passwd,user_real_name,description,email,email_show,enabled) VALUES(1,'admin','21232f297a57a5a743894a0e4a801fc3','Administrator','Kello Admin','admin@abc.com',1,1);

INSERT INTO k_role(version,authority,description) VALUES(1,'ROLE_SUPERVISOR','');
INSERT INTO k_role(version,authority,description) VALUES(1,'ROLE_ADMIN','');

INSERT INTO k_user_role(people_id,authority_id) VALUES(1,1);