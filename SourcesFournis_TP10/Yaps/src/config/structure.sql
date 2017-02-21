-- Cleanup
DROP DATABASE IF EXISTS petstoreDB;
CREATE DATABASE petstoreDB;
USE petstoreDB;

DROP TABLE IF EXISTS T_CUSTOMER;
DROP TABLE IF EXISTS T_ITEM;
DROP TABLE IF EXISTS T_PRODUCT;
DROP TABLE IF EXISTS T_CATEGORY;

-- Create
CREATE TABLE T_CUSTOMER( id VARCHAR(10), PRIMARY KEY(id), firstname VARCHAR(50) NOT NULL, lastname VARCHAR(50) NOT NULL, telephone VARCHAR(10), street1 VARCHAR(50), street2 VARCHAR(50), city VARCHAR(25), state VARCHAR(25), zipcode VARCHAR(10), country VARCHAR(25)) ENGINE=INNODB;
CREATE TABLE T_CATEGORY( id VARCHAR(10), PRIMARY KEY(id), name VARCHAR(50) NOT NULL, description VARCHAR(255) NOT NULL) ENGINE=INNODB ;
CREATE TABLE T_PRODUCT( id VARCHAR(10), PRIMARY KEY(id), name VARCHAR(50) NOT NULL, description VARCHAR(255) NOT NULL, category_fk VARCHAR(10) NOT NULL, INDEX category_fk_ind (category_fk), FOREIGN KEY (category_fk) REFERENCES T_CATEGORY(id) ON DELETE CASCADE) ENGINE=INNODB;
CREATE TABLE T_ITEM( id VARCHAR(10), PRIMARY KEY(id), name VARCHAR(50) NOT NULL, unitCost DOUBLE NOT NULL, product_fk VARCHAR(10) NOT NULL, INDEX product_fk_ind (product_fk), FOREIGN KEY (product_fk) REFERENCES T_PRODUCT(id) ON DELETE CASCADE) ENGINE=INNODB;
-- Cleanup
DROP TABLE IF EXISTS T_COUNTER;
DROP TABLE IF EXISTS T_ORDER_LINE;
DROP TABLE IF EXISTS T_ORDER;

-- Create
CREATE TABLE T_COUNTER( name VARCHAR(10), PRIMARY KEY(name), value INTEGER NOT NULL);
CREATE TABLE T_ORDER( id VARCHAR(10), PRIMARY KEY(id), orderdate TIMESTAMP NOT NULL, firstname VARCHAR(50) NOT NULL, lastname VARCHAR(50) NOT NULL, street1 VARCHAR(50) NOT NULL, street2 varchar(50), city VARCHAR(25) NOT NULL, state VARCHAR(25), zipcode VARCHAR(10) NOT NULL, country VARCHAR(25) NOT NULL, creditcardnumber VARCHAR(25), creditcardtype VARCHAR(25), creditcardexpirydate VARCHAR(10), customer_fk VARCHAR(10) NOT NULL, INDEX customer_fk_ind (customer_fk), FOREIGN KEY (customer_fk) REFERENCES T_CUSTOMER(id)) ENGINE=INNODB;
CREATE TABLE T_ORDER_LINE( id VARCHAR(10), PRIMARY KEY(id), quantity INTEGER NOT NULL, unitCost DOUBLE NOT NULL, order_fk VARCHAR(10) NOT NULL, INDEX order_fk_ind (order_fk), FOREIGN KEY (order_fk) REFERENCES T_ORDER(id) ON DELETE CASCADE, item_fk VARCHAR(10) NOT NULL, INDEX item_fk_ind (item_fk), FOREIGN KEY (item_fk) REFERENCES T_ITEM(id) ON DELETE NO ACTION) ENGINE=INNODB;
-- Alter
ALTER TABLE T_CUSTOMER ADD COLUMN creditcardnumber VARCHAR(25);
ALTER TABLE T_CUSTOMER ADD COLUMN creditcardtype VARCHAR(25);
ALTER TABLE T_CUSTOMER ADD COLUMN creditcardexpirydate VARCHAR(10);
ALTER TABLE T_CUSTOMER ADD COLUMN email VARCHAR(255);
-- Alter
ALTER TABLE T_ITEM ADD COLUMN imagePath VARCHAR(255);
-- Alter
ALTER TABLE T_CUSTOMER ADD COLUMN password VARCHAR(20);
