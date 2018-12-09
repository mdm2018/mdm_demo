CREATE TABLE IF NOT EXISTS `Admin` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `account` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `Apps` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `appName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bundleSize` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `deviceId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dynamicSize` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `managedAppsOnly` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `shortVersion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `Command` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `callBack` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `command` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `ctype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cvalue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deviceId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `doIt` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `result` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `Device` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `availableDeviceCapacity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `batteryLevel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bluetoothMAC` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `control` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `deviceCapacity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deviceFlag` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deviceId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `iccid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `imei` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isActivationLockEnabled` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isCloudBackupEnabled` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isDeviceLocatorServiceEnabled` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isSupervised` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `meid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `modelName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `oSVersion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pushMagic` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `serialNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `topic` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `udid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unlockToken` longtext COLLATE utf8_bin,
  `updateTime` datetime DEFAULT NULL,
  `wifimac` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `DeviceTemp` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `callBack` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deviceFlag` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deviceId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `Profile` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `ctype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deviceId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `result` longtext COLLATE utf8_bin,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `User` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO openmdmserver.User (id, email, password, remark)
VALUES ('1', 'kitsudo163@163.com', '5E04B15055607EE7069AD3A976C885E6', '')
ON DUPLICATE KEY UPDATE email='kitsudo163@163.com',password='5E04B15055607EE7069AD3A976C885E6',remark='';

SET FOREIGN_KEY_CHECKS = 1;
