-- use with care database setup
CREATE DATABASE `devicetracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
-- devicetracker.devices definition

CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceID` varchar(50) DEFAULT NULL,
  `location` varchar(250) DEFAULT NULL,
  `lastseen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- devicetracker.tracker definition

CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceID` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `logtime` datetime DEFAULT NULL,
  UNIQUE KEY `tracker_UN` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- devicetracker.`user` definition

CREATE TABLE `user` (
  `username` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


create user 'trackerdbuser'@'localhost' identified by 'passworddb';
GRANT ALL PRIVILEGES ON devicetracker.*  TO 'trackerdbuser'@'localhost';
RENAME USER 'trackerdbuser'@'localhost' TO 'trackerdbuser'@'%';

GRANT ALL PRIVILEGES ON *.* TO '<username>'@'localhost;

INSERT INTO devices (DeviceID, gpscoords) VALUES("5358a43138b931df", "37.421998333333335,-122.08400000000002");

ALTER TABLE devices RENAME COLUMN devlocation TO gpscoords;
ALTER TABLE devices MODIFY lastseen TIMESTAMP;

ALTER TABLE devices RENAME COLUMN DeviceID TO deviceID;

ALTER TABLE devices ADD PRIMARY KEY (`id`);
ALTER TABLE devices ADD id INT NOT NULL AUTO_INCREMENT; 


ALTER TABLE devices MODIFY id INTEGER NOT NULL AUTO_INCREMENT;
