/*
Navicat MySQL Data Transfer

Source Server         : shoppingOnline
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : shoppingsystem

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2014-12-25 16:10:48
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `bank`
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adress` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('1', 'Beijing China', '中国银行');
INSERT INTO `bank` VALUES ('2', 'Sichuan China', '中国农业银行');
INSERT INTO `bank` VALUES ('3', 'Shanghai China', '中国工商银行');
INSERT INTO `bank` VALUES ('4', 'Nanjing China', '中国建设银行');
INSERT INTO `bank` VALUES ('5', 'Tianjin China', '中国民生银行');
INSERT INTO `bank` VALUES ('6', 'Shenyang China', '中国交通银行');

-- ----------------------------
-- Table structure for `bankaccount`
-- ----------------------------
DROP TABLE IF EXISTS `bankaccount`;
CREATE TABLE `bankaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funds` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3tnmrt4q2o6l7fnl3eb1r4xou` (`bank_id`),
  CONSTRAINT `FK_3tnmrt4q2o6l7fnl3eb1r4xou` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bankaccount
-- ----------------------------
INSERT INTO `bankaccount` VALUES ('1', '2500', 'Jack', 'Jack', '1');
INSERT INTO `bankaccount` VALUES ('2', '1000', 'Jerry', 'Jerry', '1');
INSERT INTO `bankaccount` VALUES ('3', '2000', 'Joker', 'Joker', '1');
INSERT INTO `bankaccount` VALUES ('4', '2000', 'Aim', 'Aim', '2');
INSERT INTO `bankaccount` VALUES ('5', '1500', 'Amy', 'Amy', '2');
INSERT INTO `bankaccount` VALUES ('6', '2400', 'Anna', 'Anna', '2');
INSERT INTO `bankaccount` VALUES ('7', '10000', 'Cindy', 'Cindy', '3');
INSERT INTO `bankaccount` VALUES ('8', '5400', 'Criya', 'Criya', '3');
INSERT INTO `bankaccount` VALUES ('9', '4500', 'Caster', 'Caster', '3');
INSERT INTO `bankaccount` VALUES ('10', '6800', 'Sara', 'Sara', '4');
INSERT INTO `bankaccount` VALUES ('11', '7000', 'Selly', 'Selly', '4');
INSERT INTO `bankaccount` VALUES ('12', '3700', 'Sam', 'Sam', '4');
INSERT INTO `bankaccount` VALUES ('13', '2450', 'Mary', 'Mary', '5');
INSERT INTO `bankaccount` VALUES ('14', '1327', 'Mamu', 'Mamu', '5');
INSERT INTO `bankaccount` VALUES ('15', '208', 'Miui', 'Miui', '5');
INSERT INTO `bankaccount` VALUES ('16', '360', 'Hallen', 'Hallen', '6');
INSERT INTO `bankaccount` VALUES ('17', '750', 'Hank', 'Hank', '6');
INSERT INTO `bankaccount` VALUES ('18', '12345', 'Haha', 'Haha', '6');

-- ----------------------------
-- Table structure for `boss`
-- ----------------------------
DROP TABLE IF EXISTS `boss`;
CREATE TABLE `boss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adress` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `power_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lse1qhrlqtksql2i3i3iviolw` (`power_id`),
  KEY `FK_35ycm7n4b0cpb5htidwgb7prf` (`shop_id`),
  CONSTRAINT `FK_35ycm7n4b0cpb5htidwgb7prf` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`),
  CONSTRAINT `FK_lse1qhrlqtksql2i3i3iviolw` FOREIGN KEY (`power_id`) REFERENCES `power` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boss
-- ----------------------------
INSERT INTO `boss` VALUES ('8', 'Dalian', '1111@1111.com', 'Boss123', '1111111', '12341234123', 'Tom', '3', '10');
INSERT INTO `boss` VALUES ('9', 'Nanjing China', 'Sam@sam.com', 'Sam', '111111', '12345678900', 'Sonny', '3', '11');
INSERT INTO `boss` VALUES ('10', 'Shanghai China', 'Queen@queen.com', 'Queen', '222222', '98765432100', 'Queen', '3', '12');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentdate` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t4ifsxp6nl0qi8l6icwlx8vsp` (`goods_id`),
  KEY `FK_mxoojfj9tmy8088avf57mpm02` (`user_id`),
  CONSTRAINT `FK_mxoojfj9tmy8088avf57mpm02` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_t4ifsxp6nl0qi8l6icwlx8vsp` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2014-12-18 20:49:41', 'good quality!!!', '9', '2');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `introduce` varchar(255) DEFAULT NULL,
  `mark` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` double NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_i0mwoo4xwotia5d23bqf2i6ux` (`shop_id`),
  CONSTRAINT `FK_i0mwoo4xwotia5d23bqf2i6ux` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2', 'good', '34', '保温瓶', '341', '50', '10');
INSERT INTO `goods` VALUES ('3', 'nice', '24', 'T恤衫', '10', '154', '10');
INSERT INTO `goods` VALUES ('4', 'perfect', '1000', '钢琴', '50', '10000', '10');
INSERT INTO `goods` VALUES ('5', 'good', '20', '毛巾', '200', '10', '11');
INSERT INTO `goods` VALUES ('6', 'good', '5', '领带', '500', '25', '11');
INSERT INTO `goods` VALUES ('7', 'nice', '60', '单肩包', '90', '243', '11');
INSERT INTO `goods` VALUES ('8', 'nice', '30', '数据结构', '200', '19', '12');
INSERT INTO `goods` VALUES ('9', 'good quality', '45', '运动鞋', '19', '235', '10');

-- ----------------------------
-- Table structure for `goods_goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodstype`;
CREATE TABLE `goods_goodstype` (
  `goods_id` int(11) NOT NULL,
  `goodstypes_id` int(11) NOT NULL,
  KEY `FK_eepp2n4eoyeasok5p7twa6fxh` (`goodstypes_id`),
  KEY `FK_dphujfl9u43qhvb6pb1cin2ph` (`goods_id`),
  CONSTRAINT `FK_dphujfl9u43qhvb6pb1cin2ph` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_eepp2n4eoyeasok5p7twa6fxh` FOREIGN KEY (`goodstypes_id`) REFERENCES `goodstype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodstype
-- ----------------------------
INSERT INTO `goods_goodstype` VALUES ('2', '15');
INSERT INTO `goods_goodstype` VALUES ('2', '28');
INSERT INTO `goods_goodstype` VALUES ('3', '30');
INSERT INTO `goods_goodstype` VALUES ('4', '30');
INSERT INTO `goods_goodstype` VALUES ('5', '18');
INSERT INTO `goods_goodstype` VALUES ('6', '18');
INSERT INTO `goods_goodstype` VALUES ('6', '30');
INSERT INTO `goods_goodstype` VALUES ('7', '18');
INSERT INTO `goods_goodstype` VALUES ('8', '30');
INSERT INTO `goods_goodstype` VALUES ('8', '31');
INSERT INTO `goods_goodstype` VALUES ('9', '30');
INSERT INTO `goods_goodstype` VALUES ('9', '18');

-- ----------------------------
-- Table structure for `goods_shopcar`
-- ----------------------------
DROP TABLE IF EXISTS `goods_shopcar`;
CREATE TABLE `goods_shopcar` (
  `goodss_id` int(11) NOT NULL,
  `shopcars_id` int(11) NOT NULL,
  KEY `FK_o8spltdkie5iodw8h1kb3sleb` (`shopcars_id`),
  KEY `FK_h74q5gx7m5vqfmb165950q24s` (`goodss_id`),
  CONSTRAINT `FK_h74q5gx7m5vqfmb165950q24s` FOREIGN KEY (`goodss_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_o8spltdkie5iodw8h1kb3sleb` FOREIGN KEY (`shopcars_id`) REFERENCES `shopcar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_shopcar
-- ----------------------------

-- ----------------------------
-- Table structure for `goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('4', '电器');
INSERT INTO `goodstype` VALUES ('5', '数码');
INSERT INTO `goodstype` VALUES ('8', '家具');
INSERT INTO `goodstype` VALUES ('11', '玩具');
INSERT INTO `goodstype` VALUES ('13', '影像');
INSERT INTO `goodstype` VALUES ('14', '建筑');
INSERT INTO `goodstype` VALUES ('15', '金属');
INSERT INTO `goodstype` VALUES ('16', '机械');
INSERT INTO `goodstype` VALUES ('17', '灯具');
INSERT INTO `goodstype` VALUES ('18', '纺织');
INSERT INTO `goodstype` VALUES ('19', '塑料');
INSERT INTO `goodstype` VALUES ('20', '五金');
INSERT INTO `goodstype` VALUES ('21', '编程');
INSERT INTO `goodstype` VALUES ('22', '动漫');
INSERT INTO `goodstype` VALUES ('23', '电影');
INSERT INTO `goodstype` VALUES ('24', '饰品');
INSERT INTO `goodstype` VALUES ('25', '珠宝');
INSERT INTO `goodstype` VALUES ('28', '餐具');
INSERT INTO `goodstype` VALUES ('29', '水果');
INSERT INTO `goodstype` VALUES ('30', '其他');
INSERT INTO `goodstype` VALUES ('31', '书籍');
INSERT INTO `goodstype` VALUES ('32', '衣服');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `power_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r9vuyfmctv3lx6gy4u88jkd3g` (`power_id`),
  CONSTRAINT `FK_r9vuyfmctv3lx6gy4u88jkd3g` FOREIGN KEY (`power_id`) REFERENCES `power` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '333@333.com', 'JulianZYZ', 'Julian', '21212121212', '1');
INSERT INTO `manager` VALUES ('2', '222@222.com', 'Johnny', 'Johnny', '23333333333', '1');

-- ----------------------------
-- Table structure for `orderlist`
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amountpay` double NOT NULL,
  `fromdate` datetime DEFAULT NULL,
  `num` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `sendmessage_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addmessage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mg1tceypw689majneaelm1yj6` (`goods_id`),
  KEY `FK_tp1sbm184p4dxopv5kwhdr7lo` (`sendmessage_id`),
  KEY `FK_a9wolmxxw6kasg0ysnjer7hv7` (`user_id`),
  CONSTRAINT `FK_a9wolmxxw6kasg0ysnjer7hv7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_mg1tceypw689majneaelm1yj6` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_tp1sbm184p4dxopv5kwhdr7lo` FOREIGN KEY (`sendmessage_id`) REFERENCES `sendmessage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES ('2', '50', '2014-12-13 02:29:24', '1', '1', '2', '1', '2', 'we');
INSERT INTO `orderlist` VALUES ('3', '100', '2014-12-13 02:56:42', '2', '1', '2', '3', '2', '银色');
INSERT INTO `orderlist` VALUES ('8', '235', '2014-12-18 20:46:42', '1', '1', '9', '1', '2', 'white');

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ns2tmbe0c7sa9s3pvsm1p8pdr` (`goods_id`) USING BTREE,
  CONSTRAINT `FK_ns2tmbe0c7sa9s3pvsm1p8pdr` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', 'default.png', '\\Resource\\Images\\default.png', null);
INSERT INTO `picture` VALUES ('2', 'Headphoto_2.jpg', '\\Resource\\Images\\Headphoto\\Headphoto_2.jpg', null);
INSERT INTO `picture` VALUES ('11', '2_4edfc4d02bc07ddd52e0258cdd4b3efc.jpg', '\\Resource\\Images\\Goods\\2\\2_4edfc4d02bc07ddd52e0258cdd4b3efc.jpg', '2');
INSERT INTO `picture` VALUES ('12', '2_3c4ee107a74018c51807196db890798d.jpg', '\\Resource\\Images\\Goods\\2\\2_3c4ee107a74018c51807196db890798d.jpg', '2');
INSERT INTO `picture` VALUES ('13', '2_2bab0e41efb3ca444d8231264761aff5.jpg', '\\Resource\\Images\\Goods\\2\\2_2bab0e41efb3ca444d8231264761aff5.jpg', '2');
INSERT INTO `picture` VALUES ('14', '2_dc44093b8567f1a454ae20936fdd7092.jpg', '\\Resource\\Images\\Goods\\2\\2_dc44093b8567f1a454ae20936fdd7092.jpg', '2');
INSERT INTO `picture` VALUES ('15', '3_6c2a2bb83c5201588095f41793525ad8.jpg', '\\Resource\\Images\\Goods\\3\\3_6c2a2bb83c5201588095f41793525ad8.jpg', '3');
INSERT INTO `picture` VALUES ('16', '3_094b10dceb1c28911d211202a12175ef.jpg', '\\Resource\\Images\\Goods\\3\\3_094b10dceb1c28911d211202a12175ef.jpg', '3');
INSERT INTO `picture` VALUES ('18', '3_86f15fe561c2c5b4cbdb3176c9b48d4c.jpg', '\\Resource\\Images\\Goods\\3\\3_86f15fe561c2c5b4cbdb3176c9b48d4c.jpg', '3');
INSERT INTO `picture` VALUES ('19', '3_4257c4ebc7a15fcff7ac8ec88d5b3af1.jpg', '\\Resource\\Images\\Goods\\3\\3_4257c4ebc7a15fcff7ac8ec88d5b3af1.jpg', '3');
INSERT INTO `picture` VALUES ('20', '4_20f0949f70d9c6e6f02d1b199ce51559.jpg', '\\Resource\\Images\\Goods\\4\\4_20f0949f70d9c6e6f02d1b199ce51559.jpg', '4');
INSERT INTO `picture` VALUES ('21', '4_741f75ca41c7060c9c5c4b89ff0482bf.jpg', '\\Resource\\Images\\Goods\\4\\4_741f75ca41c7060c9c5c4b89ff0482bf.jpg', '4');
INSERT INTO `picture` VALUES ('22', '4_11e9a867c47b4ed1101f44ae4dc7621a.jpg', '\\Resource\\Images\\Goods\\4\\4_11e9a867c47b4ed1101f44ae4dc7621a.jpg', '4');
INSERT INTO `picture` VALUES ('23', '4_52e57a2b9049825361b0258bc6d1e6fd.jpg', '\\Resource\\Images\\Goods\\4\\4_52e57a2b9049825361b0258bc6d1e6fd.jpg', '4');
INSERT INTO `picture` VALUES ('24', '5_1fa4e3f27f3a8206d1811d2610401da3.jpg', '\\Resource\\Images\\Goods\\5\\5_1fa4e3f27f3a8206d1811d2610401da3.jpg', '5');
INSERT INTO `picture` VALUES ('25', '5_084370c5bd33c368a7ec147fc3659160.jpg', '\\Resource\\Images\\Goods\\5\\5_084370c5bd33c368a7ec147fc3659160.jpg', '5');
INSERT INTO `picture` VALUES ('26', '5_546ae223a8938a8054ce459805bf03e7.jpeg', '\\Resource\\Images\\Goods\\5\\5_546ae223a8938a8054ce459805bf03e7.jpeg', '5');
INSERT INTO `picture` VALUES ('27', '5_f88f0b32387fd90d77b173ea0b11694d.jpg', '\\Resource\\Images\\Goods\\5\\5_f88f0b32387fd90d77b173ea0b11694d.jpg', '5');
INSERT INTO `picture` VALUES ('28', '6_2dfc6cc2f41f19272a42a4aa6b370aee.jpg', '\\Resource\\Images\\Goods\\6\\6_2dfc6cc2f41f19272a42a4aa6b370aee.jpg', '6');
INSERT INTO `picture` VALUES ('29', '6_1322b93fe8559cfb4dc0068f030db4eb.jpg', '\\Resource\\Images\\Goods\\6\\6_1322b93fe8559cfb4dc0068f030db4eb.jpg', '6');
INSERT INTO `picture` VALUES ('30', '6_19e3c6508c329b239f78ea9c28b85cfd.jpg', '\\Resource\\Images\\Goods\\6\\6_19e3c6508c329b239f78ea9c28b85cfd.jpg', '6');
INSERT INTO `picture` VALUES ('31', '6_9bc898c9de58a873ef826836d875a23f.jpg', '\\Resource\\Images\\Goods\\6\\6_9bc898c9de58a873ef826836d875a23f.jpg', '6');
INSERT INTO `picture` VALUES ('32', '7_2599859eb64a8caebbde3e63812d40da.jpg', '\\Resource\\Images\\Goods\\7\\7_2599859eb64a8caebbde3e63812d40da.jpg', '7');
INSERT INTO `picture` VALUES ('33', '7_2a5a4bb0bd1d4355cdf9e1909d929c1c.jpg', '\\Resource\\Images\\Goods\\7\\7_2a5a4bb0bd1d4355cdf9e1909d929c1c.jpg', '7');
INSERT INTO `picture` VALUES ('34', '7_b5451631b41c60a1f94750c59ae55de5.jpg', '\\Resource\\Images\\Goods\\7\\7_b5451631b41c60a1f94750c59ae55de5.jpg', '7');
INSERT INTO `picture` VALUES ('35', '8_62c5f6c3cd59d61cec1b439c588f3151.jpg', '\\Resource\\Images\\Goods\\8\\8_62c5f6c3cd59d61cec1b439c588f3151.jpg', '8');
INSERT INTO `picture` VALUES ('36', '8_71327dd47e713f21ba6e580d7b4ae675.jpg', '\\Resource\\Images\\Goods\\8\\8_71327dd47e713f21ba6e580d7b4ae675.jpg', '8');
INSERT INTO `picture` VALUES ('37', '8_7276a5d9fbbc1d758d4abdc7c3681284.jpg', '\\Resource\\Images\\Goods\\8\\8_7276a5d9fbbc1d758d4abdc7c3681284.jpg', '8');
INSERT INTO `picture` VALUES ('38', '9_4d99ca215799ad7fc77ac0e40bb5a2d5.jpg', '\\Resource\\Images\\Goods\\9\\9_4d99ca215799ad7fc77ac0e40bb5a2d5.jpg', '9');
INSERT INTO `picture` VALUES ('39', '9_eaf2caa38b9d4d826129ec53bf167b13.jpg', '\\Resource\\Images\\Goods\\9\\9_eaf2caa38b9d4d826129ec53bf167b13.jpg', '9');
INSERT INTO `picture` VALUES ('40', '9_d636ed269ee67c64234192f665ba4ac8.jpg', '\\Resource\\Images\\Goods\\9\\9_d636ed269ee67c64234192f665ba4ac8.jpg', '9');

-- ----------------------------
-- Table structure for `power`
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pow` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('1', 'Manager');
INSERT INTO `power` VALUES ('2', 'User');
INSERT INTO `power` VALUES ('3', 'Boss');

-- ----------------------------
-- Table structure for `sendmessage`
-- ----------------------------
DROP TABLE IF EXISTS `sendmessage`;
CREATE TABLE `sendmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adress` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `toname` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_todxc4j45l9fat48qdj2a3m7u` (`user_id`),
  CONSTRAINT `FK_todxc4j45l9fat48qdj2a3m7u` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendmessage
-- ----------------------------
INSERT INTO `sendmessage` VALUES ('1', 'Nanjing China', '210094', '王刚', '2');
INSERT INTO `sendmessage` VALUES ('3', 'we', '333333', 'we', '2');

-- ----------------------------
-- Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adress` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `marks` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', 'New York', '0', '0', 'shop1');
INSERT INTO `shop` VALUES ('2', 'Canada', '2', '234', 'shop2');
INSERT INTO `shop` VALUES ('10', 'Dalian', '1', '1810', 'Doogle');
INSERT INTO `shop` VALUES ('11', 'Nanjing China', '1', '0', 'Clothes');
INSERT INTO `shop` VALUES ('12', 'Shanghai China', '1', '0', '书吧');
INSERT INTO `shop` VALUES ('13', 'Tianjin China', '1', '0', '甜品');

-- ----------------------------
-- Table structure for `shopcar`
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
INSERT INTO `shopcar` VALUES ('1');
INSERT INTO `shopcar` VALUES ('2');
INSERT INTO `shopcar` VALUES ('3');
INSERT INTO `shopcar` VALUES ('4');
INSERT INTO `shopcar` VALUES ('5');
INSERT INTO `shopcar` VALUES ('6');
INSERT INTO `shopcar` VALUES ('7');
INSERT INTO `shopcar` VALUES ('8');
INSERT INTO `shopcar` VALUES ('9');
INSERT INTO `shopcar` VALUES ('10');
INSERT INTO `shopcar` VALUES ('11');
INSERT INTO `shopcar` VALUES ('12');
INSERT INTO `shopcar` VALUES ('13');
INSERT INTO `shopcar` VALUES ('14');
INSERT INTO `shopcar` VALUES ('15');
INSERT INTO `shopcar` VALUES ('16');
INSERT INTO `shopcar` VALUES ('17');

-- ----------------------------
-- Table structure for `transrecord`
-- ----------------------------
DROP TABLE IF EXISTS `transrecord`;
CREATE TABLE `transrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `smid` int(11) NOT NULL,
  `transamount` double NOT NULL,
  `transdate` datetime DEFAULT NULL,
  `transnum` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transrecord
-- ----------------------------
INSERT INTO `transrecord` VALUES ('1', '2', '10', '1', '50', '2014-12-13 02:49:57', '1', '2');
INSERT INTO `transrecord` VALUES ('2', '2', '10', '3', '100', '2014-12-13 02:57:01', '2', '2');
INSERT INTO `transrecord` VALUES ('3', '2', '10', '3', '50', '2014-12-13 03:08:01', '1', '2');
INSERT INTO `transrecord` VALUES ('4', '9', '10', '1', '235', '2014-12-18 20:48:17', '1', '2');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leftmoney` double NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `marks` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `vlevel` int(11) NOT NULL,
  `headphoto_id` int(11) DEFAULT NULL,
  `power_id` int(11) DEFAULT NULL,
  `shopcar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iixqu5jx7ehfm31lht6vpy4qg` (`headphoto_id`),
  KEY `FK_pth656rvvrv0ss7vjvf8opuh0` (`power_id`),
  KEY `FK_43obn6wxhwspr3mo6antl0c8k` (`shopcar_id`),
  CONSTRAINT `FK_43obn6wxhwspr3mo6antl0c8k` FOREIGN KEY (`shopcar_id`) REFERENCES `shopcar` (`id`),
  CONSTRAINT `FK_iixqu5jx7ehfm31lht6vpy4qg` FOREIGN KEY (`headphoto_id`) REFERENCES `picture` (`id`),
  CONSTRAINT `FK_pth656rvvrv0ss7vjvf8opuh0` FOREIGN KEY (`power_id`) REFERENCES `power` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '102', '456@gmail.com', '45', 'Joker', '116987', '13877755566', '3', '1', '2', '1');
INSERT INTO `user` VALUES ('2', '165', '100@sina.com', '176', 'Sara', 'Sara', '12121212121', '1', '2', '2', '2');
INSERT INTO `user` VALUES ('3', '12', 'wer@wer.com', '0', 'Tony', '111111', '11112222333', '1', null, '2', '3');
INSERT INTO `user` VALUES ('4', '280', '132@132.com', '23', 'Joly', '222222', '13412323232', '2', null, '2', '4');
INSERT INTO `user` VALUES ('5', '34', '122@122.com', '389', 'Fancy', '333333', '22223333444', '3', null, '2', '5');
INSERT INTO `user` VALUES ('6', '2300', '321@321.com', '798', 'Lily', '233333', '14544445555', '2', null, '2', '6');
INSERT INTO `user` VALUES ('7', '100', '444@555.com', '5', 'Amy', '999999', '19999999999', '5', null, '2', '7');
INSERT INTO `user` VALUES ('8', '690', '126@gmail.com', '34', 'Kiddy', '888888', '12332112332', '6', null, '2', '8');
