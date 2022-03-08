drop database item_tracker;

create database item_tracker;

use database item_tracker;

-- create item type table
drop table item_type;
create table item_type (
	type_id 			int(11) not null auto_increment primary key,
	name 				varchar(1000) not null,
	description			varchar(1000) default null,
	color_scheme_id 	int(11) default null,		
	parent_type_id 		int(11) default null,		
	last_updated		datetime default null,
	date_created 		datetime default null,
	version 			bigint(20) default null
);

-- create item color scheme table
drop table item_color_scheme;
create table item_color_scheme (
	color_scheme_id 	int(11) not null auto_increment primary key,
	name 				varchar(1000) not null,
	description			varchar(1000) default null,
	last_updated		datetime default null,
	date_created 		datetime default null,
	version 			bigint(20) default null
);

-- create item location table
drop table item_location;
create table item_location (
	location_id 		int(11) not null auto_increment primary key,
	name 				varchar(1000) not null,
	description			varchar(1000) default null,
	parent_location_id  int(11) default null,	
	last_updated		datetime default null,
	date_created 		datetime default null,
	version 			bigint(20) default null
);

-- create item table
drop table item_item;
create table item_item (
	item_id 			int(11) not null auto_increment primary key,
	name				varchar(100) default null,
	description			varchar(1000) default null,
	mint				varchar(1000) default null,
	type_id 			int(11) not null,		
	location_id 		int(11) not null,		
	color_scheme_id 	int(11) default null,		
	last_updated		datetime default null,
	date_created 		datetime default null,
	version 			bigint(20) default null
);

