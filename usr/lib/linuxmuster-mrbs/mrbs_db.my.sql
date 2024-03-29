# MOBS-START-Tabellen
# nach:
# MySQL MRBS table creation script
# http://mrbs.sourceforge.net
#
# Angepasst fuer die Linux-Musterloesung Baden-Wuerttemberg
# durch Georg Wilke (Zentrale Planungsgruppe Netze am Ministerium fuer
# Kultus, Jugend und Sport) 
# 17.02.04
#
# Achtung:
# Die Datenbank muss mrbs heissen, da die Datenbank in den php-Skripten
# leider z.T. hardcodiert ist.
# MySQL MRBS table creation script
#
# $Id: tables.my.sql,v 1.5.2.2 2005/02/13 11:21:02 jberanek Exp $
#
# Notes:
# If you have decided to change the prefix of your tables from 'mrbs_'
# to something else then you must edit each 'CREATE TABLE' line
# below.
#

CREATE DATABASE IF NOT EXISTS mrbs;

USE mrbs;

DROP TABLE IF EXISTS mrbs_area;
CREATE TABLE mrbs_area
(
  id               int NOT NULL auto_increment,
  area_name        varchar(30),
  area_admin_email text,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS mrbs_room;
CREATE TABLE mrbs_room
(
  id               int NOT NULL auto_increment,
  area_id          int DEFAULT '0' NOT NULL,
  room_name        varchar(25) DEFAULT '' NOT NULL,
  description      varchar(60),
  capacity         int DEFAULT '0' NOT NULL,
  room_admin_email text,

  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS mrbs_entry;
CREATE TABLE mrbs_entry
(
  id          int NOT NULL auto_increment,
  start_time  int DEFAULT '0' NOT NULL,
  end_time    int DEFAULT '0' NOT NULL,
  entry_type  int DEFAULT '0' NOT NULL,
  repeat_id   int DEFAULT '0' NOT NULL,
  room_id     int DEFAULT '1' NOT NULL,
  timestamp   timestamp,
  create_by   varchar(80) DEFAULT '' NOT NULL,
  name        varchar(80) DEFAULT '' NOT NULL,
  type        char DEFAULT 'E' NOT NULL,
  description text,

  PRIMARY KEY (id),
  KEY idxStartTime (start_time),
  KEY idxEndTime   (end_time)
);

DROP TABLE IF EXISTS mrbs_repeat;
CREATE TABLE mrbs_repeat
(
  id          int NOT NULL auto_increment,
  start_time  int DEFAULT '0' NOT NULL,
  end_time    int DEFAULT '0' NOT NULL,
  rep_type    int DEFAULT '0' NOT NULL,
  end_date    int DEFAULT '0' NOT NULL,
  rep_opt     varchar(32) DEFAULT '' NOT NULL,
  room_id     int DEFAULT '1' NOT NULL,
  timestamp   timestamp,
  create_by   varchar(80) DEFAULT '' NOT NULL,
  name        varchar(80) DEFAULT '' NOT NULL,
  type        char DEFAULT 'E' NOT NULL,
  description text,
  rep_num_weeks smallint NULL,
  
  PRIMARY KEY (id)
);
