-- CREATE DATABASE DEVICE_DB;


CREATE TABLE DEVICE_TABLE (
		id INT NOT NULL AUTO_INCREMENT, 
		assetType VARCHAR(10) NOT NULL,
		asset_id INTEGER NOT NULL,
		attribute VARCHAR(10) NOT NULL,
		dateTime TIMESTAMP NOT NULL,
		site VARCHAR(10) NOT NULL,
		value bool NOT NULL,
		PRIMARY KEY (id)
	);

INSERT INTO DEVICE_TABLE (assetType, asset_id, attribute, dateTime, site, value) VALUES ('CB', 552, 'POS', '2019-06-27 16:10:30', 'CYD', 1);
INSERT INTO DEVICE_TABLE (assetType, asset_id, attribute, dateTime, site, value) VALUES ('DIS', 556, 'POS', '2019-06-27 16:10:30', 'CYD', 1);
INSERT INTO DEVICE_TABLE (assetType, asset_id, attribute, dateTime, site, value) VALUES ('DIS', 553, 'POS', '2019-06-27 16:10:30', 'CYD', 1);
INSERT INTO DEVICE_TABLE (assetType, asset_id, attribute, dateTime, site, value) VALUES ('DIS', 555, 'POS', '2019-06-27 16:10:30', 'CYD', 1);
INSERT INTO DEVICE_TABLE (assetType, asset_id, attribute, dateTime, site, value) VALUES ('DIS', 234, 'POS', '2019-06-27 16:10:30', 'NSY', 1);
INSERT INTO DEVICE_TABLE (assetType, asset_id, attribute, dateTime, site, value) VALUES ('CB', 238, 'POS', '2019-06-27 16:10:30', 'NSY', 1);
INSERT INTO DEVICE_TABLE (assetType, asset_id, attribute, dateTime, site, value) VALUES ('DIS', 237, 'POS', '2019-06-27 16:10:30', 'NSY', 1);
INSERT INTO DEVICE_TABLE (assetType, asset_id, attribute, dateTime, site, value) VALUES ('DIS', 266, 'POS', '2019-06-27 16:10:30', 'NSY', 1);
