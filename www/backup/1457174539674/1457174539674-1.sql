-- -----------------------------
-- CmsWing MySQL Data Transfer 
-- 
-- Host     : 127.0.0.1
-- Port     : 
-- Database : undefined
-- 
-- Part : #1
-- Date : 2016-03-05 18:42:19
-- -----------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- -----------------------------
-- Table structure for `cmswing_action`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_action`;
CREATE TABLE `cmswing_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- -----------------------------
-- Records of `cmswing_action`
-- -----------------------------
INSERT INTO `cmswing_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:id=${self} AND status>-1|rule:10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1452591992289');
INSERT INTO `cmswing_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:id=${self}|rule:5|cycle:24|max:5', '', '2', '0', '1452591992289');
INSERT INTO `cmswing_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:id=${self}|rule:1', '', '2', '1', '1452591992289');
INSERT INTO `cmswing_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:id=${self}|rule:10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。
表[model]，记录编号[record]。fdsfsa', '2', '1', '1452920245099');
INSERT INTO `cmswing_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:id=${self}|rule:5|cycle:24|max:10', '', '2', '0', '1452591992289');
INSERT INTO `cmswing_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1452591992289');
INSERT INTO `cmswing_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1452591992289');
INSERT INTO `cmswing_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1452591992289');
INSERT INTO `cmswing_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1452591992289');
INSERT INTO `cmswing_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1452591992289');
INSERT INTO `cmswing_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1452591992289');
INSERT INTO `cmswing_action` VALUES ('13', 'testaction', '测试行为日志', '积分+10，每天一次1111', 'table:member|field:score|condition:id=${self} AND status>-1|rule:10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]测试了日志[model]和[record]和[data]', '2', '1', '1452594160564');

-- -----------------------------
-- Table structure for `cmswing_action_log`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_action_log`;
CREATE TABLE `cmswing_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- -----------------------------
-- Records of `cmswing_action_log`
-- -----------------------------
INSERT INTO `cmswing_action_log` VALUES ('190', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454400241037');
INSERT INTO `cmswing_action_log` VALUES ('191', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454400255299');
INSERT INTO `cmswing_action_log` VALUES ('192', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-02 16:47:49登录了后台', '1', '1454402869097');
INSERT INTO `cmswing_action_log` VALUES ('193', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405194321');
INSERT INTO `cmswing_action_log` VALUES ('194', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405426062');
INSERT INTO `cmswing_action_log` VALUES ('195', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405476543');
INSERT INTO `cmswing_action_log` VALUES ('196', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405517582');
INSERT INTO `cmswing_action_log` VALUES ('197', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405528526');
INSERT INTO `cmswing_action_log` VALUES ('198', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405553533');
INSERT INTO `cmswing_action_log` VALUES ('199', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405567394');
INSERT INTO `cmswing_action_log` VALUES ('200', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405619501');
INSERT INTO `cmswing_action_log` VALUES ('201', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405627288');
INSERT INTO `cmswing_action_log` VALUES ('202', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405643656');
INSERT INTO `cmswing_action_log` VALUES ('203', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405662878');
INSERT INTO `cmswing_action_log` VALUES ('204', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1454405679388');
INSERT INTO `cmswing_action_log` VALUES ('205', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-17 10:56:18登录了后台', '1', '1455677778705');
INSERT INTO `cmswing_action_log` VALUES ('206', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1455681109058');
INSERT INTO `cmswing_action_log` VALUES ('207', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1455681125879');
INSERT INTO `cmswing_action_log` VALUES ('208', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-17 12:48:24登录了后台', '1', '1455684504579');
INSERT INTO `cmswing_action_log` VALUES ('209', '4', '1', '2130706433', 'document', '58', 'admin在2016-02-17 19:31:32发表了一篇文章。
表document，记录编号58。fdsfsa', '1', '1455708692716');
INSERT INTO `cmswing_action_log` VALUES ('210', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-18 10:56:55登录了后台', '1', '1455764215700');
INSERT INTO `cmswing_action_log` VALUES ('211', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-19 10:26:30登录了后台', '1', '1455848790913');
INSERT INTO `cmswing_action_log` VALUES ('212', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-20 09:47:01登录了后台', '1', '1455932821736');
INSERT INTO `cmswing_action_log` VALUES ('213', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-20 10:50:32登录了后台', '1', '1455936632327');
INSERT INTO `cmswing_action_log` VALUES ('214', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-20 13:07:50登录了后台', '1', '1455944870985');
INSERT INTO `cmswing_action_log` VALUES ('215', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-22 13:55:26登录了后台', '1', '1456120526503');
INSERT INTO `cmswing_action_log` VALUES ('216', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-22 14:05:41登录了后台', '1', '1456121141084');
INSERT INTO `cmswing_action_log` VALUES ('217', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-22 16:34:11登录了后台', '1', '1456130051697');
INSERT INTO `cmswing_action_log` VALUES ('218', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-22 16:41:05登录了后台', '1', '1456130465312');
INSERT INTO `cmswing_action_log` VALUES ('219', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-22 18:12:31登录了后台', '1', '1456135951216');
INSERT INTO `cmswing_action_log` VALUES ('220', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-23 12:23:22登录了后台', '1', '1456201402544');
INSERT INTO `cmswing_action_log` VALUES ('221', '4', '1', '2130706433', 'document', '59', 'admin在2016-02-23 12:51:12发表了一篇文章。
表document，记录编号59。fdsfsa', '1', '1456203072378');
INSERT INTO `cmswing_action_log` VALUES ('222', '4', '1', '2130706433', 'document', '60', 'admin在2016-02-23 12:52:58发表了一篇文章。
表document，记录编号60。fdsfsa', '1', '1456203178172');
INSERT INTO `cmswing_action_log` VALUES ('223', '4', '1', '2130706433', 'document', '61', 'admin在2016-02-23 16:19:11发表了一篇文章。
表document，记录编号61。fdsfsa', '1', '1456215551792');
INSERT INTO `cmswing_action_log` VALUES ('224', '4', '1', '2130706433', 'document', '62', 'admin在2016-02-23 22:14:17发表了一篇文章。
表document，记录编号62。fdsfsa', '1', '1456236857620');
INSERT INTO `cmswing_action_log` VALUES ('225', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-23 22:35:06登录了后台', '1', '1456238106887');
INSERT INTO `cmswing_action_log` VALUES ('226', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-24 01:13:20登录了后台', '1', '1456247600439');
INSERT INTO `cmswing_action_log` VALUES ('227', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-24 11:17:51登录了后台', '1', '1456283871586');
INSERT INTO `cmswing_action_log` VALUES ('228', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456284882291');
INSERT INTO `cmswing_action_log` VALUES ('229', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-24 13:17:13登录了后台', '1', '1456291033561');
INSERT INTO `cmswing_action_log` VALUES ('230', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-24 17:38:48登录了后台', '1', '1456306728998');
INSERT INTO `cmswing_action_log` VALUES ('231', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-25 12:15:40登录了后台', '1', '1456373740257');
INSERT INTO `cmswing_action_log` VALUES ('232', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456385981605');
INSERT INTO `cmswing_action_log` VALUES ('233', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456385996651');
INSERT INTO `cmswing_action_log` VALUES ('234', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456386031148');
INSERT INTO `cmswing_action_log` VALUES ('235', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456386084291');
INSERT INTO `cmswing_action_log` VALUES ('236', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456386107201');
INSERT INTO `cmswing_action_log` VALUES ('237', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456386145630');
INSERT INTO `cmswing_action_log` VALUES ('238', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456386192241');
INSERT INTO `cmswing_action_log` VALUES ('239', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456386241238');
INSERT INTO `cmswing_action_log` VALUES ('240', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456386248014');
INSERT INTO `cmswing_action_log` VALUES ('241', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456386280706');
INSERT INTO `cmswing_action_log` VALUES ('242', '9', '1', '2130706433', 'channel', '0', '操作url:/admin/channel/updates', '1', '1456386307655');
INSERT INTO `cmswing_action_log` VALUES ('243', '4', '1', '2130706433', 'document', '63', 'admin在2016-02-25 16:26:18发表了一篇文章。
表document，记录编号63。fdsfsa', '1', '1456388778375');
INSERT INTO `cmswing_action_log` VALUES ('244', '4', '1', '2130706433', 'document', '64', 'admin在2016-02-25 16:54:56发表了一篇文章。
表document，记录编号64。fdsfsa', '1', '1456390496774');
INSERT INTO `cmswing_action_log` VALUES ('245', '4', '1', '2130706433', 'document', '65', 'admin在2016-02-25 17:57:30发表了一篇文章。
表document，记录编号65。fdsfsa', '1', '1456394250227');
INSERT INTO `cmswing_action_log` VALUES ('246', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-25 19:46:05登录了后台', '1', '1456400765915');
INSERT INTO `cmswing_action_log` VALUES ('247', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-25 21:14:15登录了后台', '1', '1456406055026');
INSERT INTO `cmswing_action_log` VALUES ('248', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-26 11:13:37登录了后台', '1', '1456456417740');
INSERT INTO `cmswing_action_log` VALUES ('249', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-26 11:42:59登录了后台', '1', '1456458179349');
INSERT INTO `cmswing_action_log` VALUES ('250', '4', '1', '2130706433', 'document', '66', 'admin在2016-02-26 12:07:46发表了一篇文章。
表document，记录编号66。fdsfsa', '1', '1456459666600');
INSERT INTO `cmswing_action_log` VALUES ('251', '4', '1', '2130706433', 'document', '67', 'admin在2016-02-26 12:24:21发表了一篇文章。
表document，记录编号67。fdsfsa', '1', '1456460661591');
INSERT INTO `cmswing_action_log` VALUES ('252', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-26 12:54:41登录了后台', '1', '1456462481560');
INSERT INTO `cmswing_action_log` VALUES ('253', '4', '1', '2130706433', 'document', '68', 'admin在2016-02-26 14:12:52发表了一篇文章。
表document，记录编号68。fdsfsa', '1', '1456467172733');
INSERT INTO `cmswing_action_log` VALUES ('254', '4', '1', '2130706433', 'document', '69', 'admin在2016-02-26 14:15:32发表了一篇文章。
表document，记录编号69。fdsfsa', '1', '1456467332659');
INSERT INTO `cmswing_action_log` VALUES ('255', '4', '1', '2130706433', 'document', '70', 'admin在2016-02-26 14:32:47发表了一篇文章。
表document，记录编号70。fdsfsa', '1', '1456468367260');
INSERT INTO `cmswing_action_log` VALUES ('256', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-26 16:46:19登录了后台', '1', '1456476379696');
INSERT INTO `cmswing_action_log` VALUES ('257', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-27 12:06:13登录了后台', '1', '1456545973927');
INSERT INTO `cmswing_action_log` VALUES ('258', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-27 15:10:49登录了后台', '1', '1456557049727');
INSERT INTO `cmswing_action_log` VALUES ('259', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 13:42:55登录了后台', '1', '1456810975466');
INSERT INTO `cmswing_action_log` VALUES ('260', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 14:31:15登录了后台', '1', '1456813875233');
INSERT INTO `cmswing_action_log` VALUES ('261', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 18:00:21登录了后台', '1', '1456826421516');
INSERT INTO `cmswing_action_log` VALUES ('262', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 18:02:26登录了后台', '1', '1456826546146');
INSERT INTO `cmswing_action_log` VALUES ('263', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 18:02:38登录了后台', '1', '1456826558950');
INSERT INTO `cmswing_action_log` VALUES ('264', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 18:05:52登录了后台', '1', '1456826752027');
INSERT INTO `cmswing_action_log` VALUES ('265', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 18:21:43登录了后台', '1', '1456827703418');
INSERT INTO `cmswing_action_log` VALUES ('266', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 18:32:31登录了后台', '1', '1456828351546');
INSERT INTO `cmswing_action_log` VALUES ('267', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 18:32:43登录了后台', '1', '1456828363638');
INSERT INTO `cmswing_action_log` VALUES ('268', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 18:34:35登录了后台', '1', '1456828475037');
INSERT INTO `cmswing_action_log` VALUES ('269', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 18:34:57登录了后台', '1', '1456828497058');
INSERT INTO `cmswing_action_log` VALUES ('270', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 19:46:10登录了后台', '1', '1456832770718');
INSERT INTO `cmswing_action_log` VALUES ('271', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 19:47:09登录了后台', '1', '1456832829533');
INSERT INTO `cmswing_action_log` VALUES ('272', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 20:08:30登录了后台', '1', '1456834110313');
INSERT INTO `cmswing_action_log` VALUES ('273', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 20:22:32登录了后台', '1', '1456834952865');
INSERT INTO `cmswing_action_log` VALUES ('274', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 21:00:17登录了后台', '1', '1456837217552');
INSERT INTO `cmswing_action_log` VALUES ('275', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 21:10:03登录了后台', '1', '1456837803419');
INSERT INTO `cmswing_action_log` VALUES ('276', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-02 09:07:38登录了后台', '1', '1456880858757');
INSERT INTO `cmswing_action_log` VALUES ('277', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-02 09:15:41登录了后台', '1', '1456881341436');
INSERT INTO `cmswing_action_log` VALUES ('278', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-02 09:05:30登录了后台', '1', '1456880730595');
INSERT INTO `cmswing_action_log` VALUES ('279', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-02 13:10:07登录了后台', '1', '1456895407721');
INSERT INTO `cmswing_action_log` VALUES ('280', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-02 13:11:43登录了后台', '1', '1456895503388');
INSERT INTO `cmswing_action_log` VALUES ('281', '1', '1', '3232235892', 'member', '1', 'admin在2016-03-02 14:52:39登录了后台', '1', '1456901559038');
INSERT INTO `cmswing_action_log` VALUES ('282', '1', '1', '3232235892', 'member', '1', 'admin在2016-03-02 14:57:48登录了后台', '1', '1456901868031');
INSERT INTO `cmswing_action_log` VALUES ('283', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-02 15:11:47登录了后台', '1', '1456902707615');
INSERT INTO `cmswing_action_log` VALUES ('284', '1', '1', '3232235892', 'member', '1', 'admin在2016-03-02 21:57:02登录了后台', '1', '1456927022522');
INSERT INTO `cmswing_action_log` VALUES ('285', '1', '1', '3232235892', 'member', '1', 'admin在2016-03-02 21:57:03登录了后台', '1', '1456927023851');
INSERT INTO `cmswing_action_log` VALUES ('286', '1', '1', '3232235892', 'member', '1', 'admin在2016-03-02 22:00:59登录了后台', '1', '1456927259666');
INSERT INTO `cmswing_action_log` VALUES ('287', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-03 09:16:03登录了后台', '1', '1456967763490');
INSERT INTO `cmswing_action_log` VALUES ('288', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-03 09:17:28登录了后台', '1', '1456967848766');
INSERT INTO `cmswing_action_log` VALUES ('289', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-03 09:41:18登录了后台', '1', '1456969278382');
INSERT INTO `cmswing_action_log` VALUES ('290', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-03 12:52:37登录了后台', '1', '1456980757578');
INSERT INTO `cmswing_action_log` VALUES ('291', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-03 15:18:59登录了后台', '1', '1456989539083');
INSERT INTO `cmswing_action_log` VALUES ('292', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-04 09:16:28登录了后台', '1', '1457054188268');
INSERT INTO `cmswing_action_log` VALUES ('293', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-04 09:21:57登录了后台', '1', '1457054517161');
INSERT INTO `cmswing_action_log` VALUES ('294', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-04 09:19:19登录了后台', '1', '1457054359301');
INSERT INTO `cmswing_action_log` VALUES ('295', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-04 09:19:19登录了后台', '1', '1457054359304');
INSERT INTO `cmswing_action_log` VALUES ('296', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-04 11:13:45登录了后台', '1', '1457061225650');
INSERT INTO `cmswing_action_log` VALUES ('297', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-04 16:12:23登录了后台', '1', '1457079143764');
INSERT INTO `cmswing_action_log` VALUES ('298', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-04 16:43:38登录了后台', '1', '1457081018764');
INSERT INTO `cmswing_action_log` VALUES ('299', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-05 08:58:38登录了后台', '1', '1457139518431');
INSERT INTO `cmswing_action_log` VALUES ('300', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-05 08:56:19登录了后台', '1', '1457139379823');
INSERT INTO `cmswing_action_log` VALUES ('301', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-05 09:10:41登录了后台', '1', '1457140241254');
INSERT INTO `cmswing_action_log` VALUES ('302', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-05 10:54:46登录了后台', '1', '1457146486001');
INSERT INTO `cmswing_action_log` VALUES ('303', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-05 11:11:20登录了后台', '1', '1457147480799');

-- -----------------------------
-- Table structure for `cmswing_address`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_address`;
CREATE TABLE `cmswing_address` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `accept_name` varchar(20) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `province` bigint(20) NOT NULL,
  `city` bigint(20) NOT NULL,
  `county` bigint(20) NOT NULL,
  `zip` varchar(6) DEFAULT NULL,
  `addr` varchar(250) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_address`
-- -----------------------------
INSERT INTO `cmswing_address` VALUES ('1', '1', '晓飞 宁', '13589100333', '13589100475', '370000', '370100', '370102', '250000', '山东省ddddddd', '1');
INSERT INTO `cmswing_address` VALUES ('2', '2', 'hgfhfgh', '18681851637', '8688854', '310000', '310100', '310104', '822225', 'htgfhfghgfhgfhgfhfg', '1');
INSERT INTO `cmswing_address` VALUES ('3', '1', '天津帅小伙', '18651569374', '', '120000', '120100', '120107', '300021', '六大街72号', '0');
INSERT INTO `cmswing_address` VALUES ('4', '1', '路人丁', '18681851637', '', '110000', '110100', '110101', '710065', '东花市北里20号楼6单元501室 ', '0');

-- -----------------------------
-- Table structure for `cmswing_area`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_area`;
CREATE TABLE `cmswing_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=910011 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_area`
-- -----------------------------
INSERT INTO `cmswing_area` VALUES ('110000', '北京市', '0', '1');
INSERT INTO `cmswing_area` VALUES ('120000', '天津市', '0', '2');
INSERT INTO `cmswing_area` VALUES ('130000', '河北省', '0', '3');
INSERT INTO `cmswing_area` VALUES ('140000', '山西省', '0', '4');
INSERT INTO `cmswing_area` VALUES ('150000', '内蒙古', '0', '5');
INSERT INTO `cmswing_area` VALUES ('210000', '辽宁省', '0', '6');
INSERT INTO `cmswing_area` VALUES ('220000', '吉林省', '0', '7');
INSERT INTO `cmswing_area` VALUES ('230000', '黑龙江', '0', '8');
INSERT INTO `cmswing_area` VALUES ('310000', '上海市', '0', '9');
INSERT INTO `cmswing_area` VALUES ('320000', '江苏省', '0', '10');
INSERT INTO `cmswing_area` VALUES ('330000', '浙江省', '0', '11');
INSERT INTO `cmswing_area` VALUES ('340000', '安徽省', '0', '12');
INSERT INTO `cmswing_area` VALUES ('350000', '福建省', '0', '13');
INSERT INTO `cmswing_area` VALUES ('360000', '江西省', '0', '14');
INSERT INTO `cmswing_area` VALUES ('370000', '山东省', '0', '15');
INSERT INTO `cmswing_area` VALUES ('410000', '河南省', '0', '16');
INSERT INTO `cmswing_area` VALUES ('420000', '湖北省', '0', '17');
INSERT INTO `cmswing_area` VALUES ('430000', '湖南省', '0', '18');
INSERT INTO `cmswing_area` VALUES ('440000', '广东省', '0', '19');
INSERT INTO `cmswing_area` VALUES ('450000', '广西省', '0', '20');
INSERT INTO `cmswing_area` VALUES ('460000', '海南省', '0', '21');
INSERT INTO `cmswing_area` VALUES ('500000', '重庆市', '0', '22');
INSERT INTO `cmswing_area` VALUES ('510000', '四川省', '0', '23');
INSERT INTO `cmswing_area` VALUES ('520000', '贵州省', '0', '24');
INSERT INTO `cmswing_area` VALUES ('530000', '云南省', '0', '25');
INSERT INTO `cmswing_area` VALUES ('540000', '西　藏', '0', '26');
INSERT INTO `cmswing_area` VALUES ('610000', '陕西省', '0', '27');
INSERT INTO `cmswing_area` VALUES ('620000', '甘肃省', '0', '28');
INSERT INTO `cmswing_area` VALUES ('630000', '青海省', '0', '29');
INSERT INTO `cmswing_area` VALUES ('640000', '宁　夏', '0', '30');
INSERT INTO `cmswing_area` VALUES ('650000', '新　疆', '0', '31');
INSERT INTO `cmswing_area` VALUES ('710000', '台湾省', '0', '32');
INSERT INTO `cmswing_area` VALUES ('810000', '香　港', '0', '33');
INSERT INTO `cmswing_area` VALUES ('820000', '澳　门', '0', '34');
INSERT INTO `cmswing_area` VALUES ('110100', '北京市', '110000', '1');
INSERT INTO `cmswing_area` VALUES ('110200', '县', '110000', '2');
INSERT INTO `cmswing_area` VALUES ('120100', '市辖区', '120000', '1');
INSERT INTO `cmswing_area` VALUES ('120200', '县', '120000', '2');
INSERT INTO `cmswing_area` VALUES ('130100', '石家庄市', '130000', '1');
INSERT INTO `cmswing_area` VALUES ('130200', '唐山市', '130000', '2');
INSERT INTO `cmswing_area` VALUES ('130300', '秦皇岛市', '130000', '3');
INSERT INTO `cmswing_area` VALUES ('130400', '邯郸市', '130000', '4');
INSERT INTO `cmswing_area` VALUES ('130500', '邢台市', '130000', '5');
INSERT INTO `cmswing_area` VALUES ('130600', '保定市', '130000', '6');
INSERT INTO `cmswing_area` VALUES ('130700', '张家口市', '130000', '7');
INSERT INTO `cmswing_area` VALUES ('130800', '承德市', '130000', '8');
INSERT INTO `cmswing_area` VALUES ('130900', '沧州市', '130000', '9');
INSERT INTO `cmswing_area` VALUES ('131000', '廊坊市', '130000', '10');
INSERT INTO `cmswing_area` VALUES ('131100', '衡水市', '130000', '11');
INSERT INTO `cmswing_area` VALUES ('140100', '太原市', '140000', '1');
INSERT INTO `cmswing_area` VALUES ('140200', '大同市', '140000', '2');
INSERT INTO `cmswing_area` VALUES ('140300', '阳泉市', '140000', '3');
INSERT INTO `cmswing_area` VALUES ('140400', '长治市', '140000', '4');
INSERT INTO `cmswing_area` VALUES ('140500', '晋城市', '140000', '5');
INSERT INTO `cmswing_area` VALUES ('140600', '朔州市', '140000', '6');
INSERT INTO `cmswing_area` VALUES ('140700', '晋中市', '140000', '7');
INSERT INTO `cmswing_area` VALUES ('140800', '运城市', '140000', '8');
INSERT INTO `cmswing_area` VALUES ('140900', '忻州市', '140000', '9');
INSERT INTO `cmswing_area` VALUES ('141000', '临汾市', '140000', '10');
INSERT INTO `cmswing_area` VALUES ('141100', '吕梁市', '140000', '11');
INSERT INTO `cmswing_area` VALUES ('150100', '呼和浩特市', '150000', '1');
INSERT INTO `cmswing_area` VALUES ('150200', '包头市', '150000', '2');
INSERT INTO `cmswing_area` VALUES ('150300', '乌海市', '150000', '3');
INSERT INTO `cmswing_area` VALUES ('150400', '赤峰市', '150000', '4');
INSERT INTO `cmswing_area` VALUES ('150500', '通辽市', '150000', '5');
INSERT INTO `cmswing_area` VALUES ('150600', '鄂尔多斯市', '150000', '6');
INSERT INTO `cmswing_area` VALUES ('150700', '呼伦贝尔市', '150000', '7');
INSERT INTO `cmswing_area` VALUES ('150800', '巴彦淖尔市', '150000', '8');
INSERT INTO `cmswing_area` VALUES ('150900', '乌兰察布市', '150000', '9');
INSERT INTO `cmswing_area` VALUES ('152200', '兴安盟', '150000', '10');
INSERT INTO `cmswing_area` VALUES ('152500', '锡林郭勒盟', '150000', '11');
INSERT INTO `cmswing_area` VALUES ('152900', '阿拉善盟', '150000', '12');
INSERT INTO `cmswing_area` VALUES ('210100', '沈阳市', '210000', '1');
INSERT INTO `cmswing_area` VALUES ('210200', '大连市', '210000', '2');
INSERT INTO `cmswing_area` VALUES ('210300', '鞍山市', '210000', '3');
INSERT INTO `cmswing_area` VALUES ('210400', '抚顺市', '210000', '4');
INSERT INTO `cmswing_area` VALUES ('210500', '本溪市', '210000', '5');
INSERT INTO `cmswing_area` VALUES ('210600', '丹东市', '210000', '6');
INSERT INTO `cmswing_area` VALUES ('210700', '锦州市', '210000', '7');
INSERT INTO `cmswing_area` VALUES ('210800', '营口市', '210000', '8');
INSERT INTO `cmswing_area` VALUES ('210900', '阜新市', '210000', '9');
INSERT INTO `cmswing_area` VALUES ('211000', '辽阳市', '210000', '10');
INSERT INTO `cmswing_area` VALUES ('211100', '盘锦市', '210000', '11');
INSERT INTO `cmswing_area` VALUES ('211200', '铁岭市', '210000', '12');
INSERT INTO `cmswing_area` VALUES ('211300', '朝阳市', '210000', '13');
INSERT INTO `cmswing_area` VALUES ('211400', '葫芦岛市', '210000', '14');
INSERT INTO `cmswing_area` VALUES ('220100', '长春市', '220000', '1');
INSERT INTO `cmswing_area` VALUES ('220200', '吉林市', '220000', '2');
INSERT INTO `cmswing_area` VALUES ('220300', '四平市', '220000', '3');
INSERT INTO `cmswing_area` VALUES ('220400', '辽源市', '220000', '4');
INSERT INTO `cmswing_area` VALUES ('220500', '通化市', '220000', '5');
INSERT INTO `cmswing_area` VALUES ('220600', '白山市', '220000', '6');
INSERT INTO `cmswing_area` VALUES ('220700', '松原市', '220000', '7');
INSERT INTO `cmswing_area` VALUES ('220800', '白城市', '220000', '8');
INSERT INTO `cmswing_area` VALUES ('222400', '延边朝鲜族自治州', '220000', '9');
INSERT INTO `cmswing_area` VALUES ('230100', '哈尔滨市', '230000', '1');
INSERT INTO `cmswing_area` VALUES ('230200', '齐齐哈尔市', '230000', '2');
INSERT INTO `cmswing_area` VALUES ('230300', '鸡西市', '230000', '3');
INSERT INTO `cmswing_area` VALUES ('230400', '鹤岗市', '230000', '4');
INSERT INTO `cmswing_area` VALUES ('230500', '双鸭山市', '230000', '5');
INSERT INTO `cmswing_area` VALUES ('230600', '大庆市', '230000', '6');
INSERT INTO `cmswing_area` VALUES ('230700', '伊春市', '230000', '7');
INSERT INTO `cmswing_area` VALUES ('230800', '佳木斯市', '230000', '8');
INSERT INTO `cmswing_area` VALUES ('230900', '七台河市', '230000', '9');
INSERT INTO `cmswing_area` VALUES ('231000', '牡丹江市', '230000', '10');
INSERT INTO `cmswing_area` VALUES ('231100', '黑河市', '230000', '11');
INSERT INTO `cmswing_area` VALUES ('231200', '绥化市', '230000', '12');
INSERT INTO `cmswing_area` VALUES ('232700', '大兴安岭地区', '230000', '13');
INSERT INTO `cmswing_area` VALUES ('310100', '市辖区', '310000', '1');
INSERT INTO `cmswing_area` VALUES ('310200', '县', '310000', '2');
INSERT INTO `cmswing_area` VALUES ('320100', '南京市', '320000', '1');
INSERT INTO `cmswing_area` VALUES ('320200', '无锡市', '320000', '2');
INSERT INTO `cmswing_area` VALUES ('320300', '徐州市', '320000', '3');
INSERT INTO `cmswing_area` VALUES ('320400', '常州市', '320000', '4');
INSERT INTO `cmswing_area` VALUES ('320500', '苏州市', '320000', '5');
INSERT INTO `cmswing_area` VALUES ('320600', '南通市', '320000', '6');
INSERT INTO `cmswing_area` VALUES ('320700', '连云港市', '320000', '7');
INSERT INTO `cmswing_area` VALUES ('320800', '淮安市', '320000', '8');
INSERT INTO `cmswing_area` VALUES ('320900', '盐城市', '320000', '9');
INSERT INTO `cmswing_area` VALUES ('321000', '扬州市', '320000', '10');
INSERT INTO `cmswing_area` VALUES ('321100', '镇江市', '320000', '11');
INSERT INTO `cmswing_area` VALUES ('321200', '泰州市', '320000', '12');
INSERT INTO `cmswing_area` VALUES ('321300', '宿迁市', '320000', '13');
INSERT INTO `cmswing_area` VALUES ('330100', '杭州市', '330000', '1');
INSERT INTO `cmswing_area` VALUES ('330200', '宁波市', '330000', '2');
INSERT INTO `cmswing_area` VALUES ('330300', '温州市', '330000', '3');
INSERT INTO `cmswing_area` VALUES ('330400', '嘉兴市', '330000', '4');
INSERT INTO `cmswing_area` VALUES ('330500', '湖州市', '330000', '5');
INSERT INTO `cmswing_area` VALUES ('330600', '绍兴市', '330000', '6');
INSERT INTO `cmswing_area` VALUES ('330700', '金华市', '330000', '7');
INSERT INTO `cmswing_area` VALUES ('330800', '衢州市', '330000', '8');
INSERT INTO `cmswing_area` VALUES ('330900', '舟山市', '330000', '9');
INSERT INTO `cmswing_area` VALUES ('331000', '台州市', '330000', '10');
INSERT INTO `cmswing_area` VALUES ('331100', '丽水市', '330000', '11');
INSERT INTO `cmswing_area` VALUES ('340100', '合肥市', '340000', '1');
INSERT INTO `cmswing_area` VALUES ('340200', '芜湖市', '340000', '2');
INSERT INTO `cmswing_area` VALUES ('340300', '蚌埠市', '340000', '3');
INSERT INTO `cmswing_area` VALUES ('340400', '淮南市', '340000', '4');
INSERT INTO `cmswing_area` VALUES ('340500', '马鞍山市', '340000', '5');
INSERT INTO `cmswing_area` VALUES ('340600', '淮北市', '340000', '6');
INSERT INTO `cmswing_area` VALUES ('340700', '铜陵市', '340000', '7');
INSERT INTO `cmswing_area` VALUES ('340800', '安庆市', '340000', '8');
INSERT INTO `cmswing_area` VALUES ('341000', '黄山市', '340000', '9');
INSERT INTO `cmswing_area` VALUES ('341100', '滁州市', '340000', '10');
INSERT INTO `cmswing_area` VALUES ('341200', '阜阳市', '340000', '11');
INSERT INTO `cmswing_area` VALUES ('341300', '宿州市', '340000', '12');
INSERT INTO `cmswing_area` VALUES ('341500', '六安市', '340000', '13');
INSERT INTO `cmswing_area` VALUES ('341600', '亳州市', '340000', '14');
INSERT INTO `cmswing_area` VALUES ('341700', '池州市', '340000', '15');
INSERT INTO `cmswing_area` VALUES ('341800', '宣城市', '340000', '16');
INSERT INTO `cmswing_area` VALUES ('350100', '福州市', '350000', '1');
INSERT INTO `cmswing_area` VALUES ('350200', '厦门市', '350000', '2');
INSERT INTO `cmswing_area` VALUES ('350300', '莆田市', '350000', '3');
INSERT INTO `cmswing_area` VALUES ('350400', '三明市', '350000', '4');
INSERT INTO `cmswing_area` VALUES ('350500', '泉州市', '350000', '5');
INSERT INTO `cmswing_area` VALUES ('350600', '漳州市', '350000', '6');
INSERT INTO `cmswing_area` VALUES ('350700', '南平市', '350000', '7');
INSERT INTO `cmswing_area` VALUES ('350800', '龙岩市', '350000', '8');
INSERT INTO `cmswing_area` VALUES ('350900', '宁德市', '350000', '9');
INSERT INTO `cmswing_area` VALUES ('360100', '南昌市', '360000', '1');
INSERT INTO `cmswing_area` VALUES ('360200', '景德镇市', '360000', '2');
INSERT INTO `cmswing_area` VALUES ('360300', '萍乡市', '360000', '3');
INSERT INTO `cmswing_area` VALUES ('360400', '九江市', '360000', '4');
INSERT INTO `cmswing_area` VALUES ('360500', '新余市', '360000', '5');
INSERT INTO `cmswing_area` VALUES ('360600', '鹰潭市', '360000', '6');
INSERT INTO `cmswing_area` VALUES ('360700', '赣州市', '360000', '7');
INSERT INTO `cmswing_area` VALUES ('360800', '吉安市', '360000', '8');
INSERT INTO `cmswing_area` VALUES ('360900', '宜春市', '360000', '9');
INSERT INTO `cmswing_area` VALUES ('361000', '抚州市', '360000', '10');
INSERT INTO `cmswing_area` VALUES ('361100', '上饶市', '360000', '11');
INSERT INTO `cmswing_area` VALUES ('370100', '济南市', '370000', '1');
INSERT INTO `cmswing_area` VALUES ('370200', '青岛市', '370000', '2');
INSERT INTO `cmswing_area` VALUES ('370300', '淄博市', '370000', '3');
INSERT INTO `cmswing_area` VALUES ('370400', '枣庄市', '370000', '4');
INSERT INTO `cmswing_area` VALUES ('370500', '东营市', '370000', '5');
INSERT INTO `cmswing_area` VALUES ('370600', '烟台市', '370000', '6');
INSERT INTO `cmswing_area` VALUES ('370700', '潍坊市', '370000', '7');
INSERT INTO `cmswing_area` VALUES ('370800', '济宁市', '370000', '8');
INSERT INTO `cmswing_area` VALUES ('370900', '泰安市', '370000', '9');
INSERT INTO `cmswing_area` VALUES ('371000', '威海市', '370000', '10');
INSERT INTO `cmswing_area` VALUES ('371100', '日照市', '370000', '11');
INSERT INTO `cmswing_area` VALUES ('371200', '莱芜市', '370000', '12');
INSERT INTO `cmswing_area` VALUES ('371300', '临沂市', '370000', '13');
INSERT INTO `cmswing_area` VALUES ('371400', '德州市', '370000', '14');
INSERT INTO `cmswing_area` VALUES ('371500', '聊城市', '370000', '15');
INSERT INTO `cmswing_area` VALUES ('371600', '滨州市', '370000', '16');
INSERT INTO `cmswing_area` VALUES ('371700', '菏泽市', '370000', '17');
INSERT INTO `cmswing_area` VALUES ('410100', '郑州市', '410000', '1');
INSERT INTO `cmswing_area` VALUES ('410200', '开封市', '410000', '2');
INSERT INTO `cmswing_area` VALUES ('410300', '洛阳市', '410000', '3');
INSERT INTO `cmswing_area` VALUES ('410400', '平顶山市', '410000', '4');
INSERT INTO `cmswing_area` VALUES ('410500', '安阳市', '410000', '5');
INSERT INTO `cmswing_area` VALUES ('410600', '鹤壁市', '410000', '6');
INSERT INTO `cmswing_area` VALUES ('410700', '新乡市', '410000', '7');
INSERT INTO `cmswing_area` VALUES ('410800', '焦作市', '410000', '8');
INSERT INTO `cmswing_area` VALUES ('410900', '濮阳市', '410000', '9');
INSERT INTO `cmswing_area` VALUES ('411000', '许昌市', '410000', '10');
INSERT INTO `cmswing_area` VALUES ('411100', '漯河市', '410000', '11');
INSERT INTO `cmswing_area` VALUES ('411200', '三门峡市', '410000', '12');
INSERT INTO `cmswing_area` VALUES ('411300', '南阳市', '410000', '13');
INSERT INTO `cmswing_area` VALUES ('411400', '商丘市', '410000', '14');
INSERT INTO `cmswing_area` VALUES ('411500', '信阳市', '410000', '15');
INSERT INTO `cmswing_area` VALUES ('411600', '周口市', '410000', '16');
INSERT INTO `cmswing_area` VALUES ('411700', '驻马店市', '410000', '17');
INSERT INTO `cmswing_area` VALUES ('420100', '武汉市', '420000', '1');
INSERT INTO `cmswing_area` VALUES ('420200', '黄石市', '420000', '2');
INSERT INTO `cmswing_area` VALUES ('420300', '十堰市', '420000', '3');
INSERT INTO `cmswing_area` VALUES ('420500', '宜昌市', '420000', '4');
INSERT INTO `cmswing_area` VALUES ('420600', '襄樊市', '420000', '5');
INSERT INTO `cmswing_area` VALUES ('420700', '鄂州市', '420000', '6');
INSERT INTO `cmswing_area` VALUES ('420800', '荆门市', '420000', '7');
INSERT INTO `cmswing_area` VALUES ('420900', '孝感市', '420000', '8');
INSERT INTO `cmswing_area` VALUES ('421000', '荆州市', '420000', '9');
INSERT INTO `cmswing_area` VALUES ('421100', '黄冈市', '420000', '10');
INSERT INTO `cmswing_area` VALUES ('421200', '咸宁市', '420000', '11');
INSERT INTO `cmswing_area` VALUES ('421300', '随州市', '420000', '12');
INSERT INTO `cmswing_area` VALUES ('422800', '恩施土家族苗族自治州', '420000', '13');
INSERT INTO `cmswing_area` VALUES ('429000', '省直辖行政单位', '420000', '14');
INSERT INTO `cmswing_area` VALUES ('430100', '长沙市', '430000', '1');
INSERT INTO `cmswing_area` VALUES ('430200', '株洲市', '430000', '2');
INSERT INTO `cmswing_area` VALUES ('430300', '湘潭市', '430000', '3');
INSERT INTO `cmswing_area` VALUES ('430400', '衡阳市', '430000', '4');
INSERT INTO `cmswing_area` VALUES ('430500', '邵阳市', '430000', '5');
INSERT INTO `cmswing_area` VALUES ('430600', '岳阳市', '430000', '6');
INSERT INTO `cmswing_area` VALUES ('430700', '常德市', '430000', '7');
INSERT INTO `cmswing_area` VALUES ('430800', '张家界市', '430000', '8');
INSERT INTO `cmswing_area` VALUES ('430900', '益阳市', '430000', '9');
INSERT INTO `cmswing_area` VALUES ('431000', '郴州市', '430000', '10');
INSERT INTO `cmswing_area` VALUES ('431100', '永州市', '430000', '11');
INSERT INTO `cmswing_area` VALUES ('431200', '怀化市', '430000', '12');
INSERT INTO `cmswing_area` VALUES ('431300', '娄底市', '430000', '13');
INSERT INTO `cmswing_area` VALUES ('433100', '湘西土家族苗族自治州', '430000', '14');
INSERT INTO `cmswing_area` VALUES ('440100', '广州市', '440000', '1');
INSERT INTO `cmswing_area` VALUES ('440200', '韶关市', '440000', '2');
INSERT INTO `cmswing_area` VALUES ('440300', '深圳市', '440000', '3');
INSERT INTO `cmswing_area` VALUES ('440400', '珠海市', '440000', '4');
INSERT INTO `cmswing_area` VALUES ('440500', '汕头市', '440000', '5');
INSERT INTO `cmswing_area` VALUES ('440600', '佛山市', '440000', '6');
INSERT INTO `cmswing_area` VALUES ('440700', '江门市', '440000', '7');
INSERT INTO `cmswing_area` VALUES ('440800', '湛江市', '440000', '8');
INSERT INTO `cmswing_area` VALUES ('440900', '茂名市', '440000', '9');
INSERT INTO `cmswing_area` VALUES ('441200', '肇庆市', '440000', '10');
INSERT INTO `cmswing_area` VALUES ('441300', '惠州市', '440000', '11');
INSERT INTO `cmswing_area` VALUES ('441400', '梅州市', '440000', '12');
INSERT INTO `cmswing_area` VALUES ('441500', '汕尾市', '440000', '13');
INSERT INTO `cmswing_area` VALUES ('441600', '河源市', '440000', '14');
INSERT INTO `cmswing_area` VALUES ('441700', '阳江市', '440000', '15');
INSERT INTO `cmswing_area` VALUES ('441800', '清远市', '440000', '16');
INSERT INTO `cmswing_area` VALUES ('441900', '东莞市', '440000', '17');
INSERT INTO `cmswing_area` VALUES ('442000', '中山市', '440000', '18');
INSERT INTO `cmswing_area` VALUES ('445100', '潮州市', '440000', '19');
INSERT INTO `cmswing_area` VALUES ('445200', '揭阳市', '440000', '20');
INSERT INTO `cmswing_area` VALUES ('445300', '云浮市', '440000', '21');
INSERT INTO `cmswing_area` VALUES ('450100', '南宁市', '450000', '1');
INSERT INTO `cmswing_area` VALUES ('450200', '柳州市', '450000', '2');
INSERT INTO `cmswing_area` VALUES ('450300', '桂林市', '450000', '3');
INSERT INTO `cmswing_area` VALUES ('450400', '梧州市', '450000', '4');
INSERT INTO `cmswing_area` VALUES ('450500', '北海市', '450000', '5');
INSERT INTO `cmswing_area` VALUES ('450600', '防城港市', '450000', '6');
INSERT INTO `cmswing_area` VALUES ('450700', '钦州市', '450000', '7');
INSERT INTO `cmswing_area` VALUES ('450800', '贵港市', '450000', '8');
INSERT INTO `cmswing_area` VALUES ('450900', '玉林市', '450000', '9');
INSERT INTO `cmswing_area` VALUES ('451000', '百色市', '450000', '10');
INSERT INTO `cmswing_area` VALUES ('451100', '贺州市', '450000', '11');
INSERT INTO `cmswing_area` VALUES ('451200', '河池市', '450000', '12');
INSERT INTO `cmswing_area` VALUES ('451300', '来宾市', '450000', '13');
INSERT INTO `cmswing_area` VALUES ('451400', '崇左市', '450000', '14');
INSERT INTO `cmswing_area` VALUES ('460100', '海口市', '460000', '1');
INSERT INTO `cmswing_area` VALUES ('460200', '三亚市', '460000', '2');
INSERT INTO `cmswing_area` VALUES ('469000', '省直辖县级行政单位', '460000', '3');
INSERT INTO `cmswing_area` VALUES ('500100', '市辖区', '500000', '1');
INSERT INTO `cmswing_area` VALUES ('500200', '县', '500000', '2');
INSERT INTO `cmswing_area` VALUES ('500300', '市', '500000', '3');
INSERT INTO `cmswing_area` VALUES ('510100', '成都市', '510000', '1');
INSERT INTO `cmswing_area` VALUES ('510300', '自贡市', '510000', '2');
INSERT INTO `cmswing_area` VALUES ('510400', '攀枝花市', '510000', '3');
INSERT INTO `cmswing_area` VALUES ('510500', '泸州市', '510000', '4');
INSERT INTO `cmswing_area` VALUES ('510600', '德阳市', '510000', '5');
INSERT INTO `cmswing_area` VALUES ('510700', '绵阳市', '510000', '6');
INSERT INTO `cmswing_area` VALUES ('510800', '广元市', '510000', '7');
INSERT INTO `cmswing_area` VALUES ('510900', '遂宁市', '510000', '8');
INSERT INTO `cmswing_area` VALUES ('511000', '内江市', '510000', '9');
INSERT INTO `cmswing_area` VALUES ('511100', '乐山市', '510000', '10');
INSERT INTO `cmswing_area` VALUES ('511300', '南充市', '510000', '11');
INSERT INTO `cmswing_area` VALUES ('511400', '眉山市', '510000', '12');
INSERT INTO `cmswing_area` VALUES ('511500', '宜宾市', '510000', '13');
INSERT INTO `cmswing_area` VALUES ('511600', '广安市', '510000', '14');
INSERT INTO `cmswing_area` VALUES ('511700', '达州市', '510000', '15');
INSERT INTO `cmswing_area` VALUES ('511800', '雅安市', '510000', '16');
INSERT INTO `cmswing_area` VALUES ('511900', '巴中市', '510000', '17');
INSERT INTO `cmswing_area` VALUES ('512000', '资阳市', '510000', '18');
INSERT INTO `cmswing_area` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '19');
INSERT INTO `cmswing_area` VALUES ('513300', '甘孜藏族自治州', '510000', '20');
INSERT INTO `cmswing_area` VALUES ('513400', '凉山彝族自治州', '510000', '21');
INSERT INTO `cmswing_area` VALUES ('520100', '贵阳市', '520000', '1');
INSERT INTO `cmswing_area` VALUES ('520200', '六盘水市', '520000', '2');
INSERT INTO `cmswing_area` VALUES ('520300', '遵义市', '520000', '3');
INSERT INTO `cmswing_area` VALUES ('520400', '安顺市', '520000', '4');
INSERT INTO `cmswing_area` VALUES ('522200', '铜仁地区', '520000', '5');
INSERT INTO `cmswing_area` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '6');
INSERT INTO `cmswing_area` VALUES ('522400', '毕节地区', '520000', '7');
INSERT INTO `cmswing_area` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '8');
INSERT INTO `cmswing_area` VALUES ('522700', '黔南布依族苗族自治州', '520000', '9');
INSERT INTO `cmswing_area` VALUES ('530100', '昆明市', '530000', '1');
INSERT INTO `cmswing_area` VALUES ('530300', '曲靖市', '530000', '2');
INSERT INTO `cmswing_area` VALUES ('530400', '玉溪市', '530000', '3');
INSERT INTO `cmswing_area` VALUES ('530500', '保山市', '530000', '4');
INSERT INTO `cmswing_area` VALUES ('530600', '昭通市', '530000', '5');
INSERT INTO `cmswing_area` VALUES ('530700', '丽江市', '530000', '6');
INSERT INTO `cmswing_area` VALUES ('530800', '思茅市', '530000', '7');
INSERT INTO `cmswing_area` VALUES ('530900', '临沧市', '530000', '8');
INSERT INTO `cmswing_area` VALUES ('532300', '楚雄彝族自治州', '530000', '9');
INSERT INTO `cmswing_area` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '10');
INSERT INTO `cmswing_area` VALUES ('532600', '文山壮族苗族自治州', '530000', '11');
INSERT INTO `cmswing_area` VALUES ('532800', '西双版纳傣族自治州', '530000', '12');
INSERT INTO `cmswing_area` VALUES ('532900', '大理白族自治州', '530000', '13');
INSERT INTO `cmswing_area` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '14');
INSERT INTO `cmswing_area` VALUES ('533300', '怒江傈僳族自治州', '530000', '15');
INSERT INTO `cmswing_area` VALUES ('533400', '迪庆藏族自治州', '530000', '16');
INSERT INTO `cmswing_area` VALUES ('540100', '拉萨市', '540000', '1');
INSERT INTO `cmswing_area` VALUES ('542100', '昌都地区', '540000', '2');
INSERT INTO `cmswing_area` VALUES ('542200', '山南地区', '540000', '3');
INSERT INTO `cmswing_area` VALUES ('542300', '日喀则地区', '540000', '4');
INSERT INTO `cmswing_area` VALUES ('542400', '那曲地区', '540000', '5');
INSERT INTO `cmswing_area` VALUES ('542500', '阿里地区', '540000', '6');
INSERT INTO `cmswing_area` VALUES ('542600', '林芝地区', '540000', '7');
INSERT INTO `cmswing_area` VALUES ('610100', '西安市', '610000', '1');
INSERT INTO `cmswing_area` VALUES ('610200', '铜川市', '610000', '2');
INSERT INTO `cmswing_area` VALUES ('610300', '宝鸡市', '610000', '3');
INSERT INTO `cmswing_area` VALUES ('610400', '咸阳市', '610000', '4');
INSERT INTO `cmswing_area` VALUES ('610500', '渭南市', '610000', '5');
INSERT INTO `cmswing_area` VALUES ('610600', '延安市', '610000', '6');
INSERT INTO `cmswing_area` VALUES ('610700', '汉中市', '610000', '7');
INSERT INTO `cmswing_area` VALUES ('610800', '榆林市', '610000', '8');
INSERT INTO `cmswing_area` VALUES ('610900', '安康市', '610000', '9');
INSERT INTO `cmswing_area` VALUES ('611000', '商洛市', '610000', '10');
INSERT INTO `cmswing_area` VALUES ('620100', '兰州市', '620000', '1');
INSERT INTO `cmswing_area` VALUES ('620200', '嘉峪关市', '620000', '2');
INSERT INTO `cmswing_area` VALUES ('620300', '金昌市', '620000', '3');
INSERT INTO `cmswing_area` VALUES ('620400', '白银市', '620000', '4');
INSERT INTO `cmswing_area` VALUES ('620500', '天水市', '620000', '5');
INSERT INTO `cmswing_area` VALUES ('620600', '武威市', '620000', '6');
INSERT INTO `cmswing_area` VALUES ('620700', '张掖市', '620000', '7');
INSERT INTO `cmswing_area` VALUES ('620800', '平凉市', '620000', '8');
INSERT INTO `cmswing_area` VALUES ('620900', '酒泉市', '620000', '9');
INSERT INTO `cmswing_area` VALUES ('621000', '庆阳市', '620000', '10');
INSERT INTO `cmswing_area` VALUES ('621100', '定西市', '620000', '11');
INSERT INTO `cmswing_area` VALUES ('621200', '陇南市', '620000', '12');
INSERT INTO `cmswing_area` VALUES ('622900', '临夏回族自治州', '620000', '13');
INSERT INTO `cmswing_area` VALUES ('623000', '甘南藏族自治州', '620000', '14');
INSERT INTO `cmswing_area` VALUES ('630100', '西宁市', '630000', '1');
INSERT INTO `cmswing_area` VALUES ('632100', '海东地区', '630000', '2');
INSERT INTO `cmswing_area` VALUES ('632200', '海北藏族自治州', '630000', '3');
INSERT INTO `cmswing_area` VALUES ('632300', '黄南藏族自治州', '630000', '4');
INSERT INTO `cmswing_area` VALUES ('632500', '海南藏族自治州', '630000', '5');
INSERT INTO `cmswing_area` VALUES ('632600', '果洛藏族自治州', '630000', '6');
INSERT INTO `cmswing_area` VALUES ('632700', '玉树藏族自治州', '630000', '7');
INSERT INTO `cmswing_area` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '8');
INSERT INTO `cmswing_area` VALUES ('640100', '银川市', '640000', '1');
INSERT INTO `cmswing_area` VALUES ('640200', '石嘴山市', '640000', '2');
INSERT INTO `cmswing_area` VALUES ('640300', '吴忠市', '640000', '3');
INSERT INTO `cmswing_area` VALUES ('640400', '固原市', '640000', '4');
INSERT INTO `cmswing_area` VALUES ('640500', '中卫市', '640000', '5');
INSERT INTO `cmswing_area` VALUES ('650100', '乌鲁木齐市', '650000', '1');
INSERT INTO `cmswing_area` VALUES ('650200', '克拉玛依市', '650000', '2');
INSERT INTO `cmswing_area` VALUES ('652100', '吐鲁番地区', '650000', '3');
INSERT INTO `cmswing_area` VALUES ('652200', '哈密地区', '650000', '4');
INSERT INTO `cmswing_area` VALUES ('652300', '昌吉回族自治州', '650000', '5');
INSERT INTO `cmswing_area` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '6');
INSERT INTO `cmswing_area` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '7');
INSERT INTO `cmswing_area` VALUES ('652900', '阿克苏地区', '650000', '8');
INSERT INTO `cmswing_area` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '9');
INSERT INTO `cmswing_area` VALUES ('653100', '喀什地区', '650000', '10');
INSERT INTO `cmswing_area` VALUES ('653200', '和田地区', '650000', '11');
INSERT INTO `cmswing_area` VALUES ('654000', '伊犁哈萨克自治州', '650000', '12');
INSERT INTO `cmswing_area` VALUES ('654200', '塔城地区', '650000', '13');
INSERT INTO `cmswing_area` VALUES ('654300', '阿勒泰地区', '650000', '14');
INSERT INTO `cmswing_area` VALUES ('659000', '省直辖行政单位', '650000', '15');
INSERT INTO `cmswing_area` VALUES ('110101', '东城区', '110100', '1');
INSERT INTO `cmswing_area` VALUES ('110102', '西城区', '110100', '2');
INSERT INTO `cmswing_area` VALUES ('110103', '崇文区', '110100', '3');
INSERT INTO `cmswing_area` VALUES ('110104', '宣武区', '110100', '4');
INSERT INTO `cmswing_area` VALUES ('110105', '朝阳区', '110100', '5');
INSERT INTO `cmswing_area` VALUES ('110106', '丰台区', '110100', '6');
INSERT INTO `cmswing_area` VALUES ('110107', '石景山区', '110100', '7');
INSERT INTO `cmswing_area` VALUES ('110108', '海淀区', '110100', '8');
INSERT INTO `cmswing_area` VALUES ('110109', '门头沟区', '110100', '9');
INSERT INTO `cmswing_area` VALUES ('110111', '房山区', '110100', '10');
INSERT INTO `cmswing_area` VALUES ('110112', '通州区', '110100', '11');
INSERT INTO `cmswing_area` VALUES ('110113', '顺义区', '110100', '12');
INSERT INTO `cmswing_area` VALUES ('110114', '昌平区', '110100', '13');
INSERT INTO `cmswing_area` VALUES ('110115', '大兴区', '110100', '14');
INSERT INTO `cmswing_area` VALUES ('110116', '怀柔区', '110100', '15');
INSERT INTO `cmswing_area` VALUES ('110117', '平谷区', '110100', '16');
INSERT INTO `cmswing_area` VALUES ('110228', '密云县', '110200', '1');
INSERT INTO `cmswing_area` VALUES ('110229', '延庆县', '110200', '2');
INSERT INTO `cmswing_area` VALUES ('120101', '和平区', '120100', '1');
INSERT INTO `cmswing_area` VALUES ('120102', '河东区', '120100', '2');
INSERT INTO `cmswing_area` VALUES ('120103', '河西区', '120100', '3');
INSERT INTO `cmswing_area` VALUES ('120104', '南开区', '120100', '4');
INSERT INTO `cmswing_area` VALUES ('120105', '河北区', '120100', '5');
INSERT INTO `cmswing_area` VALUES ('120106', '红桥区', '120100', '6');
INSERT INTO `cmswing_area` VALUES ('120107', '塘沽区', '120100', '7');
INSERT INTO `cmswing_area` VALUES ('120108', '汉沽区', '120100', '8');
INSERT INTO `cmswing_area` VALUES ('120109', '大港区', '120100', '9');
INSERT INTO `cmswing_area` VALUES ('120110', '东丽区', '120100', '10');
INSERT INTO `cmswing_area` VALUES ('120111', '西青区', '120100', '11');
INSERT INTO `cmswing_area` VALUES ('120112', '津南区', '120100', '12');
INSERT INTO `cmswing_area` VALUES ('120113', '北辰区', '120100', '13');
INSERT INTO `cmswing_area` VALUES ('120114', '武清区', '120100', '14');
INSERT INTO `cmswing_area` VALUES ('120115', '宝坻区', '120100', '15');
INSERT INTO `cmswing_area` VALUES ('120221', '宁河县', '120200', '1');
INSERT INTO `cmswing_area` VALUES ('120223', '静海县', '120200', '2');
INSERT INTO `cmswing_area` VALUES ('120225', '蓟　县', '120200', '3');
INSERT INTO `cmswing_area` VALUES ('130101', '市辖区', '130100', '1');
INSERT INTO `cmswing_area` VALUES ('130102', '长安区', '130100', '2');
INSERT INTO `cmswing_area` VALUES ('130103', '桥东区', '130100', '3');
INSERT INTO `cmswing_area` VALUES ('130104', '桥西区', '130100', '4');
INSERT INTO `cmswing_area` VALUES ('130105', '新华区', '130100', '5');
INSERT INTO `cmswing_area` VALUES ('130107', '井陉矿区', '130100', '6');
INSERT INTO `cmswing_area` VALUES ('130108', '裕华区', '130100', '7');
INSERT INTO `cmswing_area` VALUES ('130121', '井陉县', '130100', '8');
INSERT INTO `cmswing_area` VALUES ('130123', '正定县', '130100', '9');
INSERT INTO `cmswing_area` VALUES ('130124', '栾城县', '130100', '10');
INSERT INTO `cmswing_area` VALUES ('130125', '行唐县', '130100', '11');
INSERT INTO `cmswing_area` VALUES ('130126', '灵寿县', '130100', '12');
INSERT INTO `cmswing_area` VALUES ('130127', '高邑县', '130100', '13');
INSERT INTO `cmswing_area` VALUES ('130128', '深泽县', '130100', '14');
INSERT INTO `cmswing_area` VALUES ('130129', '赞皇县', '130100', '15');
INSERT INTO `cmswing_area` VALUES ('130130', '无极县', '130100', '16');
INSERT INTO `cmswing_area` VALUES ('130131', '平山县', '130100', '17');
INSERT INTO `cmswing_area` VALUES ('130132', '元氏县', '130100', '18');
INSERT INTO `cmswing_area` VALUES ('130133', '赵　县', '130100', '19');
INSERT INTO `cmswing_area` VALUES ('130181', '辛集市', '130100', '20');
INSERT INTO `cmswing_area` VALUES ('130182', '藁城市', '130100', '21');
INSERT INTO `cmswing_area` VALUES ('130183', '晋州市', '130100', '22');
INSERT INTO `cmswing_area` VALUES ('130184', '新乐市', '130100', '23');
INSERT INTO `cmswing_area` VALUES ('130185', '鹿泉市', '130100', '24');
INSERT INTO `cmswing_area` VALUES ('130201', '市辖区', '130200', '1');
INSERT INTO `cmswing_area` VALUES ('130202', '路南区', '130200', '2');
INSERT INTO `cmswing_area` VALUES ('130203', '路北区', '130200', '3');
INSERT INTO `cmswing_area` VALUES ('130204', '古冶区', '130200', '4');
INSERT INTO `cmswing_area` VALUES ('130205', '开平区', '130200', '5');
INSERT INTO `cmswing_area` VALUES ('130207', '丰南区', '130200', '6');
INSERT INTO `cmswing_area` VALUES ('130208', '丰润区', '130200', '7');
INSERT INTO `cmswing_area` VALUES ('130223', '滦　县', '130200', '8');
INSERT INTO `cmswing_area` VALUES ('130224', '滦南县', '130200', '9');
INSERT INTO `cmswing_area` VALUES ('130225', '乐亭县', '130200', '10');
INSERT INTO `cmswing_area` VALUES ('130227', '迁西县', '130200', '11');
INSERT INTO `cmswing_area` VALUES ('130229', '玉田县', '130200', '12');
INSERT INTO `cmswing_area` VALUES ('130230', '唐海县', '130200', '13');
INSERT INTO `cmswing_area` VALUES ('130281', '遵化市', '130200', '14');
INSERT INTO `cmswing_area` VALUES ('130283', '迁安市', '130200', '15');
INSERT INTO `cmswing_area` VALUES ('130301', '市辖区', '130300', '1');
INSERT INTO `cmswing_area` VALUES ('130302', '海港区', '130300', '2');
INSERT INTO `cmswing_area` VALUES ('130303', '山海关区', '130300', '3');
INSERT INTO `cmswing_area` VALUES ('130304', '北戴河区', '130300', '4');
INSERT INTO `cmswing_area` VALUES ('130321', '青龙满族自治县', '130300', '5');
INSERT INTO `cmswing_area` VALUES ('130322', '昌黎县', '130300', '6');
INSERT INTO `cmswing_area` VALUES ('130323', '抚宁县', '130300', '7');
INSERT INTO `cmswing_area` VALUES ('130324', '卢龙县', '130300', '8');
INSERT INTO `cmswing_area` VALUES ('130401', '市辖区', '130400', '1');
INSERT INTO `cmswing_area` VALUES ('130402', '邯山区', '130400', '2');
INSERT INTO `cmswing_area` VALUES ('130403', '丛台区', '130400', '3');
INSERT INTO `cmswing_area` VALUES ('130404', '复兴区', '130400', '4');
INSERT INTO `cmswing_area` VALUES ('130406', '峰峰矿区', '130400', '5');
INSERT INTO `cmswing_area` VALUES ('130421', '邯郸县', '130400', '6');
INSERT INTO `cmswing_area` VALUES ('130423', '临漳县', '130400', '7');
INSERT INTO `cmswing_area` VALUES ('130424', '成安县', '130400', '8');
INSERT INTO `cmswing_area` VALUES ('130425', '大名县', '130400', '9');
INSERT INTO `cmswing_area` VALUES ('130426', '涉　县', '130400', '10');
INSERT INTO `cmswing_area` VALUES ('130427', '磁　县', '130400', '11');
INSERT INTO `cmswing_area` VALUES ('130428', '肥乡县', '130400', '12');
INSERT INTO `cmswing_area` VALUES ('130429', '永年县', '130400', '13');
INSERT INTO `cmswing_area` VALUES ('130430', '邱　县', '130400', '14');
INSERT INTO `cmswing_area` VALUES ('130431', '鸡泽县', '130400', '15');
INSERT INTO `cmswing_area` VALUES ('130432', '广平县', '130400', '16');
INSERT INTO `cmswing_area` VALUES ('130433', '馆陶县', '130400', '17');
INSERT INTO `cmswing_area` VALUES ('130434', '魏　县', '130400', '18');
INSERT INTO `cmswing_area` VALUES ('130435', '曲周县', '130400', '19');
INSERT INTO `cmswing_area` VALUES ('130481', '武安市', '130400', '20');
INSERT INTO `cmswing_area` VALUES ('130501', '市辖区', '130500', '1');
INSERT INTO `cmswing_area` VALUES ('130502', '桥东区', '130500', '2');
INSERT INTO `cmswing_area` VALUES ('130503', '桥西区', '130500', '3');
INSERT INTO `cmswing_area` VALUES ('130521', '邢台县', '130500', '4');
INSERT INTO `cmswing_area` VALUES ('130522', '临城县', '130500', '5');
INSERT INTO `cmswing_area` VALUES ('130523', '内丘县', '130500', '6');
INSERT INTO `cmswing_area` VALUES ('130524', '柏乡县', '130500', '7');
INSERT INTO `cmswing_area` VALUES ('130525', '隆尧县', '130500', '8');
INSERT INTO `cmswing_area` VALUES ('130526', '任　县', '130500', '9');
INSERT INTO `cmswing_area` VALUES ('130527', '南和县', '130500', '10');
INSERT INTO `cmswing_area` VALUES ('130528', '宁晋县', '130500', '11');
INSERT INTO `cmswing_area` VALUES ('130529', '巨鹿县', '130500', '12');
INSERT INTO `cmswing_area` VALUES ('130530', '新河县', '130500', '13');
INSERT INTO `cmswing_area` VALUES ('130531', '广宗县', '130500', '14');
INSERT INTO `cmswing_area` VALUES ('130532', '平乡县', '130500', '15');
INSERT INTO `cmswing_area` VALUES ('130533', '威　县', '130500', '16');
INSERT INTO `cmswing_area` VALUES ('130534', '清河县', '130500', '17');
INSERT INTO `cmswing_area` VALUES ('130535', '临西县', '130500', '18');
INSERT INTO `cmswing_area` VALUES ('130581', '南宫市', '130500', '19');
INSERT INTO `cmswing_area` VALUES ('130582', '沙河市', '130500', '20');
INSERT INTO `cmswing_area` VALUES ('130601', '市辖区', '130600', '1');
INSERT INTO `cmswing_area` VALUES ('130602', '新市区', '130600', '2');
INSERT INTO `cmswing_area` VALUES ('130603', '北市区', '130600', '3');
INSERT INTO `cmswing_area` VALUES ('130604', '南市区', '130600', '4');
INSERT INTO `cmswing_area` VALUES ('130621', '满城县', '130600', '5');
INSERT INTO `cmswing_area` VALUES ('130622', '清苑县', '130600', '6');
INSERT INTO `cmswing_area` VALUES ('130623', '涞水县', '130600', '7');
INSERT INTO `cmswing_area` VALUES ('130624', '阜平县', '130600', '8');
INSERT INTO `cmswing_area` VALUES ('130625', '徐水县', '130600', '9');
INSERT INTO `cmswing_area` VALUES ('130626', '定兴县', '130600', '10');
INSERT INTO `cmswing_area` VALUES ('130627', '唐　县', '130600', '11');
INSERT INTO `cmswing_area` VALUES ('130628', '高阳县', '130600', '12');
INSERT INTO `cmswing_area` VALUES ('130629', '容城县', '130600', '13');
INSERT INTO `cmswing_area` VALUES ('130630', '涞源县', '130600', '14');
INSERT INTO `cmswing_area` VALUES ('130631', '望都县', '130600', '15');
INSERT INTO `cmswing_area` VALUES ('130632', '安新县', '130600', '16');
INSERT INTO `cmswing_area` VALUES ('130633', '易　县', '130600', '17');
INSERT INTO `cmswing_area` VALUES ('130634', '曲阳县', '130600', '18');
INSERT INTO `cmswing_area` VALUES ('130635', '蠡　县', '130600', '19');
INSERT INTO `cmswing_area` VALUES ('130636', '顺平县', '130600', '20');
INSERT INTO `cmswing_area` VALUES ('130637', '博野县', '130600', '21');
INSERT INTO `cmswing_area` VALUES ('130638', '雄　县', '130600', '22');
INSERT INTO `cmswing_area` VALUES ('130681', '涿州市', '130600', '23');
INSERT INTO `cmswing_area` VALUES ('130682', '定州市', '130600', '24');
INSERT INTO `cmswing_area` VALUES ('130683', '安国市', '130600', '25');
INSERT INTO `cmswing_area` VALUES ('130684', '高碑店市', '130600', '26');
INSERT INTO `cmswing_area` VALUES ('130701', '市辖区', '130700', '1');
INSERT INTO `cmswing_area` VALUES ('130702', '桥东区', '130700', '2');
INSERT INTO `cmswing_area` VALUES ('130703', '桥西区', '130700', '3');
INSERT INTO `cmswing_area` VALUES ('130705', '宣化区', '130700', '4');
INSERT INTO `cmswing_area` VALUES ('130706', '下花园区', '130700', '5');
INSERT INTO `cmswing_area` VALUES ('130721', '宣化县', '130700', '6');
INSERT INTO `cmswing_area` VALUES ('130722', '张北县', '130700', '7');
INSERT INTO `cmswing_area` VALUES ('130723', '康保县', '130700', '8');
INSERT INTO `cmswing_area` VALUES ('130724', '沽源县', '130700', '9');
INSERT INTO `cmswing_area` VALUES ('130725', '尚义县', '130700', '10');
INSERT INTO `cmswing_area` VALUES ('130726', '蔚　县', '130700', '11');
INSERT INTO `cmswing_area` VALUES ('130727', '阳原县', '130700', '12');
INSERT INTO `cmswing_area` VALUES ('130728', '怀安县', '130700', '13');
INSERT INTO `cmswing_area` VALUES ('130729', '万全县', '130700', '14');
INSERT INTO `cmswing_area` VALUES ('130730', '怀来县', '130700', '15');
INSERT INTO `cmswing_area` VALUES ('130731', '涿鹿县', '130700', '16');
INSERT INTO `cmswing_area` VALUES ('130732', '赤城县', '130700', '17');
INSERT INTO `cmswing_area` VALUES ('130733', '崇礼县', '130700', '18');
INSERT INTO `cmswing_area` VALUES ('130801', '市辖区', '130800', '1');
INSERT INTO `cmswing_area` VALUES ('130802', '双桥区', '130800', '2');
INSERT INTO `cmswing_area` VALUES ('130803', '双滦区', '130800', '3');
INSERT INTO `cmswing_area` VALUES ('130804', '鹰手营子矿区', '130800', '4');
INSERT INTO `cmswing_area` VALUES ('130821', '承德县', '130800', '5');
INSERT INTO `cmswing_area` VALUES ('130822', '兴隆县', '130800', '6');
INSERT INTO `cmswing_area` VALUES ('130823', '平泉县', '130800', '7');
INSERT INTO `cmswing_area` VALUES ('130824', '滦平县', '130800', '8');
INSERT INTO `cmswing_area` VALUES ('130825', '隆化县', '130800', '9');
INSERT INTO `cmswing_area` VALUES ('130826', '丰宁满族自治县', '130800', '10');
INSERT INTO `cmswing_area` VALUES ('130827', '宽城满族自治县', '130800', '11');
INSERT INTO `cmswing_area` VALUES ('130828', '围场满族蒙古族自治县', '130800', '12');
INSERT INTO `cmswing_area` VALUES ('130901', '市辖区', '130900', '1');
INSERT INTO `cmswing_area` VALUES ('130902', '新华区', '130900', '2');
INSERT INTO `cmswing_area` VALUES ('130903', '运河区', '130900', '3');
INSERT INTO `cmswing_area` VALUES ('130921', '沧　县', '130900', '4');
INSERT INTO `cmswing_area` VALUES ('130922', '青　县', '130900', '5');
INSERT INTO `cmswing_area` VALUES ('130923', '东光县', '130900', '6');
INSERT INTO `cmswing_area` VALUES ('130924', '海兴县', '130900', '7');
INSERT INTO `cmswing_area` VALUES ('130925', '盐山县', '130900', '8');
INSERT INTO `cmswing_area` VALUES ('130926', '肃宁县', '130900', '9');
INSERT INTO `cmswing_area` VALUES ('130927', '南皮县', '130900', '10');
INSERT INTO `cmswing_area` VALUES ('130928', '吴桥县', '130900', '11');
INSERT INTO `cmswing_area` VALUES ('130929', '献　县', '130900', '12');
INSERT INTO `cmswing_area` VALUES ('130930', '孟村回族自治县', '130900', '13');
INSERT INTO `cmswing_area` VALUES ('130981', '泊头市', '130900', '14');
INSERT INTO `cmswing_area` VALUES ('130982', '任丘市', '130900', '15');
INSERT INTO `cmswing_area` VALUES ('130983', '黄骅市', '130900', '16');
INSERT INTO `cmswing_area` VALUES ('130984', '河间市', '130900', '17');
INSERT INTO `cmswing_area` VALUES ('131001', '市辖区', '131000', '1');
INSERT INTO `cmswing_area` VALUES ('131002', '安次区', '131000', '2');
INSERT INTO `cmswing_area` VALUES ('131003', '广阳区', '131000', '3');
INSERT INTO `cmswing_area` VALUES ('131022', '固安县', '131000', '4');
INSERT INTO `cmswing_area` VALUES ('131023', '永清县', '131000', '5');
INSERT INTO `cmswing_area` VALUES ('131024', '香河县', '131000', '6');
INSERT INTO `cmswing_area` VALUES ('131025', '大城县', '131000', '7');
INSERT INTO `cmswing_area` VALUES ('131026', '文安县', '131000', '8');
INSERT INTO `cmswing_area` VALUES ('131028', '大厂回族自治县', '131000', '9');
INSERT INTO `cmswing_area` VALUES ('131081', '霸州市', '131000', '10');
INSERT INTO `cmswing_area` VALUES ('131082', '三河市', '131000', '11');
INSERT INTO `cmswing_area` VALUES ('131101', '市辖区', '131100', '1');
INSERT INTO `cmswing_area` VALUES ('131102', '桃城区', '131100', '2');
INSERT INTO `cmswing_area` VALUES ('131121', '枣强县', '131100', '3');
INSERT INTO `cmswing_area` VALUES ('131122', '武邑县', '131100', '4');
INSERT INTO `cmswing_area` VALUES ('131123', '武强县', '131100', '5');
INSERT INTO `cmswing_area` VALUES ('131124', '饶阳县', '131100', '6');
INSERT INTO `cmswing_area` VALUES ('131125', '安平县', '131100', '7');
INSERT INTO `cmswing_area` VALUES ('131126', '故城县', '131100', '8');
INSERT INTO `cmswing_area` VALUES ('131127', '景　县', '131100', '9');
INSERT INTO `cmswing_area` VALUES ('131128', '阜城县', '131100', '10');
INSERT INTO `cmswing_area` VALUES ('131181', '冀州市', '131100', '11');
INSERT INTO `cmswing_area` VALUES ('131182', '深州市', '131100', '12');
INSERT INTO `cmswing_area` VALUES ('140101', '市辖区', '140100', '1');
INSERT INTO `cmswing_area` VALUES ('140105', '小店区', '140100', '2');
INSERT INTO `cmswing_area` VALUES ('140106', '迎泽区', '140100', '3');
INSERT INTO `cmswing_area` VALUES ('140107', '杏花岭区', '140100', '4');
INSERT INTO `cmswing_area` VALUES ('140108', '尖草坪区', '140100', '5');
INSERT INTO `cmswing_area` VALUES ('140109', '万柏林区', '140100', '6');
INSERT INTO `cmswing_area` VALUES ('140110', '晋源区', '140100', '7');
INSERT INTO `cmswing_area` VALUES ('140121', '清徐县', '140100', '8');
INSERT INTO `cmswing_area` VALUES ('140122', '阳曲县', '140100', '9');
INSERT INTO `cmswing_area` VALUES ('140123', '娄烦县', '140100', '10');
INSERT INTO `cmswing_area` VALUES ('140181', '古交市', '140100', '11');
INSERT INTO `cmswing_area` VALUES ('140201', '市辖区', '140200', '1');
INSERT INTO `cmswing_area` VALUES ('140202', '城　区', '140200', '2');
INSERT INTO `cmswing_area` VALUES ('140203', '矿　区', '140200', '3');
INSERT INTO `cmswing_area` VALUES ('140211', '南郊区', '140200', '4');
INSERT INTO `cmswing_area` VALUES ('140212', '新荣区', '140200', '5');
INSERT INTO `cmswing_area` VALUES ('140221', '阳高县', '140200', '6');
INSERT INTO `cmswing_area` VALUES ('140222', '天镇县', '140200', '7');
INSERT INTO `cmswing_area` VALUES ('140223', '广灵县', '140200', '8');
INSERT INTO `cmswing_area` VALUES ('140224', '灵丘县', '140200', '9');
INSERT INTO `cmswing_area` VALUES ('140225', '浑源县', '140200', '10');
INSERT INTO `cmswing_area` VALUES ('140226', '左云县', '140200', '11');
INSERT INTO `cmswing_area` VALUES ('140227', '大同县', '140200', '12');
INSERT INTO `cmswing_area` VALUES ('140301', '市辖区', '140300', '1');
INSERT INTO `cmswing_area` VALUES ('140302', '城　区', '140300', '2');
INSERT INTO `cmswing_area` VALUES ('140303', '矿　区', '140300', '3');
INSERT INTO `cmswing_area` VALUES ('140311', '郊　区', '140300', '4');
INSERT INTO `cmswing_area` VALUES ('140321', '平定县', '140300', '5');
INSERT INTO `cmswing_area` VALUES ('140322', '盂　县', '140300', '6');
INSERT INTO `cmswing_area` VALUES ('140401', '市辖区', '140400', '1');
INSERT INTO `cmswing_area` VALUES ('140402', '城　区', '140400', '2');
INSERT INTO `cmswing_area` VALUES ('140411', '郊　区', '140400', '3');
INSERT INTO `cmswing_area` VALUES ('140421', '长治县', '140400', '4');
INSERT INTO `cmswing_area` VALUES ('140423', '襄垣县', '140400', '5');
INSERT INTO `cmswing_area` VALUES ('140424', '屯留县', '140400', '6');
INSERT INTO `cmswing_area` VALUES ('140425', '平顺县', '140400', '7');
INSERT INTO `cmswing_area` VALUES ('140426', '黎城县', '140400', '8');
INSERT INTO `cmswing_area` VALUES ('140427', '壶关县', '140400', '9');
INSERT INTO `cmswing_area` VALUES ('140428', '长子县', '140400', '10');
INSERT INTO `cmswing_area` VALUES ('140429', '武乡县', '140400', '11');
INSERT INTO `cmswing_area` VALUES ('140430', '沁　县', '140400', '12');
INSERT INTO `cmswing_area` VALUES ('140431', '沁源县', '140400', '13');
INSERT INTO `cmswing_area` VALUES ('140481', '潞城市', '140400', '14');
INSERT INTO `cmswing_area` VALUES ('140501', '市辖区', '140500', '1');
INSERT INTO `cmswing_area` VALUES ('140502', '城　区', '140500', '2');
INSERT INTO `cmswing_area` VALUES ('140521', '沁水县', '140500', '3');
INSERT INTO `cmswing_area` VALUES ('140522', '阳城县', '140500', '4');
INSERT INTO `cmswing_area` VALUES ('140524', '陵川县', '140500', '5');
INSERT INTO `cmswing_area` VALUES ('140525', '泽州县', '140500', '6');
INSERT INTO `cmswing_area` VALUES ('140581', '高平市', '140500', '7');
INSERT INTO `cmswing_area` VALUES ('140601', '市辖区', '140600', '1');
INSERT INTO `cmswing_area` VALUES ('140602', '朔城区', '140600', '2');
INSERT INTO `cmswing_area` VALUES ('140603', '平鲁区', '140600', '3');
INSERT INTO `cmswing_area` VALUES ('140621', '山阴县', '140600', '4');
INSERT INTO `cmswing_area` VALUES ('140622', '应　县', '140600', '5');
INSERT INTO `cmswing_area` VALUES ('140623', '右玉县', '140600', '6');
INSERT INTO `cmswing_area` VALUES ('140624', '怀仁县', '140600', '7');
INSERT INTO `cmswing_area` VALUES ('140701', '市辖区', '140700', '1');
INSERT INTO `cmswing_area` VALUES ('140702', '榆次区', '140700', '2');
INSERT INTO `cmswing_area` VALUES ('140721', '榆社县', '140700', '3');
INSERT INTO `cmswing_area` VALUES ('140722', '左权县', '140700', '4');
INSERT INTO `cmswing_area` VALUES ('140723', '和顺县', '140700', '5');
INSERT INTO `cmswing_area` VALUES ('140724', '昔阳县', '140700', '6');
INSERT INTO `cmswing_area` VALUES ('140725', '寿阳县', '140700', '7');
INSERT INTO `cmswing_area` VALUES ('140726', '太谷县', '140700', '8');
INSERT INTO `cmswing_area` VALUES ('140727', '祁　县', '140700', '9');
INSERT INTO `cmswing_area` VALUES ('140728', '平遥县', '140700', '10');
INSERT INTO `cmswing_area` VALUES ('140729', '灵石县', '140700', '11');
INSERT INTO `cmswing_area` VALUES ('140781', '介休市', '140700', '12');
INSERT INTO `cmswing_area` VALUES ('140801', '市辖区', '140800', '1');
INSERT INTO `cmswing_area` VALUES ('140802', '盐湖区', '140800', '2');
INSERT INTO `cmswing_area` VALUES ('140821', '临猗县', '140800', '3');
INSERT INTO `cmswing_area` VALUES ('140822', '万荣县', '140800', '4');
INSERT INTO `cmswing_area` VALUES ('140823', '闻喜县', '140800', '5');
INSERT INTO `cmswing_area` VALUES ('140824', '稷山县', '140800', '6');
INSERT INTO `cmswing_area` VALUES ('140825', '新绛县', '140800', '7');
INSERT INTO `cmswing_area` VALUES ('140826', '绛　县', '140800', '8');
INSERT INTO `cmswing_area` VALUES ('140827', '垣曲县', '140800', '9');
INSERT INTO `cmswing_area` VALUES ('140828', '夏　县', '140800', '10');
INSERT INTO `cmswing_area` VALUES ('140829', '平陆县', '140800', '11');
INSERT INTO `cmswing_area` VALUES ('140830', '芮城县', '140800', '12');
INSERT INTO `cmswing_area` VALUES ('140881', '永济市', '140800', '13');
INSERT INTO `cmswing_area` VALUES ('140882', '河津市', '140800', '14');
INSERT INTO `cmswing_area` VALUES ('140901', '市辖区', '140900', '1');
INSERT INTO `cmswing_area` VALUES ('140902', '忻府区', '140900', '2');
INSERT INTO `cmswing_area` VALUES ('140921', '定襄县', '140900', '3');
INSERT INTO `cmswing_area` VALUES ('140922', '五台县', '140900', '4');
INSERT INTO `cmswing_area` VALUES ('140923', '代　县', '140900', '5');
INSERT INTO `cmswing_area` VALUES ('140924', '繁峙县', '140900', '6');
INSERT INTO `cmswing_area` VALUES ('140925', '宁武县', '140900', '7');
INSERT INTO `cmswing_area` VALUES ('140926', '静乐县', '140900', '8');
INSERT INTO `cmswing_area` VALUES ('140927', '神池县', '140900', '9');
INSERT INTO `cmswing_area` VALUES ('140928', '五寨县', '140900', '10');
INSERT INTO `cmswing_area` VALUES ('140929', '岢岚县', '140900', '11');
INSERT INTO `cmswing_area` VALUES ('140930', '河曲县', '140900', '12');
INSERT INTO `cmswing_area` VALUES ('140931', '保德县', '140900', '13');
INSERT INTO `cmswing_area` VALUES ('140932', '偏关县', '140900', '14');
INSERT INTO `cmswing_area` VALUES ('140981', '原平市', '140900', '15');
INSERT INTO `cmswing_area` VALUES ('141001', '市辖区', '141000', '1');
INSERT INTO `cmswing_area` VALUES ('141002', '尧都区', '141000', '2');
INSERT INTO `cmswing_area` VALUES ('141021', '曲沃县', '141000', '3');
INSERT INTO `cmswing_area` VALUES ('141022', '翼城县', '141000', '4');
INSERT INTO `cmswing_area` VALUES ('141023', '襄汾县', '141000', '5');
INSERT INTO `cmswing_area` VALUES ('141024', '洪洞县', '141000', '6');
INSERT INTO `cmswing_area` VALUES ('141025', '古　县', '141000', '7');
INSERT INTO `cmswing_area` VALUES ('141026', '安泽县', '141000', '8');
INSERT INTO `cmswing_area` VALUES ('141027', '浮山县', '141000', '9');
INSERT INTO `cmswing_area` VALUES ('141028', '吉　县', '141000', '10');
INSERT INTO `cmswing_area` VALUES ('141029', '乡宁县', '141000', '11');
INSERT INTO `cmswing_area` VALUES ('141030', '大宁县', '141000', '12');
INSERT INTO `cmswing_area` VALUES ('141031', '隰　县', '141000', '13');
INSERT INTO `cmswing_area` VALUES ('141032', '永和县', '141000', '14');
INSERT INTO `cmswing_area` VALUES ('141033', '蒲　县', '141000', '15');
INSERT INTO `cmswing_area` VALUES ('141034', '汾西县', '141000', '16');
INSERT INTO `cmswing_area` VALUES ('141081', '侯马市', '141000', '17');
INSERT INTO `cmswing_area` VALUES ('141082', '霍州市', '141000', '18');
INSERT INTO `cmswing_area` VALUES ('141101', '市辖区', '141100', '1');
INSERT INTO `cmswing_area` VALUES ('141102', '离石区', '141100', '2');
INSERT INTO `cmswing_area` VALUES ('141121', '文水县', '141100', '3');
INSERT INTO `cmswing_area` VALUES ('141122', '交城县', '141100', '4');
INSERT INTO `cmswing_area` VALUES ('141123', '兴　县', '141100', '5');
INSERT INTO `cmswing_area` VALUES ('141124', '临　县', '141100', '6');
INSERT INTO `cmswing_area` VALUES ('141125', '柳林县', '141100', '7');
INSERT INTO `cmswing_area` VALUES ('141126', '石楼县', '141100', '8');
INSERT INTO `cmswing_area` VALUES ('141127', '岚　县', '141100', '9');
INSERT INTO `cmswing_area` VALUES ('141128', '方山县', '141100', '10');
INSERT INTO `cmswing_area` VALUES ('141129', '中阳县', '141100', '11');
INSERT INTO `cmswing_area` VALUES ('141130', '交口县', '141100', '12');
INSERT INTO `cmswing_area` VALUES ('141181', '孝义市', '141100', '13');
INSERT INTO `cmswing_area` VALUES ('141182', '汾阳市', '141100', '14');
INSERT INTO `cmswing_area` VALUES ('150101', '市辖区', '150100', '1');
INSERT INTO `cmswing_area` VALUES ('150102', '新城区', '150100', '2');
INSERT INTO `cmswing_area` VALUES ('150103', '回民区', '150100', '3');
INSERT INTO `cmswing_area` VALUES ('150104', '玉泉区', '150100', '4');
INSERT INTO `cmswing_area` VALUES ('150105', '赛罕区', '150100', '5');
INSERT INTO `cmswing_area` VALUES ('150121', '土默特左旗', '150100', '6');
INSERT INTO `cmswing_area` VALUES ('150122', '托克托县', '150100', '7');
INSERT INTO `cmswing_area` VALUES ('150123', '和林格尔县', '150100', '8');
INSERT INTO `cmswing_area` VALUES ('150124', '清水河县', '150100', '9');
INSERT INTO `cmswing_area` VALUES ('150125', '武川县', '150100', '10');
INSERT INTO `cmswing_area` VALUES ('150201', '市辖区', '150200', '1');
INSERT INTO `cmswing_area` VALUES ('150202', '东河区', '150200', '2');
INSERT INTO `cmswing_area` VALUES ('150203', '昆都仑区', '150200', '3');
INSERT INTO `cmswing_area` VALUES ('150204', '青山区', '150200', '4');
INSERT INTO `cmswing_area` VALUES ('150205', '石拐区', '150200', '5');
INSERT INTO `cmswing_area` VALUES ('150206', '白云矿区', '150200', '6');
INSERT INTO `cmswing_area` VALUES ('150207', '九原区', '150200', '7');
INSERT INTO `cmswing_area` VALUES ('150221', '土默特右旗', '150200', '8');
INSERT INTO `cmswing_area` VALUES ('150222', '固阳县', '150200', '9');
INSERT INTO `cmswing_area` VALUES ('150223', '达尔罕茂明安联合旗', '150200', '10');
INSERT INTO `cmswing_area` VALUES ('150301', '市辖区', '150300', '1');
INSERT INTO `cmswing_area` VALUES ('150302', '海勃湾区', '150300', '2');
INSERT INTO `cmswing_area` VALUES ('150303', '海南区', '150300', '3');
INSERT INTO `cmswing_area` VALUES ('150304', '乌达区', '150300', '4');
INSERT INTO `cmswing_area` VALUES ('150401', '市辖区', '150400', '1');
INSERT INTO `cmswing_area` VALUES ('150402', '红山区', '150400', '2');
INSERT INTO `cmswing_area` VALUES ('150403', '元宝山区', '150400', '3');
INSERT INTO `cmswing_area` VALUES ('150404', '松山区', '150400', '4');
INSERT INTO `cmswing_area` VALUES ('150421', '阿鲁科尔沁旗', '150400', '5');
INSERT INTO `cmswing_area` VALUES ('150422', '巴林左旗', '150400', '6');
INSERT INTO `cmswing_area` VALUES ('150423', '巴林右旗', '150400', '7');
INSERT INTO `cmswing_area` VALUES ('150424', '林西县', '150400', '8');
INSERT INTO `cmswing_area` VALUES ('150425', '克什克腾旗', '150400', '9');
INSERT INTO `cmswing_area` VALUES ('150426', '翁牛特旗', '150400', '10');
INSERT INTO `cmswing_area` VALUES ('150428', '喀喇沁旗', '150400', '11');
INSERT INTO `cmswing_area` VALUES ('150429', '宁城县', '150400', '12');
INSERT INTO `cmswing_area` VALUES ('150430', '敖汉旗', '150400', '13');
INSERT INTO `cmswing_area` VALUES ('150501', '市辖区', '150500', '1');
INSERT INTO `cmswing_area` VALUES ('150502', '科尔沁区', '150500', '2');
INSERT INTO `cmswing_area` VALUES ('150521', '科尔沁左翼中旗', '150500', '3');
INSERT INTO `cmswing_area` VALUES ('150522', '科尔沁左翼后旗', '150500', '4');
INSERT INTO `cmswing_area` VALUES ('150523', '开鲁县', '150500', '5');
INSERT INTO `cmswing_area` VALUES ('150524', '库伦旗', '150500', '6');
INSERT INTO `cmswing_area` VALUES ('150525', '奈曼旗', '150500', '7');
INSERT INTO `cmswing_area` VALUES ('150526', '扎鲁特旗', '150500', '8');
INSERT INTO `cmswing_area` VALUES ('150581', '霍林郭勒市', '150500', '9');
INSERT INTO `cmswing_area` VALUES ('150602', '东胜区', '150600', '1');
INSERT INTO `cmswing_area` VALUES ('150621', '达拉特旗', '150600', '2');
INSERT INTO `cmswing_area` VALUES ('150622', '准格尔旗', '150600', '3');
INSERT INTO `cmswing_area` VALUES ('150623', '鄂托克前旗', '150600', '4');
INSERT INTO `cmswing_area` VALUES ('150624', '鄂托克旗', '150600', '5');
INSERT INTO `cmswing_area` VALUES ('150625', '杭锦旗', '150600', '6');
INSERT INTO `cmswing_area` VALUES ('150626', '乌审旗', '150600', '7');
INSERT INTO `cmswing_area` VALUES ('150627', '伊金霍洛旗', '150600', '8');
INSERT INTO `cmswing_area` VALUES ('150701', '市辖区', '150700', '1');
INSERT INTO `cmswing_area` VALUES ('150702', '海拉尔区', '150700', '2');
INSERT INTO `cmswing_area` VALUES ('150721', '阿荣旗', '150700', '3');
INSERT INTO `cmswing_area` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700', '4');
INSERT INTO `cmswing_area` VALUES ('150723', '鄂伦春自治旗', '150700', '5');
INSERT INTO `cmswing_area` VALUES ('150724', '鄂温克族自治旗', '150700', '6');
INSERT INTO `cmswing_area` VALUES ('150725', '陈巴尔虎旗', '150700', '7');
INSERT INTO `cmswing_area` VALUES ('150726', '新巴尔虎左旗', '150700', '8');
INSERT INTO `cmswing_area` VALUES ('150727', '新巴尔虎右旗', '150700', '9');
INSERT INTO `cmswing_area` VALUES ('150781', '满洲里市', '150700', '10');
INSERT INTO `cmswing_area` VALUES ('150782', '牙克石市', '150700', '11');
INSERT INTO `cmswing_area` VALUES ('150783', '扎兰屯市', '150700', '12');
INSERT INTO `cmswing_area` VALUES ('150784', '额尔古纳市', '150700', '13');
INSERT INTO `cmswing_area` VALUES ('150785', '根河市', '150700', '14');
INSERT INTO `cmswing_area` VALUES ('150801', '市辖区', '150800', '1');
INSERT INTO `cmswing_area` VALUES ('150802', '临河区', '150800', '2');
INSERT INTO `cmswing_area` VALUES ('150821', '五原县', '150800', '3');
INSERT INTO `cmswing_area` VALUES ('150822', '磴口县', '150800', '4');
INSERT INTO `cmswing_area` VALUES ('150823', '乌拉特前旗', '150800', '5');
INSERT INTO `cmswing_area` VALUES ('150824', '乌拉特中旗', '150800', '6');
INSERT INTO `cmswing_area` VALUES ('150825', '乌拉特后旗', '150800', '7');
INSERT INTO `cmswing_area` VALUES ('150826', '杭锦后旗', '150800', '8');
INSERT INTO `cmswing_area` VALUES ('150901', '市辖区', '150900', '1');
INSERT INTO `cmswing_area` VALUES ('150902', '集宁区', '150900', '2');
INSERT INTO `cmswing_area` VALUES ('150921', '卓资县', '150900', '3');
INSERT INTO `cmswing_area` VALUES ('150922', '化德县', '150900', '4');
INSERT INTO `cmswing_area` VALUES ('150923', '商都县', '150900', '5');
INSERT INTO `cmswing_area` VALUES ('150924', '兴和县', '150900', '6');
INSERT INTO `cmswing_area` VALUES ('150925', '凉城县', '150900', '7');
INSERT INTO `cmswing_area` VALUES ('150926', '察哈尔右翼前旗', '150900', '8');
INSERT INTO `cmswing_area` VALUES ('150927', '察哈尔右翼中旗', '150900', '9');
INSERT INTO `cmswing_area` VALUES ('150928', '察哈尔右翼后旗', '150900', '10');
INSERT INTO `cmswing_area` VALUES ('150929', '四子王旗', '150900', '11');
INSERT INTO `cmswing_area` VALUES ('150981', '丰镇市', '150900', '12');
INSERT INTO `cmswing_area` VALUES ('152201', '乌兰浩特市', '152200', '1');
INSERT INTO `cmswing_area` VALUES ('152202', '阿尔山市', '152200', '2');
INSERT INTO `cmswing_area` VALUES ('152221', '科尔沁右翼前旗', '152200', '3');
INSERT INTO `cmswing_area` VALUES ('152222', '科尔沁右翼中旗', '152200', '4');
INSERT INTO `cmswing_area` VALUES ('152223', '扎赉特旗', '152200', '5');
INSERT INTO `cmswing_area` VALUES ('152224', '突泉县', '152200', '6');
INSERT INTO `cmswing_area` VALUES ('152501', '二连浩特市', '152500', '1');
INSERT INTO `cmswing_area` VALUES ('152502', '锡林浩特市', '152500', '2');
INSERT INTO `cmswing_area` VALUES ('152522', '阿巴嘎旗', '152500', '3');
INSERT INTO `cmswing_area` VALUES ('152523', '苏尼特左旗', '152500', '4');
INSERT INTO `cmswing_area` VALUES ('152524', '苏尼特右旗', '152500', '5');
INSERT INTO `cmswing_area` VALUES ('152525', '东乌珠穆沁旗', '152500', '6');
INSERT INTO `cmswing_area` VALUES ('152526', '西乌珠穆沁旗', '152500', '7');
INSERT INTO `cmswing_area` VALUES ('152527', '太仆寺旗', '152500', '8');
INSERT INTO `cmswing_area` VALUES ('152528', '镶黄旗', '152500', '9');
INSERT INTO `cmswing_area` VALUES ('152529', '正镶白旗', '152500', '10');
INSERT INTO `cmswing_area` VALUES ('152530', '正蓝旗', '152500', '11');
INSERT INTO `cmswing_area` VALUES ('152531', '多伦县', '152500', '12');
INSERT INTO `cmswing_area` VALUES ('152921', '阿拉善左旗', '152900', '1');
INSERT INTO `cmswing_area` VALUES ('152922', '阿拉善右旗', '152900', '2');
INSERT INTO `cmswing_area` VALUES ('152923', '额济纳旗', '152900', '3');
INSERT INTO `cmswing_area` VALUES ('210101', '市辖区', '210100', '1');
INSERT INTO `cmswing_area` VALUES ('210102', '和平区', '210100', '2');
INSERT INTO `cmswing_area` VALUES ('210103', '沈河区', '210100', '3');
INSERT INTO `cmswing_area` VALUES ('210104', '大东区', '210100', '4');
INSERT INTO `cmswing_area` VALUES ('210105', '皇姑区', '210100', '5');
INSERT INTO `cmswing_area` VALUES ('210106', '铁西区', '210100', '6');
INSERT INTO `cmswing_area` VALUES ('210111', '苏家屯区', '210100', '7');
INSERT INTO `cmswing_area` VALUES ('210112', '东陵区', '210100', '8');
INSERT INTO `cmswing_area` VALUES ('210113', '新城子区', '210100', '9');
INSERT INTO `cmswing_area` VALUES ('210114', '于洪区', '210100', '10');
INSERT INTO `cmswing_area` VALUES ('210122', '辽中县', '210100', '11');
INSERT INTO `cmswing_area` VALUES ('210123', '康平县', '210100', '12');
INSERT INTO `cmswing_area` VALUES ('210124', '法库县', '210100', '13');
INSERT INTO `cmswing_area` VALUES ('210181', '新民市', '210100', '14');
INSERT INTO `cmswing_area` VALUES ('210201', '市辖区', '210200', '1');
INSERT INTO `cmswing_area` VALUES ('210202', '中山区', '210200', '2');
INSERT INTO `cmswing_area` VALUES ('210203', '西岗区', '210200', '3');
INSERT INTO `cmswing_area` VALUES ('210204', '沙河口区', '210200', '4');
INSERT INTO `cmswing_area` VALUES ('210211', '甘井子区', '210200', '5');
INSERT INTO `cmswing_area` VALUES ('210212', '旅顺口区', '210200', '6');
INSERT INTO `cmswing_area` VALUES ('210213', '金州区', '210200', '7');
INSERT INTO `cmswing_area` VALUES ('210224', '长海县', '210200', '8');
INSERT INTO `cmswing_area` VALUES ('210281', '瓦房店市', '210200', '9');
INSERT INTO `cmswing_area` VALUES ('210282', '普兰店市', '210200', '10');
INSERT INTO `cmswing_area` VALUES ('210283', '庄河市', '210200', '11');
INSERT INTO `cmswing_area` VALUES ('210301', '市辖区', '210300', '1');
INSERT INTO `cmswing_area` VALUES ('210302', '铁东区', '210300', '2');
INSERT INTO `cmswing_area` VALUES ('210303', '铁西区', '210300', '3');
INSERT INTO `cmswing_area` VALUES ('210304', '立山区', '210300', '4');
INSERT INTO `cmswing_area` VALUES ('210311', '千山区', '210300', '5');
INSERT INTO `cmswing_area` VALUES ('210321', '台安县', '210300', '6');
INSERT INTO `cmswing_area` VALUES ('210323', '岫岩满族自治县', '210300', '7');
INSERT INTO `cmswing_area` VALUES ('210381', '海城市', '210300', '8');
INSERT INTO `cmswing_area` VALUES ('210401', '市辖区', '210400', '1');
INSERT INTO `cmswing_area` VALUES ('210402', '新抚区', '210400', '2');
INSERT INTO `cmswing_area` VALUES ('210403', '东洲区', '210400', '3');
INSERT INTO `cmswing_area` VALUES ('210404', '望花区', '210400', '4');
INSERT INTO `cmswing_area` VALUES ('210411', '顺城区', '210400', '5');
INSERT INTO `cmswing_area` VALUES ('210421', '抚顺县', '210400', '6');
INSERT INTO `cmswing_area` VALUES ('210422', '新宾满族自治县', '210400', '7');
INSERT INTO `cmswing_area` VALUES ('210423', '清原满族自治县', '210400', '8');
INSERT INTO `cmswing_area` VALUES ('210501', '市辖区', '210500', '1');
INSERT INTO `cmswing_area` VALUES ('210502', '平山区', '210500', '2');
INSERT INTO `cmswing_area` VALUES ('210503', '溪湖区', '210500', '3');
INSERT INTO `cmswing_area` VALUES ('210504', '明山区', '210500', '4');
INSERT INTO `cmswing_area` VALUES ('210505', '南芬区', '210500', '5');
INSERT INTO `cmswing_area` VALUES ('210521', '本溪满族自治县', '210500', '6');
INSERT INTO `cmswing_area` VALUES ('210522', '桓仁满族自治县', '210500', '7');
INSERT INTO `cmswing_area` VALUES ('210601', '市辖区', '210600', '1');
INSERT INTO `cmswing_area` VALUES ('210602', '元宝区', '210600', '2');
INSERT INTO `cmswing_area` VALUES ('210603', '振兴区', '210600', '3');
INSERT INTO `cmswing_area` VALUES ('210604', '振安区', '210600', '4');
INSERT INTO `cmswing_area` VALUES ('210624', '宽甸满族自治县', '210600', '5');
INSERT INTO `cmswing_area` VALUES ('210681', '东港市', '210600', '6');
INSERT INTO `cmswing_area` VALUES ('210682', '凤城市', '210600', '7');
INSERT INTO `cmswing_area` VALUES ('210701', '市辖区', '210700', '1');
INSERT INTO `cmswing_area` VALUES ('210702', '古塔区', '210700', '2');
INSERT INTO `cmswing_area` VALUES ('210703', '凌河区', '210700', '3');
INSERT INTO `cmswing_area` VALUES ('210711', '太和区', '210700', '4');
INSERT INTO `cmswing_area` VALUES ('210726', '黑山县', '210700', '5');
INSERT INTO `cmswing_area` VALUES ('210727', '义　县', '210700', '6');
INSERT INTO `cmswing_area` VALUES ('210781', '凌海市', '210700', '7');
INSERT INTO `cmswing_area` VALUES ('210782', '北宁市', '210700', '8');
INSERT INTO `cmswing_area` VALUES ('210801', '市辖区', '210800', '1');
INSERT INTO `cmswing_area` VALUES ('210802', '站前区', '210800', '2');
INSERT INTO `cmswing_area` VALUES ('210803', '西市区', '210800', '3');
INSERT INTO `cmswing_area` VALUES ('210804', '鲅鱼圈区', '210800', '4');
INSERT INTO `cmswing_area` VALUES ('210811', '老边区', '210800', '5');
INSERT INTO `cmswing_area` VALUES ('210881', '盖州市', '210800', '6');
INSERT INTO `cmswing_area` VALUES ('210882', '大石桥市', '210800', '7');
INSERT INTO `cmswing_area` VALUES ('210901', '市辖区', '210900', '1');
INSERT INTO `cmswing_area` VALUES ('210902', '海州区', '210900', '2');
INSERT INTO `cmswing_area` VALUES ('210903', '新邱区', '210900', '3');
INSERT INTO `cmswing_area` VALUES ('210904', '太平区', '210900', '4');
INSERT INTO `cmswing_area` VALUES ('210905', '清河门区', '210900', '5');
INSERT INTO `cmswing_area` VALUES ('210911', '细河区', '210900', '6');
INSERT INTO `cmswing_area` VALUES ('210921', '阜新蒙古族自治县', '210900', '7');
INSERT INTO `cmswing_area` VALUES ('210922', '彰武县', '210900', '8');
INSERT INTO `cmswing_area` VALUES ('211001', '市辖区', '211000', '1');
INSERT INTO `cmswing_area` VALUES ('211002', '白塔区', '211000', '2');
INSERT INTO `cmswing_area` VALUES ('211003', '文圣区', '211000', '3');
INSERT INTO `cmswing_area` VALUES ('211004', '宏伟区', '211000', '4');
INSERT INTO `cmswing_area` VALUES ('211005', '弓长岭区', '211000', '5');
INSERT INTO `cmswing_area` VALUES ('211011', '太子河区', '211000', '6');
INSERT INTO `cmswing_area` VALUES ('211021', '辽阳县', '211000', '7');
INSERT INTO `cmswing_area` VALUES ('211081', '灯塔市', '211000', '8');
INSERT INTO `cmswing_area` VALUES ('211101', '市辖区', '211100', '1');
INSERT INTO `cmswing_area` VALUES ('211102', '双台子区', '211100', '2');
INSERT INTO `cmswing_area` VALUES ('211103', '兴隆台区', '211100', '3');
INSERT INTO `cmswing_area` VALUES ('211121', '大洼县', '211100', '4');
INSERT INTO `cmswing_area` VALUES ('211122', '盘山县', '211100', '5');
INSERT INTO `cmswing_area` VALUES ('211201', '市辖区', '211200', '1');
INSERT INTO `cmswing_area` VALUES ('211202', '银州区', '211200', '2');
INSERT INTO `cmswing_area` VALUES ('211204', '清河区', '211200', '3');
INSERT INTO `cmswing_area` VALUES ('211221', '铁岭县', '211200', '4');
INSERT INTO `cmswing_area` VALUES ('211223', '西丰县', '211200', '5');
INSERT INTO `cmswing_area` VALUES ('211224', '昌图县', '211200', '6');
INSERT INTO `cmswing_area` VALUES ('211281', '调兵山市', '211200', '7');
INSERT INTO `cmswing_area` VALUES ('211282', '开原市', '211200', '8');
INSERT INTO `cmswing_area` VALUES ('211301', '市辖区', '211300', '1');
INSERT INTO `cmswing_area` VALUES ('211302', '双塔区', '211300', '2');
INSERT INTO `cmswing_area` VALUES ('211303', '龙城区', '211300', '3');
INSERT INTO `cmswing_area` VALUES ('211321', '朝阳县', '211300', '4');
INSERT INTO `cmswing_area` VALUES ('211322', '建平县', '211300', '5');
INSERT INTO `cmswing_area` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300', '6');
INSERT INTO `cmswing_area` VALUES ('211381', '北票市', '211300', '7');
INSERT INTO `cmswing_area` VALUES ('211382', '凌源市', '211300', '8');
INSERT INTO `cmswing_area` VALUES ('211401', '市辖区', '211400', '1');
INSERT INTO `cmswing_area` VALUES ('211402', '连山区', '211400', '2');
INSERT INTO `cmswing_area` VALUES ('211403', '龙港区', '211400', '3');
INSERT INTO `cmswing_area` VALUES ('211404', '南票区', '211400', '4');
INSERT INTO `cmswing_area` VALUES ('211421', '绥中县', '211400', '5');
INSERT INTO `cmswing_area` VALUES ('211422', '建昌县', '211400', '6');
INSERT INTO `cmswing_area` VALUES ('211481', '兴城市', '211400', '7');
INSERT INTO `cmswing_area` VALUES ('220101', '市辖区', '220100', '1');
INSERT INTO `cmswing_area` VALUES ('220102', '南关区', '220100', '2');
INSERT INTO `cmswing_area` VALUES ('220103', '宽城区', '220100', '3');
INSERT INTO `cmswing_area` VALUES ('220104', '朝阳区', '220100', '4');
INSERT INTO `cmswing_area` VALUES ('220105', '二道区', '220100', '5');
INSERT INTO `cmswing_area` VALUES ('220106', '绿园区', '220100', '6');
INSERT INTO `cmswing_area` VALUES ('220112', '双阳区', '220100', '7');
INSERT INTO `cmswing_area` VALUES ('220122', '农安县', '220100', '8');
INSERT INTO `cmswing_area` VALUES ('220181', '九台市', '220100', '9');
INSERT INTO `cmswing_area` VALUES ('220182', '榆树市', '220100', '10');
INSERT INTO `cmswing_area` VALUES ('220183', '德惠市', '220100', '11');
INSERT INTO `cmswing_area` VALUES ('220201', '市辖区', '220200', '1');
INSERT INTO `cmswing_area` VALUES ('220202', '昌邑区', '220200', '2');
INSERT INTO `cmswing_area` VALUES ('220203', '龙潭区', '220200', '3');
INSERT INTO `cmswing_area` VALUES ('220204', '船营区', '220200', '4');
INSERT INTO `cmswing_area` VALUES ('220211', '丰满区', '220200', '5');
INSERT INTO `cmswing_area` VALUES ('220221', '永吉县', '220200', '6');
INSERT INTO `cmswing_area` VALUES ('220281', '蛟河市', '220200', '7');
INSERT INTO `cmswing_area` VALUES ('220282', '桦甸市', '220200', '8');
INSERT INTO `cmswing_area` VALUES ('220283', '舒兰市', '220200', '9');
INSERT INTO `cmswing_area` VALUES ('220284', '磐石市', '220200', '10');
INSERT INTO `cmswing_area` VALUES ('220301', '市辖区', '220300', '1');
INSERT INTO `cmswing_area` VALUES ('220302', '铁西区', '220300', '2');
INSERT INTO `cmswing_area` VALUES ('220303', '铁东区', '220300', '3');
INSERT INTO `cmswing_area` VALUES ('220322', '梨树县', '220300', '4');
INSERT INTO `cmswing_area` VALUES ('220323', '伊通满族自治县', '220300', '5');
INSERT INTO `cmswing_area` VALUES ('220381', '公主岭市', '220300', '6');
INSERT INTO `cmswing_area` VALUES ('220382', '双辽市', '220300', '7');
INSERT INTO `cmswing_area` VALUES ('220401', '市辖区', '220400', '1');
INSERT INTO `cmswing_area` VALUES ('220402', '龙山区', '220400', '2');
INSERT INTO `cmswing_area` VALUES ('220403', '西安区', '220400', '3');
INSERT INTO `cmswing_area` VALUES ('220421', '东丰县', '220400', '4');
INSERT INTO `cmswing_area` VALUES ('220422', '东辽县', '220400', '5');
INSERT INTO `cmswing_area` VALUES ('220501', '市辖区', '220500', '1');
INSERT INTO `cmswing_area` VALUES ('220502', '东昌区', '220500', '2');
INSERT INTO `cmswing_area` VALUES ('220503', '二道江区', '220500', '3');
INSERT INTO `cmswing_area` VALUES ('220521', '通化县', '220500', '4');
INSERT INTO `cmswing_area` VALUES ('220523', '辉南县', '220500', '5');
INSERT INTO `cmswing_area` VALUES ('220524', '柳河县', '220500', '6');
INSERT INTO `cmswing_area` VALUES ('220581', '梅河口市', '220500', '7');
INSERT INTO `cmswing_area` VALUES ('220582', '集安市', '220500', '8');
INSERT INTO `cmswing_area` VALUES ('220601', '市辖区', '220600', '1');
INSERT INTO `cmswing_area` VALUES ('220602', '八道江区', '220600', '2');
INSERT INTO `cmswing_area` VALUES ('220621', '抚松县', '220600', '3');
INSERT INTO `cmswing_area` VALUES ('220622', '靖宇县', '220600', '4');
INSERT INTO `cmswing_area` VALUES ('220623', '长白朝鲜族自治县', '220600', '5');
INSERT INTO `cmswing_area` VALUES ('220625', '江源县', '220600', '6');
INSERT INTO `cmswing_area` VALUES ('220681', '临江市', '220600', '7');
INSERT INTO `cmswing_area` VALUES ('220701', '市辖区', '220700', '1');
INSERT INTO `cmswing_area` VALUES ('220702', '宁江区', '220700', '2');
INSERT INTO `cmswing_area` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700', '3');
INSERT INTO `cmswing_area` VALUES ('220722', '长岭县', '220700', '4');
INSERT INTO `cmswing_area` VALUES ('220723', '乾安县', '220700', '5');
INSERT INTO `cmswing_area` VALUES ('220724', '扶余县', '220700', '6');
INSERT INTO `cmswing_area` VALUES ('220801', '市辖区', '220800', '1');
INSERT INTO `cmswing_area` VALUES ('220802', '洮北区', '220800', '2');
INSERT INTO `cmswing_area` VALUES ('220821', '镇赉县', '220800', '3');
INSERT INTO `cmswing_area` VALUES ('220822', '通榆县', '220800', '4');
INSERT INTO `cmswing_area` VALUES ('220881', '洮南市', '220800', '5');
INSERT INTO `cmswing_area` VALUES ('220882', '大安市', '220800', '6');
INSERT INTO `cmswing_area` VALUES ('222401', '延吉市', '222400', '1');
INSERT INTO `cmswing_area` VALUES ('222402', '图们市', '222400', '2');
INSERT INTO `cmswing_area` VALUES ('222403', '敦化市', '222400', '3');
INSERT INTO `cmswing_area` VALUES ('222404', '珲春市', '222400', '4');
INSERT INTO `cmswing_area` VALUES ('222405', '龙井市', '222400', '5');
INSERT INTO `cmswing_area` VALUES ('222406', '和龙市', '222400', '6');
INSERT INTO `cmswing_area` VALUES ('222424', '汪清县', '222400', '7');
INSERT INTO `cmswing_area` VALUES ('222426', '安图县', '222400', '8');
INSERT INTO `cmswing_area` VALUES ('230101', '市辖区', '230100', '1');
INSERT INTO `cmswing_area` VALUES ('230102', '道里区', '230100', '2');
INSERT INTO `cmswing_area` VALUES ('230103', '南岗区', '230100', '3');
INSERT INTO `cmswing_area` VALUES ('230104', '道外区', '230100', '4');
INSERT INTO `cmswing_area` VALUES ('230106', '香坊区', '230100', '5');
INSERT INTO `cmswing_area` VALUES ('230107', '动力区', '230100', '6');
INSERT INTO `cmswing_area` VALUES ('230108', '平房区', '230100', '7');
INSERT INTO `cmswing_area` VALUES ('230109', '松北区', '230100', '8');
INSERT INTO `cmswing_area` VALUES ('230111', '呼兰区', '230100', '9');
INSERT INTO `cmswing_area` VALUES ('230123', '依兰县', '230100', '10');
INSERT INTO `cmswing_area` VALUES ('230124', '方正县', '230100', '11');
INSERT INTO `cmswing_area` VALUES ('230125', '宾　县', '230100', '12');
INSERT INTO `cmswing_area` VALUES ('230126', '巴彦县', '230100', '13');
INSERT INTO `cmswing_area` VALUES ('230127', '木兰县', '230100', '14');
INSERT INTO `cmswing_area` VALUES ('230128', '通河县', '230100', '15');
INSERT INTO `cmswing_area` VALUES ('230129', '延寿县', '230100', '16');
INSERT INTO `cmswing_area` VALUES ('230181', '阿城市', '230100', '17');
INSERT INTO `cmswing_area` VALUES ('230182', '双城市', '230100', '18');
INSERT INTO `cmswing_area` VALUES ('230183', '尚志市', '230100', '19');
INSERT INTO `cmswing_area` VALUES ('230184', '五常市', '230100', '20');
INSERT INTO `cmswing_area` VALUES ('230201', '市辖区', '230200', '1');
INSERT INTO `cmswing_area` VALUES ('230202', '龙沙区', '230200', '2');
INSERT INTO `cmswing_area` VALUES ('230203', '建华区', '230200', '3');
INSERT INTO `cmswing_area` VALUES ('230204', '铁锋区', '230200', '4');
INSERT INTO `cmswing_area` VALUES ('230205', '昂昂溪区', '230200', '5');
INSERT INTO `cmswing_area` VALUES ('230206', '富拉尔基区', '230200', '6');
INSERT INTO `cmswing_area` VALUES ('230207', '碾子山区', '230200', '7');
INSERT INTO `cmswing_area` VALUES ('230208', '梅里斯达斡尔族区', '230200', '8');
INSERT INTO `cmswing_area` VALUES ('230221', '龙江县', '230200', '9');
INSERT INTO `cmswing_area` VALUES ('230223', '依安县', '230200', '10');
INSERT INTO `cmswing_area` VALUES ('230224', '泰来县', '230200', '11');
INSERT INTO `cmswing_area` VALUES ('230225', '甘南县', '230200', '12');
INSERT INTO `cmswing_area` VALUES ('230227', '富裕县', '230200', '13');
INSERT INTO `cmswing_area` VALUES ('230229', '克山县', '230200', '14');
INSERT INTO `cmswing_area` VALUES ('230230', '克东县', '230200', '15');
INSERT INTO `cmswing_area` VALUES ('230231', '拜泉县', '230200', '16');
INSERT INTO `cmswing_area` VALUES ('230281', '讷河市', '230200', '17');
INSERT INTO `cmswing_area` VALUES ('230301', '市辖区', '230300', '1');
INSERT INTO `cmswing_area` VALUES ('230302', '鸡冠区', '230300', '2');
INSERT INTO `cmswing_area` VALUES ('230303', '恒山区', '230300', '3');
INSERT INTO `cmswing_area` VALUES ('230304', '滴道区', '230300', '4');
INSERT INTO `cmswing_area` VALUES ('230305', '梨树区', '230300', '5');
INSERT INTO `cmswing_area` VALUES ('230306', '城子河区', '230300', '6');
INSERT INTO `cmswing_area` VALUES ('230307', '麻山区', '230300', '7');
INSERT INTO `cmswing_area` VALUES ('230321', '鸡东县', '230300', '8');
INSERT INTO `cmswing_area` VALUES ('230381', '虎林市', '230300', '9');
INSERT INTO `cmswing_area` VALUES ('230382', '密山市', '230300', '10');
INSERT INTO `cmswing_area` VALUES ('230401', '市辖区', '230400', '1');
INSERT INTO `cmswing_area` VALUES ('230402', '向阳区', '230400', '2');
INSERT INTO `cmswing_area` VALUES ('230403', '工农区', '230400', '3');
INSERT INTO `cmswing_area` VALUES ('230404', '南山区', '230400', '4');
INSERT INTO `cmswing_area` VALUES ('230405', '兴安区', '230400', '5');
INSERT INTO `cmswing_area` VALUES ('230406', '东山区', '230400', '6');
INSERT INTO `cmswing_area` VALUES ('230407', '兴山区', '230400', '7');
INSERT INTO `cmswing_area` VALUES ('230421', '萝北县', '230400', '8');
INSERT INTO `cmswing_area` VALUES ('230422', '绥滨县', '230400', '9');
INSERT INTO `cmswing_area` VALUES ('230501', '市辖区', '230500', '1');
INSERT INTO `cmswing_area` VALUES ('230502', '尖山区', '230500', '2');
INSERT INTO `cmswing_area` VALUES ('230503', '岭东区', '230500', '3');
INSERT INTO `cmswing_area` VALUES ('230505', '四方台区', '230500', '4');
INSERT INTO `cmswing_area` VALUES ('230506', '宝山区', '230500', '5');
INSERT INTO `cmswing_area` VALUES ('230521', '集贤县', '230500', '6');
INSERT INTO `cmswing_area` VALUES ('230522', '友谊县', '230500', '7');
INSERT INTO `cmswing_area` VALUES ('230523', '宝清县', '230500', '8');
INSERT INTO `cmswing_area` VALUES ('230524', '饶河县', '230500', '9');
INSERT INTO `cmswing_area` VALUES ('230601', '市辖区', '230600', '1');
INSERT INTO `cmswing_area` VALUES ('230602', '萨尔图区', '230600', '2');
INSERT INTO `cmswing_area` VALUES ('230603', '龙凤区', '230600', '3');
INSERT INTO `cmswing_area` VALUES ('230604', '让胡路区', '230600', '4');
INSERT INTO `cmswing_area` VALUES ('230605', '红岗区', '230600', '5');
INSERT INTO `cmswing_area` VALUES ('230606', '大同区', '230600', '6');
INSERT INTO `cmswing_area` VALUES ('230621', '肇州县', '230600', '7');
INSERT INTO `cmswing_area` VALUES ('230622', '肇源县', '230600', '8');
INSERT INTO `cmswing_area` VALUES ('230623', '林甸县', '230600', '9');
INSERT INTO `cmswing_area` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600', '10');
INSERT INTO `cmswing_area` VALUES ('230701', '市辖区', '230700', '1');
INSERT INTO `cmswing_area` VALUES ('230702', '伊春区', '230700', '2');
INSERT INTO `cmswing_area` VALUES ('230703', '南岔区', '230700', '3');
INSERT INTO `cmswing_area` VALUES ('230704', '友好区', '230700', '4');
INSERT INTO `cmswing_area` VALUES ('230705', '西林区', '230700', '5');
INSERT INTO `cmswing_area` VALUES ('230706', '翠峦区', '230700', '6');
INSERT INTO `cmswing_area` VALUES ('230707', '新青区', '230700', '7');
INSERT INTO `cmswing_area` VALUES ('230708', '美溪区', '230700', '8');
INSERT INTO `cmswing_area` VALUES ('230709', '金山屯区', '230700', '9');
INSERT INTO `cmswing_area` VALUES ('230710', '五营区', '230700', '10');
INSERT INTO `cmswing_area` VALUES ('230711', '乌马河区', '230700', '11');
INSERT INTO `cmswing_area` VALUES ('230712', '汤旺河区', '230700', '12');
INSERT INTO `cmswing_area` VALUES ('230713', '带岭区', '230700', '13');
INSERT INTO `cmswing_area` VALUES ('230714', '乌伊岭区', '230700', '14');
INSERT INTO `cmswing_area` VALUES ('230715', '红星区', '230700', '15');
INSERT INTO `cmswing_area` VALUES ('230716', '上甘岭区', '230700', '16');
INSERT INTO `cmswing_area` VALUES ('230722', '嘉荫县', '230700', '17');
INSERT INTO `cmswing_area` VALUES ('230781', '铁力市', '230700', '18');
INSERT INTO `cmswing_area` VALUES ('230801', '市辖区', '230800', '1');
INSERT INTO `cmswing_area` VALUES ('230802', '永红区', '230800', '2');
INSERT INTO `cmswing_area` VALUES ('230803', '向阳区', '230800', '3');
INSERT INTO `cmswing_area` VALUES ('230804', '前进区', '230800', '4');
INSERT INTO `cmswing_area` VALUES ('230805', '东风区', '230800', '5');
INSERT INTO `cmswing_area` VALUES ('230811', '郊　区', '230800', '6');
INSERT INTO `cmswing_area` VALUES ('230822', '桦南县', '230800', '7');
INSERT INTO `cmswing_area` VALUES ('230826', '桦川县', '230800', '8');
INSERT INTO `cmswing_area` VALUES ('230828', '汤原县', '230800', '9');
INSERT INTO `cmswing_area` VALUES ('230833', '抚远县', '230800', '10');
INSERT INTO `cmswing_area` VALUES ('230881', '同江市', '230800', '11');
INSERT INTO `cmswing_area` VALUES ('230882', '富锦市', '230800', '12');
INSERT INTO `cmswing_area` VALUES ('230901', '市辖区', '230900', '1');
INSERT INTO `cmswing_area` VALUES ('230902', '新兴区', '230900', '2');
INSERT INTO `cmswing_area` VALUES ('230903', '桃山区', '230900', '3');
INSERT INTO `cmswing_area` VALUES ('230904', '茄子河区', '230900', '4');
INSERT INTO `cmswing_area` VALUES ('230921', '勃利县', '230900', '5');
INSERT INTO `cmswing_area` VALUES ('231001', '市辖区', '231000', '1');
INSERT INTO `cmswing_area` VALUES ('231002', '东安区', '231000', '2');
INSERT INTO `cmswing_area` VALUES ('231003', '阳明区', '231000', '3');
INSERT INTO `cmswing_area` VALUES ('231004', '爱民区', '231000', '4');
INSERT INTO `cmswing_area` VALUES ('231005', '西安区', '231000', '5');
INSERT INTO `cmswing_area` VALUES ('231024', '东宁县', '231000', '6');
INSERT INTO `cmswing_area` VALUES ('231025', '林口县', '231000', '7');
INSERT INTO `cmswing_area` VALUES ('231081', '绥芬河市', '231000', '8');
INSERT INTO `cmswing_area` VALUES ('231083', '海林市', '231000', '9');
INSERT INTO `cmswing_area` VALUES ('231084', '宁安市', '231000', '10');
INSERT INTO `cmswing_area` VALUES ('231085', '穆棱市', '231000', '11');
INSERT INTO `cmswing_area` VALUES ('231101', '市辖区', '231100', '1');
INSERT INTO `cmswing_area` VALUES ('231102', '爱辉区', '231100', '2');
INSERT INTO `cmswing_area` VALUES ('231121', '嫩江县', '231100', '3');
INSERT INTO `cmswing_area` VALUES ('231123', '逊克县', '231100', '4');
INSERT INTO `cmswing_area` VALUES ('231124', '孙吴县', '231100', '5');
INSERT INTO `cmswing_area` VALUES ('231181', '北安市', '231100', '6');
INSERT INTO `cmswing_area` VALUES ('231182', '五大连池市', '231100', '7');
INSERT INTO `cmswing_area` VALUES ('231201', '市辖区', '231200', '1');
INSERT INTO `cmswing_area` VALUES ('231202', '北林区', '231200', '2');
INSERT INTO `cmswing_area` VALUES ('231221', '望奎县', '231200', '3');
INSERT INTO `cmswing_area` VALUES ('231222', '兰西县', '231200', '4');
INSERT INTO `cmswing_area` VALUES ('231223', '青冈县', '231200', '5');
INSERT INTO `cmswing_area` VALUES ('231224', '庆安县', '231200', '6');
INSERT INTO `cmswing_area` VALUES ('231225', '明水县', '231200', '7');
INSERT INTO `cmswing_area` VALUES ('231226', '绥棱县', '231200', '8');
INSERT INTO `cmswing_area` VALUES ('231281', '安达市', '231200', '9');
INSERT INTO `cmswing_area` VALUES ('231282', '肇东市', '231200', '10');
INSERT INTO `cmswing_area` VALUES ('231283', '海伦市', '231200', '11');
INSERT INTO `cmswing_area` VALUES ('232721', '呼玛县', '232700', '1');
INSERT INTO `cmswing_area` VALUES ('232722', '塔河县', '232700', '2');
INSERT INTO `cmswing_area` VALUES ('232723', '漠河县', '232700', '3');
INSERT INTO `cmswing_area` VALUES ('310101', '黄浦区', '310100', '1');
INSERT INTO `cmswing_area` VALUES ('310103', '卢湾区', '310100', '2');
INSERT INTO `cmswing_area` VALUES ('310104', '徐汇区', '310100', '3');
INSERT INTO `cmswing_area` VALUES ('310105', '长宁区', '310100', '4');
INSERT INTO `cmswing_area` VALUES ('310106', '静安区', '310100', '5');
INSERT INTO `cmswing_area` VALUES ('310107', '普陀区', '310100', '6');
INSERT INTO `cmswing_area` VALUES ('310108', '闸北区', '310100', '7');
INSERT INTO `cmswing_area` VALUES ('310109', '虹口区', '310100', '8');
INSERT INTO `cmswing_area` VALUES ('310110', '杨浦区', '310100', '9');
INSERT INTO `cmswing_area` VALUES ('310112', '闵行区', '310100', '10');
INSERT INTO `cmswing_area` VALUES ('310113', '宝山区', '310100', '11');
INSERT INTO `cmswing_area` VALUES ('310114', '嘉定区', '310100', '12');
INSERT INTO `cmswing_area` VALUES ('310115', '浦东新区', '310100', '13');
INSERT INTO `cmswing_area` VALUES ('310116', '金山区', '310100', '14');
INSERT INTO `cmswing_area` VALUES ('310117', '松江区', '310100', '15');
INSERT INTO `cmswing_area` VALUES ('310118', '青浦区', '310100', '16');
INSERT INTO `cmswing_area` VALUES ('310119', '南汇区', '310100', '17');
INSERT INTO `cmswing_area` VALUES ('310120', '奉贤区', '310100', '18');
INSERT INTO `cmswing_area` VALUES ('310230', '崇明县', '310200', '1');
INSERT INTO `cmswing_area` VALUES ('320101', '市辖区', '320100', '1');
INSERT INTO `cmswing_area` VALUES ('320102', '玄武区', '320100', '2');
INSERT INTO `cmswing_area` VALUES ('320103', '白下区', '320100', '3');
INSERT INTO `cmswing_area` VALUES ('320104', '秦淮区', '320100', '4');
INSERT INTO `cmswing_area` VALUES ('320105', '建邺区', '320100', '5');
INSERT INTO `cmswing_area` VALUES ('320106', '鼓楼区', '320100', '6');
INSERT INTO `cmswing_area` VALUES ('320107', '下关区', '320100', '7');
INSERT INTO `cmswing_area` VALUES ('320111', '浦口区', '320100', '8');
INSERT INTO `cmswing_area` VALUES ('320113', '栖霞区', '320100', '9');
INSERT INTO `cmswing_area` VALUES ('320114', '雨花台区', '320100', '10');
INSERT INTO `cmswing_area` VALUES ('320115', '江宁区', '320100', '11');
INSERT INTO `cmswing_area` VALUES ('320116', '六合区', '320100', '12');
INSERT INTO `cmswing_area` VALUES ('320124', '溧水县', '320100', '13');
INSERT INTO `cmswing_area` VALUES ('320125', '高淳县', '320100', '14');
INSERT INTO `cmswing_area` VALUES ('320201', '市辖区', '320200', '1');
INSERT INTO `cmswing_area` VALUES ('320202', '崇安区', '320200', '2');
INSERT INTO `cmswing_area` VALUES ('320203', '南长区', '320200', '3');
INSERT INTO `cmswing_area` VALUES ('320204', '北塘区', '320200', '4');
INSERT INTO `cmswing_area` VALUES ('320205', '锡山区', '320200', '5');
INSERT INTO `cmswing_area` VALUES ('320206', '惠山区', '320200', '6');
INSERT INTO `cmswing_area` VALUES ('320211', '滨湖区', '320200', '7');
INSERT INTO `cmswing_area` VALUES ('320281', '江阴市', '320200', '8');
INSERT INTO `cmswing_area` VALUES ('320282', '宜兴市', '320200', '9');
INSERT INTO `cmswing_area` VALUES ('320301', '市辖区', '320300', '1');
INSERT INTO `cmswing_area` VALUES ('320302', '鼓楼区', '320300', '2');
INSERT INTO `cmswing_area` VALUES ('320303', '云龙区', '320300', '3');
INSERT INTO `cmswing_area` VALUES ('320304', '九里区', '320300', '4');
INSERT INTO `cmswing_area` VALUES ('320305', '贾汪区', '320300', '5');
INSERT INTO `cmswing_area` VALUES ('320311', '泉山区', '320300', '6');
INSERT INTO `cmswing_area` VALUES ('320321', '丰　县', '320300', '7');
INSERT INTO `cmswing_area` VALUES ('320322', '沛　县', '320300', '8');
INSERT INTO `cmswing_area` VALUES ('320323', '铜山县', '320300', '9');
INSERT INTO `cmswing_area` VALUES ('320324', '睢宁县', '320300', '10');
INSERT INTO `cmswing_area` VALUES ('320381', '新沂市', '320300', '11');
INSERT INTO `cmswing_area` VALUES ('320382', '邳州市', '320300', '12');
INSERT INTO `cmswing_area` VALUES ('320401', '市辖区', '320400', '1');
INSERT INTO `cmswing_area` VALUES ('320402', '天宁区', '320400', '2');
INSERT INTO `cmswing_area` VALUES ('320404', '钟楼区', '320400', '3');
INSERT INTO `cmswing_area` VALUES ('320405', '戚墅堰区', '320400', '4');
INSERT INTO `cmswing_area` VALUES ('320411', '新北区', '320400', '5');
INSERT INTO `cmswing_area` VALUES ('320412', '武进区', '320400', '6');
INSERT INTO `cmswing_area` VALUES ('320481', '溧阳市', '320400', '7');
INSERT INTO `cmswing_area` VALUES ('320482', '金坛市', '320400', '8');
INSERT INTO `cmswing_area` VALUES ('320501', '市辖区', '320500', '1');
INSERT INTO `cmswing_area` VALUES ('320502', '沧浪区', '320500', '2');
INSERT INTO `cmswing_area` VALUES ('320503', '平江区', '320500', '3');
INSERT INTO `cmswing_area` VALUES ('320504', '金阊区', '320500', '4');
INSERT INTO `cmswing_area` VALUES ('320505', '虎丘区', '320500', '5');
INSERT INTO `cmswing_area` VALUES ('320506', '吴中区', '320500', '6');
INSERT INTO `cmswing_area` VALUES ('320507', '相城区', '320500', '7');
INSERT INTO `cmswing_area` VALUES ('320581', '常熟市', '320500', '8');
INSERT INTO `cmswing_area` VALUES ('320582', '张家港市', '320500', '9');
INSERT INTO `cmswing_area` VALUES ('320583', '昆山市', '320500', '10');
INSERT INTO `cmswing_area` VALUES ('320584', '吴江市', '320500', '11');
INSERT INTO `cmswing_area` VALUES ('320585', '太仓市', '320500', '12');
INSERT INTO `cmswing_area` VALUES ('320601', '市辖区', '320600', '1');
INSERT INTO `cmswing_area` VALUES ('320602', '崇川区', '320600', '2');
INSERT INTO `cmswing_area` VALUES ('320611', '港闸区', '320600', '3');
INSERT INTO `cmswing_area` VALUES ('320621', '海安县', '320600', '4');
INSERT INTO `cmswing_area` VALUES ('320623', '如东县', '320600', '5');
INSERT INTO `cmswing_area` VALUES ('320681', '启东市', '320600', '6');
INSERT INTO `cmswing_area` VALUES ('320682', '如皋市', '320600', '7');
INSERT INTO `cmswing_area` VALUES ('320683', '通州市', '320600', '8');
INSERT INTO `cmswing_area` VALUES ('320684', '海门市', '320600', '9');
INSERT INTO `cmswing_area` VALUES ('320701', '市辖区', '320700', '1');
INSERT INTO `cmswing_area` VALUES ('320703', '连云区', '320700', '2');
INSERT INTO `cmswing_area` VALUES ('320705', '新浦区', '320700', '3');
INSERT INTO `cmswing_area` VALUES ('320706', '海州区', '320700', '4');
INSERT INTO `cmswing_area` VALUES ('320721', '赣榆县', '320700', '5');
INSERT INTO `cmswing_area` VALUES ('320722', '东海县', '320700', '6');
INSERT INTO `cmswing_area` VALUES ('320723', '灌云县', '320700', '7');
INSERT INTO `cmswing_area` VALUES ('320724', '灌南县', '320700', '8');
INSERT INTO `cmswing_area` VALUES ('320801', '市辖区', '320800', '1');
INSERT INTO `cmswing_area` VALUES ('320802', '清河区', '320800', '2');
INSERT INTO `cmswing_area` VALUES ('320803', '楚州区', '320800', '3');
INSERT INTO `cmswing_area` VALUES ('320804', '淮阴区', '320800', '4');
INSERT INTO `cmswing_area` VALUES ('320811', '清浦区', '320800', '5');
INSERT INTO `cmswing_area` VALUES ('320826', '涟水县', '320800', '6');
INSERT INTO `cmswing_area` VALUES ('320829', '洪泽县', '320800', '7');
INSERT INTO `cmswing_area` VALUES ('320830', '盱眙县', '320800', '8');
INSERT INTO `cmswing_area` VALUES ('320831', '金湖县', '320800', '9');
INSERT INTO `cmswing_area` VALUES ('320901', '市辖区', '320900', '1');
INSERT INTO `cmswing_area` VALUES ('320902', '亭湖区', '320900', '2');
INSERT INTO `cmswing_area` VALUES ('320903', '盐都区', '320900', '3');
INSERT INTO `cmswing_area` VALUES ('320921', '响水县', '320900', '4');
INSERT INTO `cmswing_area` VALUES ('320922', '滨海县', '320900', '5');
INSERT INTO `cmswing_area` VALUES ('320923', '阜宁县', '320900', '6');
INSERT INTO `cmswing_area` VALUES ('320924', '射阳县', '320900', '7');
INSERT INTO `cmswing_area` VALUES ('320925', '建湖县', '320900', '8');
INSERT INTO `cmswing_area` VALUES ('320981', '东台市', '320900', '9');
INSERT INTO `cmswing_area` VALUES ('320982', '大丰市', '320900', '10');
INSERT INTO `cmswing_area` VALUES ('321001', '市辖区', '321000', '1');
INSERT INTO `cmswing_area` VALUES ('321002', '广陵区', '321000', '2');
INSERT INTO `cmswing_area` VALUES ('321003', '邗江区', '321000', '3');
INSERT INTO `cmswing_area` VALUES ('321011', '郊　区', '321000', '4');
INSERT INTO `cmswing_area` VALUES ('321023', '宝应县', '321000', '5');
INSERT INTO `cmswing_area` VALUES ('321081', '仪征市', '321000', '6');
INSERT INTO `cmswing_area` VALUES ('321084', '高邮市', '321000', '7');
INSERT INTO `cmswing_area` VALUES ('321088', '江都市', '321000', '8');
INSERT INTO `cmswing_area` VALUES ('321101', '市辖区', '321100', '1');
INSERT INTO `cmswing_area` VALUES ('321102', '京口区', '321100', '2');
INSERT INTO `cmswing_area` VALUES ('321111', '润州区', '321100', '3');
INSERT INTO `cmswing_area` VALUES ('321112', '丹徒区', '321100', '4');
INSERT INTO `cmswing_area` VALUES ('321181', '丹阳市', '321100', '5');
INSERT INTO `cmswing_area` VALUES ('321182', '扬中市', '321100', '6');
INSERT INTO `cmswing_area` VALUES ('321183', '句容市', '321100', '7');
INSERT INTO `cmswing_area` VALUES ('321201', '市辖区', '321200', '1');
INSERT INTO `cmswing_area` VALUES ('321202', '海陵区', '321200', '2');
INSERT INTO `cmswing_area` VALUES ('321203', '高港区', '321200', '3');
INSERT INTO `cmswing_area` VALUES ('321281', '兴化市', '321200', '4');
INSERT INTO `cmswing_area` VALUES ('321282', '靖江市', '321200', '5');
INSERT INTO `cmswing_area` VALUES ('321283', '泰兴市', '321200', '6');
INSERT INTO `cmswing_area` VALUES ('321284', '姜堰市', '321200', '7');
INSERT INTO `cmswing_area` VALUES ('321301', '市辖区', '321300', '1');
INSERT INTO `cmswing_area` VALUES ('321302', '宿城区', '321300', '2');
INSERT INTO `cmswing_area` VALUES ('321311', '宿豫区', '321300', '3');
INSERT INTO `cmswing_area` VALUES ('321322', '沭阳县', '321300', '4');
INSERT INTO `cmswing_area` VALUES ('321323', '泗阳县', '321300', '5');
INSERT INTO `cmswing_area` VALUES ('321324', '泗洪县', '321300', '6');
INSERT INTO `cmswing_area` VALUES ('330101', '市辖区', '330100', '1');
INSERT INTO `cmswing_area` VALUES ('330102', '上城区', '330100', '2');
INSERT INTO `cmswing_area` VALUES ('330103', '下城区', '330100', '3');
INSERT INTO `cmswing_area` VALUES ('330104', '江干区', '330100', '4');
INSERT INTO `cmswing_area` VALUES ('330105', '拱墅区', '330100', '5');
INSERT INTO `cmswing_area` VALUES ('330106', '西湖区', '330100', '6');
INSERT INTO `cmswing_area` VALUES ('330108', '滨江区', '330100', '7');
INSERT INTO `cmswing_area` VALUES ('330109', '萧山区', '330100', '8');
INSERT INTO `cmswing_area` VALUES ('330110', '余杭区', '330100', '9');
INSERT INTO `cmswing_area` VALUES ('330122', '桐庐县', '330100', '10');
INSERT INTO `cmswing_area` VALUES ('330127', '淳安县', '330100', '11');
INSERT INTO `cmswing_area` VALUES ('330182', '建德市', '330100', '12');
INSERT INTO `cmswing_area` VALUES ('330183', '富阳市', '330100', '13');
INSERT INTO `cmswing_area` VALUES ('330185', '临安市', '330100', '14');
INSERT INTO `cmswing_area` VALUES ('330201', '市辖区', '330200', '1');
INSERT INTO `cmswing_area` VALUES ('330203', '海曙区', '330200', '2');
INSERT INTO `cmswing_area` VALUES ('330204', '江东区', '330200', '3');
INSERT INTO `cmswing_area` VALUES ('330205', '江北区', '330200', '4');
INSERT INTO `cmswing_area` VALUES ('330206', '北仑区', '330200', '5');
INSERT INTO `cmswing_area` VALUES ('330211', '镇海区', '330200', '6');
INSERT INTO `cmswing_area` VALUES ('330212', '鄞州区', '330200', '7');
INSERT INTO `cmswing_area` VALUES ('330225', '象山县', '330200', '8');
INSERT INTO `cmswing_area` VALUES ('330226', '宁海县', '330200', '9');
INSERT INTO `cmswing_area` VALUES ('330281', '余姚市', '330200', '10');
INSERT INTO `cmswing_area` VALUES ('330282', '慈溪市', '330200', '11');
INSERT INTO `cmswing_area` VALUES ('330283', '奉化市', '330200', '12');
INSERT INTO `cmswing_area` VALUES ('330301', '市辖区', '330300', '1');
INSERT INTO `cmswing_area` VALUES ('330302', '鹿城区', '330300', '2');
INSERT INTO `cmswing_area` VALUES ('330303', '龙湾区', '330300', '3');
INSERT INTO `cmswing_area` VALUES ('330304', '瓯海区', '330300', '4');
INSERT INTO `cmswing_area` VALUES ('330322', '洞头县', '330300', '5');
INSERT INTO `cmswing_area` VALUES ('330324', '永嘉县', '330300', '6');
INSERT INTO `cmswing_area` VALUES ('330326', '平阳县', '330300', '7');
INSERT INTO `cmswing_area` VALUES ('330327', '苍南县', '330300', '8');
INSERT INTO `cmswing_area` VALUES ('330328', '文成县', '330300', '9');
INSERT INTO `cmswing_area` VALUES ('330329', '泰顺县', '330300', '10');
INSERT INTO `cmswing_area` VALUES ('330381', '瑞安市', '330300', '11');
INSERT INTO `cmswing_area` VALUES ('330382', '乐清市', '330300', '12');
INSERT INTO `cmswing_area` VALUES ('330401', '市辖区', '330400', '1');
INSERT INTO `cmswing_area` VALUES ('330402', '秀城区', '330400', '2');
INSERT INTO `cmswing_area` VALUES ('330411', '秀洲区', '330400', '3');
INSERT INTO `cmswing_area` VALUES ('330421', '嘉善县', '330400', '4');
INSERT INTO `cmswing_area` VALUES ('330424', '海盐县', '330400', '5');
INSERT INTO `cmswing_area` VALUES ('330481', '海宁市', '330400', '6');
INSERT INTO `cmswing_area` VALUES ('330482', '平湖市', '330400', '7');
INSERT INTO `cmswing_area` VALUES ('330483', '桐乡市', '330400', '8');
INSERT INTO `cmswing_area` VALUES ('330501', '市辖区', '330500', '1');
INSERT INTO `cmswing_area` VALUES ('330502', '吴兴区', '330500', '2');
INSERT INTO `cmswing_area` VALUES ('330503', '南浔区', '330500', '3');
INSERT INTO `cmswing_area` VALUES ('330521', '德清县', '330500', '4');
INSERT INTO `cmswing_area` VALUES ('330522', '长兴县', '330500', '5');
INSERT INTO `cmswing_area` VALUES ('330523', '安吉县', '330500', '6');
INSERT INTO `cmswing_area` VALUES ('330601', '市辖区', '330600', '1');
INSERT INTO `cmswing_area` VALUES ('330602', '越城区', '330600', '2');
INSERT INTO `cmswing_area` VALUES ('330621', '绍兴县', '330600', '3');
INSERT INTO `cmswing_area` VALUES ('330624', '新昌县', '330600', '4');
INSERT INTO `cmswing_area` VALUES ('330681', '诸暨市', '330600', '5');
INSERT INTO `cmswing_area` VALUES ('330682', '上虞市', '330600', '6');
INSERT INTO `cmswing_area` VALUES ('330683', '嵊州市', '330600', '7');
INSERT INTO `cmswing_area` VALUES ('330701', '市辖区', '330700', '1');
INSERT INTO `cmswing_area` VALUES ('330702', '婺城区', '330700', '2');
INSERT INTO `cmswing_area` VALUES ('330703', '金东区', '330700', '3');
INSERT INTO `cmswing_area` VALUES ('330723', '武义县', '330700', '4');
INSERT INTO `cmswing_area` VALUES ('330726', '浦江县', '330700', '5');
INSERT INTO `cmswing_area` VALUES ('330727', '磐安县', '330700', '6');
INSERT INTO `cmswing_area` VALUES ('330781', '兰溪市', '330700', '7');
INSERT INTO `cmswing_area` VALUES ('330782', '义乌市', '330700', '8');
INSERT INTO `cmswing_area` VALUES ('330783', '东阳市', '330700', '9');
INSERT INTO `cmswing_area` VALUES ('330784', '永康市', '330700', '10');
INSERT INTO `cmswing_area` VALUES ('330801', '市辖区', '330800', '1');
INSERT INTO `cmswing_area` VALUES ('330802', '柯城区', '330800', '2');
INSERT INTO `cmswing_area` VALUES ('330803', '衢江区', '330800', '3');
INSERT INTO `cmswing_area` VALUES ('330822', '常山县', '330800', '4');
INSERT INTO `cmswing_area` VALUES ('330824', '开化县', '330800', '5');
INSERT INTO `cmswing_area` VALUES ('330825', '龙游县', '330800', '6');
INSERT INTO `cmswing_area` VALUES ('330881', '江山市', '330800', '7');
INSERT INTO `cmswing_area` VALUES ('330901', '市辖区', '330900', '1');
INSERT INTO `cmswing_area` VALUES ('330902', '定海区', '330900', '2');
INSERT INTO `cmswing_area` VALUES ('330903', '普陀区', '330900', '3');
INSERT INTO `cmswing_area` VALUES ('330921', '岱山县', '330900', '4');
INSERT INTO `cmswing_area` VALUES ('330922', '嵊泗县', '330900', '5');
INSERT INTO `cmswing_area` VALUES ('331001', '市辖区', '331000', '1');
INSERT INTO `cmswing_area` VALUES ('331002', '椒江区', '331000', '2');
INSERT INTO `cmswing_area` VALUES ('331003', '黄岩区', '331000', '3');
INSERT INTO `cmswing_area` VALUES ('331004', '路桥区', '331000', '4');
INSERT INTO `cmswing_area` VALUES ('331021', '玉环县', '331000', '5');
INSERT INTO `cmswing_area` VALUES ('331022', '三门县', '331000', '6');
INSERT INTO `cmswing_area` VALUES ('331023', '天台县', '331000', '7');
INSERT INTO `cmswing_area` VALUES ('331024', '仙居县', '331000', '8');
INSERT INTO `cmswing_area` VALUES ('331081', '温岭市', '331000', '9');
INSERT INTO `cmswing_area` VALUES ('331082', '临海市', '331000', '10');
INSERT INTO `cmswing_area` VALUES ('331101', '市辖区', '331100', '1');
INSERT INTO `cmswing_area` VALUES ('331102', '莲都区', '331100', '2');
INSERT INTO `cmswing_area` VALUES ('331121', '青田县', '331100', '3');
INSERT INTO `cmswing_area` VALUES ('331122', '缙云县', '331100', '4');
INSERT INTO `cmswing_area` VALUES ('331123', '遂昌县', '331100', '5');
INSERT INTO `cmswing_area` VALUES ('331124', '松阳县', '331100', '6');
INSERT INTO `cmswing_area` VALUES ('331125', '云和县', '331100', '7');
INSERT INTO `cmswing_area` VALUES ('331126', '庆元县', '331100', '8');
INSERT INTO `cmswing_area` VALUES ('331127', '景宁畲族自治县', '331100', '9');
INSERT INTO `cmswing_area` VALUES ('331181', '龙泉市', '331100', '10');
INSERT INTO `cmswing_area` VALUES ('340101', '市辖区', '340100', '1');
INSERT INTO `cmswing_area` VALUES ('340102', '瑶海区', '340100', '2');
INSERT INTO `cmswing_area` VALUES ('340103', '庐阳区', '340100', '3');
INSERT INTO `cmswing_area` VALUES ('340104', '蜀山区', '340100', '4');
INSERT INTO `cmswing_area` VALUES ('340111', '包河区', '340100', '5');
INSERT INTO `cmswing_area` VALUES ('340121', '长丰县', '340100', '6');
INSERT INTO `cmswing_area` VALUES ('340122', '肥东县', '340100', '7');
INSERT INTO `cmswing_area` VALUES ('340123', '肥西县', '340100', '8');
INSERT INTO `cmswing_area` VALUES ('340201', '市辖区', '340200', '1');
INSERT INTO `cmswing_area` VALUES ('340202', '镜湖区', '340200', '2');
INSERT INTO `cmswing_area` VALUES ('340203', '马塘区', '340200', '3');
INSERT INTO `cmswing_area` VALUES ('340204', '新芜区', '340200', '4');
INSERT INTO `cmswing_area` VALUES ('340207', '鸠江区', '340200', '5');
INSERT INTO `cmswing_area` VALUES ('340221', '芜湖县', '340200', '6');
INSERT INTO `cmswing_area` VALUES ('340222', '繁昌县', '340200', '7');
INSERT INTO `cmswing_area` VALUES ('340223', '南陵县', '340200', '8');
INSERT INTO `cmswing_area` VALUES ('340301', '市辖区', '340300', '1');
INSERT INTO `cmswing_area` VALUES ('340302', '龙子湖区', '340300', '2');
INSERT INTO `cmswing_area` VALUES ('340303', '蚌山区', '340300', '3');
INSERT INTO `cmswing_area` VALUES ('340304', '禹会区', '340300', '4');
INSERT INTO `cmswing_area` VALUES ('340311', '淮上区', '340300', '5');
INSERT INTO `cmswing_area` VALUES ('340321', '怀远县', '340300', '6');
INSERT INTO `cmswing_area` VALUES ('340322', '五河县', '340300', '7');
INSERT INTO `cmswing_area` VALUES ('340323', '固镇县', '340300', '8');
INSERT INTO `cmswing_area` VALUES ('340401', '市辖区', '340400', '1');
INSERT INTO `cmswing_area` VALUES ('340402', '大通区', '340400', '2');
INSERT INTO `cmswing_area` VALUES ('340403', '田家庵区', '340400', '3');
INSERT INTO `cmswing_area` VALUES ('340404', '谢家集区', '340400', '4');
INSERT INTO `cmswing_area` VALUES ('340405', '八公山区', '340400', '5');
INSERT INTO `cmswing_area` VALUES ('340406', '潘集区', '340400', '6');
INSERT INTO `cmswing_area` VALUES ('340421', '凤台县', '340400', '7');
INSERT INTO `cmswing_area` VALUES ('340501', '市辖区', '340500', '1');
INSERT INTO `cmswing_area` VALUES ('340502', '金家庄区', '340500', '2');
INSERT INTO `cmswing_area` VALUES ('340503', '花山区', '340500', '3');
INSERT INTO `cmswing_area` VALUES ('340504', '雨山区', '340500', '4');
INSERT INTO `cmswing_area` VALUES ('340521', '当涂县', '340500', '5');
INSERT INTO `cmswing_area` VALUES ('340601', '市辖区', '340600', '1');
INSERT INTO `cmswing_area` VALUES ('340602', '杜集区', '340600', '2');
INSERT INTO `cmswing_area` VALUES ('340603', '相山区', '340600', '3');
INSERT INTO `cmswing_area` VALUES ('340604', '烈山区', '340600', '4');
INSERT INTO `cmswing_area` VALUES ('340621', '濉溪县', '340600', '5');
INSERT INTO `cmswing_area` VALUES ('340701', '市辖区', '340700', '1');
INSERT INTO `cmswing_area` VALUES ('340702', '铜官山区', '340700', '2');
INSERT INTO `cmswing_area` VALUES ('340703', '狮子山区', '340700', '3');
INSERT INTO `cmswing_area` VALUES ('340711', '郊　区', '340700', '4');
INSERT INTO `cmswing_area` VALUES ('340721', '铜陵县', '340700', '5');
INSERT INTO `cmswing_area` VALUES ('340801', '市辖区', '340800', '1');
INSERT INTO `cmswing_area` VALUES ('340802', '迎江区', '340800', '2');
INSERT INTO `cmswing_area` VALUES ('340803', '大观区', '340800', '3');
INSERT INTO `cmswing_area` VALUES ('340811', '郊　区', '340800', '4');
INSERT INTO `cmswing_area` VALUES ('340822', '怀宁县', '340800', '5');
INSERT INTO `cmswing_area` VALUES ('340823', '枞阳县', '340800', '6');
INSERT INTO `cmswing_area` VALUES ('340824', '潜山县', '340800', '7');
INSERT INTO `cmswing_area` VALUES ('340825', '太湖县', '340800', '8');
INSERT INTO `cmswing_area` VALUES ('340826', '宿松县', '340800', '9');
INSERT INTO `cmswing_area` VALUES ('340827', '望江县', '340800', '10');
INSERT INTO `cmswing_area` VALUES ('340828', '岳西县', '340800', '11');
INSERT INTO `cmswing_area` VALUES ('340881', '桐城市', '340800', '12');
INSERT INTO `cmswing_area` VALUES ('341001', '市辖区', '341000', '1');
INSERT INTO `cmswing_area` VALUES ('341002', '屯溪区', '341000', '2');
INSERT INTO `cmswing_area` VALUES ('341003', '黄山区', '341000', '3');
INSERT INTO `cmswing_area` VALUES ('341004', '徽州区', '341000', '4');
INSERT INTO `cmswing_area` VALUES ('341021', '歙　县', '341000', '5');
INSERT INTO `cmswing_area` VALUES ('341022', '休宁县', '341000', '6');
INSERT INTO `cmswing_area` VALUES ('341023', '黟　县', '341000', '7');
INSERT INTO `cmswing_area` VALUES ('341024', '祁门县', '341000', '8');
INSERT INTO `cmswing_area` VALUES ('341101', '市辖区', '341100', '1');
INSERT INTO `cmswing_area` VALUES ('341102', '琅琊区', '341100', '2');
INSERT INTO `cmswing_area` VALUES ('341103', '南谯区', '341100', '3');
INSERT INTO `cmswing_area` VALUES ('341122', '来安县', '341100', '4');
INSERT INTO `cmswing_area` VALUES ('341124', '全椒县', '341100', '5');
INSERT INTO `cmswing_area` VALUES ('341125', '定远县', '341100', '6');
INSERT INTO `cmswing_area` VALUES ('341126', '凤阳县', '341100', '7');
INSERT INTO `cmswing_area` VALUES ('341181', '天长市', '341100', '8');
INSERT INTO `cmswing_area` VALUES ('341182', '明光市', '341100', '9');
INSERT INTO `cmswing_area` VALUES ('341201', '市辖区', '341200', '1');
INSERT INTO `cmswing_area` VALUES ('341202', '颍州区', '341200', '2');
INSERT INTO `cmswing_area` VALUES ('341203', '颍东区', '341200', '3');
INSERT INTO `cmswing_area` VALUES ('341204', '颍泉区', '341200', '4');
INSERT INTO `cmswing_area` VALUES ('341221', '临泉县', '341200', '5');
INSERT INTO `cmswing_area` VALUES ('341222', '太和县', '341200', '6');
INSERT INTO `cmswing_area` VALUES ('341225', '阜南县', '341200', '7');
INSERT INTO `cmswing_area` VALUES ('341226', '颍上县', '341200', '8');
INSERT INTO `cmswing_area` VALUES ('341282', '界首市', '341200', '9');
INSERT INTO `cmswing_area` VALUES ('341301', '市辖区', '341300', '1');
INSERT INTO `cmswing_area` VALUES ('341302', '墉桥区', '341300', '2');
INSERT INTO `cmswing_area` VALUES ('341321', '砀山县', '341300', '3');
INSERT INTO `cmswing_area` VALUES ('341322', '萧　县', '341300', '4');
INSERT INTO `cmswing_area` VALUES ('341323', '灵璧县', '341300', '5');
INSERT INTO `cmswing_area` VALUES ('341324', '泗　县', '341300', '6');
INSERT INTO `cmswing_area` VALUES ('341401', '庐江县', '340100', '9');
INSERT INTO `cmswing_area` VALUES ('341402', '巢湖市', '340100', '10');
INSERT INTO `cmswing_area` VALUES ('341422', '无为县', '340200', '9');
INSERT INTO `cmswing_area` VALUES ('341423', '含山县', '340500', '6');
INSERT INTO `cmswing_area` VALUES ('341424', '和　县', '340500', '7');
INSERT INTO `cmswing_area` VALUES ('341501', '市辖区', '341500', '1');
INSERT INTO `cmswing_area` VALUES ('341502', '金安区', '341500', '2');
INSERT INTO `cmswing_area` VALUES ('341503', '裕安区', '341500', '3');
INSERT INTO `cmswing_area` VALUES ('341521', '寿　县', '341500', '4');
INSERT INTO `cmswing_area` VALUES ('341522', '霍邱县', '341500', '5');
INSERT INTO `cmswing_area` VALUES ('341523', '舒城县', '341500', '6');
INSERT INTO `cmswing_area` VALUES ('341524', '金寨县', '341500', '7');
INSERT INTO `cmswing_area` VALUES ('341525', '霍山县', '341500', '8');
INSERT INTO `cmswing_area` VALUES ('341601', '市辖区', '341600', '1');
INSERT INTO `cmswing_area` VALUES ('341602', '谯城区', '341600', '2');
INSERT INTO `cmswing_area` VALUES ('341621', '涡阳县', '341600', '3');
INSERT INTO `cmswing_area` VALUES ('341622', '蒙城县', '341600', '4');
INSERT INTO `cmswing_area` VALUES ('341623', '利辛县', '341600', '5');
INSERT INTO `cmswing_area` VALUES ('341701', '市辖区', '341700', '1');
INSERT INTO `cmswing_area` VALUES ('341702', '贵池区', '341700', '2');
INSERT INTO `cmswing_area` VALUES ('341721', '东至县', '341700', '3');
INSERT INTO `cmswing_area` VALUES ('341722', '石台县', '341700', '4');
INSERT INTO `cmswing_area` VALUES ('341723', '青阳县', '341700', '5');
INSERT INTO `cmswing_area` VALUES ('341801', '市辖区', '341800', '1');
INSERT INTO `cmswing_area` VALUES ('341802', '宣州区', '341800', '2');
INSERT INTO `cmswing_area` VALUES ('341821', '郎溪县', '341800', '3');
INSERT INTO `cmswing_area` VALUES ('341822', '广德县', '341800', '4');
INSERT INTO `cmswing_area` VALUES ('341823', '泾　县', '341800', '5');
INSERT INTO `cmswing_area` VALUES ('341824', '绩溪县', '341800', '6');
INSERT INTO `cmswing_area` VALUES ('341825', '旌德县', '341800', '7');
INSERT INTO `cmswing_area` VALUES ('341881', '宁国市', '341800', '8');
INSERT INTO `cmswing_area` VALUES ('350101', '市辖区', '350100', '1');
INSERT INTO `cmswing_area` VALUES ('350102', '鼓楼区', '350100', '2');
INSERT INTO `cmswing_area` VALUES ('350103', '台江区', '350100', '3');
INSERT INTO `cmswing_area` VALUES ('350104', '仓山区', '350100', '4');
INSERT INTO `cmswing_area` VALUES ('350105', '马尾区', '350100', '5');
INSERT INTO `cmswing_area` VALUES ('350111', '晋安区', '350100', '6');
INSERT INTO `cmswing_area` VALUES ('350121', '闽侯县', '350100', '7');
INSERT INTO `cmswing_area` VALUES ('350122', '连江县', '350100', '8');
INSERT INTO `cmswing_area` VALUES ('350123', '罗源县', '350100', '9');
INSERT INTO `cmswing_area` VALUES ('350124', '闽清县', '350100', '10');
INSERT INTO `cmswing_area` VALUES ('350125', '永泰县', '350100', '11');
INSERT INTO `cmswing_area` VALUES ('350128', '平潭县', '350100', '12');
INSERT INTO `cmswing_area` VALUES ('350181', '福清市', '350100', '13');
INSERT INTO `cmswing_area` VALUES ('350182', '长乐市', '350100', '14');
INSERT INTO `cmswing_area` VALUES ('350201', '市辖区', '350200', '1');
INSERT INTO `cmswing_area` VALUES ('350203', '思明区', '350200', '2');
INSERT INTO `cmswing_area` VALUES ('350205', '海沧区', '350200', '3');
INSERT INTO `cmswing_area` VALUES ('350206', '湖里区', '350200', '4');
INSERT INTO `cmswing_area` VALUES ('350211', '集美区', '350200', '5');
INSERT INTO `cmswing_area` VALUES ('350212', '同安区', '350200', '6');
INSERT INTO `cmswing_area` VALUES ('350213', '翔安区', '350200', '7');
INSERT INTO `cmswing_area` VALUES ('350301', '市辖区', '350300', '1');
INSERT INTO `cmswing_area` VALUES ('350302', '城厢区', '350300', '2');
INSERT INTO `cmswing_area` VALUES ('350303', '涵江区', '350300', '3');
INSERT INTO `cmswing_area` VALUES ('350304', '荔城区', '350300', '4');
INSERT INTO `cmswing_area` VALUES ('350305', '秀屿区', '350300', '5');
INSERT INTO `cmswing_area` VALUES ('350322', '仙游县', '350300', '6');
INSERT INTO `cmswing_area` VALUES ('350401', '市辖区', '350400', '1');
INSERT INTO `cmswing_area` VALUES ('350402', '梅列区', '350400', '2');
INSERT INTO `cmswing_area` VALUES ('350403', '三元区', '350400', '3');
INSERT INTO `cmswing_area` VALUES ('350421', '明溪县', '350400', '4');
INSERT INTO `cmswing_area` VALUES ('350423', '清流县', '350400', '5');
INSERT INTO `cmswing_area` VALUES ('350424', '宁化县', '350400', '6');
INSERT INTO `cmswing_area` VALUES ('350425', '大田县', '350400', '7');
INSERT INTO `cmswing_area` VALUES ('350426', '尤溪县', '350400', '8');
INSERT INTO `cmswing_area` VALUES ('350427', '沙　县', '350400', '9');
INSERT INTO `cmswing_area` VALUES ('350428', '将乐县', '350400', '10');
INSERT INTO `cmswing_area` VALUES ('350429', '泰宁县', '350400', '11');
INSERT INTO `cmswing_area` VALUES ('350430', '建宁县', '350400', '12');
INSERT INTO `cmswing_area` VALUES ('350481', '永安市', '350400', '13');
INSERT INTO `cmswing_area` VALUES ('350501', '市辖区', '350500', '1');
INSERT INTO `cmswing_area` VALUES ('350502', '鲤城区', '350500', '2');
INSERT INTO `cmswing_area` VALUES ('350503', '丰泽区', '350500', '3');
INSERT INTO `cmswing_area` VALUES ('350504', '洛江区', '350500', '4');
INSERT INTO `cmswing_area` VALUES ('350505', '泉港区', '350500', '5');
INSERT INTO `cmswing_area` VALUES ('350521', '惠安县', '350500', '6');
INSERT INTO `cmswing_area` VALUES ('350524', '安溪县', '350500', '7');
INSERT INTO `cmswing_area` VALUES ('350525', '永春县', '350500', '8');
INSERT INTO `cmswing_area` VALUES ('350526', '德化县', '350500', '9');
INSERT INTO `cmswing_area` VALUES ('350527', '金门县', '350500', '10');
INSERT INTO `cmswing_area` VALUES ('350581', '石狮市', '350500', '11');
INSERT INTO `cmswing_area` VALUES ('350582', '晋江市', '350500', '12');
INSERT INTO `cmswing_area` VALUES ('350583', '南安市', '350500', '13');
INSERT INTO `cmswing_area` VALUES ('350601', '市辖区', '350600', '1');
INSERT INTO `cmswing_area` VALUES ('350602', '芗城区', '350600', '2');
INSERT INTO `cmswing_area` VALUES ('350603', '龙文区', '350600', '3');
INSERT INTO `cmswing_area` VALUES ('350622', '云霄县', '350600', '4');
INSERT INTO `cmswing_area` VALUES ('350623', '漳浦县', '350600', '5');
INSERT INTO `cmswing_area` VALUES ('350624', '诏安县', '350600', '6');
INSERT INTO `cmswing_area` VALUES ('350625', '长泰县', '350600', '7');
INSERT INTO `cmswing_area` VALUES ('350626', '东山县', '350600', '8');
INSERT INTO `cmswing_area` VALUES ('350627', '南靖县', '350600', '9');
INSERT INTO `cmswing_area` VALUES ('350628', '平和县', '350600', '10');
INSERT INTO `cmswing_area` VALUES ('350629', '华安县', '350600', '11');
INSERT INTO `cmswing_area` VALUES ('350681', '龙海市', '350600', '12');
INSERT INTO `cmswing_area` VALUES ('350701', '市辖区', '350700', '1');
INSERT INTO `cmswing_area` VALUES ('350702', '延平区', '350700', '2');
INSERT INTO `cmswing_area` VALUES ('350721', '顺昌县', '350700', '3');
INSERT INTO `cmswing_area` VALUES ('350722', '浦城县', '350700', '4');
INSERT INTO `cmswing_area` VALUES ('350723', '光泽县', '350700', '5');
INSERT INTO `cmswing_area` VALUES ('350724', '松溪县', '350700', '6');
INSERT INTO `cmswing_area` VALUES ('350725', '政和县', '350700', '7');
INSERT INTO `cmswing_area` VALUES ('350781', '邵武市', '350700', '8');
INSERT INTO `cmswing_area` VALUES ('350782', '武夷山市', '350700', '9');
INSERT INTO `cmswing_area` VALUES ('350783', '建瓯市', '350700', '10');
INSERT INTO `cmswing_area` VALUES ('350784', '建阳市', '350700', '11');
INSERT INTO `cmswing_area` VALUES ('350801', '市辖区', '350800', '1');
INSERT INTO `cmswing_area` VALUES ('350802', '新罗区', '350800', '2');
INSERT INTO `cmswing_area` VALUES ('350821', '长汀县', '350800', '3');
INSERT INTO `cmswing_area` VALUES ('350822', '永定县', '350800', '4');
INSERT INTO `cmswing_area` VALUES ('350823', '上杭县', '350800', '5');
INSERT INTO `cmswing_area` VALUES ('350824', '武平县', '350800', '6');
INSERT INTO `cmswing_area` VALUES ('350825', '连城县', '350800', '7');
INSERT INTO `cmswing_area` VALUES ('350881', '漳平市', '350800', '8');
INSERT INTO `cmswing_area` VALUES ('350901', '市辖区', '350900', '1');
INSERT INTO `cmswing_area` VALUES ('350902', '蕉城区', '350900', '2');
INSERT INTO `cmswing_area` VALUES ('350921', '霞浦县', '350900', '3');
INSERT INTO `cmswing_area` VALUES ('350922', '古田县', '350900', '4');
INSERT INTO `cmswing_area` VALUES ('350923', '屏南县', '350900', '5');
INSERT INTO `cmswing_area` VALUES ('350924', '寿宁县', '350900', '6');
INSERT INTO `cmswing_area` VALUES ('350925', '周宁县', '350900', '7');
INSERT INTO `cmswing_area` VALUES ('350926', '柘荣县', '350900', '8');
INSERT INTO `cmswing_area` VALUES ('350981', '福安市', '350900', '9');
INSERT INTO `cmswing_area` VALUES ('350982', '福鼎市', '350900', '10');
INSERT INTO `cmswing_area` VALUES ('360101', '市辖区', '360100', '1');
INSERT INTO `cmswing_area` VALUES ('360102', '东湖区', '360100', '2');
INSERT INTO `cmswing_area` VALUES ('360103', '西湖区', '360100', '3');
INSERT INTO `cmswing_area` VALUES ('360104', '青云谱区', '360100', '4');
INSERT INTO `cmswing_area` VALUES ('360105', '湾里区', '360100', '5');
INSERT INTO `cmswing_area` VALUES ('360111', '青山湖区', '360100', '6');
INSERT INTO `cmswing_area` VALUES ('360121', '南昌县', '360100', '7');
INSERT INTO `cmswing_area` VALUES ('360122', '新建县', '360100', '8');
INSERT INTO `cmswing_area` VALUES ('360123', '安义县', '360100', '9');
INSERT INTO `cmswing_area` VALUES ('360124', '进贤县', '360100', '10');
INSERT INTO `cmswing_area` VALUES ('360201', '市辖区', '360200', '1');
INSERT INTO `cmswing_area` VALUES ('360202', '昌江区', '360200', '2');
INSERT INTO `cmswing_area` VALUES ('360203', '珠山区', '360200', '3');
INSERT INTO `cmswing_area` VALUES ('360222', '浮梁县', '360200', '4');
INSERT INTO `cmswing_area` VALUES ('360281', '乐平市', '360200', '5');
INSERT INTO `cmswing_area` VALUES ('360301', '市辖区', '360300', '1');
INSERT INTO `cmswing_area` VALUES ('360302', '安源区', '360300', '2');
INSERT INTO `cmswing_area` VALUES ('360313', '湘东区', '360300', '3');
INSERT INTO `cmswing_area` VALUES ('360321', '莲花县', '360300', '4');
INSERT INTO `cmswing_area` VALUES ('360322', '上栗县', '360300', '5');
INSERT INTO `cmswing_area` VALUES ('360323', '芦溪县', '360300', '6');
INSERT INTO `cmswing_area` VALUES ('360401', '市辖区', '360400', '1');
INSERT INTO `cmswing_area` VALUES ('360402', '庐山区', '360400', '2');
INSERT INTO `cmswing_area` VALUES ('360403', '浔阳区', '360400', '3');
INSERT INTO `cmswing_area` VALUES ('360421', '九江县', '360400', '4');
INSERT INTO `cmswing_area` VALUES ('360423', '武宁县', '360400', '5');
INSERT INTO `cmswing_area` VALUES ('360424', '修水县', '360400', '6');
INSERT INTO `cmswing_area` VALUES ('360425', '永修县', '360400', '7');
INSERT INTO `cmswing_area` VALUES ('360426', '德安县', '360400', '8');
INSERT INTO `cmswing_area` VALUES ('360427', '星子县', '360400', '9');
INSERT INTO `cmswing_area` VALUES ('360428', '都昌县', '360400', '10');
INSERT INTO `cmswing_area` VALUES ('360429', '湖口县', '360400', '11');
INSERT INTO `cmswing_area` VALUES ('360430', '彭泽县', '360400', '12');
INSERT INTO `cmswing_area` VALUES ('360481', '瑞昌市', '360400', '13');
INSERT INTO `cmswing_area` VALUES ('360501', '市辖区', '360500', '1');
INSERT INTO `cmswing_area` VALUES ('360502', '渝水区', '360500', '2');
INSERT INTO `cmswing_area` VALUES ('360521', '分宜县', '360500', '3');
INSERT INTO `cmswing_area` VALUES ('360601', '市辖区', '360600', '1');
INSERT INTO `cmswing_area` VALUES ('360602', '月湖区', '360600', '2');
INSERT INTO `cmswing_area` VALUES ('360622', '余江县', '360600', '3');
INSERT INTO `cmswing_area` VALUES ('360681', '贵溪市', '360600', '4');
INSERT INTO `cmswing_area` VALUES ('360701', '市辖区', '360700', '1');
INSERT INTO `cmswing_area` VALUES ('360702', '章贡区', '360700', '2');
INSERT INTO `cmswing_area` VALUES ('360721', '赣　县', '360700', '3');
INSERT INTO `cmswing_area` VALUES ('360722', '信丰县', '360700', '4');
INSERT INTO `cmswing_area` VALUES ('360723', '大余县', '360700', '5');
INSERT INTO `cmswing_area` VALUES ('360724', '上犹县', '360700', '6');
INSERT INTO `cmswing_area` VALUES ('360725', '崇义县', '360700', '7');
INSERT INTO `cmswing_area` VALUES ('360726', '安远县', '360700', '8');
INSERT INTO `cmswing_area` VALUES ('360727', '龙南县', '360700', '9');
INSERT INTO `cmswing_area` VALUES ('360728', '定南县', '360700', '10');
INSERT INTO `cmswing_area` VALUES ('360729', '全南县', '360700', '11');
INSERT INTO `cmswing_area` VALUES ('360730', '宁都县', '360700', '12');
INSERT INTO `cmswing_area` VALUES ('360731', '于都县', '360700', '13');
INSERT INTO `cmswing_area` VALUES ('360732', '兴国县', '360700', '14');
INSERT INTO `cmswing_area` VALUES ('360733', '会昌县', '360700', '15');
INSERT INTO `cmswing_area` VALUES ('360734', '寻乌县', '360700', '16');
INSERT INTO `cmswing_area` VALUES ('360735', '石城县', '360700', '17');
INSERT INTO `cmswing_area` VALUES ('360781', '瑞金市', '360700', '18');
INSERT INTO `cmswing_area` VALUES ('360782', '南康市', '360700', '19');
INSERT INTO `cmswing_area` VALUES ('360801', '市辖区', '360800', '1');
INSERT INTO `cmswing_area` VALUES ('360802', '吉州区', '360800', '2');
INSERT INTO `cmswing_area` VALUES ('360803', '青原区', '360800', '3');
INSERT INTO `cmswing_area` VALUES ('360821', '吉安县', '360800', '4');
INSERT INTO `cmswing_area` VALUES ('360822', '吉水县', '360800', '5');
INSERT INTO `cmswing_area` VALUES ('360823', '峡江县', '360800', '6');
INSERT INTO `cmswing_area` VALUES ('360824', '新干县', '360800', '7');
INSERT INTO `cmswing_area` VALUES ('360825', '永丰县', '360800', '8');
INSERT INTO `cmswing_area` VALUES ('360826', '泰和县', '360800', '9');
INSERT INTO `cmswing_area` VALUES ('360827', '遂川县', '360800', '10');
INSERT INTO `cmswing_area` VALUES ('360828', '万安县', '360800', '11');
INSERT INTO `cmswing_area` VALUES ('360829', '安福县', '360800', '12');
INSERT INTO `cmswing_area` VALUES ('360830', '永新县', '360800', '13');
INSERT INTO `cmswing_area` VALUES ('360881', '井冈山市', '360800', '14');
INSERT INTO `cmswing_area` VALUES ('360901', '市辖区', '360900', '1');
INSERT INTO `cmswing_area` VALUES ('360902', '袁州区', '360900', '2');
INSERT INTO `cmswing_area` VALUES ('360921', '奉新县', '360900', '3');
INSERT INTO `cmswing_area` VALUES ('360922', '万载县', '360900', '4');
INSERT INTO `cmswing_area` VALUES ('360923', '上高县', '360900', '5');
INSERT INTO `cmswing_area` VALUES ('360924', '宜丰县', '360900', '6');
INSERT INTO `cmswing_area` VALUES ('360925', '靖安县', '360900', '7');
INSERT INTO `cmswing_area` VALUES ('360926', '铜鼓县', '360900', '8');
INSERT INTO `cmswing_area` VALUES ('360981', '丰城市', '360900', '9');
INSERT INTO `cmswing_area` VALUES ('360982', '樟树市', '360900', '10');
INSERT INTO `cmswing_area` VALUES ('360983', '高安市', '360900', '11');
INSERT INTO `cmswing_area` VALUES ('361001', '市辖区', '361000', '1');
INSERT INTO `cmswing_area` VALUES ('361002', '临川区', '361000', '2');
INSERT INTO `cmswing_area` VALUES ('361021', '南城县', '361000', '3');
INSERT INTO `cmswing_area` VALUES ('361022', '黎川县', '361000', '4');
INSERT INTO `cmswing_area` VALUES ('361023', '南丰县', '361000', '5');
INSERT INTO `cmswing_area` VALUES ('361024', '崇仁县', '361000', '6');
INSERT INTO `cmswing_area` VALUES ('361025', '乐安县', '361000', '7');
INSERT INTO `cmswing_area` VALUES ('361026', '宜黄县', '361000', '8');
INSERT INTO `cmswing_area` VALUES ('361027', '金溪县', '361000', '9');
INSERT INTO `cmswing_area` VALUES ('361028', '资溪县', '361000', '10');
INSERT INTO `cmswing_area` VALUES ('361029', '东乡县', '361000', '11');
INSERT INTO `cmswing_area` VALUES ('361030', '广昌县', '361000', '12');
INSERT INTO `cmswing_area` VALUES ('361101', '市辖区', '361100', '1');
INSERT INTO `cmswing_area` VALUES ('361102', '信州区', '361100', '2');
INSERT INTO `cmswing_area` VALUES ('361121', '上饶县', '361100', '3');
INSERT INTO `cmswing_area` VALUES ('361122', '广丰县', '361100', '4');
INSERT INTO `cmswing_area` VALUES ('361123', '玉山县', '361100', '5');
INSERT INTO `cmswing_area` VALUES ('361124', '铅山县', '361100', '6');
INSERT INTO `cmswing_area` VALUES ('361125', '横峰县', '361100', '7');
INSERT INTO `cmswing_area` VALUES ('361126', '弋阳县', '361100', '8');
INSERT INTO `cmswing_area` VALUES ('361127', '余干县', '361100', '9');
INSERT INTO `cmswing_area` VALUES ('361128', '鄱阳县', '361100', '10');
INSERT INTO `cmswing_area` VALUES ('361129', '万年县', '361100', '11');
INSERT INTO `cmswing_area` VALUES ('361130', '婺源县', '361100', '12');
INSERT INTO `cmswing_area` VALUES ('361181', '德兴市', '361100', '13');
INSERT INTO `cmswing_area` VALUES ('370101', '市辖区', '370100', '1');
INSERT INTO `cmswing_area` VALUES ('370102', '历下区', '370100', '2');
INSERT INTO `cmswing_area` VALUES ('370103', '市中区', '370100', '3');
INSERT INTO `cmswing_area` VALUES ('370104', '槐荫区', '370100', '4');
INSERT INTO `cmswing_area` VALUES ('370105', '天桥区', '370100', '5');
INSERT INTO `cmswing_area` VALUES ('370112', '历城区', '370100', '6');
INSERT INTO `cmswing_area` VALUES ('370113', '长清区', '370100', '7');
INSERT INTO `cmswing_area` VALUES ('370124', '平阴县', '370100', '8');
INSERT INTO `cmswing_area` VALUES ('370125', '济阳县', '370100', '9');
INSERT INTO `cmswing_area` VALUES ('370126', '商河县', '370100', '10');
INSERT INTO `cmswing_area` VALUES ('370181', '章丘市', '370100', '11');
INSERT INTO `cmswing_area` VALUES ('370201', '市辖区', '370200', '1');
INSERT INTO `cmswing_area` VALUES ('370202', '市南区', '370200', '2');
INSERT INTO `cmswing_area` VALUES ('370203', '市北区', '370200', '3');
INSERT INTO `cmswing_area` VALUES ('370205', '四方区', '370200', '4');
INSERT INTO `cmswing_area` VALUES ('370211', '黄岛区', '370200', '5');
INSERT INTO `cmswing_area` VALUES ('370212', '崂山区', '370200', '6');
INSERT INTO `cmswing_area` VALUES ('370213', '李沧区', '370200', '7');
INSERT INTO `cmswing_area` VALUES ('370214', '城阳区', '370200', '8');
INSERT INTO `cmswing_area` VALUES ('370281', '胶州市', '370200', '9');
INSERT INTO `cmswing_area` VALUES ('370282', '即墨市', '370200', '10');
INSERT INTO `cmswing_area` VALUES ('370283', '平度市', '370200', '11');
INSERT INTO `cmswing_area` VALUES ('370284', '胶南市', '370200', '12');
INSERT INTO `cmswing_area` VALUES ('370285', '莱西市', '370200', '13');
INSERT INTO `cmswing_area` VALUES ('370301', '市辖区', '370300', '1');
INSERT INTO `cmswing_area` VALUES ('370302', '淄川区', '370300', '2');
INSERT INTO `cmswing_area` VALUES ('370303', '张店区', '370300', '3');
INSERT INTO `cmswing_area` VALUES ('370304', '博山区', '370300', '4');
INSERT INTO `cmswing_area` VALUES ('370305', '临淄区', '370300', '5');
INSERT INTO `cmswing_area` VALUES ('370306', '周村区', '370300', '6');
INSERT INTO `cmswing_area` VALUES ('370321', '桓台县', '370300', '7');
INSERT INTO `cmswing_area` VALUES ('370322', '高青县', '370300', '8');
INSERT INTO `cmswing_area` VALUES ('370323', '沂源县', '370300', '9');
INSERT INTO `cmswing_area` VALUES ('370401', '市辖区', '370400', '1');
INSERT INTO `cmswing_area` VALUES ('370402', '市中区', '370400', '2');
INSERT INTO `cmswing_area` VALUES ('370403', '薛城区', '370400', '3');
INSERT INTO `cmswing_area` VALUES ('370404', '峄城区', '370400', '4');
INSERT INTO `cmswing_area` VALUES ('370405', '台儿庄区', '370400', '5');
INSERT INTO `cmswing_area` VALUES ('370406', '山亭区', '370400', '6');
INSERT INTO `cmswing_area` VALUES ('370481', '滕州市', '370400', '7');
INSERT INTO `cmswing_area` VALUES ('370501', '市辖区', '370500', '1');
INSERT INTO `cmswing_area` VALUES ('370502', '东营区', '370500', '2');
INSERT INTO `cmswing_area` VALUES ('370503', '河口区', '370500', '3');
INSERT INTO `cmswing_area` VALUES ('370521', '垦利县', '370500', '4');
INSERT INTO `cmswing_area` VALUES ('370522', '利津县', '370500', '5');
INSERT INTO `cmswing_area` VALUES ('370523', '广饶县', '370500', '6');
INSERT INTO `cmswing_area` VALUES ('370601', '市辖区', '370600', '1');
INSERT INTO `cmswing_area` VALUES ('370602', '芝罘区', '370600', '2');
INSERT INTO `cmswing_area` VALUES ('370611', '福山区', '370600', '3');
INSERT INTO `cmswing_area` VALUES ('370612', '牟平区', '370600', '4');
INSERT INTO `cmswing_area` VALUES ('370613', '莱山区', '370600', '5');
INSERT INTO `cmswing_area` VALUES ('370634', '长岛县', '370600', '6');
INSERT INTO `cmswing_area` VALUES ('370681', '龙口市', '370600', '7');
INSERT INTO `cmswing_area` VALUES ('370682', '莱阳市', '370600', '8');
INSERT INTO `cmswing_area` VALUES ('370683', '莱州市', '370600', '9');
INSERT INTO `cmswing_area` VALUES ('370684', '蓬莱市', '370600', '10');
INSERT INTO `cmswing_area` VALUES ('370685', '招远市', '370600', '11');
INSERT INTO `cmswing_area` VALUES ('370686', '栖霞市', '370600', '12');
INSERT INTO `cmswing_area` VALUES ('370687', '海阳市', '370600', '13');
INSERT INTO `cmswing_area` VALUES ('370701', '市辖区', '370700', '1');
INSERT INTO `cmswing_area` VALUES ('370702', '潍城区', '370700', '2');
INSERT INTO `cmswing_area` VALUES ('370703', '寒亭区', '370700', '3');
INSERT INTO `cmswing_area` VALUES ('370704', '坊子区', '370700', '4');
INSERT INTO `cmswing_area` VALUES ('370705', '奎文区', '370700', '5');
INSERT INTO `cmswing_area` VALUES ('370724', '临朐县', '370700', '6');
INSERT INTO `cmswing_area` VALUES ('370725', '昌乐县', '370700', '7');
INSERT INTO `cmswing_area` VALUES ('370781', '青州市', '370700', '8');
INSERT INTO `cmswing_area` VALUES ('370782', '诸城市', '370700', '9');
INSERT INTO `cmswing_area` VALUES ('370783', '寿光市', '370700', '10');
INSERT INTO `cmswing_area` VALUES ('370784', '安丘市', '370700', '11');
INSERT INTO `cmswing_area` VALUES ('370785', '高密市', '370700', '12');
INSERT INTO `cmswing_area` VALUES ('370786', '昌邑市', '370700', '13');
INSERT INTO `cmswing_area` VALUES ('370801', '市辖区', '370800', '1');
INSERT INTO `cmswing_area` VALUES ('370802', '市中区', '370800', '2');
INSERT INTO `cmswing_area` VALUES ('370811', '任城区', '370800', '3');
INSERT INTO `cmswing_area` VALUES ('370826', '微山县', '370800', '4');
INSERT INTO `cmswing_area` VALUES ('370827', '鱼台县', '370800', '5');
INSERT INTO `cmswing_area` VALUES ('370828', '金乡县', '370800', '6');
INSERT INTO `cmswing_area` VALUES ('370829', '嘉祥县', '370800', '7');
INSERT INTO `cmswing_area` VALUES ('370830', '汶上县', '370800', '8');
INSERT INTO `cmswing_area` VALUES ('370831', '泗水县', '370800', '9');
INSERT INTO `cmswing_area` VALUES ('370832', '梁山县', '370800', '10');
INSERT INTO `cmswing_area` VALUES ('370881', '曲阜市', '370800', '11');
INSERT INTO `cmswing_area` VALUES ('370882', '兖州市', '370800', '12');
INSERT INTO `cmswing_area` VALUES ('370883', '邹城市', '370800', '13');
INSERT INTO `cmswing_area` VALUES ('370901', '市辖区', '370900', '1');
INSERT INTO `cmswing_area` VALUES ('370902', '泰山区', '370900', '2');
INSERT INTO `cmswing_area` VALUES ('370903', '岱岳区', '370900', '3');
INSERT INTO `cmswing_area` VALUES ('370921', '宁阳县', '370900', '4');
INSERT INTO `cmswing_area` VALUES ('370923', '东平县', '370900', '5');
INSERT INTO `cmswing_area` VALUES ('370982', '新泰市', '370900', '6');
INSERT INTO `cmswing_area` VALUES ('370983', '肥城市', '370900', '7');
INSERT INTO `cmswing_area` VALUES ('371001', '市辖区', '371000', '1');
INSERT INTO `cmswing_area` VALUES ('371002', '环翠区', '371000', '2');
INSERT INTO `cmswing_area` VALUES ('371081', '文登市', '371000', '3');
INSERT INTO `cmswing_area` VALUES ('371082', '荣成市', '371000', '4');
INSERT INTO `cmswing_area` VALUES ('371083', '乳山市', '371000', '5');
INSERT INTO `cmswing_area` VALUES ('371101', '市辖区', '371100', '1');
INSERT INTO `cmswing_area` VALUES ('371102', '东港区', '371100', '2');
INSERT INTO `cmswing_area` VALUES ('371103', '岚山区', '371100', '3');
INSERT INTO `cmswing_area` VALUES ('371121', '五莲县', '371100', '4');
INSERT INTO `cmswing_area` VALUES ('371122', '莒　县', '371100', '5');
INSERT INTO `cmswing_area` VALUES ('371201', '市辖区', '371200', '1');
INSERT INTO `cmswing_area` VALUES ('371202', '莱城区', '371200', '2');
INSERT INTO `cmswing_area` VALUES ('371203', '钢城区', '371200', '3');
INSERT INTO `cmswing_area` VALUES ('371301', '市辖区', '371300', '1');
INSERT INTO `cmswing_area` VALUES ('371302', '兰山区', '371300', '2');
INSERT INTO `cmswing_area` VALUES ('371311', '罗庄区', '371300', '3');
INSERT INTO `cmswing_area` VALUES ('371312', '河东区', '371300', '4');
INSERT INTO `cmswing_area` VALUES ('371321', '沂南县', '371300', '5');
INSERT INTO `cmswing_area` VALUES ('371322', '郯城县', '371300', '6');
INSERT INTO `cmswing_area` VALUES ('371323', '沂水县', '371300', '7');
INSERT INTO `cmswing_area` VALUES ('371324', '苍山县', '371300', '8');
INSERT INTO `cmswing_area` VALUES ('371325', '费　县', '371300', '9');
INSERT INTO `cmswing_area` VALUES ('371326', '平邑县', '371300', '10');
INSERT INTO `cmswing_area` VALUES ('371327', '莒南县', '371300', '11');
INSERT INTO `cmswing_area` VALUES ('371328', '蒙阴县', '371300', '12');
INSERT INTO `cmswing_area` VALUES ('371329', '临沭县', '371300', '13');
INSERT INTO `cmswing_area` VALUES ('371401', '市辖区', '371400', '1');
INSERT INTO `cmswing_area` VALUES ('371402', '德城区', '371400', '2');
INSERT INTO `cmswing_area` VALUES ('371421', '陵　县', '371400', '3');
INSERT INTO `cmswing_area` VALUES ('371422', '宁津县', '371400', '4');
INSERT INTO `cmswing_area` VALUES ('371423', '庆云县', '371400', '5');
INSERT INTO `cmswing_area` VALUES ('371424', '临邑县', '371400', '6');
INSERT INTO `cmswing_area` VALUES ('371425', '齐河县', '371400', '7');
INSERT INTO `cmswing_area` VALUES ('371426', '平原县', '371400', '8');
INSERT INTO `cmswing_area` VALUES ('371427', '夏津县', '371400', '9');
INSERT INTO `cmswing_area` VALUES ('371428', '武城县', '371400', '10');
INSERT INTO `cmswing_area` VALUES ('371481', '乐陵市', '371400', '11');
INSERT INTO `cmswing_area` VALUES ('371482', '禹城市', '371400', '12');
INSERT INTO `cmswing_area` VALUES ('371501', '市辖区', '371500', '1');
INSERT INTO `cmswing_area` VALUES ('371502', '东昌府区', '371500', '2');
INSERT INTO `cmswing_area` VALUES ('371521', '阳谷县', '371500', '3');
INSERT INTO `cmswing_area` VALUES ('371522', '莘　县', '371500', '4');
INSERT INTO `cmswing_area` VALUES ('371523', '茌平县', '371500', '5');
INSERT INTO `cmswing_area` VALUES ('371524', '东阿县', '371500', '6');
INSERT INTO `cmswing_area` VALUES ('371525', '冠　县', '371500', '7');
INSERT INTO `cmswing_area` VALUES ('371526', '高唐县', '371500', '8');
INSERT INTO `cmswing_area` VALUES ('371581', '临清市', '371500', '9');
INSERT INTO `cmswing_area` VALUES ('371601', '市辖区', '371600', '1');
INSERT INTO `cmswing_area` VALUES ('371602', '滨城区', '371600', '2');
INSERT INTO `cmswing_area` VALUES ('371621', '惠民县', '371600', '3');
INSERT INTO `cmswing_area` VALUES ('371622', '阳信县', '371600', '4');
INSERT INTO `cmswing_area` VALUES ('371623', '无棣县', '371600', '5');
INSERT INTO `cmswing_area` VALUES ('371624', '沾化县', '371600', '6');
INSERT INTO `cmswing_area` VALUES ('371625', '博兴县', '371600', '7');
INSERT INTO `cmswing_area` VALUES ('371626', '邹平县', '371600', '8');
INSERT INTO `cmswing_area` VALUES ('371701', '市辖区', '371700', '1');
INSERT INTO `cmswing_area` VALUES ('371702', '牡丹区', '371700', '2');
INSERT INTO `cmswing_area` VALUES ('371721', '曹　县', '371700', '3');
INSERT INTO `cmswing_area` VALUES ('371722', '单　县', '371700', '4');
INSERT INTO `cmswing_area` VALUES ('371723', '成武县', '371700', '5');
INSERT INTO `cmswing_area` VALUES ('371724', '巨野县', '371700', '6');
INSERT INTO `cmswing_area` VALUES ('371725', '郓城县', '371700', '7');
INSERT INTO `cmswing_area` VALUES ('371726', '鄄城县', '371700', '8');
INSERT INTO `cmswing_area` VALUES ('371727', '定陶县', '371700', '9');
INSERT INTO `cmswing_area` VALUES ('371728', '东明县', '371700', '10');
INSERT INTO `cmswing_area` VALUES ('410101', '市辖区', '410100', '1');
INSERT INTO `cmswing_area` VALUES ('410102', '中原区', '410100', '2');
INSERT INTO `cmswing_area` VALUES ('410103', '二七区', '410100', '3');
INSERT INTO `cmswing_area` VALUES ('410104', '管城回族区', '410100', '4');
INSERT INTO `cmswing_area` VALUES ('410105', '金水区', '410100', '5');
INSERT INTO `cmswing_area` VALUES ('410106', '上街区', '410100', '6');
INSERT INTO `cmswing_area` VALUES ('410108', '邙山区', '410100', '7');
INSERT INTO `cmswing_area` VALUES ('410122', '中牟县', '410100', '8');
INSERT INTO `cmswing_area` VALUES ('410181', '巩义市', '410100', '9');
INSERT INTO `cmswing_area` VALUES ('410182', '荥阳市', '410100', '10');
INSERT INTO `cmswing_area` VALUES ('410183', '新密市', '410100', '11');
INSERT INTO `cmswing_area` VALUES ('410184', '新郑市', '410100', '12');
INSERT INTO `cmswing_area` VALUES ('410185', '登封市', '410100', '13');
INSERT INTO `cmswing_area` VALUES ('410201', '市辖区', '410200', '1');
INSERT INTO `cmswing_area` VALUES ('410202', '龙亭区', '410200', '2');
INSERT INTO `cmswing_area` VALUES ('410203', '顺河回族区', '410200', '3');
INSERT INTO `cmswing_area` VALUES ('410204', '鼓楼区', '410200', '4');
INSERT INTO `cmswing_area` VALUES ('410205', '南关区', '410200', '5');
INSERT INTO `cmswing_area` VALUES ('410211', '郊　区', '410200', '6');
INSERT INTO `cmswing_area` VALUES ('410221', '杞　县', '410200', '7');
INSERT INTO `cmswing_area` VALUES ('410222', '通许县', '410200', '8');
INSERT INTO `cmswing_area` VALUES ('410223', '尉氏县', '410200', '9');
INSERT INTO `cmswing_area` VALUES ('410224', '开封县', '410200', '10');
INSERT INTO `cmswing_area` VALUES ('410225', '兰考县', '410200', '11');
INSERT INTO `cmswing_area` VALUES ('410301', '市辖区', '410300', '1');
INSERT INTO `cmswing_area` VALUES ('410302', '老城区', '410300', '2');
INSERT INTO `cmswing_area` VALUES ('410303', '西工区', '410300', '3');
INSERT INTO `cmswing_area` VALUES ('410304', '廛河回族区', '410300', '4');
INSERT INTO `cmswing_area` VALUES ('410305', '涧西区', '410300', '5');
INSERT INTO `cmswing_area` VALUES ('410306', '吉利区', '410300', '6');
INSERT INTO `cmswing_area` VALUES ('410307', '洛龙区', '410300', '7');
INSERT INTO `cmswing_area` VALUES ('410322', '孟津县', '410300', '8');
INSERT INTO `cmswing_area` VALUES ('410323', '新安县', '410300', '9');
INSERT INTO `cmswing_area` VALUES ('410324', '栾川县', '410300', '10');
INSERT INTO `cmswing_area` VALUES ('410325', '嵩　县', '410300', '11');
INSERT INTO `cmswing_area` VALUES ('410326', '汝阳县', '410300', '12');
INSERT INTO `cmswing_area` VALUES ('410327', '宜阳县', '410300', '13');
INSERT INTO `cmswing_area` VALUES ('410328', '洛宁县', '410300', '14');
INSERT INTO `cmswing_area` VALUES ('410329', '伊川县', '410300', '15');
INSERT INTO `cmswing_area` VALUES ('410381', '偃师市', '410300', '16');
INSERT INTO `cmswing_area` VALUES ('410401', '市辖区', '410400', '1');
INSERT INTO `cmswing_area` VALUES ('410402', '新华区', '410400', '2');
INSERT INTO `cmswing_area` VALUES ('410403', '卫东区', '410400', '3');
INSERT INTO `cmswing_area` VALUES ('410404', '石龙区', '410400', '4');
INSERT INTO `cmswing_area` VALUES ('410411', '湛河区', '410400', '5');
INSERT INTO `cmswing_area` VALUES ('410421', '宝丰县', '410400', '6');
INSERT INTO `cmswing_area` VALUES ('410422', '叶　县', '410400', '7');
INSERT INTO `cmswing_area` VALUES ('410423', '鲁山县', '410400', '8');
INSERT INTO `cmswing_area` VALUES ('410425', '郏　县', '410400', '9');
INSERT INTO `cmswing_area` VALUES ('410481', '舞钢市', '410400', '10');
INSERT INTO `cmswing_area` VALUES ('410482', '汝州市', '410400', '11');
INSERT INTO `cmswing_area` VALUES ('410501', '市辖区', '410500', '1');
INSERT INTO `cmswing_area` VALUES ('410502', '文峰区', '410500', '2');
INSERT INTO `cmswing_area` VALUES ('410503', '北关区', '410500', '3');
INSERT INTO `cmswing_area` VALUES ('410505', '殷都区', '410500', '4');
INSERT INTO `cmswing_area` VALUES ('410506', '龙安区', '410500', '5');
INSERT INTO `cmswing_area` VALUES ('410522', '安阳县', '410500', '6');
INSERT INTO `cmswing_area` VALUES ('410523', '汤阴县', '410500', '7');
INSERT INTO `cmswing_area` VALUES ('410526', '滑　县', '410500', '8');
INSERT INTO `cmswing_area` VALUES ('410527', '内黄县', '410500', '9');
INSERT INTO `cmswing_area` VALUES ('410581', '林州市', '410500', '10');
INSERT INTO `cmswing_area` VALUES ('410601', '市辖区', '410600', '1');
INSERT INTO `cmswing_area` VALUES ('410602', '鹤山区', '410600', '2');
INSERT INTO `cmswing_area` VALUES ('410603', '山城区', '410600', '3');
INSERT INTO `cmswing_area` VALUES ('410611', '淇滨区', '410600', '4');
INSERT INTO `cmswing_area` VALUES ('410621', '浚　县', '410600', '5');
INSERT INTO `cmswing_area` VALUES ('410622', '淇　县', '410600', '6');
INSERT INTO `cmswing_area` VALUES ('410701', '市辖区', '410700', '1');
INSERT INTO `cmswing_area` VALUES ('410702', '红旗区', '410700', '2');
INSERT INTO `cmswing_area` VALUES ('410703', '卫滨区', '410700', '3');
INSERT INTO `cmswing_area` VALUES ('410704', '凤泉区', '410700', '4');
INSERT INTO `cmswing_area` VALUES ('410711', '牧野区', '410700', '5');
INSERT INTO `cmswing_area` VALUES ('410721', '新乡县', '410700', '6');
INSERT INTO `cmswing_area` VALUES ('410724', '获嘉县', '410700', '7');
INSERT INTO `cmswing_area` VALUES ('410725', '原阳县', '410700', '8');
INSERT INTO `cmswing_area` VALUES ('410726', '延津县', '410700', '9');
INSERT INTO `cmswing_area` VALUES ('410727', '封丘县', '410700', '10');
INSERT INTO `cmswing_area` VALUES ('410728', '长垣县', '410700', '11');
INSERT INTO `cmswing_area` VALUES ('410781', '卫辉市', '410700', '12');
INSERT INTO `cmswing_area` VALUES ('410782', '辉县市', '410700', '13');
INSERT INTO `cmswing_area` VALUES ('410801', '市辖区', '410800', '1');
INSERT INTO `cmswing_area` VALUES ('410802', '解放区', '410800', '2');
INSERT INTO `cmswing_area` VALUES ('410803', '中站区', '410800', '3');
INSERT INTO `cmswing_area` VALUES ('410804', '马村区', '410800', '4');
INSERT INTO `cmswing_area` VALUES ('410811', '山阳区', '410800', '5');
INSERT INTO `cmswing_area` VALUES ('410821', '修武县', '410800', '6');
INSERT INTO `cmswing_area` VALUES ('410822', '博爱县', '410800', '7');
INSERT INTO `cmswing_area` VALUES ('410823', '武陟县', '410800', '8');
INSERT INTO `cmswing_area` VALUES ('410825', '温　县', '410800', '9');
INSERT INTO `cmswing_area` VALUES ('410881', '济源市', '410800', '10');
INSERT INTO `cmswing_area` VALUES ('410882', '沁阳市', '410800', '11');
INSERT INTO `cmswing_area` VALUES ('410883', '孟州市', '410800', '12');
INSERT INTO `cmswing_area` VALUES ('410901', '市辖区', '410900', '1');
INSERT INTO `cmswing_area` VALUES ('410902', '华龙区', '410900', '2');
INSERT INTO `cmswing_area` VALUES ('410922', '清丰县', '410900', '3');
INSERT INTO `cmswing_area` VALUES ('410923', '南乐县', '410900', '4');
INSERT INTO `cmswing_area` VALUES ('410926', '范　县', '410900', '5');
INSERT INTO `cmswing_area` VALUES ('410927', '台前县', '410900', '6');
INSERT INTO `cmswing_area` VALUES ('410928', '濮阳县', '410900', '7');
INSERT INTO `cmswing_area` VALUES ('411001', '市辖区', '411000', '1');
INSERT INTO `cmswing_area` VALUES ('411002', '魏都区', '411000', '2');
INSERT INTO `cmswing_area` VALUES ('411023', '许昌县', '411000', '3');
INSERT INTO `cmswing_area` VALUES ('411024', '鄢陵县', '411000', '4');
INSERT INTO `cmswing_area` VALUES ('411025', '襄城县', '411000', '5');
INSERT INTO `cmswing_area` VALUES ('411081', '禹州市', '411000', '6');
INSERT INTO `cmswing_area` VALUES ('411082', '长葛市', '411000', '7');
INSERT INTO `cmswing_area` VALUES ('411101', '市辖区', '411100', '1');
INSERT INTO `cmswing_area` VALUES ('411102', '源汇区', '411100', '2');
INSERT INTO `cmswing_area` VALUES ('411103', '郾城区', '411100', '3');
INSERT INTO `cmswing_area` VALUES ('411104', '召陵区', '411100', '4');
INSERT INTO `cmswing_area` VALUES ('411121', '舞阳县', '411100', '5');
INSERT INTO `cmswing_area` VALUES ('411122', '临颍县', '411100', '6');
INSERT INTO `cmswing_area` VALUES ('411201', '市辖区', '411200', '1');
INSERT INTO `cmswing_area` VALUES ('411202', '湖滨区', '411200', '2');
INSERT INTO `cmswing_area` VALUES ('411221', '渑池县', '411200', '3');
INSERT INTO `cmswing_area` VALUES ('411222', '陕　县', '411200', '4');
INSERT INTO `cmswing_area` VALUES ('411224', '卢氏县', '411200', '5');
INSERT INTO `cmswing_area` VALUES ('411281', '义马市', '411200', '6');
INSERT INTO `cmswing_area` VALUES ('411282', '灵宝市', '411200', '7');
INSERT INTO `cmswing_area` VALUES ('411301', '市辖区', '411300', '1');
INSERT INTO `cmswing_area` VALUES ('411302', '宛城区', '411300', '2');
INSERT INTO `cmswing_area` VALUES ('411303', '卧龙区', '411300', '3');
INSERT INTO `cmswing_area` VALUES ('411321', '南召县', '411300', '4');
INSERT INTO `cmswing_area` VALUES ('411322', '方城县', '411300', '5');
INSERT INTO `cmswing_area` VALUES ('411323', '西峡县', '411300', '6');
INSERT INTO `cmswing_area` VALUES ('411324', '镇平县', '411300', '7');
INSERT INTO `cmswing_area` VALUES ('411325', '内乡县', '411300', '8');
INSERT INTO `cmswing_area` VALUES ('411326', '淅川县', '411300', '9');
INSERT INTO `cmswing_area` VALUES ('411327', '社旗县', '411300', '10');
INSERT INTO `cmswing_area` VALUES ('411328', '唐河县', '411300', '11');
INSERT INTO `cmswing_area` VALUES ('411329', '新野县', '411300', '12');
INSERT INTO `cmswing_area` VALUES ('411330', '桐柏县', '411300', '13');
INSERT INTO `cmswing_area` VALUES ('411381', '邓州市', '411300', '14');
INSERT INTO `cmswing_area` VALUES ('411401', '市辖区', '411400', '1');
INSERT INTO `cmswing_area` VALUES ('411402', '梁园区', '411400', '2');
INSERT INTO `cmswing_area` VALUES ('411403', '睢阳区', '411400', '3');
INSERT INTO `cmswing_area` VALUES ('411421', '民权县', '411400', '4');
INSERT INTO `cmswing_area` VALUES ('411422', '睢　县', '411400', '5');
INSERT INTO `cmswing_area` VALUES ('411423', '宁陵县', '411400', '6');
INSERT INTO `cmswing_area` VALUES ('411424', '柘城县', '411400', '7');
INSERT INTO `cmswing_area` VALUES ('411425', '虞城县', '411400', '8');
INSERT INTO `cmswing_area` VALUES ('411426', '夏邑县', '411400', '9');
INSERT INTO `cmswing_area` VALUES ('411481', '永城市', '411400', '10');
INSERT INTO `cmswing_area` VALUES ('411501', '市辖区', '411500', '1');
INSERT INTO `cmswing_area` VALUES ('411502', '师河区', '411500', '2');
INSERT INTO `cmswing_area` VALUES ('411503', '平桥区', '411500', '3');
INSERT INTO `cmswing_area` VALUES ('411521', '罗山县', '411500', '4');
INSERT INTO `cmswing_area` VALUES ('411522', '光山县', '411500', '5');
INSERT INTO `cmswing_area` VALUES ('411523', '新　县', '411500', '6');
INSERT INTO `cmswing_area` VALUES ('411524', '商城县', '411500', '7');
INSERT INTO `cmswing_area` VALUES ('411525', '固始县', '411500', '8');
INSERT INTO `cmswing_area` VALUES ('411526', '潢川县', '411500', '9');
INSERT INTO `cmswing_area` VALUES ('411527', '淮滨县', '411500', '10');
INSERT INTO `cmswing_area` VALUES ('411528', '息　县', '411500', '11');
INSERT INTO `cmswing_area` VALUES ('411601', '市辖区', '411600', '1');
INSERT INTO `cmswing_area` VALUES ('411602', '川汇区', '411600', '2');
INSERT INTO `cmswing_area` VALUES ('411621', '扶沟县', '411600', '3');
INSERT INTO `cmswing_area` VALUES ('411622', '西华县', '411600', '4');
INSERT INTO `cmswing_area` VALUES ('411623', '商水县', '411600', '5');
INSERT INTO `cmswing_area` VALUES ('411624', '沈丘县', '411600', '6');
INSERT INTO `cmswing_area` VALUES ('411625', '郸城县', '411600', '7');
INSERT INTO `cmswing_area` VALUES ('411626', '淮阳县', '411600', '8');
INSERT INTO `cmswing_area` VALUES ('411627', '太康县', '411600', '9');
INSERT INTO `cmswing_area` VALUES ('411628', '鹿邑县', '411600', '10');
INSERT INTO `cmswing_area` VALUES ('411681', '项城市', '411600', '11');
INSERT INTO `cmswing_area` VALUES ('411701', '市辖区', '411700', '1');
INSERT INTO `cmswing_area` VALUES ('411702', '驿城区', '411700', '2');
INSERT INTO `cmswing_area` VALUES ('411721', '西平县', '411700', '3');
INSERT INTO `cmswing_area` VALUES ('411722', '上蔡县', '411700', '4');
INSERT INTO `cmswing_area` VALUES ('411723', '平舆县', '411700', '5');
INSERT INTO `cmswing_area` VALUES ('411724', '正阳县', '411700', '6');
INSERT INTO `cmswing_area` VALUES ('411725', '确山县', '411700', '7');
INSERT INTO `cmswing_area` VALUES ('411726', '泌阳县', '411700', '8');
INSERT INTO `cmswing_area` VALUES ('411727', '汝南县', '411700', '9');
INSERT INTO `cmswing_area` VALUES ('411728', '遂平县', '411700', '10');
INSERT INTO `cmswing_area` VALUES ('411729', '新蔡县', '411700', '11');
INSERT INTO `cmswing_area` VALUES ('420101', '市辖区', '420100', '1');
INSERT INTO `cmswing_area` VALUES ('420102', '江岸区', '420100', '2');
INSERT INTO `cmswing_area` VALUES ('420103', '江汉区', '420100', '3');
INSERT INTO `cmswing_area` VALUES ('420104', '乔口区', '420100', '4');
INSERT INTO `cmswing_area` VALUES ('420105', '汉阳区', '420100', '5');
INSERT INTO `cmswing_area` VALUES ('420106', '武昌区', '420100', '6');
INSERT INTO `cmswing_area` VALUES ('420107', '青山区', '420100', '7');
INSERT INTO `cmswing_area` VALUES ('420111', '洪山区', '420100', '8');
INSERT INTO `cmswing_area` VALUES ('420112', '东西湖区', '420100', '9');
INSERT INTO `cmswing_area` VALUES ('420113', '汉南区', '420100', '10');
INSERT INTO `cmswing_area` VALUES ('420114', '蔡甸区', '420100', '11');
INSERT INTO `cmswing_area` VALUES ('420115', '江夏区', '420100', '12');
INSERT INTO `cmswing_area` VALUES ('420116', '黄陂区', '420100', '13');
INSERT INTO `cmswing_area` VALUES ('420117', '新洲区', '420100', '14');
INSERT INTO `cmswing_area` VALUES ('420201', '市辖区', '420200', '1');
INSERT INTO `cmswing_area` VALUES ('420202', '黄石港区', '420200', '2');
INSERT INTO `cmswing_area` VALUES ('420203', '西塞山区', '420200', '3');
INSERT INTO `cmswing_area` VALUES ('420204', '下陆区', '420200', '4');
INSERT INTO `cmswing_area` VALUES ('420205', '铁山区', '420200', '5');
INSERT INTO `cmswing_area` VALUES ('420222', '阳新县', '420200', '6');
INSERT INTO `cmswing_area` VALUES ('420281', '大冶市', '420200', '7');
INSERT INTO `cmswing_area` VALUES ('420301', '市辖区', '420300', '1');
INSERT INTO `cmswing_area` VALUES ('420302', '茅箭区', '420300', '2');
INSERT INTO `cmswing_area` VALUES ('420303', '张湾区', '420300', '3');
INSERT INTO `cmswing_area` VALUES ('420321', '郧　县', '420300', '4');
INSERT INTO `cmswing_area` VALUES ('420322', '郧西县', '420300', '5');
INSERT INTO `cmswing_area` VALUES ('420323', '竹山县', '420300', '6');
INSERT INTO `cmswing_area` VALUES ('420324', '竹溪县', '420300', '7');
INSERT INTO `cmswing_area` VALUES ('420325', '房　县', '420300', '8');
INSERT INTO `cmswing_area` VALUES ('420381', '丹江口市', '420300', '9');
INSERT INTO `cmswing_area` VALUES ('420501', '市辖区', '420500', '1');
INSERT INTO `cmswing_area` VALUES ('420502', '西陵区', '420500', '2');
INSERT INTO `cmswing_area` VALUES ('420503', '伍家岗区', '420500', '3');
INSERT INTO `cmswing_area` VALUES ('420504', '点军区', '420500', '4');
INSERT INTO `cmswing_area` VALUES ('420505', '猇亭区', '420500', '5');
INSERT INTO `cmswing_area` VALUES ('420506', '夷陵区', '420500', '6');
INSERT INTO `cmswing_area` VALUES ('420525', '远安县', '420500', '7');
INSERT INTO `cmswing_area` VALUES ('420526', '兴山县', '420500', '8');
INSERT INTO `cmswing_area` VALUES ('420527', '秭归县', '420500', '9');
INSERT INTO `cmswing_area` VALUES ('420528', '长阳土家族自治县', '420500', '10');
INSERT INTO `cmswing_area` VALUES ('420529', '五峰土家族自治县', '420500', '11');
INSERT INTO `cmswing_area` VALUES ('420581', '宜都市', '420500', '12');
INSERT INTO `cmswing_area` VALUES ('420582', '当阳市', '420500', '13');
INSERT INTO `cmswing_area` VALUES ('420583', '枝江市', '420500', '14');
INSERT INTO `cmswing_area` VALUES ('420601', '市辖区', '420600', '1');
INSERT INTO `cmswing_area` VALUES ('420602', '襄城区', '420600', '2');
INSERT INTO `cmswing_area` VALUES ('420606', '樊城区', '420600', '3');
INSERT INTO `cmswing_area` VALUES ('420607', '襄阳区', '420600', '4');
INSERT INTO `cmswing_area` VALUES ('420624', '南漳县', '420600', '5');
INSERT INTO `cmswing_area` VALUES ('420625', '谷城县', '420600', '6');
INSERT INTO `cmswing_area` VALUES ('420626', '保康县', '420600', '7');
INSERT INTO `cmswing_area` VALUES ('420682', '老河口市', '420600', '8');
INSERT INTO `cmswing_area` VALUES ('420683', '枣阳市', '420600', '9');
INSERT INTO `cmswing_area` VALUES ('420684', '宜城市', '420600', '10');
INSERT INTO `cmswing_area` VALUES ('420701', '市辖区', '420700', '1');
INSERT INTO `cmswing_area` VALUES ('420702', '梁子湖区', '420700', '2');
INSERT INTO `cmswing_area` VALUES ('420703', '华容区', '420700', '3');
INSERT INTO `cmswing_area` VALUES ('420704', '鄂城区', '420700', '4');
INSERT INTO `cmswing_area` VALUES ('420801', '市辖区', '420800', '1');
INSERT INTO `cmswing_area` VALUES ('420802', '东宝区', '420800', '2');
INSERT INTO `cmswing_area` VALUES ('420804', '掇刀区', '420800', '3');
INSERT INTO `cmswing_area` VALUES ('420821', '京山县', '420800', '4');
INSERT INTO `cmswing_area` VALUES ('420822', '沙洋县', '420800', '5');
INSERT INTO `cmswing_area` VALUES ('420881', '钟祥市', '420800', '6');
INSERT INTO `cmswing_area` VALUES ('420901', '市辖区', '420900', '1');
INSERT INTO `cmswing_area` VALUES ('420902', '孝南区', '420900', '2');
INSERT INTO `cmswing_area` VALUES ('420921', '孝昌县', '420900', '3');
INSERT INTO `cmswing_area` VALUES ('420922', '大悟县', '420900', '4');
INSERT INTO `cmswing_area` VALUES ('420923', '云梦县', '420900', '5');
INSERT INTO `cmswing_area` VALUES ('420981', '应城市', '420900', '6');
INSERT INTO `cmswing_area` VALUES ('420982', '安陆市', '420900', '7');
INSERT INTO `cmswing_area` VALUES ('420984', '汉川市', '420900', '8');
INSERT INTO `cmswing_area` VALUES ('421001', '市辖区', '421000', '1');
INSERT INTO `cmswing_area` VALUES ('421002', '沙市区', '421000', '2');
INSERT INTO `cmswing_area` VALUES ('421003', '荆州区', '421000', '3');
INSERT INTO `cmswing_area` VALUES ('421022', '公安县', '421000', '4');
INSERT INTO `cmswing_area` VALUES ('421023', '监利县', '421000', '5');
INSERT INTO `cmswing_area` VALUES ('421024', '江陵县', '421000', '6');
INSERT INTO `cmswing_area` VALUES ('421081', '石首市', '421000', '7');
INSERT INTO `cmswing_area` VALUES ('421083', '洪湖市', '421000', '8');
INSERT INTO `cmswing_area` VALUES ('421087', '松滋市', '421000', '9');
INSERT INTO `cmswing_area` VALUES ('421101', '市辖区', '421100', '1');
INSERT INTO `cmswing_area` VALUES ('421102', '黄州区', '421100', '2');
INSERT INTO `cmswing_area` VALUES ('421121', '团风县', '421100', '3');
INSERT INTO `cmswing_area` VALUES ('421122', '红安县', '421100', '4');
INSERT INTO `cmswing_area` VALUES ('421123', '罗田县', '421100', '5');
INSERT INTO `cmswing_area` VALUES ('421124', '英山县', '421100', '6');
INSERT INTO `cmswing_area` VALUES ('421125', '浠水县', '421100', '7');
INSERT INTO `cmswing_area` VALUES ('421126', '蕲春县', '421100', '8');
INSERT INTO `cmswing_area` VALUES ('421127', '黄梅县', '421100', '9');
INSERT INTO `cmswing_area` VALUES ('421181', '麻城市', '421100', '10');
INSERT INTO `cmswing_area` VALUES ('421182', '武穴市', '421100', '11');
INSERT INTO `cmswing_area` VALUES ('421201', '市辖区', '421200', '1');
INSERT INTO `cmswing_area` VALUES ('421202', '咸安区', '421200', '2');
INSERT INTO `cmswing_area` VALUES ('421221', '嘉鱼县', '421200', '3');
INSERT INTO `cmswing_area` VALUES ('421222', '通城县', '421200', '4');
INSERT INTO `cmswing_area` VALUES ('421223', '崇阳县', '421200', '5');
INSERT INTO `cmswing_area` VALUES ('421224', '通山县', '421200', '6');
INSERT INTO `cmswing_area` VALUES ('421281', '赤壁市', '421200', '7');
INSERT INTO `cmswing_area` VALUES ('421301', '市辖区', '421300', '1');
INSERT INTO `cmswing_area` VALUES ('421302', '曾都区', '421300', '2');
INSERT INTO `cmswing_area` VALUES ('421381', '广水市', '421300', '3');
INSERT INTO `cmswing_area` VALUES ('422801', '恩施市', '422800', '1');
INSERT INTO `cmswing_area` VALUES ('422802', '利川市', '422800', '2');
INSERT INTO `cmswing_area` VALUES ('422822', '建始县', '422800', '3');
INSERT INTO `cmswing_area` VALUES ('422823', '巴东县', '422800', '4');
INSERT INTO `cmswing_area` VALUES ('422825', '宣恩县', '422800', '5');
INSERT INTO `cmswing_area` VALUES ('422826', '咸丰县', '422800', '6');
INSERT INTO `cmswing_area` VALUES ('422827', '来凤县', '422800', '7');
INSERT INTO `cmswing_area` VALUES ('422828', '鹤峰县', '422800', '8');
INSERT INTO `cmswing_area` VALUES ('429004', '仙桃市', '429000', '1');
INSERT INTO `cmswing_area` VALUES ('429005', '潜江市', '429000', '2');
INSERT INTO `cmswing_area` VALUES ('429006', '天门市', '429000', '3');
INSERT INTO `cmswing_area` VALUES ('429021', '神农架林区', '429000', '4');
INSERT INTO `cmswing_area` VALUES ('430101', '市辖区', '430100', '1');
INSERT INTO `cmswing_area` VALUES ('430102', '芙蓉区', '430100', '2');
INSERT INTO `cmswing_area` VALUES ('430103', '天心区', '430100', '3');
INSERT INTO `cmswing_area` VALUES ('430104', '岳麓区', '430100', '4');
INSERT INTO `cmswing_area` VALUES ('430105', '开福区', '430100', '5');
INSERT INTO `cmswing_area` VALUES ('430111', '雨花区', '430100', '6');
INSERT INTO `cmswing_area` VALUES ('430121', '长沙县', '430100', '7');
INSERT INTO `cmswing_area` VALUES ('430122', '望城县', '430100', '8');
INSERT INTO `cmswing_area` VALUES ('430124', '宁乡县', '430100', '9');
INSERT INTO `cmswing_area` VALUES ('430181', '浏阳市', '430100', '10');
INSERT INTO `cmswing_area` VALUES ('430201', '市辖区', '430200', '1');
INSERT INTO `cmswing_area` VALUES ('430202', '荷塘区', '430200', '2');
INSERT INTO `cmswing_area` VALUES ('430203', '芦淞区', '430200', '3');
INSERT INTO `cmswing_area` VALUES ('430204', '石峰区', '430200', '4');
INSERT INTO `cmswing_area` VALUES ('430211', '天元区', '430200', '5');
INSERT INTO `cmswing_area` VALUES ('430221', '株洲县', '430200', '6');
INSERT INTO `cmswing_area` VALUES ('430223', '攸　县', '430200', '7');
INSERT INTO `cmswing_area` VALUES ('430224', '茶陵县', '430200', '8');
INSERT INTO `cmswing_area` VALUES ('430225', '炎陵县', '430200', '9');
INSERT INTO `cmswing_area` VALUES ('430281', '醴陵市', '430200', '10');
INSERT INTO `cmswing_area` VALUES ('430301', '市辖区', '430300', '1');
INSERT INTO `cmswing_area` VALUES ('430302', '雨湖区', '430300', '2');
INSERT INTO `cmswing_area` VALUES ('430304', '岳塘区', '430300', '3');
INSERT INTO `cmswing_area` VALUES ('430321', '湘潭县', '430300', '4');
INSERT INTO `cmswing_area` VALUES ('430381', '湘乡市', '430300', '5');
INSERT INTO `cmswing_area` VALUES ('430382', '韶山市', '430300', '6');
INSERT INTO `cmswing_area` VALUES ('430401', '市辖区', '430400', '1');
INSERT INTO `cmswing_area` VALUES ('430405', '珠晖区', '430400', '2');
INSERT INTO `cmswing_area` VALUES ('430406', '雁峰区', '430400', '3');
INSERT INTO `cmswing_area` VALUES ('430407', '石鼓区', '430400', '4');
INSERT INTO `cmswing_area` VALUES ('430408', '蒸湘区', '430400', '5');
INSERT INTO `cmswing_area` VALUES ('430412', '南岳区', '430400', '6');
INSERT INTO `cmswing_area` VALUES ('430421', '衡阳县', '430400', '7');
INSERT INTO `cmswing_area` VALUES ('430422', '衡南县', '430400', '8');
INSERT INTO `cmswing_area` VALUES ('430423', '衡山县', '430400', '9');
INSERT INTO `cmswing_area` VALUES ('430424', '衡东县', '430400', '10');
INSERT INTO `cmswing_area` VALUES ('430426', '祁东县', '430400', '11');
INSERT INTO `cmswing_area` VALUES ('430481', '耒阳市', '430400', '12');
INSERT INTO `cmswing_area` VALUES ('430482', '常宁市', '430400', '13');
INSERT INTO `cmswing_area` VALUES ('430501', '市辖区', '430500', '1');
INSERT INTO `cmswing_area` VALUES ('430502', '双清区', '430500', '2');
INSERT INTO `cmswing_area` VALUES ('430503', '大祥区', '430500', '3');
INSERT INTO `cmswing_area` VALUES ('430511', '北塔区', '430500', '4');
INSERT INTO `cmswing_area` VALUES ('430521', '邵东县', '430500', '5');
INSERT INTO `cmswing_area` VALUES ('430522', '新邵县', '430500', '6');
INSERT INTO `cmswing_area` VALUES ('430523', '邵阳县', '430500', '7');
INSERT INTO `cmswing_area` VALUES ('430524', '隆回县', '430500', '8');
INSERT INTO `cmswing_area` VALUES ('430525', '洞口县', '430500', '9');
INSERT INTO `cmswing_area` VALUES ('430527', '绥宁县', '430500', '10');
INSERT INTO `cmswing_area` VALUES ('430528', '新宁县', '430500', '11');
INSERT INTO `cmswing_area` VALUES ('430529', '城步苗族自治县', '430500', '12');
INSERT INTO `cmswing_area` VALUES ('430581', '武冈市', '430500', '13');
INSERT INTO `cmswing_area` VALUES ('430601', '市辖区', '430600', '1');
INSERT INTO `cmswing_area` VALUES ('430602', '岳阳楼区', '430600', '2');
INSERT INTO `cmswing_area` VALUES ('430603', '云溪区', '430600', '3');
INSERT INTO `cmswing_area` VALUES ('430611', '君山区', '430600', '4');
INSERT INTO `cmswing_area` VALUES ('430621', '岳阳县', '430600', '5');
INSERT INTO `cmswing_area` VALUES ('430623', '华容县', '430600', '6');
INSERT INTO `cmswing_area` VALUES ('430624', '湘阴县', '430600', '7');
INSERT INTO `cmswing_area` VALUES ('430626', '平江县', '430600', '8');
INSERT INTO `cmswing_area` VALUES ('430681', '汨罗市', '430600', '9');
INSERT INTO `cmswing_area` VALUES ('430682', '临湘市', '430600', '10');
INSERT INTO `cmswing_area` VALUES ('430701', '市辖区', '430700', '1');
INSERT INTO `cmswing_area` VALUES ('430702', '武陵区', '430700', '2');
INSERT INTO `cmswing_area` VALUES ('430703', '鼎城区', '430700', '3');
INSERT INTO `cmswing_area` VALUES ('430721', '安乡县', '430700', '4');
INSERT INTO `cmswing_area` VALUES ('430722', '汉寿县', '430700', '5');
INSERT INTO `cmswing_area` VALUES ('430723', '澧　县', '430700', '6');
INSERT INTO `cmswing_area` VALUES ('430724', '临澧县', '430700', '7');
INSERT INTO `cmswing_area` VALUES ('430725', '桃源县', '430700', '8');
INSERT INTO `cmswing_area` VALUES ('430726', '石门县', '430700', '9');
INSERT INTO `cmswing_area` VALUES ('430781', '津市市', '430700', '10');
INSERT INTO `cmswing_area` VALUES ('430801', '市辖区', '430800', '1');
INSERT INTO `cmswing_area` VALUES ('430802', '永定区', '430800', '2');
INSERT INTO `cmswing_area` VALUES ('430811', '武陵源区', '430800', '3');
INSERT INTO `cmswing_area` VALUES ('430821', '慈利县', '430800', '4');
INSERT INTO `cmswing_area` VALUES ('430822', '桑植县', '430800', '5');
INSERT INTO `cmswing_area` VALUES ('430901', '市辖区', '430900', '1');
INSERT INTO `cmswing_area` VALUES ('430902', '资阳区', '430900', '2');
INSERT INTO `cmswing_area` VALUES ('430903', '赫山区', '430900', '3');
INSERT INTO `cmswing_area` VALUES ('430921', '南　县', '430900', '4');
INSERT INTO `cmswing_area` VALUES ('430922', '桃江县', '430900', '5');
INSERT INTO `cmswing_area` VALUES ('430923', '安化县', '430900', '6');
INSERT INTO `cmswing_area` VALUES ('430981', '沅江市', '430900', '7');
INSERT INTO `cmswing_area` VALUES ('431001', '市辖区', '431000', '1');
INSERT INTO `cmswing_area` VALUES ('431002', '北湖区', '431000', '2');
INSERT INTO `cmswing_area` VALUES ('431003', '苏仙区', '431000', '3');
INSERT INTO `cmswing_area` VALUES ('431021', '桂阳县', '431000', '4');
INSERT INTO `cmswing_area` VALUES ('431022', '宜章县', '431000', '5');
INSERT INTO `cmswing_area` VALUES ('431023', '永兴县', '431000', '6');
INSERT INTO `cmswing_area` VALUES ('431024', '嘉禾县', '431000', '7');
INSERT INTO `cmswing_area` VALUES ('431025', '临武县', '431000', '8');
INSERT INTO `cmswing_area` VALUES ('431026', '汝城县', '431000', '9');
INSERT INTO `cmswing_area` VALUES ('431027', '桂东县', '431000', '10');
INSERT INTO `cmswing_area` VALUES ('431028', '安仁县', '431000', '11');
INSERT INTO `cmswing_area` VALUES ('431081', '资兴市', '431000', '12');
INSERT INTO `cmswing_area` VALUES ('431101', '市辖区', '431100', '1');
INSERT INTO `cmswing_area` VALUES ('431102', '芝山区', '431100', '2');
INSERT INTO `cmswing_area` VALUES ('431103', '冷水滩区', '431100', '3');
INSERT INTO `cmswing_area` VALUES ('431121', '祁阳县', '431100', '4');
INSERT INTO `cmswing_area` VALUES ('431122', '东安县', '431100', '5');
INSERT INTO `cmswing_area` VALUES ('431123', '双牌县', '431100', '6');
INSERT INTO `cmswing_area` VALUES ('431124', '道　县', '431100', '7');
INSERT INTO `cmswing_area` VALUES ('431125', '江永县', '431100', '8');
INSERT INTO `cmswing_area` VALUES ('431126', '宁远县', '431100', '9');
INSERT INTO `cmswing_area` VALUES ('431127', '蓝山县', '431100', '10');
INSERT INTO `cmswing_area` VALUES ('431128', '新田县', '431100', '11');
INSERT INTO `cmswing_area` VALUES ('431129', '江华瑶族自治县', '431100', '12');
INSERT INTO `cmswing_area` VALUES ('431201', '市辖区', '431200', '1');
INSERT INTO `cmswing_area` VALUES ('431202', '鹤城区', '431200', '2');
INSERT INTO `cmswing_area` VALUES ('431221', '中方县', '431200', '3');
INSERT INTO `cmswing_area` VALUES ('431222', '沅陵县', '431200', '4');
INSERT INTO `cmswing_area` VALUES ('431223', '辰溪县', '431200', '5');
INSERT INTO `cmswing_area` VALUES ('431224', '溆浦县', '431200', '6');
INSERT INTO `cmswing_area` VALUES ('431225', '会同县', '431200', '7');
INSERT INTO `cmswing_area` VALUES ('431226', '麻阳苗族自治县', '431200', '8');
INSERT INTO `cmswing_area` VALUES ('431227', '新晃侗族自治县', '431200', '9');
INSERT INTO `cmswing_area` VALUES ('431228', '芷江侗族自治县', '431200', '10');
INSERT INTO `cmswing_area` VALUES ('431229', '靖州苗族侗族自治县', '431200', '11');
INSERT INTO `cmswing_area` VALUES ('431230', '通道侗族自治县', '431200', '12');
INSERT INTO `cmswing_area` VALUES ('431281', '洪江市', '431200', '13');
INSERT INTO `cmswing_area` VALUES ('431301', '市辖区', '431300', '1');
INSERT INTO `cmswing_area` VALUES ('431302', '娄星区', '431300', '2');
INSERT INTO `cmswing_area` VALUES ('431321', '双峰县', '431300', '3');
INSERT INTO `cmswing_area` VALUES ('431322', '新化县', '431300', '4');
INSERT INTO `cmswing_area` VALUES ('431381', '冷水江市', '431300', '5');
INSERT INTO `cmswing_area` VALUES ('431382', '涟源市', '431300', '6');
INSERT INTO `cmswing_area` VALUES ('433101', '吉首市', '433100', '1');
INSERT INTO `cmswing_area` VALUES ('433122', '泸溪县', '433100', '2');
INSERT INTO `cmswing_area` VALUES ('433123', '凤凰县', '433100', '3');
INSERT INTO `cmswing_area` VALUES ('433124', '花垣县', '433100', '4');
INSERT INTO `cmswing_area` VALUES ('433125', '保靖县', '433100', '5');
INSERT INTO `cmswing_area` VALUES ('433126', '古丈县', '433100', '6');
INSERT INTO `cmswing_area` VALUES ('433127', '永顺县', '433100', '7');
INSERT INTO `cmswing_area` VALUES ('433130', '龙山县', '433100', '8');
INSERT INTO `cmswing_area` VALUES ('440101', '市辖区', '440100', '1');
INSERT INTO `cmswing_area` VALUES ('440102', '东山区', '440100', '2');
INSERT INTO `cmswing_area` VALUES ('440103', '荔湾区', '440100', '3');
INSERT INTO `cmswing_area` VALUES ('440104', '越秀区', '440100', '4');
INSERT INTO `cmswing_area` VALUES ('440105', '海珠区', '440100', '5');
INSERT INTO `cmswing_area` VALUES ('440106', '天河区', '440100', '6');
INSERT INTO `cmswing_area` VALUES ('440107', '芳村区', '440100', '7');
INSERT INTO `cmswing_area` VALUES ('440111', '白云区', '440100', '8');
INSERT INTO `cmswing_area` VALUES ('440112', '黄埔区', '440100', '9');
INSERT INTO `cmswing_area` VALUES ('440113', '番禺区', '440100', '10');
INSERT INTO `cmswing_area` VALUES ('440114', '花都区', '440100', '11');
INSERT INTO `cmswing_area` VALUES ('440183', '增城市', '440100', '12');
INSERT INTO `cmswing_area` VALUES ('440184', '从化市', '440100', '13');
INSERT INTO `cmswing_area` VALUES ('440201', '市辖区', '440200', '1');
INSERT INTO `cmswing_area` VALUES ('440203', '武江区', '440200', '2');
INSERT INTO `cmswing_area` VALUES ('440204', '浈江区', '440200', '3');
INSERT INTO `cmswing_area` VALUES ('440205', '曲江区', '440200', '4');
INSERT INTO `cmswing_area` VALUES ('440222', '始兴县', '440200', '5');
INSERT INTO `cmswing_area` VALUES ('440224', '仁化县', '440200', '6');
INSERT INTO `cmswing_area` VALUES ('440229', '翁源县', '440200', '7');
INSERT INTO `cmswing_area` VALUES ('440232', '乳源瑶族自治县', '440200', '8');
INSERT INTO `cmswing_area` VALUES ('440233', '新丰县', '440200', '9');
INSERT INTO `cmswing_area` VALUES ('440281', '乐昌市', '440200', '10');
INSERT INTO `cmswing_area` VALUES ('440282', '南雄市', '440200', '11');
INSERT INTO `cmswing_area` VALUES ('440301', '市辖区', '440300', '1');
INSERT INTO `cmswing_area` VALUES ('440303', '罗湖区', '440300', '2');
INSERT INTO `cmswing_area` VALUES ('440304', '福田区', '440300', '3');
INSERT INTO `cmswing_area` VALUES ('440305', '南山区', '440300', '4');
INSERT INTO `cmswing_area` VALUES ('440306', '宝安区', '440300', '5');
INSERT INTO `cmswing_area` VALUES ('440307', '龙岗区', '440300', '6');
INSERT INTO `cmswing_area` VALUES ('440308', '盐田区', '440300', '7');
INSERT INTO `cmswing_area` VALUES ('440401', '市辖区', '440400', '1');
INSERT INTO `cmswing_area` VALUES ('440402', '香洲区', '440400', '2');
INSERT INTO `cmswing_area` VALUES ('440403', '斗门区', '440400', '3');
INSERT INTO `cmswing_area` VALUES ('440404', '金湾区', '440400', '4');
INSERT INTO `cmswing_area` VALUES ('440501', '市辖区', '440500', '1');
INSERT INTO `cmswing_area` VALUES ('440507', '龙湖区', '440500', '2');
INSERT INTO `cmswing_area` VALUES ('440511', '金平区', '440500', '3');
INSERT INTO `cmswing_area` VALUES ('440512', '濠江区', '440500', '4');
INSERT INTO `cmswing_area` VALUES ('440513', '潮阳区', '440500', '5');
INSERT INTO `cmswing_area` VALUES ('440514', '潮南区', '440500', '6');
INSERT INTO `cmswing_area` VALUES ('440515', '澄海区', '440500', '7');
INSERT INTO `cmswing_area` VALUES ('440523', '南澳县', '440500', '8');
INSERT INTO `cmswing_area` VALUES ('440601', '市辖区', '440600', '1');
INSERT INTO `cmswing_area` VALUES ('440604', '禅城区', '440600', '2');
INSERT INTO `cmswing_area` VALUES ('440605', '南海区', '440600', '3');
INSERT INTO `cmswing_area` VALUES ('440606', '顺德区', '440600', '4');
INSERT INTO `cmswing_area` VALUES ('440607', '三水区', '440600', '5');
INSERT INTO `cmswing_area` VALUES ('440608', '高明区', '440600', '6');
INSERT INTO `cmswing_area` VALUES ('440701', '市辖区', '440700', '1');
INSERT INTO `cmswing_area` VALUES ('440703', '蓬江区', '440700', '2');
INSERT INTO `cmswing_area` VALUES ('440704', '江海区', '440700', '3');
INSERT INTO `cmswing_area` VALUES ('440705', '新会区', '440700', '4');
INSERT INTO `cmswing_area` VALUES ('440781', '台山市', '440700', '5');
INSERT INTO `cmswing_area` VALUES ('440783', '开平市', '440700', '6');
INSERT INTO `cmswing_area` VALUES ('440784', '鹤山市', '440700', '7');
INSERT INTO `cmswing_area` VALUES ('440785', '恩平市', '440700', '8');
INSERT INTO `cmswing_area` VALUES ('440801', '市辖区', '440800', '1');
INSERT INTO `cmswing_area` VALUES ('440802', '赤坎区', '440800', '2');
INSERT INTO `cmswing_area` VALUES ('440803', '霞山区', '440800', '3');
INSERT INTO `cmswing_area` VALUES ('440804', '坡头区', '440800', '4');
INSERT INTO `cmswing_area` VALUES ('440811', '麻章区', '440800', '5');
INSERT INTO `cmswing_area` VALUES ('440823', '遂溪县', '440800', '6');
INSERT INTO `cmswing_area` VALUES ('440825', '徐闻县', '440800', '7');
INSERT INTO `cmswing_area` VALUES ('440881', '廉江市', '440800', '8');
INSERT INTO `cmswing_area` VALUES ('440882', '雷州市', '440800', '9');
INSERT INTO `cmswing_area` VALUES ('440883', '吴川市', '440800', '10');
INSERT INTO `cmswing_area` VALUES ('440901', '市辖区', '440900', '1');
INSERT INTO `cmswing_area` VALUES ('440902', '茂南区', '440900', '2');
INSERT INTO `cmswing_area` VALUES ('440903', '茂港区', '440900', '3');
INSERT INTO `cmswing_area` VALUES ('440923', '电白县', '440900', '4');
INSERT INTO `cmswing_area` VALUES ('440981', '高州市', '440900', '5');
INSERT INTO `cmswing_area` VALUES ('440982', '化州市', '440900', '6');
INSERT INTO `cmswing_area` VALUES ('440983', '信宜市', '440900', '7');
INSERT INTO `cmswing_area` VALUES ('441201', '市辖区', '441200', '1');
INSERT INTO `cmswing_area` VALUES ('441202', '端州区', '441200', '2');
INSERT INTO `cmswing_area` VALUES ('441203', '鼎湖区', '441200', '3');
INSERT INTO `cmswing_area` VALUES ('441223', '广宁县', '441200', '4');
INSERT INTO `cmswing_area` VALUES ('441224', '怀集县', '441200', '5');
INSERT INTO `cmswing_area` VALUES ('441225', '封开县', '441200', '6');
INSERT INTO `cmswing_area` VALUES ('441226', '德庆县', '441200', '7');
INSERT INTO `cmswing_area` VALUES ('441283', '高要市', '441200', '8');
INSERT INTO `cmswing_area` VALUES ('441284', '四会市', '441200', '9');
INSERT INTO `cmswing_area` VALUES ('441301', '市辖区', '441300', '1');
INSERT INTO `cmswing_area` VALUES ('441302', '惠城区', '441300', '2');
INSERT INTO `cmswing_area` VALUES ('441303', '惠阳区', '441300', '3');
INSERT INTO `cmswing_area` VALUES ('441322', '博罗县', '441300', '4');
INSERT INTO `cmswing_area` VALUES ('441323', '惠东县', '441300', '5');
INSERT INTO `cmswing_area` VALUES ('441324', '龙门县', '441300', '6');
INSERT INTO `cmswing_area` VALUES ('441401', '市辖区', '441400', '1');
INSERT INTO `cmswing_area` VALUES ('441402', '梅江区', '441400', '2');
INSERT INTO `cmswing_area` VALUES ('441421', '梅　县', '441400', '3');
INSERT INTO `cmswing_area` VALUES ('441422', '大埔县', '441400', '4');
INSERT INTO `cmswing_area` VALUES ('441423', '丰顺县', '441400', '5');
INSERT INTO `cmswing_area` VALUES ('441424', '五华县', '441400', '6');
INSERT INTO `cmswing_area` VALUES ('441426', '平远县', '441400', '7');
INSERT INTO `cmswing_area` VALUES ('441427', '蕉岭县', '441400', '8');
INSERT INTO `cmswing_area` VALUES ('441481', '兴宁市', '441400', '9');
INSERT INTO `cmswing_area` VALUES ('441501', '市辖区', '441500', '1');
INSERT INTO `cmswing_area` VALUES ('441502', '城　区', '441500', '2');
INSERT INTO `cmswing_area` VALUES ('441521', '海丰县', '441500', '3');
INSERT INTO `cmswing_area` VALUES ('441523', '陆河县', '441500', '4');
INSERT INTO `cmswing_area` VALUES ('441581', '陆丰市', '441500', '5');
INSERT INTO `cmswing_area` VALUES ('441601', '市辖区', '441600', '1');
INSERT INTO `cmswing_area` VALUES ('441602', '源城区', '441600', '2');
INSERT INTO `cmswing_area` VALUES ('441621', '紫金县', '441600', '3');
INSERT INTO `cmswing_area` VALUES ('441622', '龙川县', '441600', '4');
INSERT INTO `cmswing_area` VALUES ('441623', '连平县', '441600', '5');
INSERT INTO `cmswing_area` VALUES ('441624', '和平县', '441600', '6');
INSERT INTO `cmswing_area` VALUES ('441625', '东源县', '441600', '7');
INSERT INTO `cmswing_area` VALUES ('441701', '市辖区', '441700', '1');
INSERT INTO `cmswing_area` VALUES ('441702', '江城区', '441700', '2');
INSERT INTO `cmswing_area` VALUES ('441721', '阳西县', '441700', '3');
INSERT INTO `cmswing_area` VALUES ('441723', '阳东县', '441700', '4');
INSERT INTO `cmswing_area` VALUES ('441781', '阳春市', '441700', '5');
INSERT INTO `cmswing_area` VALUES ('441801', '市辖区', '441800', '1');
INSERT INTO `cmswing_area` VALUES ('441802', '清城区', '441800', '2');
INSERT INTO `cmswing_area` VALUES ('441821', '佛冈县', '441800', '3');
INSERT INTO `cmswing_area` VALUES ('441823', '阳山县', '441800', '4');
INSERT INTO `cmswing_area` VALUES ('441825', '连山壮族瑶族自治县', '441800', '5');
INSERT INTO `cmswing_area` VALUES ('441826', '连南瑶族自治县', '441800', '6');
INSERT INTO `cmswing_area` VALUES ('441827', '清新县', '441800', '7');
INSERT INTO `cmswing_area` VALUES ('441881', '英德市', '441800', '8');
INSERT INTO `cmswing_area` VALUES ('441882', '连州市', '441800', '9');
INSERT INTO `cmswing_area` VALUES ('445101', '市辖区', '445100', '1');
INSERT INTO `cmswing_area` VALUES ('445102', '湘桥区', '445100', '2');
INSERT INTO `cmswing_area` VALUES ('445121', '潮安县', '445100', '3');
INSERT INTO `cmswing_area` VALUES ('445122', '饶平县', '445100', '4');
INSERT INTO `cmswing_area` VALUES ('445201', '市辖区', '445200', '1');
INSERT INTO `cmswing_area` VALUES ('445202', '榕城区', '445200', '2');
INSERT INTO `cmswing_area` VALUES ('445221', '揭东县', '445200', '3');
INSERT INTO `cmswing_area` VALUES ('445222', '揭西县', '445200', '4');
INSERT INTO `cmswing_area` VALUES ('445224', '惠来县', '445200', '5');
INSERT INTO `cmswing_area` VALUES ('445281', '普宁市', '445200', '6');
INSERT INTO `cmswing_area` VALUES ('445301', '市辖区', '445300', '1');
INSERT INTO `cmswing_area` VALUES ('445302', '云城区', '445300', '2');
INSERT INTO `cmswing_area` VALUES ('445321', '新兴县', '445300', '3');
INSERT INTO `cmswing_area` VALUES ('445322', '郁南县', '445300', '4');
INSERT INTO `cmswing_area` VALUES ('445323', '云安县', '445300', '5');
INSERT INTO `cmswing_area` VALUES ('445381', '罗定市', '445300', '6');
INSERT INTO `cmswing_area` VALUES ('450101', '市辖区', '450100', '1');
INSERT INTO `cmswing_area` VALUES ('450102', '兴宁区', '450100', '2');
INSERT INTO `cmswing_area` VALUES ('450103', '青秀区', '450100', '3');
INSERT INTO `cmswing_area` VALUES ('450105', '江南区', '450100', '4');
INSERT INTO `cmswing_area` VALUES ('450107', '西乡塘区', '450100', '5');
INSERT INTO `cmswing_area` VALUES ('450108', '良庆区', '450100', '6');
INSERT INTO `cmswing_area` VALUES ('450109', '邕宁区', '450100', '7');
INSERT INTO `cmswing_area` VALUES ('450122', '武鸣县', '450100', '8');
INSERT INTO `cmswing_area` VALUES ('450123', '隆安县', '450100', '9');
INSERT INTO `cmswing_area` VALUES ('450124', '马山县', '450100', '10');
INSERT INTO `cmswing_area` VALUES ('450125', '上林县', '450100', '11');
INSERT INTO `cmswing_area` VALUES ('450126', '宾阳县', '450100', '12');
INSERT INTO `cmswing_area` VALUES ('450127', '横　县', '450100', '13');
INSERT INTO `cmswing_area` VALUES ('450201', '市辖区', '450200', '1');
INSERT INTO `cmswing_area` VALUES ('450202', '城中区', '450200', '2');
INSERT INTO `cmswing_area` VALUES ('450203', '鱼峰区', '450200', '3');
INSERT INTO `cmswing_area` VALUES ('450204', '柳南区', '450200', '4');
INSERT INTO `cmswing_area` VALUES ('450205', '柳北区', '450200', '5');
INSERT INTO `cmswing_area` VALUES ('450221', '柳江县', '450200', '6');
INSERT INTO `cmswing_area` VALUES ('450222', '柳城县', '450200', '7');
INSERT INTO `cmswing_area` VALUES ('450223', '鹿寨县', '450200', '8');
INSERT INTO `cmswing_area` VALUES ('450224', '融安县', '450200', '9');
INSERT INTO `cmswing_area` VALUES ('450225', '融水苗族自治县', '450200', '10');
INSERT INTO `cmswing_area` VALUES ('450226', '三江侗族自治县', '450200', '11');
INSERT INTO `cmswing_area` VALUES ('450301', '市辖区', '450300', '1');
INSERT INTO `cmswing_area` VALUES ('450302', '秀峰区', '450300', '2');
INSERT INTO `cmswing_area` VALUES ('450303', '叠彩区', '450300', '3');
INSERT INTO `cmswing_area` VALUES ('450304', '象山区', '450300', '4');
INSERT INTO `cmswing_area` VALUES ('450305', '七星区', '450300', '5');
INSERT INTO `cmswing_area` VALUES ('450311', '雁山区', '450300', '6');
INSERT INTO `cmswing_area` VALUES ('450321', '阳朔县', '450300', '7');
INSERT INTO `cmswing_area` VALUES ('450322', '临桂县', '450300', '8');
INSERT INTO `cmswing_area` VALUES ('450323', '灵川县', '450300', '9');
INSERT INTO `cmswing_area` VALUES ('450324', '全州县', '450300', '10');
INSERT INTO `cmswing_area` VALUES ('450325', '兴安县', '450300', '11');
INSERT INTO `cmswing_area` VALUES ('450326', '永福县', '450300', '12');
INSERT INTO `cmswing_area` VALUES ('450327', '灌阳县', '450300', '13');
INSERT INTO `cmswing_area` VALUES ('450328', '龙胜各族自治县', '450300', '14');
INSERT INTO `cmswing_area` VALUES ('450329', '资源县', '450300', '15');
INSERT INTO `cmswing_area` VALUES ('450330', '平乐县', '450300', '16');
INSERT INTO `cmswing_area` VALUES ('450331', '荔蒲县', '450300', '17');
INSERT INTO `cmswing_area` VALUES ('450332', '恭城瑶族自治县', '450300', '18');
INSERT INTO `cmswing_area` VALUES ('450401', '市辖区', '450400', '1');
INSERT INTO `cmswing_area` VALUES ('450403', '万秀区', '450400', '2');
INSERT INTO `cmswing_area` VALUES ('450404', '蝶山区', '450400', '3');
INSERT INTO `cmswing_area` VALUES ('450405', '长洲区', '450400', '4');
INSERT INTO `cmswing_area` VALUES ('450421', '苍梧县', '450400', '5');
INSERT INTO `cmswing_area` VALUES ('450422', '藤　县', '450400', '6');
INSERT INTO `cmswing_area` VALUES ('450423', '蒙山县', '450400', '7');
INSERT INTO `cmswing_area` VALUES ('450481', '岑溪市', '450400', '8');
INSERT INTO `cmswing_area` VALUES ('450501', '市辖区', '450500', '1');
INSERT INTO `cmswing_area` VALUES ('450502', '海城区', '450500', '2');
INSERT INTO `cmswing_area` VALUES ('450503', '银海区', '450500', '3');
INSERT INTO `cmswing_area` VALUES ('450512', '铁山港区', '450500', '4');
INSERT INTO `cmswing_area` VALUES ('450521', '合浦县', '450500', '5');
INSERT INTO `cmswing_area` VALUES ('450601', '市辖区', '450600', '1');
INSERT INTO `cmswing_area` VALUES ('450602', '港口区', '450600', '2');
INSERT INTO `cmswing_area` VALUES ('450603', '防城区', '450600', '3');
INSERT INTO `cmswing_area` VALUES ('450621', '上思县', '450600', '4');
INSERT INTO `cmswing_area` VALUES ('450681', '东兴市', '450600', '5');
INSERT INTO `cmswing_area` VALUES ('450701', '市辖区', '450700', '1');
INSERT INTO `cmswing_area` VALUES ('450702', '钦南区', '450700', '2');
INSERT INTO `cmswing_area` VALUES ('450703', '钦北区', '450700', '3');
INSERT INTO `cmswing_area` VALUES ('450721', '灵山县', '450700', '4');
INSERT INTO `cmswing_area` VALUES ('450722', '浦北县', '450700', '5');
INSERT INTO `cmswing_area` VALUES ('450801', '市辖区', '450800', '1');
INSERT INTO `cmswing_area` VALUES ('450802', '港北区', '450800', '2');
INSERT INTO `cmswing_area` VALUES ('450803', '港南区', '450800', '3');
INSERT INTO `cmswing_area` VALUES ('450804', '覃塘区', '450800', '4');
INSERT INTO `cmswing_area` VALUES ('450821', '平南县', '450800', '5');
INSERT INTO `cmswing_area` VALUES ('450881', '桂平市', '450800', '6');
INSERT INTO `cmswing_area` VALUES ('450901', '市辖区', '450900', '1');
INSERT INTO `cmswing_area` VALUES ('450902', '玉州区', '450900', '2');
INSERT INTO `cmswing_area` VALUES ('450921', '容　县', '450900', '3');
INSERT INTO `cmswing_area` VALUES ('450922', '陆川县', '450900', '4');
INSERT INTO `cmswing_area` VALUES ('450923', '博白县', '450900', '5');
INSERT INTO `cmswing_area` VALUES ('450924', '兴业县', '450900', '6');
INSERT INTO `cmswing_area` VALUES ('450981', '北流市', '450900', '7');
INSERT INTO `cmswing_area` VALUES ('451001', '市辖区', '451000', '1');
INSERT INTO `cmswing_area` VALUES ('451002', '右江区', '451000', '2');
INSERT INTO `cmswing_area` VALUES ('451021', '田阳县', '451000', '3');
INSERT INTO `cmswing_area` VALUES ('451022', '田东县', '451000', '4');
INSERT INTO `cmswing_area` VALUES ('451023', '平果县', '451000', '5');
INSERT INTO `cmswing_area` VALUES ('451024', '德保县', '451000', '6');
INSERT INTO `cmswing_area` VALUES ('451025', '靖西县', '451000', '7');
INSERT INTO `cmswing_area` VALUES ('451026', '那坡县', '451000', '8');
INSERT INTO `cmswing_area` VALUES ('451027', '凌云县', '451000', '9');
INSERT INTO `cmswing_area` VALUES ('451028', '乐业县', '451000', '10');
INSERT INTO `cmswing_area` VALUES ('451029', '田林县', '451000', '11');
INSERT INTO `cmswing_area` VALUES ('451030', '西林县', '451000', '12');
INSERT INTO `cmswing_area` VALUES ('451031', '隆林各族自治县', '451000', '13');
INSERT INTO `cmswing_area` VALUES ('451101', '市辖区', '451100', '1');
INSERT INTO `cmswing_area` VALUES ('451102', '八步区', '451100', '2');
INSERT INTO `cmswing_area` VALUES ('451121', '昭平县', '451100', '3');
INSERT INTO `cmswing_area` VALUES ('451122', '钟山县', '451100', '4');
INSERT INTO `cmswing_area` VALUES ('451123', '富川瑶族自治县', '451100', '5');
INSERT INTO `cmswing_area` VALUES ('451201', '市辖区', '451200', '1');
INSERT INTO `cmswing_area` VALUES ('451202', '金城江区', '451200', '2');
INSERT INTO `cmswing_area` VALUES ('451221', '南丹县', '451200', '3');
INSERT INTO `cmswing_area` VALUES ('451222', '天峨县', '451200', '4');
INSERT INTO `cmswing_area` VALUES ('451223', '凤山县', '451200', '5');
INSERT INTO `cmswing_area` VALUES ('451224', '东兰县', '451200', '6');
INSERT INTO `cmswing_area` VALUES ('451225', '罗城仫佬族自治县', '451200', '7');
INSERT INTO `cmswing_area` VALUES ('451226', '环江毛南族自治县', '451200', '8');
INSERT INTO `cmswing_area` VALUES ('451227', '巴马瑶族自治县', '451200', '9');
INSERT INTO `cmswing_area` VALUES ('451228', '都安瑶族自治县', '451200', '10');
INSERT INTO `cmswing_area` VALUES ('451229', '大化瑶族自治县', '451200', '11');
INSERT INTO `cmswing_area` VALUES ('451281', '宜州市', '451200', '12');
INSERT INTO `cmswing_area` VALUES ('451301', '市辖区', '451300', '1');
INSERT INTO `cmswing_area` VALUES ('451302', '兴宾区', '451300', '2');
INSERT INTO `cmswing_area` VALUES ('451321', '忻城县', '451300', '3');
INSERT INTO `cmswing_area` VALUES ('451322', '象州县', '451300', '4');
INSERT INTO `cmswing_area` VALUES ('451323', '武宣县', '451300', '5');
INSERT INTO `cmswing_area` VALUES ('451324', '金秀瑶族自治县', '451300', '6');
INSERT INTO `cmswing_area` VALUES ('451381', '合山市', '451300', '7');
INSERT INTO `cmswing_area` VALUES ('451401', '市辖区', '451400', '1');
INSERT INTO `cmswing_area` VALUES ('451402', '江洲区', '451400', '2');
INSERT INTO `cmswing_area` VALUES ('451421', '扶绥县', '451400', '3');
INSERT INTO `cmswing_area` VALUES ('451422', '宁明县', '451400', '4');
INSERT INTO `cmswing_area` VALUES ('451423', '龙州县', '451400', '5');
INSERT INTO `cmswing_area` VALUES ('451424', '大新县', '451400', '6');
INSERT INTO `cmswing_area` VALUES ('451425', '天等县', '451400', '7');
INSERT INTO `cmswing_area` VALUES ('451481', '凭祥市', '451400', '8');
INSERT INTO `cmswing_area` VALUES ('460101', '市辖区', '460100', '1');
INSERT INTO `cmswing_area` VALUES ('460105', '秀英区', '460100', '2');
INSERT INTO `cmswing_area` VALUES ('460106', '龙华区', '460100', '3');
INSERT INTO `cmswing_area` VALUES ('460107', '琼山区', '460100', '4');
INSERT INTO `cmswing_area` VALUES ('460108', '美兰区', '460100', '5');
INSERT INTO `cmswing_area` VALUES ('460201', '市辖区', '460200', '1');
INSERT INTO `cmswing_area` VALUES ('469001', '五指山市', '469000', '1');
INSERT INTO `cmswing_area` VALUES ('469002', '琼海市', '469000', '2');
INSERT INTO `cmswing_area` VALUES ('469003', '儋州市', '469000', '3');
INSERT INTO `cmswing_area` VALUES ('469005', '文昌市', '469000', '4');
INSERT INTO `cmswing_area` VALUES ('469006', '万宁市', '469000', '5');
INSERT INTO `cmswing_area` VALUES ('469007', '东方市', '469000', '6');
INSERT INTO `cmswing_area` VALUES ('469025', '定安县', '469000', '7');
INSERT INTO `cmswing_area` VALUES ('469026', '屯昌县', '469000', '8');
INSERT INTO `cmswing_area` VALUES ('469027', '澄迈县', '469000', '9');
INSERT INTO `cmswing_area` VALUES ('469028', '临高县', '469000', '10');
INSERT INTO `cmswing_area` VALUES ('469030', '白沙黎族自治县', '469000', '11');
INSERT INTO `cmswing_area` VALUES ('469031', '昌江黎族自治县', '469000', '12');
INSERT INTO `cmswing_area` VALUES ('469033', '乐东黎族自治县', '469000', '13');
INSERT INTO `cmswing_area` VALUES ('469034', '陵水黎族自治县', '469000', '14');
INSERT INTO `cmswing_area` VALUES ('469035', '保亭黎族苗族自治县', '469000', '15');
INSERT INTO `cmswing_area` VALUES ('469036', '琼中黎族苗族自治县', '469000', '16');
INSERT INTO `cmswing_area` VALUES ('469037', '西沙群岛', '469000', '17');
INSERT INTO `cmswing_area` VALUES ('469038', '南沙群岛', '469000', '18');
INSERT INTO `cmswing_area` VALUES ('469039', '中沙群岛的岛礁及其海域', '469000', '19');
INSERT INTO `cmswing_area` VALUES ('500101', '万州区', '500100', '1');
INSERT INTO `cmswing_area` VALUES ('500102', '涪陵区', '500100', '2');
INSERT INTO `cmswing_area` VALUES ('500103', '渝中区', '500100', '3');
INSERT INTO `cmswing_area` VALUES ('500104', '大渡口区', '500100', '4');
INSERT INTO `cmswing_area` VALUES ('500105', '江北区', '500100', '5');
INSERT INTO `cmswing_area` VALUES ('500106', '沙坪坝区', '500100', '6');
INSERT INTO `cmswing_area` VALUES ('500107', '九龙坡区', '500100', '7');
INSERT INTO `cmswing_area` VALUES ('500108', '南岸区', '500100', '8');
INSERT INTO `cmswing_area` VALUES ('500109', '北碚区', '500100', '9');
INSERT INTO `cmswing_area` VALUES ('500110', '万盛区', '500100', '10');
INSERT INTO `cmswing_area` VALUES ('500111', '双桥区', '500100', '11');
INSERT INTO `cmswing_area` VALUES ('500112', '渝北区', '500100', '12');
INSERT INTO `cmswing_area` VALUES ('500113', '巴南区', '500100', '13');
INSERT INTO `cmswing_area` VALUES ('500114', '黔江区', '500100', '14');
INSERT INTO `cmswing_area` VALUES ('500115', '长寿区', '500100', '15');
INSERT INTO `cmswing_area` VALUES ('500222', '綦江县', '500200', '1');
INSERT INTO `cmswing_area` VALUES ('500223', '潼南县', '500200', '2');
INSERT INTO `cmswing_area` VALUES ('500224', '铜梁县', '500200', '3');
INSERT INTO `cmswing_area` VALUES ('500225', '大足县', '500200', '4');
INSERT INTO `cmswing_area` VALUES ('500226', '荣昌县', '500200', '5');
INSERT INTO `cmswing_area` VALUES ('500227', '璧山县', '500200', '6');
INSERT INTO `cmswing_area` VALUES ('500228', '梁平县', '500200', '7');
INSERT INTO `cmswing_area` VALUES ('500229', '城口县', '500200', '8');
INSERT INTO `cmswing_area` VALUES ('500230', '丰都县', '500200', '9');
INSERT INTO `cmswing_area` VALUES ('500231', '垫江县', '500200', '10');
INSERT INTO `cmswing_area` VALUES ('500232', '武隆县', '500200', '11');
INSERT INTO `cmswing_area` VALUES ('500233', '忠　县', '500200', '12');
INSERT INTO `cmswing_area` VALUES ('500234', '开　县', '500200', '13');
INSERT INTO `cmswing_area` VALUES ('500235', '云阳县', '500200', '14');
INSERT INTO `cmswing_area` VALUES ('500236', '奉节县', '500200', '15');
INSERT INTO `cmswing_area` VALUES ('500237', '巫山县', '500200', '16');
INSERT INTO `cmswing_area` VALUES ('500238', '巫溪县', '500200', '17');
INSERT INTO `cmswing_area` VALUES ('500240', '石柱土家族自治县', '500200', '18');
INSERT INTO `cmswing_area` VALUES ('500241', '秀山土家族苗族自治县', '500200', '19');
INSERT INTO `cmswing_area` VALUES ('500242', '酉阳土家族苗族自治县', '500200', '20');
INSERT INTO `cmswing_area` VALUES ('500243', '彭水苗族土家族自治县', '500200', '21');
INSERT INTO `cmswing_area` VALUES ('500381', '江津市', '500300', '1');
INSERT INTO `cmswing_area` VALUES ('500382', '合川市', '500300', '2');
INSERT INTO `cmswing_area` VALUES ('500383', '永川市', '500300', '3');
INSERT INTO `cmswing_area` VALUES ('500384', '南川市', '500300', '4');
INSERT INTO `cmswing_area` VALUES ('510101', '市辖区', '510100', '1');
INSERT INTO `cmswing_area` VALUES ('510104', '锦江区', '510100', '2');
INSERT INTO `cmswing_area` VALUES ('510105', '青羊区', '510100', '3');
INSERT INTO `cmswing_area` VALUES ('510106', '金牛区', '510100', '4');
INSERT INTO `cmswing_area` VALUES ('510107', '武侯区', '510100', '5');
INSERT INTO `cmswing_area` VALUES ('510108', '成华区', '510100', '6');
INSERT INTO `cmswing_area` VALUES ('510112', '龙泉驿区', '510100', '7');
INSERT INTO `cmswing_area` VALUES ('510113', '青白江区', '510100', '8');
INSERT INTO `cmswing_area` VALUES ('510114', '新都区', '510100', '9');
INSERT INTO `cmswing_area` VALUES ('510115', '温江区', '510100', '10');
INSERT INTO `cmswing_area` VALUES ('510121', '金堂县', '510100', '11');
INSERT INTO `cmswing_area` VALUES ('510122', '双流县', '510100', '12');
INSERT INTO `cmswing_area` VALUES ('510124', '郫　县', '510100', '13');
INSERT INTO `cmswing_area` VALUES ('510129', '大邑县', '510100', '14');
INSERT INTO `cmswing_area` VALUES ('510131', '蒲江县', '510100', '15');
INSERT INTO `cmswing_area` VALUES ('510132', '新津县', '510100', '16');
INSERT INTO `cmswing_area` VALUES ('510181', '都江堰市', '510100', '17');
INSERT INTO `cmswing_area` VALUES ('510182', '彭州市', '510100', '18');
INSERT INTO `cmswing_area` VALUES ('510183', '邛崃市', '510100', '19');
INSERT INTO `cmswing_area` VALUES ('510184', '崇州市', '510100', '20');
INSERT INTO `cmswing_area` VALUES ('510301', '市辖区', '510300', '1');
INSERT INTO `cmswing_area` VALUES ('510302', '自流井区', '510300', '2');
INSERT INTO `cmswing_area` VALUES ('510303', '贡井区', '510300', '3');
INSERT INTO `cmswing_area` VALUES ('510304', '大安区', '510300', '4');
INSERT INTO `cmswing_area` VALUES ('510311', '沿滩区', '510300', '5');
INSERT INTO `cmswing_area` VALUES ('510321', '荣　县', '510300', '6');
INSERT INTO `cmswing_area` VALUES ('510322', '富顺县', '510300', '7');
INSERT INTO `cmswing_area` VALUES ('510401', '市辖区', '510400', '1');
INSERT INTO `cmswing_area` VALUES ('510402', '东　区', '510400', '2');
INSERT INTO `cmswing_area` VALUES ('510403', '西　区', '510400', '3');
INSERT INTO `cmswing_area` VALUES ('510411', '仁和区', '510400', '4');
INSERT INTO `cmswing_area` VALUES ('510421', '米易县', '510400', '5');
INSERT INTO `cmswing_area` VALUES ('510422', '盐边县', '510400', '6');
INSERT INTO `cmswing_area` VALUES ('510501', '市辖区', '510500', '1');
INSERT INTO `cmswing_area` VALUES ('510502', '江阳区', '510500', '2');
INSERT INTO `cmswing_area` VALUES ('510503', '纳溪区', '510500', '3');
INSERT INTO `cmswing_area` VALUES ('510504', '龙马潭区', '510500', '4');
INSERT INTO `cmswing_area` VALUES ('510521', '泸　县', '510500', '5');
INSERT INTO `cmswing_area` VALUES ('510522', '合江县', '510500', '6');
INSERT INTO `cmswing_area` VALUES ('510524', '叙永县', '510500', '7');
INSERT INTO `cmswing_area` VALUES ('510525', '古蔺县', '510500', '8');
INSERT INTO `cmswing_area` VALUES ('510601', '市辖区', '510600', '1');
INSERT INTO `cmswing_area` VALUES ('510603', '旌阳区', '510600', '2');
INSERT INTO `cmswing_area` VALUES ('510623', '中江县', '510600', '3');
INSERT INTO `cmswing_area` VALUES ('510626', '罗江县', '510600', '4');
INSERT INTO `cmswing_area` VALUES ('510681', '广汉市', '510600', '5');
INSERT INTO `cmswing_area` VALUES ('510682', '什邡市', '510600', '6');
INSERT INTO `cmswing_area` VALUES ('510683', '绵竹市', '510600', '7');
INSERT INTO `cmswing_area` VALUES ('510701', '市辖区', '510700', '1');
INSERT INTO `cmswing_area` VALUES ('510703', '涪城区', '510700', '2');
INSERT INTO `cmswing_area` VALUES ('510704', '游仙区', '510700', '3');
INSERT INTO `cmswing_area` VALUES ('510722', '三台县', '510700', '4');
INSERT INTO `cmswing_area` VALUES ('510723', '盐亭县', '510700', '5');
INSERT INTO `cmswing_area` VALUES ('510724', '安　县', '510700', '6');
INSERT INTO `cmswing_area` VALUES ('510725', '梓潼县', '510700', '7');
INSERT INTO `cmswing_area` VALUES ('510726', '北川羌族自治县', '510700', '8');
INSERT INTO `cmswing_area` VALUES ('510727', '平武县', '510700', '9');
INSERT INTO `cmswing_area` VALUES ('510781', '江油市', '510700', '10');
INSERT INTO `cmswing_area` VALUES ('510801', '市辖区', '510800', '1');
INSERT INTO `cmswing_area` VALUES ('510802', '市中区', '510800', '2');
INSERT INTO `cmswing_area` VALUES ('510811', '元坝区', '510800', '3');
INSERT INTO `cmswing_area` VALUES ('510812', '朝天区', '510800', '4');
INSERT INTO `cmswing_area` VALUES ('510821', '旺苍县', '510800', '5');
INSERT INTO `cmswing_area` VALUES ('510822', '青川县', '510800', '6');
INSERT INTO `cmswing_area` VALUES ('510823', '剑阁县', '510800', '7');
INSERT INTO `cmswing_area` VALUES ('510824', '苍溪县', '510800', '8');
INSERT INTO `cmswing_area` VALUES ('510901', '市辖区', '510900', '1');
INSERT INTO `cmswing_area` VALUES ('510903', '船山区', '510900', '2');
INSERT INTO `cmswing_area` VALUES ('510904', '安居区', '510900', '3');
INSERT INTO `cmswing_area` VALUES ('510921', '蓬溪县', '510900', '4');
INSERT INTO `cmswing_area` VALUES ('510922', '射洪县', '510900', '5');
INSERT INTO `cmswing_area` VALUES ('510923', '大英县', '510900', '6');
INSERT INTO `cmswing_area` VALUES ('511001', '市辖区', '511000', '1');
INSERT INTO `cmswing_area` VALUES ('511002', '市中区', '511000', '2');
INSERT INTO `cmswing_area` VALUES ('511011', '东兴区', '511000', '3');
INSERT INTO `cmswing_area` VALUES ('511024', '威远县', '511000', '4');
INSERT INTO `cmswing_area` VALUES ('511025', '资中县', '511000', '5');
INSERT INTO `cmswing_area` VALUES ('511028', '隆昌县', '511000', '6');
INSERT INTO `cmswing_area` VALUES ('511101', '市辖区', '511100', '1');
INSERT INTO `cmswing_area` VALUES ('511102', '市中区', '511100', '2');
INSERT INTO `cmswing_area` VALUES ('511111', '沙湾区', '511100', '3');
INSERT INTO `cmswing_area` VALUES ('511112', '五通桥区', '511100', '4');
INSERT INTO `cmswing_area` VALUES ('511113', '金口河区', '511100', '5');
INSERT INTO `cmswing_area` VALUES ('511123', '犍为县', '511100', '6');
INSERT INTO `cmswing_area` VALUES ('511124', '井研县', '511100', '7');
INSERT INTO `cmswing_area` VALUES ('511126', '夹江县', '511100', '8');
INSERT INTO `cmswing_area` VALUES ('511129', '沐川县', '511100', '9');
INSERT INTO `cmswing_area` VALUES ('511132', '峨边彝族自治县', '511100', '10');
INSERT INTO `cmswing_area` VALUES ('511133', '马边彝族自治县', '511100', '11');
INSERT INTO `cmswing_area` VALUES ('511181', '峨眉山市', '511100', '12');
INSERT INTO `cmswing_area` VALUES ('511301', '市辖区', '511300', '1');
INSERT INTO `cmswing_area` VALUES ('511302', '顺庆区', '511300', '2');
INSERT INTO `cmswing_area` VALUES ('511303', '高坪区', '511300', '3');
INSERT INTO `cmswing_area` VALUES ('511304', '嘉陵区', '511300', '4');
INSERT INTO `cmswing_area` VALUES ('511321', '南部县', '511300', '5');
INSERT INTO `cmswing_area` VALUES ('511322', '营山县', '511300', '6');
INSERT INTO `cmswing_area` VALUES ('511323', '蓬安县', '511300', '7');
INSERT INTO `cmswing_area` VALUES ('511324', '仪陇县', '511300', '8');
INSERT INTO `cmswing_area` VALUES ('511325', '西充县', '511300', '9');
INSERT INTO `cmswing_area` VALUES ('511381', '阆中市', '511300', '10');
INSERT INTO `cmswing_area` VALUES ('511401', '市辖区', '511400', '1');
INSERT INTO `cmswing_area` VALUES ('511402', '东坡区', '511400', '2');
INSERT INTO `cmswing_area` VALUES ('511421', '仁寿县', '511400', '3');
INSERT INTO `cmswing_area` VALUES ('511422', '彭山县', '511400', '4');
INSERT INTO `cmswing_area` VALUES ('511423', '洪雅县', '511400', '5');
INSERT INTO `cmswing_area` VALUES ('511424', '丹棱县', '511400', '6');
INSERT INTO `cmswing_area` VALUES ('511425', '青神县', '511400', '7');
INSERT INTO `cmswing_area` VALUES ('511501', '市辖区', '511500', '1');
INSERT INTO `cmswing_area` VALUES ('511502', '翠屏区', '511500', '2');
INSERT INTO `cmswing_area` VALUES ('511521', '宜宾县', '511500', '3');
INSERT INTO `cmswing_area` VALUES ('511522', '南溪县', '511500', '4');
INSERT INTO `cmswing_area` VALUES ('511523', '江安县', '511500', '5');
INSERT INTO `cmswing_area` VALUES ('511524', '长宁县', '511500', '6');
INSERT INTO `cmswing_area` VALUES ('511525', '高　县', '511500', '7');
INSERT INTO `cmswing_area` VALUES ('511526', '珙　县', '511500', '8');
INSERT INTO `cmswing_area` VALUES ('511527', '筠连县', '511500', '9');
INSERT INTO `cmswing_area` VALUES ('511528', '兴文县', '511500', '10');
INSERT INTO `cmswing_area` VALUES ('511529', '屏山县', '511500', '11');
INSERT INTO `cmswing_area` VALUES ('511601', '市辖区', '511600', '1');
INSERT INTO `cmswing_area` VALUES ('511602', '广安区', '511600', '2');
INSERT INTO `cmswing_area` VALUES ('511621', '岳池县', '511600', '3');
INSERT INTO `cmswing_area` VALUES ('511622', '武胜县', '511600', '4');
INSERT INTO `cmswing_area` VALUES ('511623', '邻水县', '511600', '5');
INSERT INTO `cmswing_area` VALUES ('511681', '华莹市', '511600', '6');
INSERT INTO `cmswing_area` VALUES ('511701', '市辖区', '511700', '1');
INSERT INTO `cmswing_area` VALUES ('511702', '通川区', '511700', '2');
INSERT INTO `cmswing_area` VALUES ('511721', '达　县', '511700', '3');
INSERT INTO `cmswing_area` VALUES ('511722', '宣汉县', '511700', '4');
INSERT INTO `cmswing_area` VALUES ('511723', '开江县', '511700', '5');
INSERT INTO `cmswing_area` VALUES ('511724', '大竹县', '511700', '6');
INSERT INTO `cmswing_area` VALUES ('511725', '渠　县', '511700', '7');
INSERT INTO `cmswing_area` VALUES ('511781', '万源市', '511700', '8');
INSERT INTO `cmswing_area` VALUES ('511801', '市辖区', '511800', '1');
INSERT INTO `cmswing_area` VALUES ('511802', '雨城区', '511800', '2');
INSERT INTO `cmswing_area` VALUES ('511821', '名山县', '511800', '3');
INSERT INTO `cmswing_area` VALUES ('511822', '荥经县', '511800', '4');
INSERT INTO `cmswing_area` VALUES ('511823', '汉源县', '511800', '5');
INSERT INTO `cmswing_area` VALUES ('511824', '石棉县', '511800', '6');
INSERT INTO `cmswing_area` VALUES ('511825', '天全县', '511800', '7');
INSERT INTO `cmswing_area` VALUES ('511826', '芦山县', '511800', '8');
INSERT INTO `cmswing_area` VALUES ('511827', '宝兴县', '511800', '9');
INSERT INTO `cmswing_area` VALUES ('511901', '市辖区', '511900', '1');
INSERT INTO `cmswing_area` VALUES ('511902', '巴州区', '511900', '2');
INSERT INTO `cmswing_area` VALUES ('511921', '通江县', '511900', '3');
INSERT INTO `cmswing_area` VALUES ('511922', '南江县', '511900', '4');
INSERT INTO `cmswing_area` VALUES ('511923', '平昌县', '511900', '5');
INSERT INTO `cmswing_area` VALUES ('512001', '市辖区', '512000', '1');
INSERT INTO `cmswing_area` VALUES ('512002', '雁江区', '512000', '2');
INSERT INTO `cmswing_area` VALUES ('512021', '安岳县', '512000', '3');
INSERT INTO `cmswing_area` VALUES ('512022', '乐至县', '512000', '4');
INSERT INTO `cmswing_area` VALUES ('512081', '简阳市', '512000', '5');
INSERT INTO `cmswing_area` VALUES ('513221', '汶川县', '513200', '1');
INSERT INTO `cmswing_area` VALUES ('513222', '理　县', '513200', '2');
INSERT INTO `cmswing_area` VALUES ('513223', '茂　县', '513200', '3');
INSERT INTO `cmswing_area` VALUES ('513224', '松潘县', '513200', '4');
INSERT INTO `cmswing_area` VALUES ('513225', '九寨沟县', '513200', '5');
INSERT INTO `cmswing_area` VALUES ('513226', '金川县', '513200', '6');
INSERT INTO `cmswing_area` VALUES ('513227', '小金县', '513200', '7');
INSERT INTO `cmswing_area` VALUES ('513228', '黑水县', '513200', '8');
INSERT INTO `cmswing_area` VALUES ('513229', '马尔康县', '513200', '9');
INSERT INTO `cmswing_area` VALUES ('513230', '壤塘县', '513200', '10');
INSERT INTO `cmswing_area` VALUES ('513231', '阿坝县', '513200', '11');
INSERT INTO `cmswing_area` VALUES ('513232', '若尔盖县', '513200', '12');
INSERT INTO `cmswing_area` VALUES ('513233', '红原县', '513200', '13');
INSERT INTO `cmswing_area` VALUES ('513321', '康定县', '513300', '1');
INSERT INTO `cmswing_area` VALUES ('513322', '泸定县', '513300', '2');
INSERT INTO `cmswing_area` VALUES ('513323', '丹巴县', '513300', '3');
INSERT INTO `cmswing_area` VALUES ('513324', '九龙县', '513300', '4');
INSERT INTO `cmswing_area` VALUES ('513325', '雅江县', '513300', '5');
INSERT INTO `cmswing_area` VALUES ('513326', '道孚县', '513300', '6');
INSERT INTO `cmswing_area` VALUES ('513327', '炉霍县', '513300', '7');
INSERT INTO `cmswing_area` VALUES ('513328', '甘孜县', '513300', '8');
INSERT INTO `cmswing_area` VALUES ('513329', '新龙县', '513300', '9');
INSERT INTO `cmswing_area` VALUES ('513330', '德格县', '513300', '10');
INSERT INTO `cmswing_area` VALUES ('513331', '白玉县', '513300', '11');
INSERT INTO `cmswing_area` VALUES ('513332', '石渠县', '513300', '12');
INSERT INTO `cmswing_area` VALUES ('513333', '色达县', '513300', '13');
INSERT INTO `cmswing_area` VALUES ('513334', '理塘县', '513300', '14');
INSERT INTO `cmswing_area` VALUES ('513335', '巴塘县', '513300', '15');
INSERT INTO `cmswing_area` VALUES ('513336', '乡城县', '513300', '16');
INSERT INTO `cmswing_area` VALUES ('513337', '稻城县', '513300', '17');
INSERT INTO `cmswing_area` VALUES ('513338', '得荣县', '513300', '18');
INSERT INTO `cmswing_area` VALUES ('513401', '西昌市', '513400', '1');
INSERT INTO `cmswing_area` VALUES ('513422', '木里藏族自治县', '513400', '2');
INSERT INTO `cmswing_area` VALUES ('513423', '盐源县', '513400', '3');
INSERT INTO `cmswing_area` VALUES ('513424', '德昌县', '513400', '4');
INSERT INTO `cmswing_area` VALUES ('513425', '会理县', '513400', '5');
INSERT INTO `cmswing_area` VALUES ('513426', '会东县', '513400', '6');
INSERT INTO `cmswing_area` VALUES ('513427', '宁南县', '513400', '7');
INSERT INTO `cmswing_area` VALUES ('513428', '普格县', '513400', '8');
INSERT INTO `cmswing_area` VALUES ('513429', '布拖县', '513400', '9');
INSERT INTO `cmswing_area` VALUES ('513430', '金阳县', '513400', '10');
INSERT INTO `cmswing_area` VALUES ('513431', '昭觉县', '513400', '11');
INSERT INTO `cmswing_area` VALUES ('513432', '喜德县', '513400', '12');
INSERT INTO `cmswing_area` VALUES ('513433', '冕宁县', '513400', '13');
INSERT INTO `cmswing_area` VALUES ('513434', '越西县', '513400', '14');
INSERT INTO `cmswing_area` VALUES ('513435', '甘洛县', '513400', '15');
INSERT INTO `cmswing_area` VALUES ('513436', '美姑县', '513400', '16');
INSERT INTO `cmswing_area` VALUES ('513437', '雷波县', '513400', '17');
INSERT INTO `cmswing_area` VALUES ('520101', '市辖区', '520100', '1');
INSERT INTO `cmswing_area` VALUES ('520102', '南明区', '520100', '2');
INSERT INTO `cmswing_area` VALUES ('520103', '云岩区', '520100', '3');
INSERT INTO `cmswing_area` VALUES ('520111', '花溪区', '520100', '4');
INSERT INTO `cmswing_area` VALUES ('520112', '乌当区', '520100', '5');
INSERT INTO `cmswing_area` VALUES ('520113', '白云区', '520100', '6');
INSERT INTO `cmswing_area` VALUES ('520114', '小河区', '520100', '7');
INSERT INTO `cmswing_area` VALUES ('520121', '开阳县', '520100', '8');
INSERT INTO `cmswing_area` VALUES ('520122', '息烽县', '520100', '9');
INSERT INTO `cmswing_area` VALUES ('520123', '修文县', '520100', '10');
INSERT INTO `cmswing_area` VALUES ('520181', '清镇市', '520100', '11');
INSERT INTO `cmswing_area` VALUES ('520201', '钟山区', '520200', '1');
INSERT INTO `cmswing_area` VALUES ('520203', '六枝特区', '520200', '2');
INSERT INTO `cmswing_area` VALUES ('520221', '水城县', '520200', '3');
INSERT INTO `cmswing_area` VALUES ('520222', '盘　县', '520200', '4');
INSERT INTO `cmswing_area` VALUES ('520301', '市辖区', '520300', '1');
INSERT INTO `cmswing_area` VALUES ('520302', '红花岗区', '520300', '2');
INSERT INTO `cmswing_area` VALUES ('520303', '汇川区', '520300', '3');
INSERT INTO `cmswing_area` VALUES ('520321', '遵义县', '520300', '4');
INSERT INTO `cmswing_area` VALUES ('520322', '桐梓县', '520300', '5');
INSERT INTO `cmswing_area` VALUES ('520323', '绥阳县', '520300', '6');
INSERT INTO `cmswing_area` VALUES ('520324', '正安县', '520300', '7');
INSERT INTO `cmswing_area` VALUES ('520325', '道真仡佬族苗族自治县', '520300', '8');
INSERT INTO `cmswing_area` VALUES ('520326', '务川仡佬族苗族自治县', '520300', '9');
INSERT INTO `cmswing_area` VALUES ('520327', '凤冈县', '520300', '10');
INSERT INTO `cmswing_area` VALUES ('520328', '湄潭县', '520300', '11');
INSERT INTO `cmswing_area` VALUES ('520329', '余庆县', '520300', '12');
INSERT INTO `cmswing_area` VALUES ('520330', '习水县', '520300', '13');
INSERT INTO `cmswing_area` VALUES ('520381', '赤水市', '520300', '14');
INSERT INTO `cmswing_area` VALUES ('520382', '仁怀市', '520300', '15');
INSERT INTO `cmswing_area` VALUES ('520401', '市辖区', '520400', '1');
INSERT INTO `cmswing_area` VALUES ('520402', '西秀区', '520400', '2');
INSERT INTO `cmswing_area` VALUES ('520421', '平坝县', '520400', '3');
INSERT INTO `cmswing_area` VALUES ('520422', '普定县', '520400', '4');
INSERT INTO `cmswing_area` VALUES ('520423', '镇宁布依族苗族自治县', '520400', '5');
INSERT INTO `cmswing_area` VALUES ('520424', '关岭布依族苗族自治县', '520400', '6');
INSERT INTO `cmswing_area` VALUES ('520425', '紫云苗族布依族自治县', '520400', '7');
INSERT INTO `cmswing_area` VALUES ('522201', '铜仁市', '522200', '1');
INSERT INTO `cmswing_area` VALUES ('522222', '江口县', '522200', '2');
INSERT INTO `cmswing_area` VALUES ('522223', '玉屏侗族自治县', '522200', '3');
INSERT INTO `cmswing_area` VALUES ('522224', '石阡县', '522200', '4');
INSERT INTO `cmswing_area` VALUES ('522225', '思南县', '522200', '5');
INSERT INTO `cmswing_area` VALUES ('522226', '印江土家族苗族自治县', '522200', '6');
INSERT INTO `cmswing_area` VALUES ('522227', '德江县', '522200', '7');
INSERT INTO `cmswing_area` VALUES ('522228', '沿河土家族自治县', '522200', '8');
INSERT INTO `cmswing_area` VALUES ('522229', '松桃苗族自治县', '522200', '9');
INSERT INTO `cmswing_area` VALUES ('522230', '万山特区', '522200', '10');
INSERT INTO `cmswing_area` VALUES ('522301', '兴义市', '522300', '1');
INSERT INTO `cmswing_area` VALUES ('522322', '兴仁县', '522300', '2');
INSERT INTO `cmswing_area` VALUES ('522323', '普安县', '522300', '3');
INSERT INTO `cmswing_area` VALUES ('522324', '晴隆县', '522300', '4');
INSERT INTO `cmswing_area` VALUES ('522325', '贞丰县', '522300', '5');
INSERT INTO `cmswing_area` VALUES ('522326', '望谟县', '522300', '6');
INSERT INTO `cmswing_area` VALUES ('522327', '册亨县', '522300', '7');
INSERT INTO `cmswing_area` VALUES ('522328', '安龙县', '522300', '8');
INSERT INTO `cmswing_area` VALUES ('522401', '毕节市', '522400', '1');
INSERT INTO `cmswing_area` VALUES ('522422', '大方县', '522400', '2');
INSERT INTO `cmswing_area` VALUES ('522423', '黔西县', '522400', '3');
INSERT INTO `cmswing_area` VALUES ('522424', '金沙县', '522400', '4');
INSERT INTO `cmswing_area` VALUES ('522425', '织金县', '522400', '5');
INSERT INTO `cmswing_area` VALUES ('522426', '纳雍县', '522400', '6');
INSERT INTO `cmswing_area` VALUES ('522427', '威宁彝族回族苗族自治县', '522400', '7');
INSERT INTO `cmswing_area` VALUES ('522428', '赫章县', '522400', '8');
INSERT INTO `cmswing_area` VALUES ('522601', '凯里市', '522600', '1');
INSERT INTO `cmswing_area` VALUES ('522622', '黄平县', '522600', '2');
INSERT INTO `cmswing_area` VALUES ('522623', '施秉县', '522600', '3');
INSERT INTO `cmswing_area` VALUES ('522624', '三穗县', '522600', '4');
INSERT INTO `cmswing_area` VALUES ('522625', '镇远县', '522600', '5');
INSERT INTO `cmswing_area` VALUES ('522626', '岑巩县', '522600', '6');
INSERT INTO `cmswing_area` VALUES ('522627', '天柱县', '522600', '7');
INSERT INTO `cmswing_area` VALUES ('522628', '锦屏县', '522600', '8');
INSERT INTO `cmswing_area` VALUES ('522629', '剑河县', '522600', '9');
INSERT INTO `cmswing_area` VALUES ('522630', '台江县', '522600', '10');
INSERT INTO `cmswing_area` VALUES ('522631', '黎平县', '522600', '11');
INSERT INTO `cmswing_area` VALUES ('522632', '榕江县', '522600', '12');
INSERT INTO `cmswing_area` VALUES ('522633', '从江县', '522600', '13');
INSERT INTO `cmswing_area` VALUES ('522634', '雷山县', '522600', '14');
INSERT INTO `cmswing_area` VALUES ('522635', '麻江县', '522600', '15');
INSERT INTO `cmswing_area` VALUES ('522636', '丹寨县', '522600', '16');
INSERT INTO `cmswing_area` VALUES ('522701', '都匀市', '522700', '1');
INSERT INTO `cmswing_area` VALUES ('522702', '福泉市', '522700', '2');
INSERT INTO `cmswing_area` VALUES ('522722', '荔波县', '522700', '3');
INSERT INTO `cmswing_area` VALUES ('522723', '贵定县', '522700', '4');
INSERT INTO `cmswing_area` VALUES ('522725', '瓮安县', '522700', '5');
INSERT INTO `cmswing_area` VALUES ('522726', '独山县', '522700', '6');
INSERT INTO `cmswing_area` VALUES ('522727', '平塘县', '522700', '7');
INSERT INTO `cmswing_area` VALUES ('522728', '罗甸县', '522700', '8');
INSERT INTO `cmswing_area` VALUES ('522729', '长顺县', '522700', '9');
INSERT INTO `cmswing_area` VALUES ('522730', '龙里县', '522700', '10');
INSERT INTO `cmswing_area` VALUES ('522731', '惠水县', '522700', '11');
INSERT INTO `cmswing_area` VALUES ('522732', '三都水族自治县', '522700', '12');
INSERT INTO `cmswing_area` VALUES ('530101', '市辖区', '530100', '1');
INSERT INTO `cmswing_area` VALUES ('530102', '五华区', '530100', '2');
INSERT INTO `cmswing_area` VALUES ('530103', '盘龙区', '530100', '3');
INSERT INTO `cmswing_area` VALUES ('530111', '官渡区', '530100', '4');
INSERT INTO `cmswing_area` VALUES ('530112', '西山区', '530100', '5');
INSERT INTO `cmswing_area` VALUES ('530113', '东川区', '530100', '6');
INSERT INTO `cmswing_area` VALUES ('530121', '呈贡县', '530100', '7');
INSERT INTO `cmswing_area` VALUES ('530122', '晋宁县', '530100', '8');
INSERT INTO `cmswing_area` VALUES ('530124', '富民县', '530100', '9');
INSERT INTO `cmswing_area` VALUES ('530125', '宜良县', '530100', '10');
INSERT INTO `cmswing_area` VALUES ('530126', '石林彝族自治县', '530100', '11');
INSERT INTO `cmswing_area` VALUES ('530127', '嵩明县', '530100', '12');
INSERT INTO `cmswing_area` VALUES ('530128', '禄劝彝族苗族自治县', '530100', '13');
INSERT INTO `cmswing_area` VALUES ('530129', '寻甸回族彝族自治县', '530100', '14');
INSERT INTO `cmswing_area` VALUES ('530181', '安宁市', '530100', '15');
INSERT INTO `cmswing_area` VALUES ('530301', '市辖区', '530300', '1');
INSERT INTO `cmswing_area` VALUES ('530302', '麒麟区', '530300', '2');
INSERT INTO `cmswing_area` VALUES ('530321', '马龙县', '530300', '3');
INSERT INTO `cmswing_area` VALUES ('530322', '陆良县', '530300', '4');
INSERT INTO `cmswing_area` VALUES ('530323', '师宗县', '530300', '5');
INSERT INTO `cmswing_area` VALUES ('530324', '罗平县', '530300', '6');
INSERT INTO `cmswing_area` VALUES ('530325', '富源县', '530300', '7');
INSERT INTO `cmswing_area` VALUES ('530326', '会泽县', '530300', '8');
INSERT INTO `cmswing_area` VALUES ('530328', '沾益县', '530300', '9');
INSERT INTO `cmswing_area` VALUES ('530381', '宣威市', '530300', '10');
INSERT INTO `cmswing_area` VALUES ('530401', '市辖区', '530400', '1');
INSERT INTO `cmswing_area` VALUES ('530402', '红塔区', '530400', '2');
INSERT INTO `cmswing_area` VALUES ('530421', '江川县', '530400', '3');
INSERT INTO `cmswing_area` VALUES ('530422', '澄江县', '530400', '4');
INSERT INTO `cmswing_area` VALUES ('530423', '通海县', '530400', '5');
INSERT INTO `cmswing_area` VALUES ('530424', '华宁县', '530400', '6');
INSERT INTO `cmswing_area` VALUES ('530425', '易门县', '530400', '7');
INSERT INTO `cmswing_area` VALUES ('530426', '峨山彝族自治县', '530400', '8');
INSERT INTO `cmswing_area` VALUES ('530427', '新平彝族傣族自治县', '530400', '9');
INSERT INTO `cmswing_area` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400', '10');
INSERT INTO `cmswing_area` VALUES ('530501', '市辖区', '530500', '1');
INSERT INTO `cmswing_area` VALUES ('530502', '隆阳区', '530500', '2');
INSERT INTO `cmswing_area` VALUES ('530521', '施甸县', '530500', '3');
INSERT INTO `cmswing_area` VALUES ('530522', '腾冲县', '530500', '4');
INSERT INTO `cmswing_area` VALUES ('530523', '龙陵县', '530500', '5');
INSERT INTO `cmswing_area` VALUES ('530524', '昌宁县', '530500', '6');
INSERT INTO `cmswing_area` VALUES ('530601', '市辖区', '530600', '1');
INSERT INTO `cmswing_area` VALUES ('530602', '昭阳区', '530600', '2');
INSERT INTO `cmswing_area` VALUES ('530621', '鲁甸县', '530600', '3');
INSERT INTO `cmswing_area` VALUES ('530622', '巧家县', '530600', '4');
INSERT INTO `cmswing_area` VALUES ('530623', '盐津县', '530600', '5');
INSERT INTO `cmswing_area` VALUES ('530624', '大关县', '530600', '6');
INSERT INTO `cmswing_area` VALUES ('530625', '永善县', '530600', '7');
INSERT INTO `cmswing_area` VALUES ('530626', '绥江县', '530600', '8');
INSERT INTO `cmswing_area` VALUES ('530627', '镇雄县', '530600', '9');
INSERT INTO `cmswing_area` VALUES ('530628', '彝良县', '530600', '10');
INSERT INTO `cmswing_area` VALUES ('530629', '威信县', '530600', '11');
INSERT INTO `cmswing_area` VALUES ('530630', '水富县', '530600', '12');
INSERT INTO `cmswing_area` VALUES ('530701', '市辖区', '530700', '1');
INSERT INTO `cmswing_area` VALUES ('530702', '古城区', '530700', '2');
INSERT INTO `cmswing_area` VALUES ('530721', '玉龙纳西族自治县', '530700', '3');
INSERT INTO `cmswing_area` VALUES ('530722', '永胜县', '530700', '4');
INSERT INTO `cmswing_area` VALUES ('530723', '华坪县', '530700', '5');
INSERT INTO `cmswing_area` VALUES ('530724', '宁蒗彝族自治县', '530700', '6');
INSERT INTO `cmswing_area` VALUES ('530801', '市辖区', '530800', '1');
INSERT INTO `cmswing_area` VALUES ('530802', '翠云区', '530800', '2');
INSERT INTO `cmswing_area` VALUES ('530821', '普洱哈尼族彝族自治县', '530800', '3');
INSERT INTO `cmswing_area` VALUES ('530822', '墨江哈尼族自治县', '530800', '4');
INSERT INTO `cmswing_area` VALUES ('530823', '景东彝族自治县', '530800', '5');
INSERT INTO `cmswing_area` VALUES ('530824', '景谷傣族彝族自治县', '530800', '6');
INSERT INTO `cmswing_area` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '7');
INSERT INTO `cmswing_area` VALUES ('530826', '江城哈尼族彝族自治县', '530800', '8');
INSERT INTO `cmswing_area` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800', '9');
INSERT INTO `cmswing_area` VALUES ('530828', '澜沧拉祜族自治县', '530800', '10');
INSERT INTO `cmswing_area` VALUES ('530829', '西盟佤族自治县', '530800', '11');
INSERT INTO `cmswing_area` VALUES ('530901', '市辖区', '530900', '1');
INSERT INTO `cmswing_area` VALUES ('530902', '临翔区', '530900', '2');
INSERT INTO `cmswing_area` VALUES ('530921', '凤庆县', '530900', '3');
INSERT INTO `cmswing_area` VALUES ('530922', '云　县', '530900', '4');
INSERT INTO `cmswing_area` VALUES ('530923', '永德县', '530900', '5');
INSERT INTO `cmswing_area` VALUES ('530924', '镇康县', '530900', '6');
INSERT INTO `cmswing_area` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '7');
INSERT INTO `cmswing_area` VALUES ('530926', '耿马傣族佤族自治县', '530900', '8');
INSERT INTO `cmswing_area` VALUES ('530927', '沧源佤族自治县', '530900', '9');
INSERT INTO `cmswing_area` VALUES ('532301', '楚雄市', '532300', '1');
INSERT INTO `cmswing_area` VALUES ('532322', '双柏县', '532300', '2');
INSERT INTO `cmswing_area` VALUES ('532323', '牟定县', '532300', '3');
INSERT INTO `cmswing_area` VALUES ('532324', '南华县', '532300', '4');
INSERT INTO `cmswing_area` VALUES ('532325', '姚安县', '532300', '5');
INSERT INTO `cmswing_area` VALUES ('532326', '大姚县', '532300', '6');
INSERT INTO `cmswing_area` VALUES ('532327', '永仁县', '532300', '7');
INSERT INTO `cmswing_area` VALUES ('532328', '元谋县', '532300', '8');
INSERT INTO `cmswing_area` VALUES ('532329', '武定县', '532300', '9');
INSERT INTO `cmswing_area` VALUES ('532331', '禄丰县', '532300', '10');
INSERT INTO `cmswing_area` VALUES ('532501', '个旧市', '532500', '1');
INSERT INTO `cmswing_area` VALUES ('532502', '开远市', '532500', '2');
INSERT INTO `cmswing_area` VALUES ('532522', '蒙自县', '532500', '3');
INSERT INTO `cmswing_area` VALUES ('532523', '屏边苗族自治县', '532500', '4');
INSERT INTO `cmswing_area` VALUES ('532524', '建水县', '532500', '5');
INSERT INTO `cmswing_area` VALUES ('532525', '石屏县', '532500', '6');
INSERT INTO `cmswing_area` VALUES ('532526', '弥勒县', '532500', '7');
INSERT INTO `cmswing_area` VALUES ('532527', '泸西县', '532500', '8');
INSERT INTO `cmswing_area` VALUES ('532528', '元阳县', '532500', '9');
INSERT INTO `cmswing_area` VALUES ('532529', '红河县', '532500', '10');
INSERT INTO `cmswing_area` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500', '11');
INSERT INTO `cmswing_area` VALUES ('532531', '绿春县', '532500', '12');
INSERT INTO `cmswing_area` VALUES ('532532', '河口瑶族自治县', '532500', '13');
INSERT INTO `cmswing_area` VALUES ('532621', '文山县', '532600', '1');
INSERT INTO `cmswing_area` VALUES ('532622', '砚山县', '532600', '2');
INSERT INTO `cmswing_area` VALUES ('532623', '西畴县', '532600', '3');
INSERT INTO `cmswing_area` VALUES ('532624', '麻栗坡县', '532600', '4');
INSERT INTO `cmswing_area` VALUES ('532625', '马关县', '532600', '5');
INSERT INTO `cmswing_area` VALUES ('532626', '丘北县', '532600', '6');
INSERT INTO `cmswing_area` VALUES ('532627', '广南县', '532600', '7');
INSERT INTO `cmswing_area` VALUES ('532628', '富宁县', '532600', '8');
INSERT INTO `cmswing_area` VALUES ('532801', '景洪市', '532800', '1');
INSERT INTO `cmswing_area` VALUES ('532822', '勐海县', '532800', '2');
INSERT INTO `cmswing_area` VALUES ('532823', '勐腊县', '532800', '3');
INSERT INTO `cmswing_area` VALUES ('532901', '大理市', '532900', '1');
INSERT INTO `cmswing_area` VALUES ('532922', '漾濞彝族自治县', '532900', '2');
INSERT INTO `cmswing_area` VALUES ('532923', '祥云县', '532900', '3');
INSERT INTO `cmswing_area` VALUES ('532924', '宾川县', '532900', '4');
INSERT INTO `cmswing_area` VALUES ('532925', '弥渡县', '532900', '5');
INSERT INTO `cmswing_area` VALUES ('532926', '南涧彝族自治县', '532900', '6');
INSERT INTO `cmswing_area` VALUES ('532927', '巍山彝族回族自治县', '532900', '7');
INSERT INTO `cmswing_area` VALUES ('532928', '永平县', '532900', '8');
INSERT INTO `cmswing_area` VALUES ('532929', '云龙县', '532900', '9');
INSERT INTO `cmswing_area` VALUES ('532930', '洱源县', '532900', '10');
INSERT INTO `cmswing_area` VALUES ('532931', '剑川县', '532900', '11');
INSERT INTO `cmswing_area` VALUES ('532932', '鹤庆县', '532900', '12');
INSERT INTO `cmswing_area` VALUES ('533102', '瑞丽市', '533100', '1');
INSERT INTO `cmswing_area` VALUES ('533103', '潞西市', '533100', '2');
INSERT INTO `cmswing_area` VALUES ('533122', '梁河县', '533100', '3');
INSERT INTO `cmswing_area` VALUES ('533123', '盈江县', '533100', '4');
INSERT INTO `cmswing_area` VALUES ('533124', '陇川县', '533100', '5');
INSERT INTO `cmswing_area` VALUES ('533321', '泸水县', '533300', '1');
INSERT INTO `cmswing_area` VALUES ('533323', '福贡县', '533300', '2');
INSERT INTO `cmswing_area` VALUES ('533324', '贡山独龙族怒族自治县', '533300', '3');
INSERT INTO `cmswing_area` VALUES ('533325', '兰坪白族普米族自治县', '533300', '4');
INSERT INTO `cmswing_area` VALUES ('533421', '香格里拉县', '533400', '1');
INSERT INTO `cmswing_area` VALUES ('533422', '德钦县', '533400', '2');
INSERT INTO `cmswing_area` VALUES ('533423', '维西傈僳族自治县', '533400', '3');
INSERT INTO `cmswing_area` VALUES ('540101', '市辖区', '540100', '1');
INSERT INTO `cmswing_area` VALUES ('540102', '城关区', '540100', '2');
INSERT INTO `cmswing_area` VALUES ('540121', '林周县', '540100', '3');
INSERT INTO `cmswing_area` VALUES ('540122', '当雄县', '540100', '4');
INSERT INTO `cmswing_area` VALUES ('540123', '尼木县', '540100', '5');
INSERT INTO `cmswing_area` VALUES ('540124', '曲水县', '540100', '6');
INSERT INTO `cmswing_area` VALUES ('540125', '堆龙德庆县', '540100', '7');
INSERT INTO `cmswing_area` VALUES ('540126', '达孜县', '540100', '8');
INSERT INTO `cmswing_area` VALUES ('540127', '墨竹工卡县', '540100', '9');
INSERT INTO `cmswing_area` VALUES ('542121', '昌都县', '542100', '1');
INSERT INTO `cmswing_area` VALUES ('542122', '江达县', '542100', '2');
INSERT INTO `cmswing_area` VALUES ('542123', '贡觉县', '542100', '3');
INSERT INTO `cmswing_area` VALUES ('542124', '类乌齐县', '542100', '4');
INSERT INTO `cmswing_area` VALUES ('542125', '丁青县', '542100', '5');
INSERT INTO `cmswing_area` VALUES ('542126', '察雅县', '542100', '6');
INSERT INTO `cmswing_area` VALUES ('542127', '八宿县', '542100', '7');
INSERT INTO `cmswing_area` VALUES ('542128', '左贡县', '542100', '8');
INSERT INTO `cmswing_area` VALUES ('542129', '芒康县', '542100', '9');
INSERT INTO `cmswing_area` VALUES ('542132', '洛隆县', '542100', '10');
INSERT INTO `cmswing_area` VALUES ('542133', '边坝县', '542100', '11');
INSERT INTO `cmswing_area` VALUES ('542221', '乃东县', '542200', '1');
INSERT INTO `cmswing_area` VALUES ('542222', '扎囊县', '542200', '2');
INSERT INTO `cmswing_area` VALUES ('542223', '贡嘎县', '542200', '3');
INSERT INTO `cmswing_area` VALUES ('542224', '桑日县', '542200', '4');
INSERT INTO `cmswing_area` VALUES ('542225', '琼结县', '542200', '5');
INSERT INTO `cmswing_area` VALUES ('542226', '曲松县', '542200', '6');
INSERT INTO `cmswing_area` VALUES ('542227', '措美县', '542200', '7');
INSERT INTO `cmswing_area` VALUES ('542228', '洛扎县', '542200', '8');
INSERT INTO `cmswing_area` VALUES ('542229', '加查县', '542200', '9');
INSERT INTO `cmswing_area` VALUES ('542231', '隆子县', '542200', '10');
INSERT INTO `cmswing_area` VALUES ('542232', '错那县', '542200', '11');
INSERT INTO `cmswing_area` VALUES ('542233', '浪卡子县', '542200', '12');
INSERT INTO `cmswing_area` VALUES ('542301', '日喀则市', '542300', '1');
INSERT INTO `cmswing_area` VALUES ('542322', '南木林县', '542300', '2');
INSERT INTO `cmswing_area` VALUES ('542323', '江孜县', '542300', '3');
INSERT INTO `cmswing_area` VALUES ('542324', '定日县', '542300', '4');
INSERT INTO `cmswing_area` VALUES ('542325', '萨迦县', '542300', '5');
INSERT INTO `cmswing_area` VALUES ('542326', '拉孜县', '542300', '6');
INSERT INTO `cmswing_area` VALUES ('542327', '昂仁县', '542300', '7');
INSERT INTO `cmswing_area` VALUES ('542328', '谢通门县', '542300', '8');
INSERT INTO `cmswing_area` VALUES ('542329', '白朗县', '542300', '9');
INSERT INTO `cmswing_area` VALUES ('542330', '仁布县', '542300', '10');
INSERT INTO `cmswing_area` VALUES ('542331', '康马县', '542300', '11');
INSERT INTO `cmswing_area` VALUES ('542332', '定结县', '542300', '12');
INSERT INTO `cmswing_area` VALUES ('542333', '仲巴县', '542300', '13');
INSERT INTO `cmswing_area` VALUES ('542334', '亚东县', '542300', '14');
INSERT INTO `cmswing_area` VALUES ('542335', '吉隆县', '542300', '15');
INSERT INTO `cmswing_area` VALUES ('542336', '聂拉木县', '542300', '16');
INSERT INTO `cmswing_area` VALUES ('542337', '萨嘎县', '542300', '17');
INSERT INTO `cmswing_area` VALUES ('542338', '岗巴县', '542300', '18');
INSERT INTO `cmswing_area` VALUES ('542421', '那曲县', '542400', '1');
INSERT INTO `cmswing_area` VALUES ('542422', '嘉黎县', '542400', '2');
INSERT INTO `cmswing_area` VALUES ('542423', '比如县', '542400', '3');
INSERT INTO `cmswing_area` VALUES ('542424', '聂荣县', '542400', '4');
INSERT INTO `cmswing_area` VALUES ('542425', '安多县', '542400', '5');
INSERT INTO `cmswing_area` VALUES ('542426', '申扎县', '542400', '6');
INSERT INTO `cmswing_area` VALUES ('542427', '索　县', '542400', '7');
INSERT INTO `cmswing_area` VALUES ('542428', '班戈县', '542400', '8');
INSERT INTO `cmswing_area` VALUES ('542429', '巴青县', '542400', '9');
INSERT INTO `cmswing_area` VALUES ('542430', '尼玛县', '542400', '10');
INSERT INTO `cmswing_area` VALUES ('542521', '普兰县', '542500', '1');
INSERT INTO `cmswing_area` VALUES ('542522', '札达县', '542500', '2');
INSERT INTO `cmswing_area` VALUES ('542523', '噶尔县', '542500', '3');
INSERT INTO `cmswing_area` VALUES ('542524', '日土县', '542500', '4');
INSERT INTO `cmswing_area` VALUES ('542525', '革吉县', '542500', '5');
INSERT INTO `cmswing_area` VALUES ('542526', '改则县', '542500', '6');
INSERT INTO `cmswing_area` VALUES ('542527', '措勤县', '542500', '7');
INSERT INTO `cmswing_area` VALUES ('542621', '林芝县', '542600', '1');
INSERT INTO `cmswing_area` VALUES ('542622', '工布江达县', '542600', '2');
INSERT INTO `cmswing_area` VALUES ('542623', '米林县', '542600', '3');
INSERT INTO `cmswing_area` VALUES ('542624', '墨脱县', '542600', '4');
INSERT INTO `cmswing_area` VALUES ('542625', '波密县', '542600', '5');
INSERT INTO `cmswing_area` VALUES ('542626', '察隅县', '542600', '6');
INSERT INTO `cmswing_area` VALUES ('542627', '朗　县', '542600', '7');
INSERT INTO `cmswing_area` VALUES ('610101', '市辖区', '610100', '1');
INSERT INTO `cmswing_area` VALUES ('610102', '新城区', '610100', '2');
INSERT INTO `cmswing_area` VALUES ('610103', '碑林区', '610100', '3');
INSERT INTO `cmswing_area` VALUES ('610104', '莲湖区', '610100', '4');
INSERT INTO `cmswing_area` VALUES ('610111', '灞桥区', '610100', '5');
INSERT INTO `cmswing_area` VALUES ('610112', '未央区', '610100', '6');
INSERT INTO `cmswing_area` VALUES ('610113', '雁塔区', '610100', '7');
INSERT INTO `cmswing_area` VALUES ('610114', '阎良区', '610100', '8');
INSERT INTO `cmswing_area` VALUES ('610115', '临潼区', '610100', '9');
INSERT INTO `cmswing_area` VALUES ('610116', '长安区', '610100', '10');
INSERT INTO `cmswing_area` VALUES ('610122', '蓝田县', '610100', '11');
INSERT INTO `cmswing_area` VALUES ('610124', '周至县', '610100', '12');
INSERT INTO `cmswing_area` VALUES ('610125', '户　县', '610100', '13');
INSERT INTO `cmswing_area` VALUES ('610126', '高陵县', '610100', '14');
INSERT INTO `cmswing_area` VALUES ('610201', '市辖区', '610200', '1');
INSERT INTO `cmswing_area` VALUES ('610202', '王益区', '610200', '2');
INSERT INTO `cmswing_area` VALUES ('610203', '印台区', '610200', '3');
INSERT INTO `cmswing_area` VALUES ('610204', '耀州区', '610200', '4');
INSERT INTO `cmswing_area` VALUES ('610222', '宜君县', '610200', '5');
INSERT INTO `cmswing_area` VALUES ('610301', '市辖区', '610300', '1');
INSERT INTO `cmswing_area` VALUES ('610302', '渭滨区', '610300', '2');
INSERT INTO `cmswing_area` VALUES ('610303', '金台区', '610300', '3');
INSERT INTO `cmswing_area` VALUES ('610304', '陈仓区', '610300', '4');
INSERT INTO `cmswing_area` VALUES ('610322', '凤翔县', '610300', '5');
INSERT INTO `cmswing_area` VALUES ('610323', '岐山县', '610300', '6');
INSERT INTO `cmswing_area` VALUES ('610324', '扶风县', '610300', '7');
INSERT INTO `cmswing_area` VALUES ('610326', '眉　县', '610300', '8');
INSERT INTO `cmswing_area` VALUES ('610327', '陇　县', '610300', '9');
INSERT INTO `cmswing_area` VALUES ('610328', '千阳县', '610300', '10');
INSERT INTO `cmswing_area` VALUES ('610329', '麟游县', '610300', '11');
INSERT INTO `cmswing_area` VALUES ('610330', '凤　县', '610300', '12');
INSERT INTO `cmswing_area` VALUES ('610331', '太白县', '610300', '13');
INSERT INTO `cmswing_area` VALUES ('610401', '市辖区', '610400', '1');
INSERT INTO `cmswing_area` VALUES ('610402', '秦都区', '610400', '2');
INSERT INTO `cmswing_area` VALUES ('610403', '杨凌区', '610400', '3');
INSERT INTO `cmswing_area` VALUES ('610404', '渭城区', '610400', '4');
INSERT INTO `cmswing_area` VALUES ('610422', '三原县', '610400', '5');
INSERT INTO `cmswing_area` VALUES ('610423', '泾阳县', '610400', '6');
INSERT INTO `cmswing_area` VALUES ('610424', '乾　县', '610400', '7');
INSERT INTO `cmswing_area` VALUES ('610425', '礼泉县', '610400', '8');
INSERT INTO `cmswing_area` VALUES ('610426', '永寿县', '610400', '9');
INSERT INTO `cmswing_area` VALUES ('610427', '彬　县', '610400', '10');
INSERT INTO `cmswing_area` VALUES ('610428', '长武县', '610400', '11');
INSERT INTO `cmswing_area` VALUES ('610429', '旬邑县', '610400', '12');
INSERT INTO `cmswing_area` VALUES ('610430', '淳化县', '610400', '13');
INSERT INTO `cmswing_area` VALUES ('610431', '武功县', '610400', '14');
INSERT INTO `cmswing_area` VALUES ('610481', '兴平市', '610400', '15');
INSERT INTO `cmswing_area` VALUES ('610501', '市辖区', '610500', '1');
INSERT INTO `cmswing_area` VALUES ('610502', '临渭区', '610500', '2');
INSERT INTO `cmswing_area` VALUES ('610521', '华　县', '610500', '3');
INSERT INTO `cmswing_area` VALUES ('610522', '潼关县', '610500', '4');
INSERT INTO `cmswing_area` VALUES ('610523', '大荔县', '610500', '5');
INSERT INTO `cmswing_area` VALUES ('610524', '合阳县', '610500', '6');
INSERT INTO `cmswing_area` VALUES ('610525', '澄城县', '610500', '7');
INSERT INTO `cmswing_area` VALUES ('610526', '蒲城县', '610500', '8');
INSERT INTO `cmswing_area` VALUES ('610527', '白水县', '610500', '9');
INSERT INTO `cmswing_area` VALUES ('610528', '富平县', '610500', '10');
INSERT INTO `cmswing_area` VALUES ('610581', '韩城市', '610500', '11');
INSERT INTO `cmswing_area` VALUES ('610582', '华阴市', '610500', '12');
INSERT INTO `cmswing_area` VALUES ('610601', '市辖区', '610600', '1');
INSERT INTO `cmswing_area` VALUES ('610602', '宝塔区', '610600', '2');
INSERT INTO `cmswing_area` VALUES ('610621', '延长县', '610600', '3');
INSERT INTO `cmswing_area` VALUES ('610622', '延川县', '610600', '4');
INSERT INTO `cmswing_area` VALUES ('610623', '子长县', '610600', '5');
INSERT INTO `cmswing_area` VALUES ('610624', '安塞县', '610600', '6');
INSERT INTO `cmswing_area` VALUES ('610625', '志丹县', '610600', '7');
INSERT INTO `cmswing_area` VALUES ('610626', '吴旗县', '610600', '8');
INSERT INTO `cmswing_area` VALUES ('610627', '甘泉县', '610600', '9');
INSERT INTO `cmswing_area` VALUES ('610628', '富　县', '610600', '10');
INSERT INTO `cmswing_area` VALUES ('610629', '洛川县', '610600', '11');
INSERT INTO `cmswing_area` VALUES ('610630', '宜川县', '610600', '12');
INSERT INTO `cmswing_area` VALUES ('610631', '黄龙县', '610600', '13');
INSERT INTO `cmswing_area` VALUES ('610632', '黄陵县', '610600', '14');
INSERT INTO `cmswing_area` VALUES ('610701', '市辖区', '610700', '1');
INSERT INTO `cmswing_area` VALUES ('610702', '汉台区', '610700', '2');
INSERT INTO `cmswing_area` VALUES ('610721', '南郑县', '610700', '3');
INSERT INTO `cmswing_area` VALUES ('610722', '城固县', '610700', '4');
INSERT INTO `cmswing_area` VALUES ('610723', '洋　县', '610700', '5');
INSERT INTO `cmswing_area` VALUES ('610724', '西乡县', '610700', '6');
INSERT INTO `cmswing_area` VALUES ('610725', '勉　县', '610700', '7');
INSERT INTO `cmswing_area` VALUES ('610726', '宁强县', '610700', '8');
INSERT INTO `cmswing_area` VALUES ('610727', '略阳县', '610700', '9');
INSERT INTO `cmswing_area` VALUES ('610728', '镇巴县', '610700', '10');
INSERT INTO `cmswing_area` VALUES ('610729', '留坝县', '610700', '11');
INSERT INTO `cmswing_area` VALUES ('610730', '佛坪县', '610700', '12');
INSERT INTO `cmswing_area` VALUES ('610801', '市辖区', '610800', '1');
INSERT INTO `cmswing_area` VALUES ('610802', '榆阳区', '610800', '2');
INSERT INTO `cmswing_area` VALUES ('610821', '神木县', '610800', '3');
INSERT INTO `cmswing_area` VALUES ('610822', '府谷县', '610800', '4');
INSERT INTO `cmswing_area` VALUES ('610823', '横山县', '610800', '5');
INSERT INTO `cmswing_area` VALUES ('610824', '靖边县', '610800', '6');
INSERT INTO `cmswing_area` VALUES ('610825', '定边县', '610800', '7');
INSERT INTO `cmswing_area` VALUES ('610826', '绥德县', '610800', '8');
INSERT INTO `cmswing_area` VALUES ('610827', '米脂县', '610800', '9');
INSERT INTO `cmswing_area` VALUES ('610828', '佳　县', '610800', '10');
INSERT INTO `cmswing_area` VALUES ('610829', '吴堡县', '610800', '11');
INSERT INTO `cmswing_area` VALUES ('610830', '清涧县', '610800', '12');
INSERT INTO `cmswing_area` VALUES ('610831', '子洲县', '610800', '13');
INSERT INTO `cmswing_area` VALUES ('610901', '市辖区', '610900', '1');
INSERT INTO `cmswing_area` VALUES ('610902', '汉滨区', '610900', '2');
INSERT INTO `cmswing_area` VALUES ('610921', '汉阴县', '610900', '3');
INSERT INTO `cmswing_area` VALUES ('610922', '石泉县', '610900', '4');
INSERT INTO `cmswing_area` VALUES ('610923', '宁陕县', '610900', '5');
INSERT INTO `cmswing_area` VALUES ('610924', '紫阳县', '610900', '6');
INSERT INTO `cmswing_area` VALUES ('610925', '岚皋县', '610900', '7');
INSERT INTO `cmswing_area` VALUES ('610926', '平利县', '610900', '8');
INSERT INTO `cmswing_area` VALUES ('610927', '镇坪县', '610900', '9');
INSERT INTO `cmswing_area` VALUES ('610928', '旬阳县', '610900', '10');
INSERT INTO `cmswing_area` VALUES ('610929', '白河县', '610900', '11');
INSERT INTO `cmswing_area` VALUES ('611001', '市辖区', '611000', '1');
INSERT INTO `cmswing_area` VALUES ('611002', '商州区', '611000', '2');
INSERT INTO `cmswing_area` VALUES ('611021', '洛南县', '611000', '3');
INSERT INTO `cmswing_area` VALUES ('611022', '丹凤县', '611000', '4');
INSERT INTO `cmswing_area` VALUES ('611023', '商南县', '611000', '5');
INSERT INTO `cmswing_area` VALUES ('611024', '山阳县', '611000', '6');
INSERT INTO `cmswing_area` VALUES ('611025', '镇安县', '611000', '7');
INSERT INTO `cmswing_area` VALUES ('611026', '柞水县', '611000', '8');
INSERT INTO `cmswing_area` VALUES ('620101', '市辖区', '620100', '1');
INSERT INTO `cmswing_area` VALUES ('620102', '城关区', '620100', '2');
INSERT INTO `cmswing_area` VALUES ('620103', '七里河区', '620100', '3');
INSERT INTO `cmswing_area` VALUES ('620104', '西固区', '620100', '4');
INSERT INTO `cmswing_area` VALUES ('620105', '安宁区', '620100', '5');
INSERT INTO `cmswing_area` VALUES ('620111', '红古区', '620100', '6');
INSERT INTO `cmswing_area` VALUES ('620121', '永登县', '620100', '7');
INSERT INTO `cmswing_area` VALUES ('620122', '皋兰县', '620100', '8');
INSERT INTO `cmswing_area` VALUES ('620123', '榆中县', '620100', '9');
INSERT INTO `cmswing_area` VALUES ('620201', '市辖区', '620200', '1');
INSERT INTO `cmswing_area` VALUES ('620301', '市辖区', '620300', '1');
INSERT INTO `cmswing_area` VALUES ('620302', '金川区', '620300', '2');
INSERT INTO `cmswing_area` VALUES ('620321', '永昌县', '620300', '3');
INSERT INTO `cmswing_area` VALUES ('620401', '市辖区', '620400', '1');
INSERT INTO `cmswing_area` VALUES ('620402', '白银区', '620400', '2');
INSERT INTO `cmswing_area` VALUES ('620403', '平川区', '620400', '3');
INSERT INTO `cmswing_area` VALUES ('620421', '靖远县', '620400', '4');
INSERT INTO `cmswing_area` VALUES ('620422', '会宁县', '620400', '5');
INSERT INTO `cmswing_area` VALUES ('620423', '景泰县', '620400', '6');
INSERT INTO `cmswing_area` VALUES ('620501', '市辖区', '620500', '1');
INSERT INTO `cmswing_area` VALUES ('620502', '秦城区', '620500', '2');
INSERT INTO `cmswing_area` VALUES ('620503', '北道区', '620500', '3');
INSERT INTO `cmswing_area` VALUES ('620521', '清水县', '620500', '4');
INSERT INTO `cmswing_area` VALUES ('620522', '秦安县', '620500', '5');
INSERT INTO `cmswing_area` VALUES ('620523', '甘谷县', '620500', '6');
INSERT INTO `cmswing_area` VALUES ('620524', '武山县', '620500', '7');
INSERT INTO `cmswing_area` VALUES ('620525', '张家川回族自治县', '620500', '8');
INSERT INTO `cmswing_area` VALUES ('620601', '市辖区', '620600', '1');
INSERT INTO `cmswing_area` VALUES ('620602', '凉州区', '620600', '2');
INSERT INTO `cmswing_area` VALUES ('620621', '民勤县', '620600', '3');
INSERT INTO `cmswing_area` VALUES ('620622', '古浪县', '620600', '4');
INSERT INTO `cmswing_area` VALUES ('620623', '天祝藏族自治县', '620600', '5');
INSERT INTO `cmswing_area` VALUES ('620701', '市辖区', '620700', '1');
INSERT INTO `cmswing_area` VALUES ('620702', '甘州区', '620700', '2');
INSERT INTO `cmswing_area` VALUES ('620721', '肃南裕固族自治县', '620700', '3');
INSERT INTO `cmswing_area` VALUES ('620722', '民乐县', '620700', '4');
INSERT INTO `cmswing_area` VALUES ('620723', '临泽县', '620700', '5');
INSERT INTO `cmswing_area` VALUES ('620724', '高台县', '620700', '6');
INSERT INTO `cmswing_area` VALUES ('620725', '山丹县', '620700', '7');
INSERT INTO `cmswing_area` VALUES ('620801', '市辖区', '620800', '1');
INSERT INTO `cmswing_area` VALUES ('620802', '崆峒区', '620800', '2');
INSERT INTO `cmswing_area` VALUES ('620821', '泾川县', '620800', '3');
INSERT INTO `cmswing_area` VALUES ('620822', '灵台县', '620800', '4');
INSERT INTO `cmswing_area` VALUES ('620823', '崇信县', '620800', '5');
INSERT INTO `cmswing_area` VALUES ('620824', '华亭县', '620800', '6');
INSERT INTO `cmswing_area` VALUES ('620825', '庄浪县', '620800', '7');
INSERT INTO `cmswing_area` VALUES ('620826', '静宁县', '620800', '8');
INSERT INTO `cmswing_area` VALUES ('620901', '市辖区', '620900', '1');
INSERT INTO `cmswing_area` VALUES ('620902', '肃州区', '620900', '2');
INSERT INTO `cmswing_area` VALUES ('620921', '金塔县', '620900', '3');
INSERT INTO `cmswing_area` VALUES ('620922', '安西县', '620900', '4');
INSERT INTO `cmswing_area` VALUES ('620923', '肃北蒙古族自治县', '620900', '5');
INSERT INTO `cmswing_area` VALUES ('620924', '阿克塞哈萨克族自治县', '620900', '6');
INSERT INTO `cmswing_area` VALUES ('620981', '玉门市', '620900', '7');
INSERT INTO `cmswing_area` VALUES ('620982', '敦煌市', '620900', '8');
INSERT INTO `cmswing_area` VALUES ('621001', '市辖区', '621000', '1');
INSERT INTO `cmswing_area` VALUES ('621002', '西峰区', '621000', '2');
INSERT INTO `cmswing_area` VALUES ('621021', '庆城县', '621000', '3');
INSERT INTO `cmswing_area` VALUES ('621022', '环　县', '621000', '4');
INSERT INTO `cmswing_area` VALUES ('621023', '华池县', '621000', '5');
INSERT INTO `cmswing_area` VALUES ('621024', '合水县', '621000', '6');
INSERT INTO `cmswing_area` VALUES ('621025', '正宁县', '621000', '7');
INSERT INTO `cmswing_area` VALUES ('621026', '宁　县', '621000', '8');
INSERT INTO `cmswing_area` VALUES ('621027', '镇原县', '621000', '9');
INSERT INTO `cmswing_area` VALUES ('621101', '市辖区', '621100', '1');
INSERT INTO `cmswing_area` VALUES ('621102', '安定区', '621100', '2');
INSERT INTO `cmswing_area` VALUES ('621121', '通渭县', '621100', '3');
INSERT INTO `cmswing_area` VALUES ('621122', '陇西县', '621100', '4');
INSERT INTO `cmswing_area` VALUES ('621123', '渭源县', '621100', '5');
INSERT INTO `cmswing_area` VALUES ('621124', '临洮县', '621100', '6');
INSERT INTO `cmswing_area` VALUES ('621125', '漳　县', '621100', '7');
INSERT INTO `cmswing_area` VALUES ('621126', '岷　县', '621100', '8');
INSERT INTO `cmswing_area` VALUES ('621201', '市辖区', '621200', '1');
INSERT INTO `cmswing_area` VALUES ('621202', '武都区', '621200', '2');
INSERT INTO `cmswing_area` VALUES ('621221', '成　县', '621200', '3');
INSERT INTO `cmswing_area` VALUES ('621222', '文　县', '621200', '4');
INSERT INTO `cmswing_area` VALUES ('621223', '宕昌县', '621200', '5');
INSERT INTO `cmswing_area` VALUES ('621224', '康　县', '621200', '6');
INSERT INTO `cmswing_area` VALUES ('621225', '西和县', '621200', '7');
INSERT INTO `cmswing_area` VALUES ('621226', '礼　县', '621200', '8');
INSERT INTO `cmswing_area` VALUES ('621227', '徽　县', '621200', '9');
INSERT INTO `cmswing_area` VALUES ('621228', '两当县', '621200', '10');
INSERT INTO `cmswing_area` VALUES ('622901', '临夏市', '622900', '1');
INSERT INTO `cmswing_area` VALUES ('622921', '临夏县', '622900', '2');
INSERT INTO `cmswing_area` VALUES ('622922', '康乐县', '622900', '3');
INSERT INTO `cmswing_area` VALUES ('622923', '永靖县', '622900', '4');
INSERT INTO `cmswing_area` VALUES ('622924', '广河县', '622900', '5');
INSERT INTO `cmswing_area` VALUES ('622925', '和政县', '622900', '6');
INSERT INTO `cmswing_area` VALUES ('622926', '东乡族自治县', '622900', '7');
INSERT INTO `cmswing_area` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900', '8');
INSERT INTO `cmswing_area` VALUES ('623001', '合作市', '623000', '1');
INSERT INTO `cmswing_area` VALUES ('623021', '临潭县', '623000', '2');
INSERT INTO `cmswing_area` VALUES ('623022', '卓尼县', '623000', '3');
INSERT INTO `cmswing_area` VALUES ('623023', '舟曲县', '623000', '4');
INSERT INTO `cmswing_area` VALUES ('623024', '迭部县', '623000', '5');
INSERT INTO `cmswing_area` VALUES ('623025', '玛曲县', '623000', '6');
INSERT INTO `cmswing_area` VALUES ('623026', '碌曲县', '623000', '7');
INSERT INTO `cmswing_area` VALUES ('623027', '夏河县', '623000', '8');
INSERT INTO `cmswing_area` VALUES ('630101', '市辖区', '630100', '1');
INSERT INTO `cmswing_area` VALUES ('630102', '城东区', '630100', '2');
INSERT INTO `cmswing_area` VALUES ('630103', '城中区', '630100', '3');
INSERT INTO `cmswing_area` VALUES ('630104', '城西区', '630100', '4');
INSERT INTO `cmswing_area` VALUES ('630105', '城北区', '630100', '5');
INSERT INTO `cmswing_area` VALUES ('630121', '大通回族土族自治县', '630100', '6');
INSERT INTO `cmswing_area` VALUES ('630122', '湟中县', '630100', '7');
INSERT INTO `cmswing_area` VALUES ('630123', '湟源县', '630100', '8');
INSERT INTO `cmswing_area` VALUES ('632121', '平安县', '632100', '1');
INSERT INTO `cmswing_area` VALUES ('632122', '民和回族土族自治县', '632100', '2');
INSERT INTO `cmswing_area` VALUES ('632123', '乐都县', '632100', '3');
INSERT INTO `cmswing_area` VALUES ('632126', '互助土族自治县', '632100', '4');
INSERT INTO `cmswing_area` VALUES ('632127', '化隆回族自治县', '632100', '5');
INSERT INTO `cmswing_area` VALUES ('632128', '循化撒拉族自治县', '632100', '6');
INSERT INTO `cmswing_area` VALUES ('632221', '门源回族自治县', '632200', '1');
INSERT INTO `cmswing_area` VALUES ('632222', '祁连县', '632200', '2');
INSERT INTO `cmswing_area` VALUES ('632223', '海晏县', '632200', '3');
INSERT INTO `cmswing_area` VALUES ('632224', '刚察县', '632200', '4');
INSERT INTO `cmswing_area` VALUES ('632321', '同仁县', '632300', '1');
INSERT INTO `cmswing_area` VALUES ('632322', '尖扎县', '632300', '2');
INSERT INTO `cmswing_area` VALUES ('632323', '泽库县', '632300', '3');
INSERT INTO `cmswing_area` VALUES ('632324', '河南蒙古族自治县', '632300', '4');
INSERT INTO `cmswing_area` VALUES ('632521', '共和县', '632500', '1');
INSERT INTO `cmswing_area` VALUES ('632522', '同德县', '632500', '2');
INSERT INTO `cmswing_area` VALUES ('632523', '贵德县', '632500', '3');
INSERT INTO `cmswing_area` VALUES ('632524', '兴海县', '632500', '4');
INSERT INTO `cmswing_area` VALUES ('632525', '贵南县', '632500', '5');
INSERT INTO `cmswing_area` VALUES ('632621', '玛沁县', '632600', '1');
INSERT INTO `cmswing_area` VALUES ('632622', '班玛县', '632600', '2');
INSERT INTO `cmswing_area` VALUES ('632623', '甘德县', '632600', '3');
INSERT INTO `cmswing_area` VALUES ('632624', '达日县', '632600', '4');
INSERT INTO `cmswing_area` VALUES ('632625', '久治县', '632600', '5');
INSERT INTO `cmswing_area` VALUES ('632626', '玛多县', '632600', '6');
INSERT INTO `cmswing_area` VALUES ('632721', '玉树县', '632700', '1');
INSERT INTO `cmswing_area` VALUES ('632722', '杂多县', '632700', '2');
INSERT INTO `cmswing_area` VALUES ('632723', '称多县', '632700', '3');
INSERT INTO `cmswing_area` VALUES ('632724', '治多县', '632700', '4');
INSERT INTO `cmswing_area` VALUES ('632725', '囊谦县', '632700', '5');
INSERT INTO `cmswing_area` VALUES ('632726', '曲麻莱县', '632700', '6');
INSERT INTO `cmswing_area` VALUES ('632801', '格尔木市', '632800', '1');
INSERT INTO `cmswing_area` VALUES ('632802', '德令哈市', '632800', '2');
INSERT INTO `cmswing_area` VALUES ('632821', '乌兰县', '632800', '3');
INSERT INTO `cmswing_area` VALUES ('632822', '都兰县', '632800', '4');
INSERT INTO `cmswing_area` VALUES ('632823', '天峻县', '632800', '5');
INSERT INTO `cmswing_area` VALUES ('640101', '市辖区', '640100', '1');
INSERT INTO `cmswing_area` VALUES ('640104', '兴庆区', '640100', '2');
INSERT INTO `cmswing_area` VALUES ('640105', '西夏区', '640100', '3');
INSERT INTO `cmswing_area` VALUES ('640106', '金凤区', '640100', '4');
INSERT INTO `cmswing_area` VALUES ('640121', '永宁县', '640100', '5');
INSERT INTO `cmswing_area` VALUES ('640122', '贺兰县', '640100', '6');
INSERT INTO `cmswing_area` VALUES ('640181', '灵武市', '640100', '7');
INSERT INTO `cmswing_area` VALUES ('640201', '市辖区', '640200', '1');
INSERT INTO `cmswing_area` VALUES ('640202', '大武口区', '640200', '2');
INSERT INTO `cmswing_area` VALUES ('640205', '惠农区', '640200', '3');
INSERT INTO `cmswing_area` VALUES ('640221', '平罗县', '640200', '4');
INSERT INTO `cmswing_area` VALUES ('640301', '市辖区', '640300', '1');
INSERT INTO `cmswing_area` VALUES ('640302', '利通区', '640300', '2');
INSERT INTO `cmswing_area` VALUES ('640323', '盐池县', '640300', '3');
INSERT INTO `cmswing_area` VALUES ('640324', '同心县', '640300', '4');
INSERT INTO `cmswing_area` VALUES ('640381', '青铜峡市', '640300', '5');
INSERT INTO `cmswing_area` VALUES ('640401', '市辖区', '640400', '1');
INSERT INTO `cmswing_area` VALUES ('640402', '原州区', '640400', '2');
INSERT INTO `cmswing_area` VALUES ('640422', '西吉县', '640400', '3');
INSERT INTO `cmswing_area` VALUES ('640423', '隆德县', '640400', '4');
INSERT INTO `cmswing_area` VALUES ('640424', '泾源县', '640400', '5');
INSERT INTO `cmswing_area` VALUES ('640425', '彭阳县', '640400', '6');
INSERT INTO `cmswing_area` VALUES ('640501', '市辖区', '640500', '1');
INSERT INTO `cmswing_area` VALUES ('640502', '沙坡头区', '640500', '2');
INSERT INTO `cmswing_area` VALUES ('640521', '中宁县', '640500', '3');
INSERT INTO `cmswing_area` VALUES ('640522', '海原县', '640500', '4');
INSERT INTO `cmswing_area` VALUES ('650101', '市辖区', '650100', '1');
INSERT INTO `cmswing_area` VALUES ('650102', '天山区', '650100', '2');
INSERT INTO `cmswing_area` VALUES ('650103', '沙依巴克区', '650100', '3');
INSERT INTO `cmswing_area` VALUES ('650104', '新市区', '650100', '4');
INSERT INTO `cmswing_area` VALUES ('650105', '水磨沟区', '650100', '5');
INSERT INTO `cmswing_area` VALUES ('650106', '头屯河区', '650100', '6');
INSERT INTO `cmswing_area` VALUES ('650107', '达坂城区', '650100', '7');
INSERT INTO `cmswing_area` VALUES ('650108', '东山区', '650100', '8');
INSERT INTO `cmswing_area` VALUES ('650121', '乌鲁木齐县', '650100', '9');
INSERT INTO `cmswing_area` VALUES ('650201', '市辖区', '650200', '1');
INSERT INTO `cmswing_area` VALUES ('650202', '独山子区', '650200', '2');
INSERT INTO `cmswing_area` VALUES ('650203', '克拉玛依区', '650200', '3');
INSERT INTO `cmswing_area` VALUES ('650204', '白碱滩区', '650200', '4');
INSERT INTO `cmswing_area` VALUES ('650205', '乌尔禾区', '650200', '5');
INSERT INTO `cmswing_area` VALUES ('652101', '吐鲁番市', '652100', '1');
INSERT INTO `cmswing_area` VALUES ('652122', '鄯善县', '652100', '2');
INSERT INTO `cmswing_area` VALUES ('652123', '托克逊县', '652100', '3');
INSERT INTO `cmswing_area` VALUES ('652201', '哈密市', '652200', '1');
INSERT INTO `cmswing_area` VALUES ('652222', '巴里坤哈萨克自治县', '652200', '2');
INSERT INTO `cmswing_area` VALUES ('652223', '伊吾县', '652200', '3');
INSERT INTO `cmswing_area` VALUES ('652301', '昌吉市', '652300', '1');
INSERT INTO `cmswing_area` VALUES ('652302', '阜康市', '652300', '2');
INSERT INTO `cmswing_area` VALUES ('652303', '米泉市', '652300', '3');
INSERT INTO `cmswing_area` VALUES ('652323', '呼图壁县', '652300', '4');
INSERT INTO `cmswing_area` VALUES ('652324', '玛纳斯县', '652300', '5');
INSERT INTO `cmswing_area` VALUES ('652325', '奇台县', '652300', '6');
INSERT INTO `cmswing_area` VALUES ('652327', '吉木萨尔县', '652300', '7');
INSERT INTO `cmswing_area` VALUES ('652328', '木垒哈萨克自治县', '652300', '8');
INSERT INTO `cmswing_area` VALUES ('652701', '博乐市', '652700', '1');
INSERT INTO `cmswing_area` VALUES ('652722', '精河县', '652700', '2');
INSERT INTO `cmswing_area` VALUES ('652723', '温泉县', '652700', '3');
INSERT INTO `cmswing_area` VALUES ('652801', '库尔勒市', '652800', '1');
INSERT INTO `cmswing_area` VALUES ('652822', '轮台县', '652800', '2');
INSERT INTO `cmswing_area` VALUES ('652823', '尉犁县', '652800', '3');
INSERT INTO `cmswing_area` VALUES ('652824', '若羌县', '652800', '4');
INSERT INTO `cmswing_area` VALUES ('652825', '且末县', '652800', '5');
INSERT INTO `cmswing_area` VALUES ('652826', '焉耆回族自治县', '652800', '6');
INSERT INTO `cmswing_area` VALUES ('652827', '和静县', '652800', '7');
INSERT INTO `cmswing_area` VALUES ('652828', '和硕县', '652800', '8');
INSERT INTO `cmswing_area` VALUES ('652829', '博湖县', '652800', '9');
INSERT INTO `cmswing_area` VALUES ('652901', '阿克苏市', '652900', '1');
INSERT INTO `cmswing_area` VALUES ('652922', '温宿县', '652900', '2');
INSERT INTO `cmswing_area` VALUES ('652923', '库车县', '652900', '3');
INSERT INTO `cmswing_area` VALUES ('652924', '沙雅县', '652900', '4');
INSERT INTO `cmswing_area` VALUES ('652925', '新和县', '652900', '5');
INSERT INTO `cmswing_area` VALUES ('652926', '拜城县', '652900', '6');
INSERT INTO `cmswing_area` VALUES ('652927', '乌什县', '652900', '7');
INSERT INTO `cmswing_area` VALUES ('652928', '阿瓦提县', '652900', '8');
INSERT INTO `cmswing_area` VALUES ('652929', '柯坪县', '652900', '9');
INSERT INTO `cmswing_area` VALUES ('653001', '阿图什市', '653000', '1');
INSERT INTO `cmswing_area` VALUES ('653022', '阿克陶县', '653000', '2');
INSERT INTO `cmswing_area` VALUES ('653023', '阿合奇县', '653000', '3');
INSERT INTO `cmswing_area` VALUES ('653024', '乌恰县', '653000', '4');
INSERT INTO `cmswing_area` VALUES ('653101', '喀什市', '653100', '1');
INSERT INTO `cmswing_area` VALUES ('653121', '疏附县', '653100', '2');
INSERT INTO `cmswing_area` VALUES ('653122', '疏勒县', '653100', '3');
INSERT INTO `cmswing_area` VALUES ('653123', '英吉沙县', '653100', '4');
INSERT INTO `cmswing_area` VALUES ('653124', '泽普县', '653100', '5');
INSERT INTO `cmswing_area` VALUES ('653125', '莎车县', '653100', '6');
INSERT INTO `cmswing_area` VALUES ('653126', '叶城县', '653100', '7');
INSERT INTO `cmswing_area` VALUES ('653127', '麦盖提县', '653100', '8');
INSERT INTO `cmswing_area` VALUES ('653128', '岳普湖县', '653100', '9');
INSERT INTO `cmswing_area` VALUES ('653129', '伽师县', '653100', '10');
INSERT INTO `cmswing_area` VALUES ('653130', '巴楚县', '653100', '11');
INSERT INTO `cmswing_area` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100', '12');
INSERT INTO `cmswing_area` VALUES ('653201', '和田市', '653200', '1');
INSERT INTO `cmswing_area` VALUES ('653221', '和田县', '653200', '2');
INSERT INTO `cmswing_area` VALUES ('653222', '墨玉县', '653200', '3');
INSERT INTO `cmswing_area` VALUES ('653223', '皮山县', '653200', '4');
INSERT INTO `cmswing_area` VALUES ('653224', '洛浦县', '653200', '5');
INSERT INTO `cmswing_area` VALUES ('653225', '策勒县', '653200', '6');
INSERT INTO `cmswing_area` VALUES ('653226', '于田县', '653200', '7');
INSERT INTO `cmswing_area` VALUES ('653227', '民丰县', '653200', '8');
INSERT INTO `cmswing_area` VALUES ('654002', '伊宁市', '654000', '1');
INSERT INTO `cmswing_area` VALUES ('654003', '奎屯市', '654000', '2');
INSERT INTO `cmswing_area` VALUES ('654021', '伊宁县', '654000', '3');
INSERT INTO `cmswing_area` VALUES ('654022', '察布查尔锡伯自治县', '654000', '4');
INSERT INTO `cmswing_area` VALUES ('654023', '霍城县', '654000', '5');
INSERT INTO `cmswing_area` VALUES ('654024', '巩留县', '654000', '6');
INSERT INTO `cmswing_area` VALUES ('654025', '新源县', '654000', '7');
INSERT INTO `cmswing_area` VALUES ('654026', '昭苏县', '654000', '8');
INSERT INTO `cmswing_area` VALUES ('654027', '特克斯县', '654000', '9');
INSERT INTO `cmswing_area` VALUES ('654028', '尼勒克县', '654000', '10');
INSERT INTO `cmswing_area` VALUES ('654201', '塔城市', '654200', '1');
INSERT INTO `cmswing_area` VALUES ('654202', '乌苏市', '654200', '2');
INSERT INTO `cmswing_area` VALUES ('654221', '额敏县', '654200', '3');
INSERT INTO `cmswing_area` VALUES ('654223', '沙湾县', '654200', '4');
INSERT INTO `cmswing_area` VALUES ('654224', '托里县', '654200', '5');
INSERT INTO `cmswing_area` VALUES ('654225', '裕民县', '654200', '6');
INSERT INTO `cmswing_area` VALUES ('654226', '和布克赛尔蒙古自治县', '654200', '7');
INSERT INTO `cmswing_area` VALUES ('654301', '阿勒泰市', '654300', '1');
INSERT INTO `cmswing_area` VALUES ('654321', '布尔津县', '654300', '2');
INSERT INTO `cmswing_area` VALUES ('654322', '富蕴县', '654300', '3');
INSERT INTO `cmswing_area` VALUES ('654323', '福海县', '654300', '4');
INSERT INTO `cmswing_area` VALUES ('654324', '哈巴河县', '654300', '5');
INSERT INTO `cmswing_area` VALUES ('654325', '青河县', '654300', '6');
INSERT INTO `cmswing_area` VALUES ('654326', '吉木乃县', '654300', '7');
INSERT INTO `cmswing_area` VALUES ('659001', '石河子市', '659000', '1');
INSERT INTO `cmswing_area` VALUES ('659002', '阿拉尔市', '659000', '2');
INSERT INTO `cmswing_area` VALUES ('659003', '图木舒克市', '659000', '3');
INSERT INTO `cmswing_area` VALUES ('659004', '五家渠市', '659000', '4');
INSERT INTO `cmswing_area` VALUES ('810001', '香港', '810000', '1');
INSERT INTO `cmswing_area` VALUES ('810002', '中西区', '810001', '1');
INSERT INTO `cmswing_area` VALUES ('810003', '九龙城区', '810001', '2');
INSERT INTO `cmswing_area` VALUES ('810004', '南区', '810001', '3');
INSERT INTO `cmswing_area` VALUES ('810005', '黄大仙区', '810001', '4');
INSERT INTO `cmswing_area` VALUES ('810006', '油尖旺区', '810001', '5');
INSERT INTO `cmswing_area` VALUES ('810007', '葵青区', '810001', '6');
INSERT INTO `cmswing_area` VALUES ('810008', '西贡区', '810001', '7');
INSERT INTO `cmswing_area` VALUES ('810009', '屯门区', '810001', '8');
INSERT INTO `cmswing_area` VALUES ('810010', '荃湾区', '810001', '9');
INSERT INTO `cmswing_area` VALUES ('810011', '东区', '810001', '10');
INSERT INTO `cmswing_area` VALUES ('810012', '观塘区', '810001', '11');
INSERT INTO `cmswing_area` VALUES ('810013', '深水步区', '810001', '12');
INSERT INTO `cmswing_area` VALUES ('810014', '湾仔区', '810001', '13');
INSERT INTO `cmswing_area` VALUES ('810015', '离岛区', '810001', '14');
INSERT INTO `cmswing_area` VALUES ('810016', '北区', '810001', '15');
INSERT INTO `cmswing_area` VALUES ('810017', '沙田区', '810001', '16');
INSERT INTO `cmswing_area` VALUES ('810018', '大埔区', '810001', '17');
INSERT INTO `cmswing_area` VALUES ('810019', '元朗区', '810001', '18');
INSERT INTO `cmswing_area` VALUES ('820001', '澳门', '820000', '1');
INSERT INTO `cmswing_area` VALUES ('820002', '澳门', '820001', '1');
INSERT INTO `cmswing_area` VALUES ('710001', '台北市', '710000', '1');
INSERT INTO `cmswing_area` VALUES ('710002', '台北县', '710001', '1');
INSERT INTO `cmswing_area` VALUES ('710003', '基隆市', '710000', '2');
INSERT INTO `cmswing_area` VALUES ('910005', '中山市', '442000', '1');
INSERT INTO `cmswing_area` VALUES ('710004', '花莲县', '710003', '1');
INSERT INTO `cmswing_area` VALUES ('910006', '东莞市', '441900', '1');
INSERT INTO `cmswing_area` VALUES ('910010', '1111', '910007', '1');

-- -----------------------------
-- Table structure for `cmswing_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_attribute`;
CREATE TABLE `cmswing_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` text NOT NULL COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- -----------------------------
-- Records of `cmswing_attribute`
-- -----------------------------
INSERT INTO `cmswing_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '简介(选填，微信分享给好友时会显示这里的文案)', '1', '', '1', '0', '1', '1456398274652', '1455692156629', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录
2:主题
3:段落', '1', '0', '1', '1384511157', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐
2:频道推荐
4:首页推荐', '1', '0', '1', '1451019960368', '1455692156629', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见
1:所有人可见', '1', '0', '1', '1386662271', '1455692156629', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `cmswing_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1455692156629', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `cmswing_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1455692156629', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `cmswing_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除
0:禁用
1:正常
2:待审核
3:草稿', '1', '0', '1', '1384508496', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html
1:ubb
2:markdown', '2', '0', '1', '1384511049', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html
1:ubb
2:markdown', '3', '0', '1', '1387260461', '1455692156629', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `cmswing_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1455692156629', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_attribute` VALUES ('33', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '38', '0', '1', '1449654579', '1455692156629', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('34', 'user', 'user', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '38', '0', '1', '1449654738', '1455692156629', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('43', 'testtext', '测试文本框', 'text NOT NULL', 'textarea', '', '', '1', '', '40', '0', '1', '0', '4294967295', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('37', 'aaaaa', '测试', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '38', '0', '0', '0', '0', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('44', 'testvarchar', '测试字符串', 'varchar(255) NOT NULL', 'string', '测试字符串默认值', '', '1', '', '40', '0', '1', '0', '4294967295', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('40', 'username', '用户名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '39', '0', '1', '0', '4294967295', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('45', 'testdate', '测试日期', 'bigint(13) NOT NULL', 'date', '', '', '1', '', '40', '0', '1', '0', '1450412511553', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('46', 'testnun', '测试数字', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '40', '0', '1', '0', '1450412574764', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('47', 'testbool', '测试布尔', 'tinyint(2) NOT NULL', 'bool', '1', '', '1', '1:是
2:否', '40', '0', '1', '0', '1450412802959', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('48', 'testpicture', '测试上传图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '40', '0', '1', '0', '1450416534420', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('49', 'testfile', '测试上传附件', 'int(10) UNSIGNED NOT NULL', 'file', '', '', '1', '', '40', '0', '1', '0', '1450416616549', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('50', 'title', '文章标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '41', '0', '1', '0', '1450534650444', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('51', 'picurl', '上传图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '43', '0', '1', '0', '1451110019548', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('53', 'testeidtor', '测试编辑器', 'text NOT NULL', 'editor', '', '', '1', '', '2', '0', '1', '0', '1451394866041', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('58', 'uppic', '图片上传', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '44', '0', '1', '0', '1451878043164', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('60', 'picinfo', '图片说明', 'text NOT NULL', 'textarea', '', '', '1', '', '44', '0', '1', '0', '1451878215891', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('61', 'bbq', '编辑器', 'text NOT NULL', 'editor', '', '', '1', '', '44', '0', '1', '0', '1451878885909', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('62', 'picss', '图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '上传图片，不大于400兆', '1', '', '45', '0', '1', '0', '1452918866690', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('63', 'suk', '库存/规格', 'text NOT NULL', 'suk', '', '', '1', '', '4', '0', '1', '1455769829822', '1455680862339', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('65', 'pics', '多图上传', 'varchar(255) NOT NULL', 'pics', '', '', '1', '', '1', '0', '1', '0', '1455692156629', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('67', 'price', '价格', 'varchar(255) NOT NULL', 'price', '', '', '1', '', '1', '0', '1', '0', '1456122357598', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('69', 'goods_no', '商家编码', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '4', '0', '1', '1456128840440', '1456128738327', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('71', 'total_stock', '总库存', 'int(10) unsigned NOT NULL', 'num', '0', '总库存为 0 时，会上架到『已售罄的商品』列表里  发布后商品同步更新，以库存数字为准', '1', '', '4', '0', '1', '1456129021000', '1456128960735', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('73', 'quota', '每人限购', 'int(10) unsigned NOT NULL', 'num', '0', ' 0 代表不限购', '1', '', '4', '0', '1', '0', '1456129417690', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('75', 'join_level_discount', '会员折扣', 'varchar(100) NOT NULL', 'checkbox', '1', '', '1', '1:参加会员折扣', '4', '0', '1', '0', '1456129558129', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('77', 'invoice', '发票', 'char(10) NOT NULL', 'radio', '0', '', '1', '0:无
1:有', '4', '0', '1', '0', '1456129640083', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('79', 'warranty', '保修', 'char(10) NOT NULL', 'radio', '0', '', '1', '0:无
1:有', '4', '0', '1', '0', '1456129729338', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('81', 'goods_detail', '商品详情', 'text NOT NULL', 'editor', '', '', '1', '', '4', '1', '1', '0', '1456130237178', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `cmswing_attribute` VALUES ('83', 'freight', '设置运费', 'varchar(255) NOT NULL', 'freight', '', ' <a class="js-refresh-delivery text-info-dk" href="javascript:;">刷新</a>
                                <span class="c-gray">|</span>
                                <a href="#" target="_blank" class="text-info-dk">新建</a>
                                <span class="c-gray">|</span>
                                <a href="#" target="_blank" class="text-info-dk">如何设置合适的运费模板？</a>', '1', '', '4', '1', '1', '1456206927526', '1456205924096', '', '3', '', 'regex', '', '3', 'function');

-- -----------------------------
-- Table structure for `cmswing_auth_role`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_auth_role`;
CREATE TABLE `cmswing_auth_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(11) NOT NULL DEFAULT '1',
  `rule_ids` varchar(255) DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_auth_role`
-- -----------------------------
INSERT INTO `cmswing_auth_role` VALUES ('1', '规则', '分身55111', '1', '10,12,13', 'admin', '1');
INSERT INTO `cmswing_auth_role` VALUES ('2', '测试用户组', '', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_role` VALUES ('19', '版主', '2222', '1', '2', 'admin', '1');

-- -----------------------------
-- Table structure for `cmswing_auth_rule`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_auth_rule`;
CREATE TABLE `cmswing_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(11) NOT NULL DEFAULT '1',
  `condition` varchar(255) DEFAULT '',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_auth_rule`
-- -----------------------------
INSERT INTO `cmswing_auth_rule` VALUES ('1', 'article/index', '文档列表', '0', '-1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('2', 'article/add', '新增', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('3', 'article/edit', '编辑', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('4', 'article/setStatus', '改变状态', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('5', 'article/update', '保存', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('6', 'article/autoSave', '保存草稿', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('7', 'article/move', '移动', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('8', 'article/copy', '复制', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('9', 'article/paste', '粘贴', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('10', 'article/batchOperate', '导入', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('11', 'article/recycle', '回收站', '0', '-1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('12', 'article/permit', '还原', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('13', 'article/clear', '清空', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('14', 'User/add', '新增用户', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('15', 'User/addaction', '新增用户行为', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('16', 'User/editaction', '编辑用户行为', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('17', 'User/saveAction', '保存用户行为', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('18', 'User/setStatus', '变更行为状态', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('19', 'User/changeStatus?method=forbidUser', '禁用会员', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('20', 'User/changeStatus?method=resumeUser', '启用会员', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('21', 'User/changeStatus?method=deleteUser', '删除会员', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('22', 'AuthManager/changeStatus?method=deleteGroup', '删除', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('23', 'AuthManager/changeStatus?method=forbidGroup', '禁用', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('24', 'AuthManager/changeStatus?method=resumeGroup', '恢复', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('25', 'AuthManager/createGroup', '新增', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('26', 'AuthManager/editGroup', '编辑', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('27', 'AuthManager/writeGroup', '保存用户组', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('28', 'AuthManager/group', '授权', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('29', 'AuthManager/access', '访问授权', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('30', 'AuthManager/user', '成员授权', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('31', 'AuthManager/removeFromGroup', '解除授权', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('32', 'AuthManager/addToGroup', '保存成员授权', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('33', 'AuthManager/category', '分类授权', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('34', 'AuthManager/addToCategory', '保存分类授权', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('35', 'AuthManager/modelauth', '模型授权', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('36', 'AuthManager/addToModel', '保存模型授权', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('37', 'Addons/create', '创建', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('38', 'Addons/checkForm', '检测创建', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('39', 'Addons/preview', '预览', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('40', 'Addons/build', '快速生成插件', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('41', 'Addons/config', '设置', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('42', 'Addons/disable', '禁用', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('43', 'Addons/enable', '启用', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('44', 'Addons/install', '安装', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('45', 'Addons/uninstall', '卸载', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('46', 'Addons/saveconfig', '更新配置', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('47', 'Addons/adminList', '插件后台列表', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('48', 'Addons/execute', 'URL方式访问插件', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('49', 'model/add', '新增', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('50', 'model/edit', '编辑', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('51', 'model/setStatus', '改变状态', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('52', 'model/update', '保存数据', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('53', 'Attribute/index', '属性管理', '0', '-1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('54', 'Attribute/add', '新增', '0', '-1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('55', 'Attribute/edit', '编辑', '0', '-1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('56', 'Attribute/setStatus', '改变状态', '0', '-1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('57', 'Attribute/update', '保存数据', '0', '-1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('58', 'Config/edit', '编辑', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('59', 'Config/del', '删除', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('60', 'Config/add', '新增', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('61', 'Config/save', '保存', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('62', 'Channel/add', '新增', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('63', 'Channel/edit', '编辑', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('64', 'Channel/del', '删除', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('65', 'Category/edit', '编辑', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('66', 'Category/add', '新增', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('67', 'Category/remove', '删除', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('68', 'Category/operate/type/move', '移动', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('69', 'Category/operate/type/merge', '合并', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('70', 'Database/export', '备份', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('71', 'Database/optimize', '优化表', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('72', 'Database/repair', '修复表', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('73', 'Database/import', '恢复', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('74', 'Database/del', '删除', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('75', 'Menu/add', '新增', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('76', 'Menu/edit', '编辑', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('77', 'User/updatePassword', '修改密码', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('78', 'User/updateNickname', '修改昵称', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('79', 'action/edit', '查看行为日志', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('80', 'think/add', '新增数据', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('81', 'think/edit', '编辑数据', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('82', 'Menu/import', '导入', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('83', 'Model/generate', '生成', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('84', 'Addons/addHook', '新增钩子', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('85', 'Addons/edithook', '编辑钩子', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('86', 'Article/sort', '文档排序', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('87', 'Config/sort', '排序', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('88', 'Menu/sort', '排序', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('89', 'Channel/sort', '排序', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('90', 'think/lists', '数据列表', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('91', 'Article/examine', '审核列表', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('92', 'wenz/mang', '其他', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('93', 'admin/index/index', '首页', '0', '1', '', 'admin', '2');
INSERT INTO `cmswing_auth_rule` VALUES ('94', 'admin/user/index', '用户信息', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('95', 'Addons/index', '插件管理', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('96', 'admin/setup/index', '网站设置', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('97', 'Article/index', '网站内容', '0', '-1', '', 'admin', '2');
INSERT INTO `cmswing_auth_rule` VALUES ('98', 'admin/auth/index', '权限管理', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('99', 'Addons/hooks', '钩子管理', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('100', 'admin/category/index', '分类管理', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('101', 'user', '用户管理', '0', '1', '', 'admin', '2');
INSERT INTO `cmswing_auth_rule` VALUES ('102', 'admin/user/action', '用户行为', '0', '-1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('103', 'admin/model/index', '模型管理', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('104', 'setup', '系统设置', '0', '1', '', 'admin', '2');
INSERT INTO `cmswing_auth_rule` VALUES ('105', 'admin/setup/group', '配置管理', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('106', 'admin/action/actionlog', '行为日志', '0', '-1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('107', 'admin/menu/index', '菜单管理', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('108', 'other', '其他', '0', '1', '', 'admin', '2');
INSERT INTO `cmswing_auth_rule` VALUES ('109', 'admin/channel/index', '导航管理', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('110', 'Addons/index', '扩展', '0', '1', '', 'admin', '2');
INSERT INTO `cmswing_auth_rule` VALUES ('111', 'admin/database/index', '备份数据库', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('112', 'admin/database/imports', '还原数据库', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('113', 'admin/attribute/index', '属性管理', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('114', 'admin/attribute/add', '新增', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('115', 'admin/attribute/edit', '编辑', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('116', 'admin/attribute/setStatus', '改变状态', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('117', 'admin/attribute/update', '保存数据', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('118', 'admin/article/index', '内容管理', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('119', 'article', '网站内容', '0', '1', '', 'admin', '2');
INSERT INTO `cmswing_auth_rule` VALUES ('120', 'admin/action/index', '用户行为', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('121', 'admin/action/log', '行为日志', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('122', 'admin/article/recycle', '回收站', '0', '1', '', 'admin', '1');
INSERT INTO `cmswing_auth_rule` VALUES ('123', 'admin/mpbase/index', '微信', '0', '1', '', 'admin', '2');
INSERT INTO `cmswing_auth_rule` VALUES ('124', 'admin/mpbase/seting', '公共账号管理', '0', '1', '', 'admin', '1');

-- -----------------------------
-- Table structure for `cmswing_auth_user_role`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_auth_user_role`;
CREATE TABLE `cmswing_auth_user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_role` (`user_id`,`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_auth_user_role`
-- -----------------------------
INSERT INTO `cmswing_auth_user_role` VALUES ('1', '1', '1');
INSERT INTO `cmswing_auth_user_role` VALUES ('2', '1', '2');
INSERT INTO `cmswing_auth_user_role` VALUES ('3', '14', '19');

-- -----------------------------
-- Table structure for `cmswing_cart`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_cart`;
CREATE TABLE `cmswing_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL COMMENT '商品数量',
  `type` varchar(255) DEFAULT NULL COMMENT '商品类型',
  `price` int(11) NOT NULL COMMENT '商品价格小计',
  `title` varchar(255) NOT NULL COMMENT '商品标题',
  `unit_price` int(11) NOT NULL COMMENT '商品单价',
  `pic` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `url` varchar(255) DEFAULT NULL COMMENT '商品地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cmswing_category`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_category`;
CREATE TABLE `cmswing_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- -----------------------------
-- Records of `cmswing_category`
-- -----------------------------
INSERT INTO `cmswing_category` VALUES ('1', 'blog', '博客', '0', '0', '10', '', 'fsf,犯得上发射点,', 'fdsfdsafdsafas', '', '', '', '', '2,3', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('2', 'default_blog', '默认分类', '1', '1', '10', '', '', '', '', '', '', '', '2,3', '2', '1,2', '0', '1', '1', '0', '1', '1', '', '1379475028', '4294967295', '1', '0', '0:aaaa
1:bbbb
2:cccc
3:dddd');
INSERT INTO `cmswing_category` VALUES ('39', '222', '2222', '2', '0', '10', '', '', '', '', '', '', '', '2,3', '2,3', '2,1,3', '0', '2', '1', '0', '0', '1', '', '1447235659', '1447235770', '1', '0', '11111');
INSERT INTO `cmswing_category` VALUES ('40', 'pic', '图片上传', '0', '0', '10', '', '', '', '', '', '', '', '2,3', '2,3', '', '0', '1', '1', '0', '0', '1', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('41', 'aaaa', '三级分类测试', '39', '0', '10', '', '', '', '', '', '', '', '2,3', '2,3', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('42', 'tttttt', '四级分类', '41', '0', '10', '', '', '', '', '', '', '', '2,3', '2,3', '', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('43', 'ssg', '五级', '42', '0', '10', '', '', '', '', '', '', '', '2', '2', '1,2,3', '0', '1', '1', '0', '1', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('44', 'hhh', '六级', '43', '0', '10', '', '', '', '', '', '', '', '2,3', '2,3', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('45', 'shop', '商城', '0', '0', '10', '', '', '', '', 'shop.html', '', '', '4', '4', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('46', 'doc', '文档', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '', '0', '0', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('47', 'start', '快速入门', '46', '0', '10', '', '', '', '', '', '', '', '2', '2,3', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('48', 'tags', '模板标签', '46', '0', '10', '', '', '', '', '', '', '', '2', '2', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '0', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('49', 'architecture', '构架设计', '46', '0', '10', '', '', '', '', '', '', '', '2', '2,3', '', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('50', 'men', '男士', '45', '1', '10', '', '', '', '', 'shop.html', '', '', '4', '4', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('51', 'msneakers', '鞋', '50', '0', '10', '', '', '', '', 'shop.html', '', '', '4', '4', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('52', 'maccessories', '配饰', '50', '0', '10', '', '', '', '', 'shop.html', '', '', '4', '4', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('53', 'mclothing', '服装', '50', '0', '10', '', '', '', '', 'shop.html', '', '', '4', '4', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('54', 'women', '女士', '45', '0', '10', '', '', '', '', 'shop.html', '', '', '4', '4', '4', '0', '1', '1', '0', '0', '', '', '4294967295', '0', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('55', 'wsneakers', '鞋', '54', '0', '10', '', '', '', '', 'shop.html', '', '', '4', '4', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '0', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('56', 'wclothing', '服装', '54', '0', '10', '', '', '', '', 'shop.html', '', '', '4', '4', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '0', '1', '0', '');
INSERT INTO `cmswing_category` VALUES ('57', 'waccessories', '配饰', '54', '0', '10', '', '', '', '', 'shop.html', '', '', '4', '4', '1,2,3', '0', '1', '1', '0', '0', '', '', '4294967295', '4294967295', '1', '0', '');

-- -----------------------------
-- Table structure for `cmswing_channel`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_channel`;
CREATE TABLE `cmswing_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_channel`
-- -----------------------------
INSERT INTO `cmswing_channel` VALUES ('1', '0', '首页', '/', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('2', '0', '博客', '/topic/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('3', '0', '外部链接', 'http://www.cmswing.com', '3', '1379475154', '1454396773062', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('10', '0', '测试导航', '11111', '5', '1454399423443', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('11', '10', '222', '1111', '0', '1454400241024', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('12', '10', '1111', '222211', '0', '1454400255255', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('13', '0', '文档', '/channel/doc', '3', '1454405194251', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('14', '13', '快速入门', '/column/start', '0', '1454405426043', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('15', '13', '模板标签', '/column/tags', '1', '1454405476532', '1454405553528', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('16', '13', '构架设计', '/column/architecture', '3', '1454405517570', '1454405567389', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('17', '10', '测试1', '1111', '0', '1454405619456', '1454405627281', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('18', '10', '测试2', '22222', '0', '1454405643640', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('19', '18', '测试21', '212121', '0', '1454405662868', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('20', '18', '测试22', '33333', '0', '1454405679378', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('21', '0', '商城', '/column/shop', '5', '1455681109020', '1456284882283', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('22', '21', ' 男士', '/column/men', '0', '1456385981567', '1456385996644', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('23', '21', '女士', '/column/women', '0', '1456386031139', '0', '1', '1');
INSERT INTO `cmswing_channel` VALUES ('24', '22', '鞋', '/column/msneakers', '0', '1456386084280', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('25', '22', '配饰', '/column/maccessories', '0', '1456386107187', '1456386145624', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('26', '22', '服装', '/column/mclothing', '0', '1456386192230', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('27', '23', '鞋', '/column/wsneakers', '0', '1456386241191', '1456386248008', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('28', '23', '服装', '/column/wclothing', '0', '1456386280696', '0', '1', '0');
INSERT INTO `cmswing_channel` VALUES ('29', '23', '配饰', '/column/waccessories', '0', '1456386307640', '0', '1', '0');

-- -----------------------------
-- Table structure for `cmswing_document`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_document`;
CREATE TABLE `cmswing_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '所属分组',
  `description` char(140) NOT NULL COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态0禁用，1启用，-1删除',
  `pics` varchar(255) NOT NULL COMMENT '多图上传',
  `price` varchar(255) NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- -----------------------------
-- Records of `cmswing_document`
-- -----------------------------
INSERT INTO `cmswing_document` VALUES ('1', '1', 'cmswing', 'CmsWing1.0测试版发布', '2', '0', '期待已久的最新版发布', '0', '0', '2', '2', '0', '0', '84', '1', '1970', '0', '8', '0', '0', '0', '2015', '1456306773159', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('3', '1', '', '6546456', '39', '0', '465464', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1450510498', '1450510498', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('2', '1', '', '46456456', '2', '0', '456546546', '0', '0', '2', '2', '0', '0', '0', '1', '1451018700', '0', '0', '0', '0', '0', '1451018700', '1451030139', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('4', '1', '', 'gfdgd', '2', '0', '', '0', '0', '2', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452670981', '1452670981', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('55', '1', '', '简介', '47', '0', 'CmsWing是一个开源的内容管理框架，基于最新的ThinkJs开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内nodejs WEB应用傻瓜式开发的新潮流。', '0', '0', '2', '1', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1453711202518', '1453711202518', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('56', '1', 'install', '安装', '47', '0', 'ThinkJS 是一款 Node.js 的 MVC 框架，所以安装 ThinkJS 之前，需要先安装 Node.js 环境，可以去 官方 下载最新的安装包进行安装，也可以通过其他一些渠道安装。

安装完成后，在命令行执行 node -v，如果能看到对应的版本号输出，则表示安装', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '10', '0', '0', '0', '1453777763757', '1453777763757', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('57', '1', '', '法大师傅大师傅山风都是', '47', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '1970', '0', '2', '0', '0', '0', '2016', '1453789112170', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('10', '1', '', '2222222222222222', '2', '0', '2222222222222222222222222222222222222222222222', '0', '4', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('11', '1', '', '111111111111111111', '2', '0', '2222222222222222', '0', '4', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('12', '1', '', '222222222222222222222', '2', '0', '22222222222222222222222', '0', '4', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('13', '1', '', '222222222222222222222222221111111111111', '2', '0', '21212', '0', '4', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('14', '1', '', '666666666', '2', '0', '666666666', '0', '4', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('15', '1', '', '66666666611', '2', '0', '66666666611', '0', '4', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('16', '1', '', '6666666661133', '2', '0', '6666666661133333333333', '0', '4', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('17', '1', '', '245546456546', '2', '0', '456546', '0', '4', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('18', '1', '', '3123123', '2', '0', '132213', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('19', '1', '', '456546', '2', '0', '546546', '0', '4', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '2016', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('20', '1', '', '456546456', '2', '0', '546', '0', '0', '2', '2', '0', '0', '86', '1', '1970', '0', '0', '0', '0', '0', '1970', '1456307199726', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('21', '1', '', '8888888888', '39', '0', '45654', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452687667869', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('22', '1', '', '9999999999', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452687704515', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('23', '1', '', '77777777', '39', '0', '7777777777777', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452687916935', '0', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('24', '1', '', '6666666', '39', '0', '6666666666', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452688032174', '1452688032174', '0', '', '0');
INSERT INTO `cmswing_document` VALUES ('25', '1', '', '5654', '39', '0', '6546', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452689847691', '1452689847691', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('26', '1', '', '555555', '2', '0', '555555555', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452689894271', '1452689894271', '2', '', '0');
INSERT INTO `cmswing_document` VALUES ('27', '1', '', '似的大师傅但是f'd's', '2', '0', ' f第三方打撒放', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452689920378', '1452689920378', '2', '', '0');
INSERT INTO `cmswing_document` VALUES ('28', '1', '', '犯得上发射点f都是富士达', '2', '0', '都是放大撒冯绍峰是', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1441717080000', '1452689967653', '2', '', '0');
INSERT INTO `cmswing_document` VALUES ('29', '1', '', '333333', '40', '0', '', '0', '0', '44', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452690238124', '1452690238124', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('30', '1', '', '555555555', '2', '0', '5555555', '0', '0', '2', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452690518649', '1452690518649', '2', '', '0');
INSERT INTO `cmswing_document` VALUES ('31', '1', '', '546456', '2', '0', '', '0', '30', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452690572967', '1452690572967', '2', '', '0');
INSERT INTO `cmswing_document` VALUES ('32', '1', '', 'fdgfdsg', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452761583069', '1452761583069', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('33', '1', '', '563546456', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452761911599', '1452761911599', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('34', '1', '', '', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452762563599', '1452762563599', '-1', '', '0');
INSERT INTO `cmswing_document` VALUES ('35', '1', '', '', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452764041381', '1452764041381', '-1', '', '0');
INSERT INTO `cmswing_document` VALUES ('36', '1', '', 'gfdsg gfds gds', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452764244127', '1452764244127', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('37', '1', '', '11111111', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452766628568', '1452766628568', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('38', '1', '', '房贷', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452766677479', '1452766677479', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('39', '1', '', '法大师傅士大夫的萨芬', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452766900091', '1452766900091', '1', '', '0');
INSERT INTO `cmswing_document` VALUES ('40', '1', '', '上范德萨范德萨范德萨啊法大师傅士大夫大师傅顺丰速递放大撒放大撒放大撒山风放大撒分身都是分身富士达富士达放大撒', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1452767005593', '1452767005593', '-1', '', '0');
INSERT INTO `cmswing_document` VALUES ('41', '1', 'asda', '的撒旦撒旦撒打算hfghggfhgfhgfhgf', '39', '0', 'hgfhfgh', '0', '0', '2', '2', '0', '0', '0', '1', '1970', '0', '0', '0', '0', '0', '1970', '1452772003048', '-1', '', '0');
INSERT INTO `cmswing_document` VALUES ('68', '1', '', '测试商品多个商品图', '57', '0', '111111111111', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1456467172623', '1456467172623', '1', '109,110,111,112,113,114,115,116,117,118,119,120,121,122', '{"present_price":"100","discount_price":"150"}');
INSERT INTO `cmswing_document` VALUES ('69', '1', '', '测试商品多个规格相同价格', '57', '0', '111111111111', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '71', '0', '0', '0', '1456467332547', '1456467402367', '1', '123,124', '{"present_price":"167","discount_price":"180"}');
INSERT INTO `cmswing_document` VALUES ('70', '1', '', '测试商品多规格多价格', '57', '0', '111111111111111111111', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '347', '0', '0', '0', '1456468367173', '1456569698580', '1', '125,126', '{"present_price":"50-200","discount_price":"0"}');
INSERT INTO `cmswing_document` VALUES ('67', '1', '', '测试商品没有库存', '57', '0', '放大是放大撒放大撒放大撒放大撒', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '34', '0', '0', '0', '1456460661557', '1456460661557', '1', '107,108', '{"present_price":"999","discount_price":"1500"}');
INSERT INTO `cmswing_document` VALUES ('54', '1', 'fdsf', 'sdfds', '42', '0', 'fdsf', '0', '0', '2', '2', '0', '0', '34', '1', '1970', '0', '0', '0', '0', '0', '2016', '1453703628809', '1', '', '');
INSERT INTO `cmswing_document` VALUES ('58', '1', '', 'gfdgfdgfdgdfgdfg', '45', '0', '', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1455708692570', '1456305969296', '1', '72,73,74', '{"present_price":8,"discount_price":"0"}');
INSERT INTO `cmswing_document` VALUES ('59', '1', '', 'hgfhhgfhgfhfghfghfghfgfdgdfg', '45', '0', '', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1456203072311', '1456305816537', '1', '79,80', '{"present_price":100,"discount_price":"0"}');
INSERT INTO `cmswing_document` VALUES ('60', '1', '', 'fdsfsdf5555', '45', '0', '', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1456203178151', '1456305771036', '1', '81', '{"present_price":100,"discount_price":"0"}');
INSERT INTO `cmswing_document` VALUES ('61', '1', '', 'gfdgdf', '45', '0', '', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1456215551669', '1456304825972', '1', '82', '{"present_price":"10-101","discount_price":"0"}');
INSERT INTO `cmswing_document` VALUES ('62', '1', '', '测试唱片', '45', '0', '', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1456236857429', '1456305874738', '1', '75,76', '{"present_price":100,"discount_price":"0"}');
INSERT INTO `cmswing_document` VALUES ('63', '1', '', '犯得上发生', '45', '0', '', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1456388778234', '1456388778234', '1', '81', '{"present_price":"12-23","discount_price":"0"}');
INSERT INTO `cmswing_document` VALUES ('64', '1', '', '2222', '45', '0', '', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1456390496719', '1456390496719', '1', '87', '{"present_price":"10-20","discount_price":"0"}');
INSERT INTO `cmswing_document` VALUES ('65', '1', '', '测试商品的价格长度', '57', '0', '这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介这里是简介', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '62', '0', '0', '0', '1456394250128', '1456460285526', '1', '88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105', '{"present_price":"99999-999991","discount_price":"0"}');
INSERT INTO `cmswing_document` VALUES ('66', '1', '', '测试商品的长度测试商品的长度测试商品的长度测试商品的长度测试商品的长度', '57', '0', '法大师傅大师傅放的说法都是放到富士达电风扇放到', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '36', '0', '0', '0', '1456459666532', '1456459682701', '1', '106', '{"present_price":"100","discount_price":"120"}');

-- -----------------------------
-- Table structure for `cmswing_document_article`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_document_article`;
CREATE TABLE `cmswing_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `testeidtor` text NOT NULL COMMENT '测试编辑器',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- -----------------------------
-- Records of `cmswing_document_article`
-- -----------------------------
INSERT INTO `cmswing_document_article` VALUES ('1', '<p>范德萨范德萨测试1·11111111111111111111111111</p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('4', '<p>gfdgdf<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('7', '<p>111111111111111<br/></p>', '', '0', '<p>111111111111<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('8', '<p>111111111111111<br/></p>', '', '0', '<p>111111111111<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('9', '<p>111111111111111<br/></p>', '', '0', '<p>111111111111<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('10', '<p>222222222222222222222222222222222<br/></p>', '', '0', '<p>222222222222222222<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('11', '<p>22222222222222222222222<br/></p>', '', '0', '<p>222222222222222<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('12', '<p>222222222222222222222<br/></p>', '', '0', '<p>22222222222222<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('13', '<p>2121<br/></p>', '', '0', '<p>212<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('14', '<p>66666666666666666<br/></p>', '', '0', '<p>666666666666<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('15', '<p>111111111<br/></p>', '', '0', '<p>11111111111<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('16', '<p>333333333333333<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('17', '<p>6546546<br/></p>', '', '0', '<p>6546546<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('18', '<p>3123123<br/></p>', '', '0', '<p>32131<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('19', '<p>546<br/></p>', '', '0', '<p>6546<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('20', '<p>654645<br/></p>', '', '0', '<p>6546<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('21', '<p>654646546<br/></p>', '', '0', '<p>65464<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('22', '<p>999999999999999999<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('23', '<p>77777777777<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('24', '<p>66666666666<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('25', '<p>546<br/></p>', '', '0', '<p>6546<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('26', '<p>55555555555<br/></p>', '', '0', '<p>55555555555<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('27', '<p>f都是放大撒放大撒富士达是<img alt="logo.png" src="/upload/editor/image/20160113/1452689918161817419.png" title="1452689918161817419.png"/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('28', '<p><img src="/upload/editor/image/20160113/1452689943289153964.png" title="1452689943289153964.png" alt="scrawl.png"/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('30', '<p>555555555555555<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('31', '<p>654654654<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('32', '<p>gfdsgfds<br/></p>', '', '0', '<p>gfdsg<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('33', '<p>6546546<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('34', '', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('35', '', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('36', '<p>gfdsgfds gfdsgdsf<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('37', '<p>gdfdgfdg<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('38', '', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('39', '', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('40', '<p>放大撒富士达富士达<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('41', '<p>打撒打撒打撒fdsfdsfdsfdgfdgsfsdgfdsg<br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('54', '<p>fdsfs<br/></p>', '', '0', '<p>dsfs<br/></p>');
INSERT INTO `cmswing_document_article` VALUES ('55', '<p>CmsWing是一个开源的内容管理框架，基于最新的ThinkJs开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内nodejs WEB应用傻瓜式开发的新潮流。</p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('2', '4654645645', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('56', '<h3>安装 Node.js</h3><p>ThinkJS 是一款 Node.js 的 MVC 框架，所以安装 ThinkJS 之前，需要先安装 Node.js 环境，可以去 <a href="https://nodejs.org/">官方</a> 下载最新的安装包进行安装，也可以通过其他一些渠道安装。</p><p>安装完成后，在命令行执行 <code>node -v</code>，如果能看到对应的版本号输出，则表示安装成功。</p><p>ThinkJS 需要 Node.js 的版本 <code>&gt;=0.12.0</code>，如果版本小于这个版本，需要升级 Node.js，否则无法启动服务。建议将 Node.js 版本升级到 <code>4.2.1</code> 或更高版本。</p><p><br/></p><h3 id="toc-36c">安装 ThinkJS</h3><p>通过下面的命令即可安装 ThinkJS：</p><pre class="brush:bash;toolbar:false">npm&nbsp;install&nbsp;thinkjs@2&nbsp;-g&nbsp;--verbose</pre><p>如果安装很慢的话，可以尝试使用 <a href="http://npm.taobao.org/">taobao</a> 的源进行安装。具体如下：</p><pre class="brush:bash;toolbar:false">npm&nbsp;install&nbsp;thinkjs@2&nbsp;-g&nbsp;--registry=https://registry.npm.taobao.org&nbsp;--verbose</pre><p>安装完成后，可以通过 <code>thinkjs --version</code> 或 <code>thinkjs -V</code> 命令查看安装的版本。</p><p><code>注</code>：如果之前安装过 ThinkJS 1.x 的版本，可能需要将之前的版本删除掉，可以通过 <code>npm uninstall -g thinkjs-cmd</code> 命令删除。</p><p><br/></p>', '', '0', '');
INSERT INTO `cmswing_document_article` VALUES ('57', '<h3>放大萨法第三方打撒</h3><pre class="brush:css;toolbar:false">html&nbsp;{
&nbsp;&nbsp;background-color:&nbsp;#f2f4f8;
&nbsp;&nbsp;overflow-x:&nbsp;hidden;
}
body&nbsp;{
&nbsp;&nbsp;font-family:&nbsp;&quot;Source&nbsp;Sans&nbsp;Pro&quot;,&nbsp;&quot;Helvetica&nbsp;Neue&quot;,&nbsp;Helvetica,&nbsp;Arial,&nbsp;sans-serif;
&nbsp;&nbsp;font-size:&nbsp;14px;
&nbsp;&nbsp;color:&nbsp;#788188;
&nbsp;&nbsp;background-color:&nbsp;transparent;
&nbsp;&nbsp;-webkit-font-smoothing:&nbsp;antialiased;
&nbsp;&nbsp;line-height:&nbsp;1.40;
}
.h1,
.h2,
.h3,
.h4,
.h5,
.h6&nbsp;{
&nbsp;&nbsp;margin:&nbsp;0;
}
a&nbsp;{
&nbsp;&nbsp;color:&nbsp;#545a5f;
&nbsp;&nbsp;text-decoration:&nbsp;none;
}
a:hover,
a:focus&nbsp;{
&nbsp;&nbsp;color:&nbsp;#303437;
&nbsp;&nbsp;text-decoration:&nbsp;none;
}
label&nbsp;{
&nbsp;&nbsp;font-weight:&nbsp;normal;
}</pre><table><tbody><tr class="firstRow"><td valign="top" width="95">1<br/></td><td valign="top" width="95">2<br/></td><td valign="top" width="95">2<br/></td><td valign="top" width="95">3<br/></td><td valign="top" width="95">1<br/></td><td valign="top" width="95">1<br/></td><td valign="top" width="95">1<br/></td><td valign="top" width="95">1<br/></td><td valign="top" width="95">1<br/></td></tr><tr><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td></tr><tr><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td></tr><tr><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td></tr><tr><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td></tr><tr><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td><td valign="top" width="95"><br/></td></tr></tbody></table><p><br/></p>', '', '0', '');

-- -----------------------------
-- Table structure for `cmswing_document_download`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_document_download`;
CREATE TABLE `cmswing_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- -----------------------------
-- Records of `cmswing_document_download`
-- -----------------------------
INSERT INTO `cmswing_document_download` VALUES ('3', '456456464', '', '1', '0', '103928');

-- -----------------------------
-- Table structure for `cmswing_document_shop`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_document_shop`;
CREATE TABLE `cmswing_document_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `suk` text NOT NULL COMMENT '库存/规格',
  `goods_no` varchar(255) NOT NULL COMMENT '商家编码',
  `total_stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总库存',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '每人限购',
  `join_level_discount` varchar(100) NOT NULL DEFAULT '1' COMMENT '会员折扣',
  `invoice` char(10) NOT NULL DEFAULT '0' COMMENT '发票',
  `warranty` char(10) NOT NULL DEFAULT '0' COMMENT '保修',
  `goods_detail` text NOT NULL COMMENT '商品详情',
  `freight` varchar(255) NOT NULL COMMENT '设置运费',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `cmswing_document_shop`
-- -----------------------------
INSERT INTO `cmswing_document_shop` VALUES ('58', '{"type":["颜色"],"data":[{"name":"11","type":"颜色","sku_price":"8","sku_stock":"9","sku_code":""}]}', '', '0', '0', '1', '0', '0', '', '{"type":0,"val":"10"}');
INSERT INTO `cmswing_document_shop` VALUES ('59', '{"type":["颜色"],"data":[{"name":"11","type":"颜色","sku_price":"8","sku_stock":"9","sku_code":""}]}', '', '0', '0', '1', '0', '0', '<p>fsdfdsfsd<br/></p>', '{"type":1,"val":"1"}');
INSERT INTO `cmswing_document_shop` VALUES ('60', '', '', '10', '0', '1', '0', '0', '<p>5454<br/></p>', '{"type":0,"val":"20"}');
INSERT INTO `cmswing_document_shop` VALUES ('61', '{"type":["颜色","颜色","颜色"],"data":[{"name":"2121","type":"颜色","ch":[{"name":"fdsf","type":"颜色","ch":[{"name":"fsdf","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"f s","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"ssss","type":"颜色","sku_price":"101","sku_stock":"10","sku_code":""}]},{"name":"fds","type":"颜色","ch":[{"name":"fsdf","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"f s","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"ssss","type":"颜色","sku_price":"101","sku_stock":"10","sku_code":""}]}]},{"name":"sfs","type":"颜色","ch":[{"name":"fdsf","type":"颜色","ch":[{"name":"fsdf","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"f s","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"ssss","type":"颜色","sku_price":"101","sku_stock":"10","sku_code":""}]},{"name":"fds","type":"颜色","ch":[{"name":"fsdf","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"f s","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"ssss","type":"颜色","sku_price":"101","sku_stock":"10","sku_code":""}]}]},{"name":"fds","type":"颜色","ch":[{"name":"fdsf","type":"颜色","ch":[{"name":"fsdf","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"f s","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"ssss","type":"颜色","sku_price":"101","sku_stock":"10","sku_code":""}]},{"name":"fds","type":"颜色","ch":[{"name":"fsdf","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"f s","type":"颜色","sku_price":"10","sku_stock":"10","sku_code":""},{"name":"ssss","type":"颜色","sku_price":"101","sku_stock":"10","sku_code":""}]}]}]}', '', '1440', '0', '1', '0', '0', '<p>54545454545<br/></p>', '{"type":1,"val":"2"}');
INSERT INTO `cmswing_document_shop` VALUES ('62', '{"type":["颜色","颜色","颜色"],"data":[{"name":"11","type":"颜色","ch":[{"name":"222","type":"颜色","ch":[{"name":"333","type":"颜色","sku_price":"100","sku_stock":"222","sku_code":""}]}]}]}', '', '100', '0', '1', '0', '0', '<p>1111111111<br/></p>', '{"type":0,"val":"10"}');
INSERT INTO `cmswing_document_shop` VALUES ('63', '{"type":["颜色"],"data":[{"name":"aa","type":"颜色","ch":[{"name":"bb","sku_price":"12","sku_stock":"10","sku_code":""}]},{"name":"cc","type":"颜色","ch":[{"name":"bb","sku_price":"23","sku_stock":"10","sku_code":""}]}]}', '', '0', '0', '1', '0', '0', '<p>1111111111111111<br/></p>', '{"type":0,"val":"10"}');
INSERT INTO `cmswing_document_shop` VALUES ('64', '{"type":["颜色"],"data":[{"name":"111","type":"颜色","ch":[{"name":"222","sku_price":"10","sku_stock":"12","sku_code":""}]},{"name":"11","type":"颜色","ch":[{"name":"222","sku_price":"20","sku_stock":"12","sku_code":""}]}]}', '', '0', '0', '1', '0', '0', '<p>111<br/></p>', '{"type":0,"val":"10"}');
INSERT INTO `cmswing_document_shop` VALUES ('65', '{"type":["颜色","颜色"],"data":[{"name":"S","type":"颜色","ch":[{"name":"黑色","type":"颜色","sku_price":"99999","sku_stock":"10","sku_code":"UY7321987"},{"name":"红色","type":"颜色","sku_price":"999991","sku_stock":"101","sku_code":"UY7321988"}]},{"name":"M","type":"颜色","ch":[{"name":"黑色","type":"颜色","sku_price":"99999","sku_stock":"10","sku_code":"UY7321987"},{"name":"红色","type":"颜色","sku_price":"999991","sku_stock":"101","sku_code":"UY7321988"}]},{"name":"L","type":"颜色","ch":[{"name":"黑色","type":"颜色","sku_price":"99999","sku_stock":"10","sku_code":"UY7321987"},{"name":"红色","type":"颜色","sku_price":"999991","sku_stock":"101","sku_code":"UY7321988"}]},{"name":"XL","type":"颜色","ch":[{"name":"黑色","type":"颜色","sku_price":"99999","sku_stock":"10","sku_code":"UY7321987"},{"name":"红色","type":"颜色","sku_price":"999991","sku_stock":"101","sku_code":"UY7321988"}]}]}', 'UY7321987 ', '80', '0', '1', '0', '0', '<p>111111111111111111111111111111111111111111111111111111111111111111111111111<br/></p>', '{"type":0,"val":"10"}');
INSERT INTO `cmswing_document_shop` VALUES ('66', '', '', '10', '0', '1', '0', '0', '<p>放大撒放大撒放到士大夫但是是放大撒是</p>', '{"type":0,"val":"10"}');
INSERT INTO `cmswing_document_shop` VALUES ('67', '', '', '0', '0', '1', '0', '0', '<p>&nbsp;放大撒放大撒放大撒放到电风扇犯得上发射点</p>', '{"type":0,"val":"10"}');
INSERT INTO `cmswing_document_shop` VALUES ('68', '', '', '10', '0', '1', '0', '0', '<p>1111222222222222222</p>', '{"type":1,"val":"2"}');
INSERT INTO `cmswing_document_shop` VALUES ('69', '{"type":["颜色","颜色"],"data":[{"name":"红色","type":"颜色","ch":[{"name":"S","type":"颜色","sku_price":"167","sku_stock":"101","sku_code":""},{"name":"M","type":"颜色","sku_price":"167","sku_stock":"10","sku_code":""},{"name":"L","type":"颜色","sku_price":"167","sku_stock":"10","sku_code":""}]},{"name":"黄色","type":"颜色","ch":[{"name":"S","type":"颜色","sku_price":"167","sku_stock":"10","sku_code":""},{"name":"M","type":"颜色","sku_price":"167","sku_stock":"10","sku_code":""},{"name":"L","type":"颜色","sku_price":"167","sku_stock":"10","sku_code":""}]},{"name":"蓝色","type":"颜色","ch":[{"name":"S","type":"颜色","sku_price":"167","sku_stock":"10","sku_code":""},{"name":"M","type":"颜色","sku_price":"167","sku_stock":"10","sku_code":""},{"name":"L","type":"颜色","sku_price":"167","sku_stock":"10","sku_code":""}]}]}', 'UK2545843664', '70', '0', '1', '0', '0', '<p>22222222222222222</p>', '{"type":0,"val":"10"}');
INSERT INTO `cmswing_document_shop` VALUES ('70', '{"type":["颜色","尺码"],"data":[{"name":"紫不溜秋","type":"颜色","ch":[{"name":"肥","type":"尺码","sku_price":"50","sku_stock":"5","sku_code":""},{"name":"特别肥","type":"尺码","sku_price":"60","sku_stock":"5","sku_code":""},{"name":"相当肥","type":"尺码","sku_price":"100","sku_stock":"54","sku_code":""}]},{"name":"黄了吧唧","type":"颜色","ch":[{"name":"肥","type":"尺码","sku_price":"55","sku_stock":"5","sku_code":""},{"name":"特别肥","type":"尺码","sku_price":"90","sku_stock":"5","sku_code":""},{"name":"相当肥","type":"尺码","sku_price":"200","sku_stock":"54","sku_code":""}]}]}', 'uk888888888', '128', '0', '1', '0', '0', '<p>22222222222222222222222</p>', '{"type":0,"val":"10"}');

-- -----------------------------
-- Table structure for `cmswing_file`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_file`;
CREATE TABLE `cmswing_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(30) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- -----------------------------
-- Records of `cmswing_file`
-- -----------------------------
INSERT INTO `cmswing_file` VALUES ('1', 'moban112.rar', '7oxGhtNhy1_e9VP2Ru4_mzaP.rar', '/upload/download/2015-12-28/', '', 'application/octet-stream', '592673', '2d2dde4c500f81674bd22c9a6338da7a', '', '0', '', '1451307240706');
INSERT INTO `cmswing_file` VALUES ('2', 'phpcms_v9.5.10_UTF8.zip', 'dO_l1-u7cEotnGzHhyTVzsSD.zip', '/upload/download/2015-12-28/', '', '"application/octet-stream', '8723992', 'c42373e0aa56b52c9e8556e638fe6919', '', '0', '', '1451307241462');
INSERT INTO `cmswing_file` VALUES ('3', '悦蕾网设计文件.zip', 'm5Cui2KNThJXZh06idj9QVD4.zip', '/upload/download/2015-12-28/', '', '"application/octet-stream', '20521434', 'f87ff613f19c83329445ffde24994b89', '', '0', '', '1451307242115');
INSERT INTO `cmswing_file` VALUES ('4', 'moban112.rar', 'ey3_2TwS5t0-PE1Oya_U4C6r.rar', '/upload/download/2015-12-28/', '', 'application/octet-stream', '592673', 'ab5d018ad9e839bbeb6e4eff04a38d1d', '', '0', '', '1451308335223');
INSERT INTO `cmswing_file` VALUES ('5', 'fex-team-webuploader-0.1.5-56-', 'sa7e06WygQCHs9iWStUoh88P.zip', '/upload/download/2015-12-28/', '', '"application/octet-stream', '3703904', '889b7f0e638d0048d98d6f794073f58b', '', '0', '', '1451308989436');
INSERT INTO `cmswing_file` VALUES ('6', 'proui(1).rar', 'y-x_4UmVkUJ1X84d8A42OqSP.rar', '/upload/download/2015-12-28/', '', 'application/octet-stream', '7179376', '4744342697b42fa9a0027c4ca264321c', '', '0', '', '1451309847621');
INSERT INTO `cmswing_file` VALUES ('7', '1448609511220.tar.gz', 'MXuucSEw9QTLG5-H36jFLGul.gz', '/upload/download/2015-12-28/', '', 'application/gzip', '8113', '6b60a7131d182c7a97932e5a61d0d8db', '', '0', '', '1451310113941');

-- -----------------------------
-- Table structure for `cmswing_member`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_member`;
CREATE TABLE `cmswing_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` bigint(15) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` bigint(15) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` bigint(15) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- -----------------------------
-- Records of `cmswing_member`
-- -----------------------------
INSERT INTO `cmswing_member` VALUES ('1', 'admin', 'e051070da90d8f227ee2eb0805abce79', '420', 'arterli@qq.com', '104', '', '1452513965683', '0', '1457147480787', '2130706433', '0', '1');

-- -----------------------------
-- Table structure for `cmswing_member_public`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_member_public`;
CREATE TABLE `cmswing_member_public` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `public_name` varchar(50) NOT NULL COMMENT '公众号名称',
  `public_id` varchar(100) NOT NULL COMMENT '公众号原始id',
  `wechat` varchar(100) NOT NULL COMMENT '微信号',
  `interface_url` varchar(255) NOT NULL COMMENT '接口地址',
  `headface_url` varchar(255) NOT NULL COMMENT '公众号头像',
  `area` varchar(50) NOT NULL COMMENT '地区',
  `addon_config` text NOT NULL COMMENT '插件配置',
  `addon_status` text NOT NULL COMMENT '插件状态',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  `type` char(10) NOT NULL DEFAULT '0' COMMENT '公众号类型',
  `appid` varchar(255) NOT NULL COMMENT 'AppID',
  `secret` varchar(255) NOT NULL COMMENT 'AppSecret',
  `status` tinyint(4) NOT NULL COMMENT '2：未审核，1:启用，0：禁用，-1：删除',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `encodingaeskey` varchar(255) NOT NULL COMMENT 'EncodingAESKey',
  `mchid` varchar(50) NOT NULL COMMENT '商户号（微信支付必须配置）',
  `mchkey` varchar(50) NOT NULL COMMENT '商户支付密钥（微信支付必须配置）',
  `notify_url` varchar(255) NOT NULL COMMENT '接收微信支付异步通知回调地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_member_public`
-- -----------------------------
INSERT INTO `cmswing_member_public` VALUES ('1', '1', 'cmswing', 'gh_1dd1d1321b7c', 'cmswing', '', '', '', '', '', '', '3', '', '', '1', '0', '', '', '', '');

-- -----------------------------
-- Table structure for `cmswing_menu`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_menu`;
CREATE TABLE `cmswing_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` int(10) NOT NULL COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_menu`
-- -----------------------------
INSERT INTO `cmswing_menu` VALUES ('1', '首页', '0', '1', 'admin/index/index', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('2', '网站内容', '0', '2', 'article', '0', '', '1', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('3', '内容管理', '2', '0', 'admin/article/index', '0', '', '1', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('13', '回收站', '2', '0', 'admin/article/recycle', '0', '', '1', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('16', '用户管理', '0', '3', 'user', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('17', '用户信息', '16', '1', 'admin/user/index', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('19', '用户行为', '16', '3', 'admin/action/index', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '"用户->用户行为"保存编辑和新增的用户行为', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '"用户->用户行为"中的启用,禁用和删除权限', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '"用户->用户信息"中的禁用', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '"用户->用户信息"中的启用', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '"用户->用户信息"中的删除', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('27', '权限管理', '16', '2', 'admin/auth/index', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的"保存"按钮', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '"后台  用户  用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '"后台  用户  权限管理"列表页的"访问授权"操作按钮', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '"后台  用户  权限管理"列表页的"成员授权"操作按钮', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '"成员授权"列表页内的解除授权操作按钮', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '"后台  用户  权限管理"列表页的"分类授权"操作按钮', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '"分类授权"页面的"保存"按钮', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '"后台  用户  权限管理"列表页的"模型授权"操作按钮', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '"分类授权"页面的"保存"按钮', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('58', '模型管理', '68', '3', 'admin/model/index', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('63', '属性管理', '68', '0', 'admin/attribute/index', '1', '网站属性配置。', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('64', '新增', '63', '0', 'admin/attribute/add', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('65', '编辑', '63', '0', 'admin/attribute/edit', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('66', '改变状态', '63', '0', 'admin/attribute/setStatus', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('67', '保存数据', '63', '0', 'admin/attribute/update', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('68', '系统设置', '0', '4', 'setup', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('69', '网站设置', '68', '1', 'admin/setup/index', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('70', '配置管理', '68', '4', 'admin/setup/group', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('75', '菜单管理', '68', '5', 'admin/menu/index', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('76', '导航管理', '68', '6', 'admin/channel/index', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('80', '分类管理', '68', '2', 'admin/category/index', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('86', '备份数据库', '68', '7', 'admin/database/index', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('90', '还原数据库', '68', '8', 'admin/database/imports', '1', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('106', '行为日志', '16', '4', 'admin/action/log', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('122', '数据列表', '58', '0', 'think/lists', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('123', '审核列表', '3', '0', 'Article/examine', '1', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('126', '其他', '2', '0', 'wenz/mang', '0', '12152', '1', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('127', '微信', '0', '5', 'admin/mpbase/index', '0', '', '99', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('128', '公共账号管理', '127', '0', 'admin/mpbase/seting', '0', '', '99', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('129', '群发消息', '127', '0', 'admin/mpbase/mass', '0', '', '99', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('130', '素材管理', '127', '0', 'admin/mpbase2/fodderlist', '0', '', '99', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('131', '微信用户管理', '127', '0', 'admin/mpbase/menu', '0', '', '99', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('132', '自定义菜单', '127', '1', 'admin/mpbase/selfmenu', '0', '', '99', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('133', '自动回复', '127', '0', 'admin/mpbase2/autoreply', '0', '', '99', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('134', '支付与配送', '0', '3', 'ecom', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('135', '支付方式', '134', '0', 'admin/ecom/payment', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('136', '支付插件', '134', '0', 'admin/ecom/payplugin', '0', '', '0', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('137', '运费模板', '134', '0', 'admin/ecom/fare', '0', '', '3', '0', '1');
INSERT INTO `cmswing_menu` VALUES ('138', '快递公司', '134', '0', 'admin/ecom/express', '0', '', '3', '0', '1');

-- -----------------------------
-- Table structure for `cmswing_model`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_model`;
CREATE TABLE `cmswing_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` bigint(15) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint(15) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- -----------------------------
-- Records of `cmswing_model`
-- -----------------------------
INSERT INTO `cmswing_model` VALUES ('1', 'document', '基础模型', '0', '', '1', '{"1":["2","3","5","9","10","11","12","13","14","16","17","19","20"]}', '1:基础', '', '', '', '', '', 'id:编号
title:标题:[EDIT]
type:类型
update_time:最后更新
status:状态
view:浏览
id:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1449340764453', '1455680364521', '1', 'MyISAM');
INSERT INTO `cmswing_model` VALUES ('2', 'article', '文章', '1', '', '1', '{"1":["2","3","5","9","12","24"],"2":["10","11","13","14","16","17","19","20","25","26"]}', '1:基础,2:扩展', '24,25,26,2,3,5,9,10,11,12,13,14,16,17,19,20', '', '', '', '', 'id:编号
title:标题:[EDIT]
type:类型
update_time:最后更新
status:状态
view:浏览
id:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1449340764453', '1453711249446', '1', 'MyISAM');
INSERT INTO `cmswing_model` VALUES ('3', 'download', '下载', '1', '', '1', '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1449340764453', '1387260449', '1', 'MyISAM');
INSERT INTO `cmswing_model` VALUES ('4', 'shop', '商品', '1', '', '1', '{"1":["3","5","65","67","71","81"],"2":["63","69"],"3":["83","75","73","77","79"],"4":["2","9","10","16","19"]}', '1:基本信息,2:库存/规格,3:物流/其它,4:高级信息', '63,69,71,73,75,77,79,81,83,2,3,5,9,10,16,19,65,67', 'title:商品名称
pics:商品图片
description:商品简介', '', '', '', 'id:编号
pics:商品图
title:商品名称:[EDIT]
price|formatprice:价格
type:类型
update_time:最后更新
status:状态
total_stock:总库存
view:浏览量
id:操作:[EDIT]|编辑,[DELETE]|删除', '9', '', '', '1455680338771', '1456477081387', '1', 'MyISAM');

-- -----------------------------
-- Table structure for `cmswing_order`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_order`;
CREATE TABLE `cmswing_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `pay_code` varchar(255) DEFAULT NULL,
  `payment` bigint(20) NOT NULL,
  `express` bigint(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `pay_status` tinyint(1) DEFAULT '0',
  `delivery_status` tinyint(1) DEFAULT '0',
  `accept_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `province` bigint(20) DEFAULT NULL,
  `city` bigint(20) DEFAULT NULL,
  `county` bigint(20) DEFAULT NULL,
  `addr` varchar(250) DEFAULT NULL,
  `zip` varchar(6) DEFAULT NULL,
  `payable_amount` float(10,2) DEFAULT NULL,
  `real_amount` float(10,2) DEFAULT '0.00',
  `payable_freight` float(10,2) DEFAULT '0.00',
  `real_freight` float(10,2) DEFAULT '0.00',
  `pay_time` bigint(13) DEFAULT NULL,
  `send_time` bigint(13) DEFAULT NULL,
  `create_time` bigint(13) DEFAULT NULL,
  `completion_time` bigint(13) DEFAULT NULL,
  `user_remark` varchar(255) DEFAULT NULL,
  `admin_remark` varchar(255) DEFAULT NULL,
  `handling_fee` float(10,2) DEFAULT '0.00',
  `is_invoice` tinyint(1) DEFAULT '0',
  `invoice_title` varchar(100) DEFAULT NULL,
  `taxes` float(10,2) DEFAULT '0.00',
  `prom_id` bigint(20) DEFAULT '0',
  `prom` text,
  `discount_amount` float(10,2) DEFAULT '0.00',
  `adjust_amount` float(10,2) DEFAULT '0.00',
  `adjust_note` varchar(255) DEFAULT NULL,
  `order_amount` float(10,2) DEFAULT '0.00',
  `is_print` varchar(255) DEFAULT NULL,
  `accept_time` varchar(80) DEFAULT NULL,
  `point` int(5) unsigned DEFAULT '0',
  `voucher_id` bigint(20) DEFAULT '0',
  `voucher` text,
  `type` int(4) unsigned DEFAULT '0',
  `trading_info` varchar(255) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_order`
-- -----------------------------
INSERT INTO `cmswing_order` VALUES ('3', '20160229132904600317', '2', '', '1', '', '3', '1', '0', 'hgfhfgh', '8688854', '18681851637', '310000', '310100', '310104', 'htgfhfghgfhgfhgfhfg', '822225', '94', '94', '8', '8', '20160229132913', '', '20160229132904', '', '441454545', '', '0', '1', '1:54545454545', '5.64', '0', '', '0', '0', '', '107.64', '', '', '0', '0', 'a:0:{}', '0', '', '0');
INSERT INTO `cmswing_order` VALUES ('4', '20160301151336826470', '2', '', '1', '', '3', '1', '0', 'hgfhfgh', '8688854', '18681851637', '310000', '310100', '310104', 'htgfhfghgfhgfhgfhfg', '822225', '165', '165', '8', '8', '20160301155709', '', '20160301151336', '', '65465464556', '', '0', '0', '', '0', '0', '', '0', '0', '', '173', '', '', '0', '0', 'a:0:{}', '0', '', '0');
INSERT INTO `cmswing_order` VALUES ('13', '1457173597231', '1', '', '7', '', '1', '0', '0', '晓飞 宁', '13589100475', '13589100333', '370000', '370100', '370102', '山东省ddddddd', '250000', '', '0', '0', '0', '', '', '', '', '', '', '0', '0', '', '0', '0', '', '0', '0', '', '0', '', '', '0', '0', '', '0', '', '0');
INSERT INTO `cmswing_order` VALUES ('12', '1457173231957', '1', '', '7', '', '1', '0', '0', '晓飞 宁', '13589100475', '13589100333', '370000', '370100', '370102', '山东省ddddddd', '250000', '', '0', '0', '0', '', '', '', '', '', '', '0', '0', '', '0', '0', '', '0', '0', '', '0', '', '', '0', '0', '', '0', '', '0');

-- -----------------------------
-- Table structure for `cmswing_order_goods`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_order_goods`;
CREATE TABLE `cmswing_order_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `goods_price` float(10,2) DEFAULT '0.00',
  `real_price` float(10,2) DEFAULT '0.00',
  `goods_nums` int(11) DEFAULT '1',
  `goods_weight` float DEFAULT '0',
  `shipments` int(11) DEFAULT '0',
  `prom_goods` text,
  `spec` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_order_goods`
-- -----------------------------
INSERT INTO `cmswing_order_goods` VALUES ('3', '3', '16', '56', '49', '49', '1', '200', '0', 'a:3:{s:10:"real_price";s:5:"49.00";s:4:"note";s:0:"";s:5:"minus";s:2:"-0";}', 'a:2:{i:2;a:6:{s:2:"id";s:1:"2";s:4:"name";s:6:"颜色";s:5:"value";a:4:{i:0;s:2:"10";i:1;s:6:"红色";i:2;s:6:"红色";i:3;s:0:"";}s:4:"type";s:1:"1";s:4:"note";s:12:"基本颜色";s:6:"is_del";s:1:"0";}i:6;a:6:{s:2:"id";s:1:"6";s:4:"name";s:6:"尺码";s:5:"value";a:4:{i:0;s:2:"46";i:1;s:2:"XL";i:2;s:2:"XL";i:3;s:0:"";}s:4:"type";s:1:"1";s:4:"note";s:6:"女式";s:6:"is_del";s:1:"0";}}');
INSERT INTO `cmswing_order_goods` VALUES ('4', '3', '20', '114', '45', '45', '1', '200', '0', 'a:3:{s:10:"real_price";s:5:"45.00";s:4:"note";s:0:"";s:5:"minus";s:2:"-0";}', 'a:2:{i:2;a:6:{s:2:"id";s:1:"2";s:4:"name";s:6:"颜色";s:5:"value";a:4:{i:0;s:1:"5";i:1;s:6:"白色";i:2;s:6:"白色";i:3;s:0:"";}s:4:"type";s:1:"1";s:4:"note";s:12:"基本颜色";s:6:"is_del";s:1:"0";}i:6;a:6:{s:2:"id";s:1:"6";s:4:"name";s:6:"尺码";s:5:"value";a:4:{i:0;s:2:"44";i:1;s:1:"M";i:2;s:1:"M";i:3;s:0:"";}s:4:"type";s:1:"1";s:4:"note";s:6:"女式";s:6:"is_del";s:1:"0";}}');
INSERT INTO `cmswing_order_goods` VALUES ('5', '4', '17', '68', '55', '55', '3', '200', '0', 'a:3:{s:10:"real_price";s:5:"55.00";s:4:"note";s:0:"";s:5:"minus";s:2:"-0";}', 'a:2:{i:2;a:6:{s:2:"id";s:1:"2";s:4:"name";s:6:"颜色";s:5:"value";a:4:{i:0;s:1:"5";i:1;s:6:"白色";i:2;s:6:"白色";i:3;s:0:"";}s:4:"type";s:1:"1";s:4:"note";s:12:"基本颜色";s:6:"is_del";s:1:"0";}i:6;a:6:{s:2:"id";s:1:"6";s:4:"name";s:6:"尺码";s:5:"value";a:4:{i:0;s:2:"45";i:1;s:1:"L";i:2;s:1:"L";i:3;s:0:"";}s:4:"type";s:1:"1";s:4:"note";s:6:"女式";s:6:"is_del";s:1:"0";}}');
INSERT INTO `cmswing_order_goods` VALUES ('6', '5', '19', '105', '49', '49', '2', '200', '0', 'a:3:{s:10:"real_price";s:5:"49.00";s:4:"note";s:0:"";s:5:"minus";s:2:"-0";}', 'a:2:{i:2;a:6:{s:2:"id";s:1:"2";s:4:"name";s:6:"颜色";s:5:"value";a:4:{i:0;s:1:"5";i:1;s:6:"白色";i:2;s:6:"白色";i:3;s:0:"";}s:4:"type";s:1:"1";s:4:"note";s:12:"基本颜色";s:6:"is_del";s:1:"0";}i:6;a:6:{s:2:"id";s:1:"6";s:4:"name";s:6:"尺码";s:5:"value";a:4:{i:0;s:2:"42";i:1;s:2:"XS";i:2;s:2:"XS";i:3;s:0:"";}s:4:"type";s:1:"1";s:4:"note";s:6:"女式";s:6:"is_del";s:1:"0";}}');
INSERT INTO `cmswing_order_goods` VALUES ('16', '13', '68', '', '100', '0', '1', '0', '0', '{"id":100,"uid":1,"product_id":68,"qty":1,"type":"","price":100,"title":"测试商品多个商品图","unit_price":100,"pic":"/upload/picture/2016-02-26/0KZWd7jZygj8ZvcWds6kMRcE.jpg","url":"/detail/68"}', '');
INSERT INTO `cmswing_order_goods` VALUES ('15', '12', '69', '', '167', '0', '1', '0', '0', '{"id":98,"uid":1,"product_id":69,"qty":1,"type":"红色,M","price":167,"title":"测试商品多个规格相同价格","unit_price":167,"pic":"/upload/picture/2016-02-26/y3ZiHNl29kiNmnWtdJi87gxd.jpg","url":"/detail/69"}', '');

-- -----------------------------
-- Table structure for `cmswing_order_log`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_order_log`;
CREATE TABLE `cmswing_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `result` varchar(10) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cmswing_pay_plugin`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_pay_plugin`;
CREATE TABLE `cmswing_pay_plugin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  `description` text,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_pay_plugin`
-- -----------------------------
INSERT INTO `cmswing_pay_plugin` VALUES ('1', '预存款支付', 'balance', '预存款是客户在您网站上的虚拟资金帐户。', '/static/admin/img/payments/logos/pay_deposit.gif');
INSERT INTO `cmswing_pay_plugin` VALUES ('5', '腾讯财付通', 'tenpay', '费率最低至<span style="color: #FF0000;font-weight: bold;">0.61%</span>，并赠送价值千元企业QQ <a style="color:blue" href="http://union.tenpay.com/mch/mch_register.shtml" target="_blank">立即申请</a>', '/static/admin/img/payments/logos/pay_tenpay.gif');
INSERT INTO `cmswing_pay_plugin` VALUES ('2', '支付宝[担保交易]', 'alipaytrad', '淘宝买家最熟悉的付款方式：买家先将交易资金存入支付宝并通知卖家发货，买家确认收货后资金自动进入卖家支付宝账户，完成交易 <a style="color:blue" href="https://b.alipay.com/order/productDetail.htm?productId=2012111200373121" target="_blank">立即申请</a>', '/static/admin/img//payments/logos/pay_alipaytrad.gif');
INSERT INTO `cmswing_pay_plugin` VALUES ('3', '支付宝[双向接口]', 'alipay', '买家付款时，可选择担保交易或即时到账中的任一支付方式进行付款，完成交易。<a style="color:blue" href="https://b.alipay.com/order/productDetail.htm?productId=2012111300373136" target="_blank">立即申请</a>', '/static/admin/img//payments/logos/pay_alipay.gif');
INSERT INTO `cmswing_pay_plugin` VALUES ('6', 'PayPal', 'paypal', 'PayPal 是全球最大的在线支付平台，同时也是目前全球贸易网上支付标准。', '/static/admin/img//payments/logos/pay_paypal.gif');
INSERT INTO `cmswing_pay_plugin` VALUES ('4', '支付宝[即时到帐]', 'alipaydirect', '网上交易时，买家的交易资金直接打入卖家支付宝账户，快速回笼交易资金。 <a style="color:blue" href="https://b.alipay.com/order/productDetail.htm?productId=2012111200373124" target="_blank">立即申请</a>', '/static/admin/img//payments/logos/pay_alipay.gif');
INSERT INTO `cmswing_pay_plugin` VALUES ('7', '货到付款', 'received', '客户收到商品时，再进行付款，让客户更放心。', '/static/admin/img//payments/logos/pay_received.gif');
INSERT INTO `cmswing_pay_plugin` VALUES ('8', '支付宝[银行支付]', 'alipaygateway', '', '/static/admin/img//payments/logos/pay_alipay.gif');

-- -----------------------------
-- Table structure for `cmswing_payment`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_payment`;
CREATE TABLE `cmswing_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plugin_id` varchar(32) NOT NULL,
  `pay_name` varchar(100) NOT NULL,
  `config` text,
  `client_type` int(1) DEFAULT '0',
  `description` text,
  `note` text,
  `pay_fee` float(10,2) DEFAULT '0.00',
  `fee_type` tinyint(1) DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '0禁用，1启用，-1删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_payment`
-- -----------------------------
INSERT INTO `cmswing_payment` VALUES ('1', '1', '预存款支付', '{"partner_id":"456456456","partner_key":"456546464"}', '2', '预存款是客户在您网站上的虚拟资金帐户。', '', '0', '1', '1', '1');
INSERT INTO `cmswing_payment` VALUES ('5', '5', '腾讯财付通', '{"partner_id":"635645645","partner_key":"64565464564"}', '2', '<p>费率最低至<span style="color: #FF0000;font-weight: bold;">0.61%</span>，并赠送价值千元企业QQ <a style="color:blue" href="http://union.tenpay.com/mch/mch_register.shtml" target="_blank">立即申请</a></p>', '<p>111215855<br/></p>', '15', '1', '3', '1');
INSERT INTO `cmswing_payment` VALUES ('7', '7', '货到付款', '{"partner_id":"1115555","partner_key":"22224445"}', '0', '<p>客户收到商品时，再进行付款，让客户更放心。</p>', '<p>2121321<br/></p>', '0', '1', '0', '1');

-- -----------------------------
-- Table structure for `cmswing_picture`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_picture`;
CREATE TABLE `cmswing_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `type` int(2) DEFAULT '0' COMMENT '图片来源，或模块区分 1:微信',
  `source_id` varchar(255) DEFAULT '' COMMENT '来源id，当关联其他平台时该平台生产的id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_picture`
-- -----------------------------
INSERT INTO `cmswing_picture` VALUES ('1', '/Uploads/Picture/2015-12-25/567cf54a36ea6.png', '', 'f3eaa6c12a36de8a052d1d77cd9dc1e1', 'd4a24c871be2dc3be7607d3102b42523b1f4a683', '1', '1451029834', '', '');
INSERT INTO `cmswing_picture` VALUES ('2', '/Uploads/Picture/2015-12-25/567d3a8788fe6.png', '', 'ca283b4bfceaf203177b9e9acf3241c3', '9ff89de6ae933c3b0de83652c101fb1b284e0d65', '1', '1451047559', '', '');
INSERT INTO `cmswing_picture` VALUES ('3', '/upload/picture/2015-12-25/rbLGp9vjY1DemXO0DRY7JzVT.png', '', '', '', '1', '1451051924514', '', '');
INSERT INTO `cmswing_picture` VALUES ('4', '/upload/picture/2015-12-25/2sSUNAWwQ-yPaPS9boIcBY2K.jpg', '', '', '', '1', '1451051961775', '', '');
INSERT INTO `cmswing_picture` VALUES ('5', '/upload/picture/2015-12-25/1KlWY4ut1DqYl6bmX_DoQ6B1.png', '', '', '', '1', '1451052022238', '', '');
INSERT INTO `cmswing_picture` VALUES ('6', '/upload/picture/2015-12-25/4HLlzNvjnlyUnKY8X6Y-U6h1.jpg', '', '', '', '1', '1451052030761', '', '');
INSERT INTO `cmswing_picture` VALUES ('7', '/upload/picture/2015-12-25/gax_wWo9sZR-JZ_b0DBiugta.jpg', '', '', '', '1', '1451052354530', '', '');
INSERT INTO `cmswing_picture` VALUES ('8', '/upload/picture/2015-12-25/NZ4-YBz5LHnCqp2sqDFwIfWs.png', '', '', '', '1', '1451052483035', '', '');
INSERT INTO `cmswing_picture` VALUES ('9', '/upload/picture/2015-12-26/BUNOS_nHpdGFKtdZvYKDRQ49.png', '', '', '', '1', '1451110257877', '', '');
INSERT INTO `cmswing_picture` VALUES ('10', '/upload/picture/2015-12-26/VD4YVQCeo2mvRJ_KkMGYHKSW.png', '', '', '', '1', '1451110401131', '', '');
INSERT INTO `cmswing_picture` VALUES ('11', '/upload/picture/2015-12-28/eoBllez-pPPyHe1Lj-pWxr7W.jpg', '', '', '', '1', '1451301404071', '', '');
INSERT INTO `cmswing_picture` VALUES ('12', '/upload/picture/2015-12-28/_K9Z1B2lCgpRsXhRou2dwdlg.jpg', '', '', '', '1', '1451303946844', '', '');
INSERT INTO `cmswing_picture` VALUES ('13', '/upload/picture/2015-12-28/rk4XLHU1fZ_XsS1YA6atoOWB.jpg', '', '', '', '1', '1451303973834', '', '');
INSERT INTO `cmswing_picture` VALUES ('14', '/upload/picture/2015-12-28/9keT7MphBbnHeWjHIIqRaXdj.jpg', '', '', '', '1', '1451307702105', '', '');
INSERT INTO `cmswing_picture` VALUES ('15', '/upload/picture/2015-12-28/FlgennevswlBDjJUcr0RtRTP.jpg', '', '', '', '1', '1451307713630', '', '');
INSERT INTO `cmswing_picture` VALUES ('16', '/upload/picture/2015-12-28/otYhAIEH88KXND-CWLYB-Vbc.png', '', '', '', '1', '1451309044762', '', '');
INSERT INTO `cmswing_picture` VALUES ('17', '/upload/picture/2015-12-29/eSiieCg7cLbJClblvYeklqF7.jpg', '', '', '', '1', '1451395596202', '', '');
INSERT INTO `cmswing_picture` VALUES ('18', '/upload/picture/2015-12-30/dR7zwL2u8nMHxkpmJLDH-6Ht.png', '', '', '', '1', '1451464802409', '', '');
INSERT INTO `cmswing_picture` VALUES ('19', '/upload/picture/2016-01-04/G5cGMPq8xeUIPmAIli83-HdK.png', '', '', '', '1', '1451878852719', '', '');
INSERT INTO `cmswing_picture` VALUES ('20', '/upload/picture/2016-01-13/9TLUUw6FONF2lLRLwMknhzLN.png', '', '', '', '1', '1452690230397', '', '');
INSERT INTO `cmswing_picture` VALUES ('21', '/upload/picture/2016-01-15/QqIiJShMeQ_EpAI_ebRZdXfq.png', '', '', '', '1', '1452839151989', '', '');
INSERT INTO `cmswing_picture` VALUES ('22', '/upload/picture/2016-01-15/H0axv1GKpLYhrnDTye86lZxV.png', '', '', '', '1', '1452839162017', '', '');
INSERT INTO `cmswing_picture` VALUES ('23', '/upload/picture/2016-01-15/9sUsetciafo39OXxRz4mxlru.png', '', '', '', '1', '1452839189799', '', '');
INSERT INTO `cmswing_picture` VALUES ('24', '/upload/picture/2016-01-15/YlshdvV8jGEdn4RvLFxlzGRS.png', '', '', '', '1', '1452839942254', '', '');
INSERT INTO `cmswing_picture` VALUES ('25', '/upload/picture/2016-01-15/Hho7m8ZiOpsvTOX6qX2i2oPq.png', '', '', '', '1', '1452840007315', '', '');
INSERT INTO `cmswing_picture` VALUES ('26', '/upload/picture/2016-01-15/Tlp9bAaVOO1ytcJ-2tz9cZl9.png', '', '', '', '1', '1452840130366', '', '');
INSERT INTO `cmswing_picture` VALUES ('27', '/upload/picture/2016-01-15/I6NNoG58d-FYJfWV2eUhe7iJ.png', '', '', '', '1', '1452840489639', '', '');
INSERT INTO `cmswing_picture` VALUES ('28', '/upload/picture/2016-01-16/LkPB5Z4AZfaGtMoVVbJwqzMW.jpg', '', '', '', '1', '1452919474738', '', '');
INSERT INTO `cmswing_picture` VALUES ('29', '/upload/picture/2016-01-16/FCkGU9Nteynkd6k6Vxj98Llq.JPG', '', '', '', '1', '1452919524092', '', '');
INSERT INTO `cmswing_picture` VALUES ('30', '/upload/picture/2016-01-16/uDdVHERiQP9HSPeVV1BBehm-.jpg', '', '', '', '1', '1452919681703', '', '');
INSERT INTO `cmswing_picture` VALUES ('31', '/upload/picture/2016-01-16/B6s5nw1H4ia9AzxC5tXjU7MV.png', '', '', '', '1', '1452919791633', '', '');
INSERT INTO `cmswing_picture` VALUES ('32', '/upload/picture/2016-01-16/4AUwAgwK0MM_McU6tZYQuG5H.png', '', '', '', '1', '1452920302896', '', '');
INSERT INTO `cmswing_picture` VALUES ('33', '/upload/picture/2016-01-25/Oqefa8OlJGa9tYQAOn4LzDNo.png', '', '', '', '1', '1453694903926', '', '');
INSERT INTO `cmswing_picture` VALUES ('34', '/upload/picture/2016-01-25/YgJNn-vAHrTojIMJaa5b_NZF.png', '', '', '', '1', '1453703626503', '', '');
INSERT INTO `cmswing_picture` VALUES ('35', '/upload/picture/2016-02-17/upcIkYfahsrA2v91WVrnwnnT.png', '', '', '', '1', '1455685465490', '', '');
INSERT INTO `cmswing_picture` VALUES ('36', '/upload/picture/2016-02-17/9x8ATjsn0yWCOD12-Sg8IZ9b.png', '', '', '', '1', '1455685468060', '', '');
INSERT INTO `cmswing_picture` VALUES ('37', '/upload/picture/2016-02-17/WuD6azDV2nzjpsuw0THr9H8Z.png', '', '', '', '1', '1455697076519', '', '');
INSERT INTO `cmswing_picture` VALUES ('38', '/upload/picture/2016-02-17/NJ6ZrgTPMiIdq2jwG4D2oW57.png', '', '', '', '1', '1455697076555', '', '');
INSERT INTO `cmswing_picture` VALUES ('39', '/upload/picture/2016-02-17/GVVfiEt7mJx3ythCiusaF1Bd.png', '', '', '', '1', '1455697076630', '', '');
INSERT INTO `cmswing_picture` VALUES ('40', '/upload/picture/2016-02-17/bByJqpKt_0LIhxW0HCOfevST.png', '', '', '', '1', '1455697076728', '', '');
INSERT INTO `cmswing_picture` VALUES ('41', '/upload/picture/2016-02-17/XIbYnHMsBQDJPzLI3wnwtpwy.png', '', '', '', '1', '1455697076749', '', '');
INSERT INTO `cmswing_picture` VALUES ('42', '/upload/picture/2016-02-17/h5SYnoyk2Zdb8vOBAbuK-jkh.png', '', '', '', '1', '1455697076807', '', '');
INSERT INTO `cmswing_picture` VALUES ('43', '/upload/picture/2016-02-17/hOf9UPDW8x8PfP-y2tGluL-y.png', '', '', '', '1', '1455697076920', '', '');
INSERT INTO `cmswing_picture` VALUES ('44', '/upload/picture/2016-02-17/yZ-lYx4grjwjnUaCkGgStK_x.png', '', '', '', '1', '1455697076973', '', '');
INSERT INTO `cmswing_picture` VALUES ('45', '/upload/picture/2016-02-17/Z-flFprPTM2NjKjUUG-2JNQR.png', '', '', '', '1', '1455698404323', '', '');
INSERT INTO `cmswing_picture` VALUES ('46', '/upload/picture/2016-02-17/E_LFQxuWpam9uDfN0fLMML8v.png', '', '', '', '1', '1455698404405', '', '');
INSERT INTO `cmswing_picture` VALUES ('47', '/upload/picture/2016-02-17/FXWeBn2e3p_w7_4ovPI_JqQz.png', '', '', '', '1', '1455698404446', '', '');
INSERT INTO `cmswing_picture` VALUES ('48', '/upload/picture/2016-02-17/8JAxQijhowZNgUSGCtCeBvmV.png', '', '', '', '1', '1455698477924', '', '');
INSERT INTO `cmswing_picture` VALUES ('49', '/upload/picture/2016-02-17/GtcJUi6Z58qRaSfprJtcA2xP.png', '', '', '', '1', '1455698478060', '', '');
INSERT INTO `cmswing_picture` VALUES ('50', '/upload/picture/2016-02-17/fJT_8mv42Eza2tefFg8c57F-.png', '', '', '', '1', '1455698478095', '', '');
INSERT INTO `cmswing_picture` VALUES ('51', '/upload/picture/2016-02-17/yjXlg40MFFfX2tmWuoFNHCX_.png', '', '', '', '1', '1455698912408', '', '');
INSERT INTO `cmswing_picture` VALUES ('52', '/upload/picture/2016-02-17/vs_6iKCSkezHgFLqWrGo_yG6.png', '', '', '', '1', '1455698912510', '', '');
INSERT INTO `cmswing_picture` VALUES ('53', '/upload/picture/2016-02-17/sitYEDcx3KXnAO9Soa9-3n1Z.png', '', '', '', '1', '1455698912516', '', '');
INSERT INTO `cmswing_picture` VALUES ('54', '/upload/picture/2016-02-17/5Vepdn_g1ZCn0ZxlbkCrJLx0.png', '', '', '', '1', '1455698912552', '', '');
INSERT INTO `cmswing_picture` VALUES ('55', '/upload/picture/2016-02-17/wUexvivri6hdozn5s4nGG-6l.png', '', '', '', '1', '1455698994835', '', '');
INSERT INTO `cmswing_picture` VALUES ('56', '/upload/picture/2016-02-17/EF8xNu270Hibe6AjVD9ZNFn_.png', '', '', '', '1', '1455698994908', '', '');
INSERT INTO `cmswing_picture` VALUES ('57', '/upload/picture/2016-02-17/GgxHP6rDiZapWid3a0lOycGt.png', '', '', '', '1', '1455698994979', '', '');
INSERT INTO `cmswing_picture` VALUES ('58', '/upload/picture/2016-02-17/shnPDRcYY92WRiZnyYSymwWV.png', '', '', '', '1', '1455698995013', '', '');
INSERT INTO `cmswing_picture` VALUES ('59', '/upload/picture/2016-02-17/3t5RrngSZy-Eyavdgfonb6pC.png', '', '', '', '1', '1455698995068', '', '');
INSERT INTO `cmswing_picture` VALUES ('60', '/upload/picture/2016-02-17/y8YSTPw5PA1bjpVM2NydM9UO.png', '', '', '', '1', '1455698995147', '', '');
INSERT INTO `cmswing_picture` VALUES ('61', '/upload/picture/2016-02-17/plyovRYkXbFfE2kU_KUVN4Qk.png', '', '', '', '1', '1455698995178', '', '');
INSERT INTO `cmswing_picture` VALUES ('62', '/upload/picture/2016-02-17/L7FaMEY2fipWoIY6aDamQPFH.png', '', '', '', '1', '1455699100368', '', '');
INSERT INTO `cmswing_picture` VALUES ('63', '/upload/picture/2016-02-17/OT8G_tuLQfIf6BuP9nZWq7Tq.png', '', '', '', '1', '1455699100421', '', '');
INSERT INTO `cmswing_picture` VALUES ('64', '/upload/picture/2016-02-17/Jb8ux4j2x4rbO4-Sz4Z3ZJfL.png', '', '', '', '1', '1455699126352', '', '');
INSERT INTO `cmswing_picture` VALUES ('65', '/upload/picture/2016-02-17/ogwNEUNphebpL1jPGt4Y3d3s.png', '', '', '', '1', '1455699126412', '', '');
INSERT INTO `cmswing_picture` VALUES ('66', '/upload/picture/2016-02-17/hbrF4GZBm4XNCW4WEXYOpDN0.png', '', '', '', '1', '1455699126457', '', '');
INSERT INTO `cmswing_picture` VALUES ('67', '/upload/picture/2016-02-17/N05WpPOegd79k3x22kDITuzH.png', '', '', '', '1', '1455699126528', '', '');
INSERT INTO `cmswing_picture` VALUES ('68', '/upload/picture/2016-02-17/FECkq195UjlNHw_TMs8zzDHE.png', '', '', '', '1', '1455699167743', '', '');
INSERT INTO `cmswing_picture` VALUES ('69', '/upload/picture/2016-02-17/GniOHS1QY2ddoe0Wnc0N4Uei.png', '', '', '', '1', '1455699167792', '', '');
INSERT INTO `cmswing_picture` VALUES ('70', '/upload/picture/2016-02-17/P9-IYSXgs1gTkQX-0jjbdM6M.png', '', '', '', '1', '1455699167863', '', '');
INSERT INTO `cmswing_picture` VALUES ('71', '/upload/picture/2016-02-17/iDlgPDtaWAnqRv9dGuGHUHzS.png', '', '', '', '1', '1455699167891', '', '');
INSERT INTO `cmswing_picture` VALUES ('72', '/upload/picture/2016-02-17/vcj2HR7Y3luK4M1Jk72YpjUU.png', '', '', '', '1', '1455708689996', '', '');
INSERT INTO `cmswing_picture` VALUES ('73', '/upload/picture/2016-02-17/Y_83VJuAlZVYWc7fOCO6B8rh.png', '', '', '', '1', '1455708690066', '', '');
INSERT INTO `cmswing_picture` VALUES ('74', '/upload/picture/2016-02-17/JQ5VJcVR3YRsgtxam6lg9wV7.png', '', '', '', '1', '1455708690070', '', '');
INSERT INTO `cmswing_picture` VALUES ('75', '/upload/picture/2016-02-23/4oG7lGGocXEDbM3LT-ESGqwt.jpg', '', '', '', '1', '1456236833650', '', '');
INSERT INTO `cmswing_picture` VALUES ('76', '/upload/picture/2016-02-23/Nw4N4viqLvUJrg_ewYRd8sN0.jpg', '', '', '', '1', '1456236833735', '', '');
INSERT INTO `cmswing_picture` VALUES ('77', '/upload/picture/2016-02-24/T5E0Gb_7LVHEMZrP8yDzqKb6.png', '', '', '', '1', '1456290063424', '', '');
INSERT INTO `cmswing_picture` VALUES ('78', '/upload/picture/2016-02-24/t4OJv1qpjTUfBIU5YbK_3dZy.jpg', '', '', '', '1', '1456290063442', '', '');
INSERT INTO `cmswing_picture` VALUES ('79', '/upload/picture/2016-02-24/bE22Yn_xZtzDaCBRpjqm4Smq.png', '', '', '', '1', '1456290102319', '', '');
INSERT INTO `cmswing_picture` VALUES ('80', '/upload/picture/2016-02-24/iXADeXYxj-dqUsUdqZkLB-tO.png', '', '', '', '1', '1456290102431', '', '');
INSERT INTO `cmswing_picture` VALUES ('81', '/upload/picture/2016-02-24/ZwMTBjoh_K7xFBjw0Z5iyJ1-.jpg', '', '', '', '1', '1456290128970', '', '');
INSERT INTO `cmswing_picture` VALUES ('82', '/upload/picture/2016-02-24/BBCDgD4bL2ZmqYKE85cza_Ku.jpg', '', '', '', '1', '1456290146439', '', '');
INSERT INTO `cmswing_picture` VALUES ('83', '/upload/picture/2016-02-24/B_uAOKyaGh_REFH5rnwRhuZV.jpg', '', '', '', '1', '1456306069801', '', '');
INSERT INTO `cmswing_picture` VALUES ('84', '/upload/picture/2016-02-24/7dsjUWMwil4X36NwwO5CjOrz.png', '', '', '', '1', '1456306769396', '', '');
INSERT INTO `cmswing_picture` VALUES ('85', '/upload/picture/2016-02-24/Z4WW6sicGmpzHdc-TjzyFxjC.jpg', '', '', '', '1', '1456307138230', '', '');
INSERT INTO `cmswing_picture` VALUES ('86', '/upload/picture/2016-02-24/d_6cQjY2Upfs1JH-IB3aN8Jn.jpg', '', '', '', '1', '1456307197896', '', '');
INSERT INTO `cmswing_picture` VALUES ('87', '/upload/picture/2016-02-25/AI9935U42KDQeJwjEDbEenq2.png', '', '', '', '1', '1456390485523', '', '');
INSERT INTO `cmswing_picture` VALUES ('88', '/upload/picture/2016-02-25/GaaxWzxUQukhVipP1cPoFA7b.jpg', '', '', '', '1', '1456394032645', '', '');
INSERT INTO `cmswing_picture` VALUES ('89', '/upload/picture/2016-02-25/qcqxmZ773WoIGMPeJi9NrN7i.jpg', '', '', '', '1', '1456394032891', '', '');
INSERT INTO `cmswing_picture` VALUES ('90', '/upload/picture/2016-02-25/tGfsacJrfU-IGUPoyOnBa_A3.jpg', '', '', '', '1', '1456394033042', '', '');
INSERT INTO `cmswing_picture` VALUES ('91', '/upload/picture/2016-02-25/-rHapXzhi2nv6vSvVxsa7QeJ.jpg', '', '', '', '1', '1456394033174', '', '');
INSERT INTO `cmswing_picture` VALUES ('92', '/upload/picture/2016-02-25/a3mW2IUP0gyNK_F9VBU-CDnl.jpg', '', '', '', '1', '1456396319612', '', '');
INSERT INTO `cmswing_picture` VALUES ('93', '/upload/picture/2016-02-25/NYyh-sChqwXkfIw7Wj00vu4D.jpg', '', '', '', '1', '1456396319946', '', '');
INSERT INTO `cmswing_picture` VALUES ('94', '/upload/picture/2016-02-25/UsozucdB94Yyu7pd0-Bpdsmm.jpg', '', '', '', '1', '1456396320256', '', '');
INSERT INTO `cmswing_picture` VALUES ('95', '/upload/picture/2016-02-25/4QI5lJWnqyOW07OlLlDpVb8k.jpg', '', '', '', '1', '1456396320413', '', '');
INSERT INTO `cmswing_picture` VALUES ('96', '/upload/picture/2016-02-25/XDmOIKEoMgWdkxd6ymaTdCFG.jpg', '', '', '', '1', '1456396320615', '', '');
INSERT INTO `cmswing_picture` VALUES ('97', '/upload/picture/2016-02-25/hwKQTB3uOCvp8zJBd8ZGUgPa.jpg', '', '', '', '1', '1456396320743', '', '');
INSERT INTO `cmswing_picture` VALUES ('98', '/upload/picture/2016-02-25/68T5qhK0UKrZ4IzUov5P7Fv0.jpg', '', '', '', '1', '1456396320865', '', '');
INSERT INTO `cmswing_picture` VALUES ('99', '/upload/picture/2016-02-25/q8AVyFtsWng-YeUCcygEs3GX.jpg', '', '', '', '1', '1456396320976', '', '');
INSERT INTO `cmswing_picture` VALUES ('100', '/upload/picture/2016-02-25/yZTUfSB_ACj8M-7xzpXPF2yC.jpg', '', '', '', '1', '1456396321138', '', '');
INSERT INTO `cmswing_picture` VALUES ('101', '/upload/picture/2016-02-25/BSTiRb49Kkl1pj8OFmJtYTxL.jpg', '', '', '', '1', '1456396321258', '', '');
INSERT INTO `cmswing_picture` VALUES ('102', '/upload/picture/2016-02-25/c7EhQZ6DBqnvQp2eKHGluS4t.jpg', '', '', '', '1', '1456396321394', '', '');
INSERT INTO `cmswing_picture` VALUES ('103', '/upload/picture/2016-02-25/xoDO5YmxqUmvo6UVQcnKQ6ye.jpg', '', '', '', '1', '1456396321490', '', '');
INSERT INTO `cmswing_picture` VALUES ('104', '/upload/picture/2016-02-25/m-seuHTLjuuyqpBOOGZfXX0a.jpg', '', '', '', '1', '1456396321619', '', '');
INSERT INTO `cmswing_picture` VALUES ('105', '/upload/picture/2016-02-25/0bCgkzjur_kv-fkIsuC-6h_5.jpg', '', '', '', '1', '1456396321784', '', '');
INSERT INTO `cmswing_picture` VALUES ('106', '/upload/picture/2016-02-26/5ZoCC1EvrqSaHRar81MYZtgC.jpg', '', '', '', '1', '1456459679579', '', '');
INSERT INTO `cmswing_picture` VALUES ('107', '/upload/picture/2016-02-26/iRuL7cWSXq2nGugZD-UUjXQm.jpg', '', '', '', '1', '1456460626835', '', '');
INSERT INTO `cmswing_picture` VALUES ('108', '/upload/picture/2016-02-26/FhXzoJlRXlh4kew-3ErOaFyb.jpg', '', '', '', '1', '1456460626870', '', '');
INSERT INTO `cmswing_picture` VALUES ('109', '/upload/picture/2016-02-26/0KZWd7jZygj8ZvcWds6kMRcE.jpg', '', '', '', '1', '1456467143191', '', '');
INSERT INTO `cmswing_picture` VALUES ('110', '/upload/picture/2016-02-26/rYFzL5wmYwAscCm6DgWzRZ2p.jpg', '', '', '', '1', '1456467143278', '', '');
INSERT INTO `cmswing_picture` VALUES ('111', '/upload/picture/2016-02-26/dsU37BoOnRlgGLX-7xunE-zb.jpg', '', '', '', '1', '1456467143369', '', '');
INSERT INTO `cmswing_picture` VALUES ('112', '/upload/picture/2016-02-26/RoqIK96VedfIplTWaVdnt3Hq.jpg', '', '', '', '1', '1456467143452', '', '');
INSERT INTO `cmswing_picture` VALUES ('113', '/upload/picture/2016-02-26/0En7my_7ip_cita-jkOv-7T3.jpg', '', '', '', '1', '1456467143514', '', '');
INSERT INTO `cmswing_picture` VALUES ('114', '/upload/picture/2016-02-26/owCi6MqvZzAONlxUZJNe1nXB.jpg', '', '', '', '1', '1456467143612', '', '');
INSERT INTO `cmswing_picture` VALUES ('115', '/upload/picture/2016-02-26/C1Hv5Ewz8JIIXmvNofiCK0AR.jpg', '', '', '', '1', '1456467143685', '', '');
INSERT INTO `cmswing_picture` VALUES ('116', '/upload/picture/2016-02-26/QtWCJoqLDAuJqMtDXMQbSJm7.jpg', '', '', '', '1', '1456467143767', '', '');
INSERT INTO `cmswing_picture` VALUES ('117', '/upload/picture/2016-02-26/m0fzi2FxtQyT_xT5msvkvzFE.jpg', '', '', '', '1', '1456467143845', '', '');
INSERT INTO `cmswing_picture` VALUES ('118', '/upload/picture/2016-02-26/LlXhaPE4jBnkGlcHBLb4W_DQ.jpg', '', '', '', '1', '1456467143941', '', '');
INSERT INTO `cmswing_picture` VALUES ('119', '/upload/picture/2016-02-26/0_A3UhB2SMAPuTyvF6EGxs1X.jpg', '', '', '', '1', '1456467143999', '', '');
INSERT INTO `cmswing_picture` VALUES ('120', '/upload/picture/2016-02-26/daHi2ELprmXWL7FVUblhny1x.jpg', '', '', '', '1', '1456467144112', '', '');
INSERT INTO `cmswing_picture` VALUES ('121', '/upload/picture/2016-02-26/V5WWrW4vvR6jIfqQ1gKewONr.jpg', '', '', '', '1', '1456467144140', '', '');
INSERT INTO `cmswing_picture` VALUES ('122', '/upload/picture/2016-02-26/LkJDOVPlhqRlM_YuwZFeskmz.jpg', '', '', '', '1', '1456467144233', '', '');
INSERT INTO `cmswing_picture` VALUES ('123', '/upload/picture/2016-02-26/y3ZiHNl29kiNmnWtdJi87gxd.jpg', '', '', '', '1', '1456467366632', '', '');
INSERT INTO `cmswing_picture` VALUES ('124', '/upload/picture/2016-02-26/5YUpFuw_uPb5sU-UMtOh9UVG.jpg', '', '', '', '1', '1456467366710', '', '');
INSERT INTO `cmswing_picture` VALUES ('125', '/upload/picture/2016-02-26/PCQbaNF7m06EHWmXnMu7cYXE.jpg', '', '', '', '1', '1456468194336', '', '');
INSERT INTO `cmswing_picture` VALUES ('126', '/upload/picture/2016-02-26/iJ-GwDggGfzfMI9RkF5kZmaI.jpg', '', '', '', '1', '1456468194418', '', '');
INSERT INTO `cmswing_picture` VALUES ('127', '/upload/picture/2016-03-02/bRjow4pnaCqgaMpoOo8h6OXn.jpg', '', '', '', '1', '1456891559436', '0', 'wc0LsqkZlrXnMNstWxP4bHmG-UyzdwtMcuY2wFmWH68');
INSERT INTO `cmswing_picture` VALUES ('128', '/upload/picture/2016-03-03/23Xpu3B-m6pvp1lr49Syzp1c.png', '', '', '', '1', '1456973153509', '0', 'Pi0Cuuy_spnDgDCEsbVSgIyVWr7sNlOC3n2_op23J6M');
INSERT INTO `cmswing_picture` VALUES ('129', '/upload/picture/2016-03-03/5k4rgSCzUTbtjE7S0it9cUOV.jpg', '', '', '', '1', '1456995648406', '0', 'tMnUi4E7UQtt-hn3WJc2AX4wuNZPy6HOpTOvnIl05Do');
INSERT INTO `cmswing_picture` VALUES ('130', '/upload/picture/2016-03-03/PRmw_LzOUt2_YT_cKvFpYal1.png', '', '', '', '1', '1456999712491', '0', 'rYTK-hn-e5tZ8LXb3ncWVmIXbkt7LYka-TMhTP7ao4o');
INSERT INTO `cmswing_picture` VALUES ('131', '/upload/picture/2016-03-05/ORumm4ua0wP8VFVX2U_q_smf.gif', '', '', '', '1', '1457150738985', '0', 'WHaDQ3y1CKv2E53_pazWIeMAv9lb3G5B-0milOTSTDM');

-- -----------------------------
-- Table structure for `cmswing_session`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_session`;
CREATE TABLE `cmswing_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cookie` varchar(255) NOT NULL DEFAULT '',
  `data` text,
  `expire` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cookie` (`cookie`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cmswing_setup`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_setup`;
CREATE TABLE `cmswing_setup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_setup`
-- -----------------------------
INSERT INTO `cmswing_setup` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '4294967295', '1379235274', '1', 'CmsWing内容管理框架', '0');
INSERT INTO `cmswing_setup` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'CmsWing内容管理框架', '1');
INSERT INTO `cmswing_setup` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'nodej,comswing,内容管理框架,thinkjs22', '8');
INSERT INTO `cmswing_setup` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `cmswing_setup` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字
1:字符
2:文本
3:数组
4:枚举', '2');
INSERT INTO `cmswing_setup` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“陕ICP备16000909号“', '4294967295', '1379235859', '1', '陕ICP备16000909号-2', '9');
INSERT INTO `cmswing_setup` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表推荐
2:频道推荐
4:首页推荐', '3');
INSERT INTO `cmswing_setup` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见
1:仅注册会员可见
2:仅管理员可见', '4');
INSERT INTO `cmswing_setup` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认
blue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `cmswing_setup` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本
2:内容
3:用户
4:系统
5:商城', '4');
INSERT INTO `cmswing_setup` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图
2:控制器', '6');
INSERT INTO `cmswing_setup` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1
AUTH_TYPE:2', '8');
INSERT INTO `cmswing_setup` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能
1:开启草稿功能
', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `cmswing_setup` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `cmswing_setup` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `cmswing_setup` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册
1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `cmswing_setup` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day
3024-night:3024 night
ambiance:ambiance
base16-dark:base16 dark
base16-light:base16 light
blackboard:blackboard
cobalt:cobalt
eclipse:eclipse
elegant:elegant
erlang-dark:erlang-dark
lesser-dark:lesser-dark
midnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `cmswing_setup` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `cmswing_setup` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `cmswing_setup` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩
1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `cmswing_setup` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通
4:一般
9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `cmswing_setup` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭
1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `cmswing_setup` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox
1:article/mydocument
2:Category/tree
3:Index/verify
4:file/upload
5:file/download
6:user/updatePassword
7:user/updateNickname
8:user/submitPassword
9:user/submitNickname
10:file/uploadpicture', '0');
INSERT INTO `cmswing_setup` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook
1:Addons/edithook
2:Addons/delhook
3:Addons/updateHook
4:Admin/getMenus
5:Admin/recordList
6:AuthManager/updateRules
7:AuthManager/tree', '0');
INSERT INTO `cmswing_setup` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '4294967295', '1387178083', '1', '10', '0');
INSERT INTO `cmswing_setup` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `cmswing_setup` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭
1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');
INSERT INTO `cmswing_setup` VALUES ('56', 'MENU_GROUP', '3', '后台菜单分组', '4', '', '后台菜单分组，左侧栏显示', '4294967295', '4294967295', '1', '0:不分组
1:内容
3:系统
99:微信', '33');
INSERT INTO `cmswing_setup` VALUES ('59', 'SYMBOL', '1', '货币符号', '5', '', '例如：人民币“￥”', '0', '1457158431682', '1', '￥', '1');
INSERT INTO `cmswing_setup` VALUES ('60', 'UNIT', '1', '货币单位', '5', '', '例如：人民币“元”', '0', '1457158524941', '1', '元', '2');
INSERT INTO `cmswing_setup` VALUES ('61', 'IS_INVOICE', '4', '发票功能', '5', '0:关闭
1:开启', '', '0', '1457158685756', '1', '1', '3');
INSERT INTO `cmswing_setup` VALUES ('62', 'TAX', '0', '税率', '5', '', '填写数字不带"%"', '0', '1457158841664', '1', '0', '4');
INSERT INTO `cmswing_setup` VALUES ('63', 'GRADE_DAYS', '0', '消费时长', '5', '', '（天）默认365天，会员升级，消费金额需要统计的最近时长。', '0', '1457159118296', '1', '365', '6');
INSERT INTO `cmswing_setup` VALUES ('64', 'ORDER_DELAY_FLASH', '0', '抢购订单作废时长', '5', '', '（分钟）默认120分钟，自下单之时起，用户在多长时间内没有支付，订单将自动作废。', '0', '1457159218435', '1', '120', '7');
INSERT INTO `cmswing_setup` VALUES ('65', 'ORDER_DELAY_GROUP', '0', '团购订单作废时长', '5', '', '（分钟）默认120分钟，自下单之时起，用户在多长时间内没有支付，订单将自动作废。', '0', '1457159279852', '1', '120', '8');
INSERT INTO `cmswing_setup` VALUES ('66', 'ORDER_DELAY_BUND', '0', '捆绑订单作废时长', '5', '', '（分钟）默认不限制（0表示不限制），自下单之时起，用户在多长时间内没有支付，订单将自动作废。', '0', '1457159346456', '1', '0', '9');
INSERT INTO `cmswing_setup` VALUES ('67', 'ORDER_DELAY', '0', '默认订单作废时长', '5', '', '（分钟）默认不限制（0表示不限制），自下单之时起，用户在多长时间内没有支付，订单将自动作废。', '0', '1457159425148', '1', '120', '11');

-- -----------------------------
-- Table structure for `cmswing_wx_keywords`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_wx_keywords`;
CREATE TABLE `cmswing_wx_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_name` varchar(50) NOT NULL DEFAULT '',
  `match_type` int(1) DEFAULT '1' COMMENT '1:全匹配，2:模糊',
  `rule_id` int(11) DEFAULT NULL COMMENT '所属规则id',
  `create_time` bigint(13) DEFAULT NULL COMMENT '创建时间',
  `web_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword_name` (`keyword_name`),
  UNIQUE KEY `keyword_name_2` (`keyword_name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_wx_keywords`
-- -----------------------------
INSERT INTO `cmswing_wx_keywords` VALUES ('39', '3333', '1', '2', '1457166661206', '0');
INSERT INTO `cmswing_wx_keywords` VALUES ('40', 'a', '1', '5', '1457167002260', '0');
INSERT INTO `cmswing_wx_keywords` VALUES ('41', 'b', '1', '5', '1457167004975', '0');
INSERT INTO `cmswing_wx_keywords` VALUES ('42', 'c', '1', '5', '1457167007693', '0');

-- -----------------------------
-- Table structure for `cmswing_wx_keywords_rule`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_wx_keywords_rule`;
CREATE TABLE `cmswing_wx_keywords_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(100) DEFAULT NULL,
  `keywords_id` varchar(255) DEFAULT '' COMMENT '关键词id',
  `reply_id` varchar(255) DEFAULT '' COMMENT '自动回复id',
  `web_token` varchar(255) DEFAULT NULL,
  `create_time` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_wx_keywords_rule`
-- -----------------------------
INSERT INTO `cmswing_wx_keywords_rule` VALUES ('2', '规则名称', ',39', ',20', '', '1457166713190');
INSERT INTO `cmswing_wx_keywords_rule` VALUES ('5', '规则名称', ',40,41,42', ',37,39', '', '1457167039798');

-- -----------------------------
-- Table structure for `cmswing_wx_masssend`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_wx_masssend`;
CREATE TABLE `cmswing_wx_masssend` (
  `msg_id` bigint(15) NOT NULL COMMENT '已发送消息ID',
  `mate_id` int(11) DEFAULT NULL COMMENT '素材表ID',
  `create_time` bigint(13) DEFAULT NULL COMMENT '发送时间',
  `sent_count` int(11) DEFAULT NULL COMMENT '发送成功人数',
  `error_count` int(11) DEFAULT NULL COMMENT '发送失败人数',
  `material_content` text COMMENT '素材详细内容',
  `material_wx_content` text COMMENT '微信素材详细内容',
  `type` varchar(50) DEFAULT NULL COMMENT '发送类型',
  `del_status` int(11) DEFAULT '0' COMMENT '删除状态 0:未删除，1：删除',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_wx_masssend`
-- -----------------------------
INSERT INTO `cmswing_wx_masssend` VALUES ('402477905', '15', '', '', '', '{"articles":[{"title":"新建一个素材","thumb_media_id":"wc0LsqkZlrXnMNstWxP4bHmG-UyzdwtMcuY2wFmWH68","author":"abc","digest":"","show_cover_pic":0,"content":"<p>新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材</p>","content_source_url":"http://www.baidu.com","hs_image_id":127,"hs_image_src":"/upload/picture/2016-03-02/bRjow4pnaCqgaMpoOo8h6OXn.jpg","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/tibZ44Dultwric4l8k0iaALRJWFicDuYwH5galJS1o34U98jMkBkU05yn5E4zdkKyD3g8h19lMib9HcQyoydJqhM7bA/0?wx_fmt=jpeg"}]}', '{"news_item":[{"title":"新建一个素材","author":"abc","digest":"","content":"<p>新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材<\/p>","content_source_url":"http:\/\/www.baidu.com","thumb_media_id":"1108503980627","show_cover_pic":0,"url":"http:\/\/mp.weixin.qq.com\/s?__biz=MzA3NDUyMTU2Nw==&mid=402419576&idx=1&sn=f29bef9f1cdbf5884fdaf1d643491297#rd","thumb_url":"http:\/\/mmbiz.qpic.cn\/mmbiz\/tibZ44Dultwric4l8k0iaALRJWFicDuYwH5gzafJ84ezEvpFgfrFYgIZlHusLrrcoAibQMrmZ5z3t3z7xI6h1WkJOeg\/0?wx_fmt=jpeg"}]}', 'newsArea', '0');
INSERT INTO `cmswing_wx_masssend` VALUES ('2549930555', '19', '', '', '', '{"articles":[{"title":"web","thumb_media_id":"rYTK-hn-e5tZ8LXb3ncWVmIXbkt7LYka-TMhTP7ao4o","author":"at","digest":"fasdfasdfdasf","show_cover_pic":0,"content":"<p>fasdfasdfasdfasdffasdfdsaf</p>","content_source_url":"http://www.baidu.com","hs_image_id":130,"hs_image_src":"/upload/picture/2016-03-03/PRmw_LzOUt2_YT_cKvFpYal1.png","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/tibZ44DultwoL7ibeGpeLt1m6y6Y2ZdiakibH2Hbgn0qibHic0FBlAmgosnK5KVrhiceFUicyBkia9s5Y33qRFAiaZkiciaqicQ/0?wx_fmt=png"}]}', '{"news_item":[{"title":"web","author":"at","digest":"fasdfasdfdasf","content":"<p>fasdfasdfasdfasdffasdfdsaf<\/p>","content_source_url":"http:\/\/www.baidu.com","thumb_media_id":"1108504009259","show_cover_pic":0,"url":"http:\/\/mp.weixin.qq.com\/s?__biz=MzA3NDUyMTU2Nw==&mid=402446899&idx=1&sn=aafae322605e2d5beb5e50c3720dc31d#rd","thumb_url":"http:\/\/mmbiz.qpic.cn\/mmbiz\/tibZ44DultwoL7ibeGpeLt1m6y6Y2Zdiakib1RKuKUROfiaVm47qN6eNhc9WlNNVtDaevAgxMC8VHGTdWxbb1JmrCbA\/0?wx_fmt=jpeg"}]}', 'newsArea', '1');
INSERT INTO `cmswing_wx_masssend` VALUES ('2549930583', '19', '', '', '', '{"articles":[{"title":"web","thumb_media_id":"rYTK-hn-e5tZ8LXb3ncWVmIXbkt7LYka-TMhTP7ao4o","author":"at","digest":"fasdfasdfdasf","show_cover_pic":0,"content":"<p>fasdfasdfasdfasdffasdfdsaf</p>","content_source_url":"http://www.baidu.com","hs_image_id":130,"hs_image_src":"/upload/picture/2016-03-03/PRmw_LzOUt2_YT_cKvFpYal1.png","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/tibZ44DultwoL7ibeGpeLt1m6y6Y2ZdiakibH2Hbgn0qibHic0FBlAmgosnK5KVrhiceFUicyBkia9s5Y33qRFAiaZkiciaqicQ/0?wx_fmt=png"}]}', '{"news_item":[{"title":"web","author":"at","digest":"fasdfasdfdasf","content":"<p>fasdfasdfasdfasdffasdfdsaf<\/p>","content_source_url":"http:\/\/www.baidu.com","thumb_media_id":"1108504009259","show_cover_pic":0,"url":"http:\/\/mp.weixin.qq.com\/s?__biz=MzA3NDUyMTU2Nw==&mid=402446899&idx=1&sn=aafae322605e2d5beb5e50c3720dc31d#rd","thumb_url":"http:\/\/mmbiz.qpic.cn\/mmbiz\/tibZ44DultwoL7ibeGpeLt1m6y6Y2Zdiakib1RKuKUROfiaVm47qN6eNhc9WlNNVtDaevAgxMC8VHGTdWxbb1JmrCbA\/0?wx_fmt=jpeg"}]}', 'newsArea', '0');
INSERT INTO `cmswing_wx_masssend` VALUES ('2556300611', '', '', '', '', '', '哦怕p'风格化', 'textArea', '0');
INSERT INTO `cmswing_wx_masssend` VALUES ('2556305274', '', '', '', '', '', 'fsdsdfsdfsdf[得意]', 'textArea', '1');
INSERT INTO `cmswing_wx_masssend` VALUES ('2556306296', '17', '', '', '', '{"articles":[{"title":"dddd","thumb_media_id":"Pi0Cuuy_spnDgDCEsbVSgIyVWr7sNlOC3n2_op23J6M","author":"ddd","digest":"发大水范德萨分士大夫犯得上发","show_cover_pic":0,"content":"<p>fsdfdsfdsf犯得上发射点发大水范德萨分</p>","content_source_url":"http://www.baidu.com","hs_image_id":128,"hs_image_src":"/upload/picture/2016-03-03/23Xpu3B-m6pvp1lr49Syzp1c.png","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/yNHpDQhqmZlyDdIz7HsuBxC9Na7Ria9XMEMOpdJBnhYLFdhOIN0oAYqGhAHlZ77fS7tMEicwHvIAibUFibHa6TIpBw/0?wx_fmt=png"}]}', '{"news_item":[{"title":"dddd","author":"ddd","digest":"发大水范德萨分士大夫犯得上发","content":"<p>fsdfdsfdsf犯得上发射点发大水范德萨分<\/p>","content_source_url":"http:\/\/www.baidu.com","thumb_media_id":"1108510379183","show_cover_pic":0,"url":"http:\/\/mp.weixin.qq.com\/s?__biz=MzI3NjA3NDgzNw==&mid=408816884&idx=1&sn=dd8ccdfbd7d0fd8785f63ed41a1f908d#rd","thumb_url":"http:\/\/mmbiz.qpic.cn\/mmbiz\/yNHpDQhqmZlyDdIz7HsuBxC9Na7Ria9XMos8AcWWBvpB16DKSHg5iaqW02dFG08sCeEzNXqVQicJCp8vLqib56FdXg\/0?wx_fmt=jpeg"}]}', 'newsArea', '1');
INSERT INTO `cmswing_wx_masssend` VALUES ('2556307496', '18', '', '', '', '{"articles":[{"title":"房价上涨","thumb_media_id":"tMnUi4E7UQtt-hn3WJc2AX4wuNZPy6HOpTOvnIl05Do","author":"二师兄","digest":"发士大夫大师傅","show_cover_pic":0,"content":"<p>但是犯得上犯得上法士大夫大师傅</p>","content_source_url":"http://www.qq.com","hs_image_id":129,"hs_image_src":"/upload/picture/2016-03-03/5k4rgSCzUTbtjE7S0it9cUOV.jpg","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/yNHpDQhqmZlyDdIz7HsuBxC9Na7Ria9XMeNzdFx7VFVl0FtWvTuVkPVmabI41zs0VJMtX7OkC9lPNyv4NAjPWXA/0?wx_fmt=jpeg"}]}', '{"news_item":[{"title":"房价上涨","author":"二师兄","digest":"发士大夫大师傅","content":"<p>但是犯得上犯得上法士大夫大师傅<\/p>","content_source_url":"http:\/\/www.qq.com","thumb_media_id":"1108510386186","show_cover_pic":0,"url":"http:\/\/mp.weixin.qq.com\/s?__biz=MzI3NjA3NDgzNw==&mid=408823830&idx=1&sn=405224e4e5a646c2f19a588bcfe46c6a#rd","thumb_url":"http:\/\/mmbiz.qpic.cn\/mmbiz\/yNHpDQhqmZlyDdIz7HsuBxC9Na7Ria9XMCn7nlFYTKPjWsYCeGT15PAmHJ2QsN1LXGeFLZ5wv2nmiaZ3fGpxzUiaA\/0?wx_fmt=jpeg"}]}', 'newsArea', '0');

-- -----------------------------
-- Table structure for `cmswing_wx_material`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_wx_material`;
CREATE TABLE `cmswing_wx_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` varchar(255) DEFAULT NULL COMMENT '微信素材media_id',
  `material_content` text COMMENT '素材详细内容',
  `material_wx_content` text COMMENT '微信同步的素材信息',
  `web_token` varchar(255) DEFAULT '0' COMMENT '该素材所从属的微信公众号id,  0为测试或发生错误的数据',
  `add_time` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_wx_material`
-- -----------------------------
INSERT INTO `cmswing_wx_material` VALUES ('15', 'wc0LsqkZlrXnMNstWxP4bNz1iPPpmGyfwGJ2wgJgkcY', '{"articles":[{"title":"新建一个素材","thumb_media_id":"wc0LsqkZlrXnMNstWxP4bHmG-UyzdwtMcuY2wFmWH68","author":"abc","digest":"","show_cover_pic":0,"content":"<p>新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材</p>","content_source_url":"http://www.baidu.com","hs_image_id":127,"hs_image_src":"/upload/picture/2016-03-02/bRjow4pnaCqgaMpoOo8h6OXn.jpg","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/tibZ44Dultwric4l8k0iaALRJWFicDuYwH5galJS1o34U98jMkBkU05yn5E4zdkKyD3g8h19lMib9HcQyoydJqhM7bA/0?wx_fmt=jpeg"}]}', '{"news_item":[{"title":"新建一个素材","author":"abc","digest":"","content":"<p>新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材新建一个素材<\/p>","content_source_url":"http:\/\/www.baidu.com","thumb_media_id":"1108503980627","show_cover_pic":0,"url":"http:\/\/mp.weixin.qq.com\/s?__biz=MzA3NDUyMTU2Nw==&mid=402419576&idx=1&sn=f29bef9f1cdbf5884fdaf1d643491297#rd","thumb_url":"http:\/\/mmbiz.qpic.cn\/mmbiz\/tibZ44Dultwric4l8k0iaALRJWFicDuYwH5gzafJ84ezEvpFgfrFYgIZlHusLrrcoAibQMrmZ5z3t3z7xI6h1WkJOeg\/0?wx_fmt=jpeg"}]}', '0', '1456896104387');
INSERT INTO `cmswing_wx_material` VALUES ('16', 'Pi0Cuuy_spnDgDCEsbVSgHBmC-42gpodrlKtYwWGbcg', '{"articles":[{"title":"aaa","thumb_media_id":"Pi0Cuuy_spnDgDCEsbVSgIyVWr7sNlOC3n2_op23J6M","author":"bbb","digest":"sdfsdfdsf","show_cover_pic":0,"content":"<p>fsdfdsfdsf</p>","content_source_url":"http://www.baidu.com","hs_image_id":128,"hs_image_src":"/upload/picture/2016-03-03/23Xpu3B-m6pvp1lr49Syzp1c.png","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/yNHpDQhqmZlyDdIz7HsuBxC9Na7Ria9XMEMOpdJBnhYLFdhOIN0oAYqGhAHlZ77fS7tMEicwHvIAibUFibHa6TIpBw/0?wx_fmt=png"}]}', '', '0', '1456973183388');
INSERT INTO `cmswing_wx_material` VALUES ('17', 'Pi0Cuuy_spnDgDCEsbVSgGz_7_fR7NEZ1cP4x99_75Y', '{"articles":[{"title":"dddd","thumb_media_id":"Pi0Cuuy_spnDgDCEsbVSgIyVWr7sNlOC3n2_op23J6M","author":"ddd","digest":"发大水范德萨分士大夫犯得上发","show_cover_pic":0,"content":"<p>fsdfdsfdsf犯得上发射点发大水范德萨分</p>","content_source_url":"http://www.baidu.com","hs_image_id":128,"hs_image_src":"/upload/picture/2016-03-03/23Xpu3B-m6pvp1lr49Syzp1c.png","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/yNHpDQhqmZlyDdIz7HsuBxC9Na7Ria9XMEMOpdJBnhYLFdhOIN0oAYqGhAHlZ77fS7tMEicwHvIAibUFibHa6TIpBw/0?wx_fmt=png"}]}', '{"news_item":[{"title":"dddd","author":"ddd","digest":"发大水范德萨分士大夫犯得上发","content":"<p>fsdfdsfdsf犯得上发射点发大水范德萨分<\/p>","content_source_url":"http:\/\/www.baidu.com","thumb_media_id":"1108510379183","show_cover_pic":0,"url":"http:\/\/mp.weixin.qq.com\/s?__biz=MzI3NjA3NDgzNw==&mid=408816884&idx=1&sn=dd8ccdfbd7d0fd8785f63ed41a1f908d#rd","thumb_url":"http:\/\/mmbiz.qpic.cn\/mmbiz\/yNHpDQhqmZlyDdIz7HsuBxC9Na7Ria9XMos8AcWWBvpB16DKSHg5iaqW02dFG08sCeEzNXqVQicJCp8vLqib56FdXg\/0?wx_fmt=jpeg"}]}', '0', '1456973404507');
INSERT INTO `cmswing_wx_material` VALUES ('18', 'tMnUi4E7UQtt-hn3WJc2AWPLlC8vDXHio-86LjOd1_w', '{"articles":[{"title":"房价上涨","thumb_media_id":"tMnUi4E7UQtt-hn3WJc2AX4wuNZPy6HOpTOvnIl05Do","author":"二师兄","digest":"发士大夫大师傅","show_cover_pic":0,"content":"<p>但是犯得上犯得上法士大夫大师傅</p>","content_source_url":"http://www.qq.com","hs_image_id":129,"hs_image_src":"/upload/picture/2016-03-03/5k4rgSCzUTbtjE7S0it9cUOV.jpg","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/yNHpDQhqmZlyDdIz7HsuBxC9Na7Ria9XMeNzdFx7VFVl0FtWvTuVkPVmabI41zs0VJMtX7OkC9lPNyv4NAjPWXA/0?wx_fmt=jpeg"}]}', '{"news_item":[{"title":"房价上涨","author":"二师兄","digest":"发士大夫大师傅","content":"<p>但是犯得上犯得上法士大夫大师傅<\/p>","content_source_url":"http:\/\/www.qq.com","thumb_media_id":"1108510386186","show_cover_pic":0,"url":"http:\/\/mp.weixin.qq.com\/s?__biz=MzI3NjA3NDgzNw==&mid=408823830&idx=1&sn=405224e4e5a646c2f19a588bcfe46c6a#rd","thumb_url":"http:\/\/mmbiz.qpic.cn\/mmbiz\/yNHpDQhqmZlyDdIz7HsuBxC9Na7Ria9XMCn7nlFYTKPjWsYCeGT15PAmHJ2QsN1LXGeFLZ5wv2nmiaZ3fGpxzUiaA\/0?wx_fmt=jpeg"}]}', '0', '1456995670824');
INSERT INTO `cmswing_wx_material` VALUES ('19', 'rYTK-hn-e5tZ8LXb3ncWVq34nywh3T5vb78AdQ41zUY', '{"articles":[{"title":"web","thumb_media_id":"rYTK-hn-e5tZ8LXb3ncWVmIXbkt7LYka-TMhTP7ao4o","author":"at","digest":"fasdfasdfdasf","show_cover_pic":0,"content":"<p>fasdfasdfasdfasdffasdfdsaf</p>","content_source_url":"http://www.baidu.com","hs_image_id":130,"hs_image_src":"/upload/picture/2016-03-03/PRmw_LzOUt2_YT_cKvFpYal1.png","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/tibZ44DultwoL7ibeGpeLt1m6y6Y2ZdiakibH2Hbgn0qibHic0FBlAmgosnK5KVrhiceFUicyBkia9s5Y33qRFAiaZkiciaqicQ/0?wx_fmt=png"}]}', '{"news_item":[{"title":"web","author":"at","digest":"fasdfasdfdasf","content":"<p>fasdfasdfasdfasdffasdfdsaf<\/p>","content_source_url":"http:\/\/www.baidu.com","thumb_media_id":"1108504009259","show_cover_pic":0,"url":"http:\/\/mp.weixin.qq.com\/s?__biz=MzA3NDUyMTU2Nw==&mid=402446899&idx=1&sn=aafae322605e2d5beb5e50c3720dc31d#rd","thumb_url":"http:\/\/mmbiz.qpic.cn\/mmbiz\/tibZ44DultwoL7ibeGpeLt1m6y6Y2Zdiakib1RKuKUROfiaVm47qN6eNhc9WlNNVtDaevAgxMC8VHGTdWxbb1JmrCbA\/0?wx_fmt=jpeg"}]}', '0', '1456999730715');
INSERT INTO `cmswing_wx_material` VALUES ('20', 'WHaDQ3y1CKv2E53_pazWIVY3E4LrPQcM6-iGh-otUfk', '{"articles":[{"title":"mawt","thumb_media_id":"WHaDQ3y1CKv2E53_pazWIeMAv9lb3G5B-0milOTSTDM","author":"","digest":"fdsfdsafdsafdasfa","show_cover_pic":0,"content":"<p>fdsfdsadfsa&nbsp;</p>","content_source_url":"http://www.baidu.com","hs_image_id":131,"hs_image_src":"/upload/picture/2016-03-05/ORumm4ua0wP8VFVX2U_q_smf.gif","hs_image_wx_src":"https://mmbiz.qlogo.cn/mmbiz/tibZ44DultwqO95lFLgR0r32eqOhRwRm16mvMegFJLT14SsPKRoiaOWNnFm5Ttv9qIJqAD87GvMqDuvVwgS6dF0A/0?wx_fmt=gif"}]}', '{"news_item":[{"title":"mawt","author":"","digest":"fdsfdsafdsafdasfa","content":"<p>fdsfdsadfsa&nbsp;<\/p>","content_source_url":"http:\/\/www.baidu.com","thumb_media_id":"1108504043141","show_cover_pic":0,"url":"http:\/\/mp.weixin.qq.com\/s?__biz=MzA3NDUyMTU2Nw==&mid=402480783&idx=1&sn=ba123a5566719f12d7468c117d833c50#rd","thumb_url":"http:\/\/mmbiz.qpic.cn\/mmbiz\/tibZ44DultwqO95lFLgR0r32eqOhRwRm18pkQ40UKakkoTlE0B54mKmKy87ibkiaoSesbYLMVxrzQVzjXZibYENwrg\/0?wx_fmt=jpeg"}]}', '0', '1457150761226');

-- -----------------------------
-- Table structure for `cmswing_wx_menu`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_wx_menu`;
CREATE TABLE `cmswing_wx_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `m_id` varchar(50) DEFAULT NULL COMMENT '微信菜单ID',
  `sort` tinyint(4) DEFAULT '0' COMMENT '菜单排序字段',
  `pid` varchar(30) DEFAULT '0' COMMENT '0: 一级菜单 1：二级菜单',
  `title` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关联关键词',
  `url` varchar(255) DEFAULT NULL COMMENT '关联URL',
  `web_token` varchar(255) DEFAULT NULL COMMENT '公众号Token',
  `type` varchar(30) DEFAULT 'click' COMMENT 'click:点击推送事件 \r\nview：点击跳转URL\r\nscancode_push:扫码推事件\r\nscancode_waitmsg：扫码推事件且弹出“消息接收中”提示框\r\npic_sysphoto：弹出系统拍照发图\r\npic_photo_or_album：弹出拍照或者相册发图\r\npic_weixin：弹出微信相册发图器\r\nlocation_select：弹出地理位置选择器\r\nmedia_id：下发消息（除文本消息）\r\nview_limited：跳转图文消息URL\r\n',
  `status` tinyint(11) DEFAULT NULL,
  `media_id` varchar(50) DEFAULT NULL COMMENT '永久素材ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `cmswing_wx_menu`
-- -----------------------------
INSERT INTO `cmswing_wx_menu` VALUES ('44', '微信商城', '1456902635288', '1', '0', '', '', '', '', 'click', '', '');
INSERT INTO `cmswing_wx_menu` VALUES ('60', '121', '1457079137933', '2', '1456902635288', '', '', '', '', 'click', '', '');
INSERT INTO `cmswing_wx_menu` VALUES ('53', '微信卡', '1456993411507', '1', '1456902635288', '', '', '', '', 'click', '', '');
INSERT INTO `cmswing_wx_menu` VALUES ('72', 'fe', '1457150689325', '3', '1456902635288', '', '', '', '', 'click', '', '');
INSERT INTO `cmswing_wx_menu` VALUES ('62', '子菜单', '1457079159237', '1', '1457079151148', '', '', '', '', 'click', '', '');
INSERT INTO `cmswing_wx_menu` VALUES ('73', 'few', '1457150696820', '2', '0', '', '', '', '', 'click', '', '');
INSERT INTO `cmswing_wx_menu` VALUES ('64', 'say hello', '1457079181772', '1', '1457079168092', '', '', '', '', 'click', '', '');
INSERT INTO `cmswing_wx_menu` VALUES ('67', '画虎', '1457083393294', '1', '1457083378471', '', '', '', '', 'click', '', '');
INSERT INTO `cmswing_wx_menu` VALUES ('69', '巍峨', '1457148884776', '1', '1457145396195', '', '', '', '', 'click', '', '');

-- -----------------------------
-- Table structure for `cmswing_wx_replylist`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_wx_replylist`;
CREATE TABLE `cmswing_wx_replylist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(13) DEFAULT NULL,
  `type` enum('news','music','video','voice','image','text') DEFAULT NULL,
  `content` text,
  `media_id` varchar(255) DEFAULT NULL COMMENT '通过素材管理接口上传多媒体文件，得到的id',
  `title` varchar(200) DEFAULT NULL COMMENT '消息标题',
  `description` text COMMENT '消息描述',
  `music_url` varchar(255) DEFAULT NULL COMMENT '音乐链接',
  `hq_music_url` varchar(255) DEFAULT NULL COMMENT '高质量音乐链接，WIFI环境优先使用该链接播放音乐',
  `thumb_media_id` varchar(255) DEFAULT NULL COMMENT '缩略图的媒体id，通过素材管理接口上传多媒体文件，得到的id',
  `article_count` int(2) DEFAULT '0' COMMENT '图文消息个数，限制为10条以内',
  `articles` text COMMENT '多条图文消息信息，默认第一个item为大图,注意，如果图文数超过10，则将会无响应',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片链接，支持JPG、PNG格式，较好的效果为大图360*200，小图200*200',
  `url` varchar(255) DEFAULT NULL COMMENT '点击图文消息跳转链接',
  `web_token` varchar(255) DEFAULT NULL,
  `reply_type` int(11) DEFAULT '0' COMMENT '回复类型 1：关注自动回复 2：消息自动回复 3：关键词自动回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_wx_replylist`
-- -----------------------------
INSERT INTO `cmswing_wx_replylist` VALUES ('2', '', 'image', '', '', '', '', '', '', '', '0', '', '', '', '', '');
INSERT INTO `cmswing_wx_replylist` VALUES ('4', '1456999923044', 'text', 'kasdfjj', '', '', '', '', '', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_wx_replylist` VALUES ('5', '1457054837059', 'text', 'asdfsa', '', '', '', '', '', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_wx_replylist` VALUES ('6', '1457057377461', 'text', '啊打发', '', '', '', '', '', '', '0', '', '', '', '0', '');
INSERT INTO `cmswing_wx_replylist` VALUES ('7', '1457087578779', 'text', 'adsf&nbsp;', '', '', '', '', '', '', '0', '', '', '', '0', '0');
INSERT INTO `cmswing_wx_replylist` VALUES ('9', '1457145351006', 'text', 'asdfad', '', '', '', '', '', '', '0', '', '', '', '0', '0');
INSERT INTO `cmswing_wx_replylist` VALUES ('19', '1457147389088', 'text', 'adfa', '', '', '', '', '', '', '0', '', '', '', '0', '0');
INSERT INTO `cmswing_wx_replylist` VALUES ('20', '1457147444693', 'text', 'adfa', '', '', '', '', '', '', '0', '', '', '', '0', '0');
INSERT INTO `cmswing_wx_replylist` VALUES ('32', '1457162747756', 'text', '445', '', '', '', '', '', '', '0', '', '', '', '0', '0');
INSERT INTO `cmswing_wx_replylist` VALUES ('37', '1457163165543', 'text', 'adsfasdf', '', '', '', '', '', '', '0', '', '', '', '0', '0');
INSERT INTO `cmswing_wx_replylist` VALUES ('39', '1457167039798', 'text', '测试abc的自动回复功能', '', '', '', '', '', '', '0', '', '', '', '0', '0');
INSERT INTO `cmswing_wx_replylist` VALUES ('47', '', 'news', '[{"title":"房价上涨","description":"发士大夫大师傅","pic_url":"/upload/picture/2016-03-03/5k4rgSCzUTbtjE7S0it9cUOV.jpg","url":"http://www.qq.com"}]', '', '', '', '', '', '', '0', '', '', '', '', '2');
INSERT INTO `cmswing_wx_replylist` VALUES ('52', '', 'news', '[{"title":"web","description":"fasdfasdfdasf","pic_url":"/upload/picture/2016-03-03/PRmw_LzOUt2_YT_cKvFpYal1.png","url":"http://www.baidu.com"}]', '', '', '', '', '', '', '0', '', '', '', '', '1');

-- -----------------------------
-- Table structure for `cmswing_wx_user`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_wx_user`;
CREATE TABLE `cmswing_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '粉丝ID',
  `subscribe` int(11) DEFAULT NULL COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。',
  `openid` varchar(100) DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `nickname` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户的昵称',
  `sex` int(11) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(50) DEFAULT NULL COMMENT '用户所在城市',
  `country` varchar(50) DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(50) DEFAULT NULL COMMENT '用户所在省份',
  `language` varchar(50) DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `headimgurl` text COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `subscribe_time` bigint(13) DEFAULT NULL COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
  `unionid` varchar(100) DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。',
  `remark` text COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` int(11) DEFAULT NULL COMMENT '用户所在的分组ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1744 DEFAULT CHARSET=utf8 COMMENT='微信粉丝表';

-- -----------------------------
-- Records of `cmswing_wx_user`
-- -----------------------------
INSERT INTO `cmswing_wx_user` VALUES ('1554', '1', 'o33lBt0Pz3rEXUARWtUUO5GxuUG0', ' 阿 特 ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr6pFXjQd4NEO1dWC8Atlib6Y5pLdxQHNiaWqpxcZmA5mnxzicYejNoU7uTSuw29sQG04mjwIEO4rBUw/0', '1445592951000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1555', '1', 'o33lBt-rbaJuS11dbRUjNeR12wn4', ' 地 球 屋 零 食 驿 站 ', '1', '淮北', '中国', '安徽', 'zh_CN', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELaEUaXdAGrwVV5ykBGM1poDywic7dNuesdhUqH31ic3fdf70GXhS9zQkRZ7wNdfMvYKZQZkxyKwdsw/0', '1440583938000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1556', '1', 'o33lBt0nWQQQD3Yq3pdysE24ambA', ' 峰 『 沃 』 梅 ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1nyQZ4D4KRialkCj0d4SM4WmDOziclbafaQQXuXUKriawyPsNRbWvpIpsibicuqDkYl5ic3hbkJkxLa6V0A/0', '1445592972000', '', '', '100');
INSERT INTO `cmswing_wx_user` VALUES ('1557', '1', 'o33lBt5x6w-nsEam58BUdGMfkeDA', ' V I P ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5Mvs7yibR3AXdrU71WnNw8ArZ2q76bznibXicFGVwibkd5Nv5J6nQVKMhZqjIlH15aRpcJpPibPibeW4Gw/0', '1438741015000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1558', '1', 'o33lBt80WXrW2V_-KZ7cSAXwF9P4', ' 头 狼 电 商 C E O 朱 加 宝 ', '1', '深圳', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshPFA3ibXdOJKw5ZcWLxofQJUHhKtpiaqXE5z5wVbUNOb97TzNLcAMzG23FsxIBKm4ZpDjAF4gXXa1KffcdIjNlTY/0', '1428995926000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1559', '1', 'o33lBt2cS_90vF0TKWaIY1Eh13nM', ' � �   B e a r x i w i   � � ', '2', '武汉', '中国', '湖北', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5Vq0KjBjDgpr0RZCxhhHFJcNaBwjTvej04L2lTQKslj1eQwt5xib9HQrQ034NK3Zt4iaK2TNp3f3icQ/0', '1432717201000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1560', '1', 'o33lBt78cAEU6twkkGX8ymvJmD5s', '  金  ', '2', '洛阳', '中国', '河南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1mQbb7yJ3rGeHFQskYaFmdqOIC1ZARDRrzNjbUXYianm43KurjM2hmfyjOGq5Su8hMAy0awVcIo7cw/0', '1443108841000', '', '金', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1561', '1', 'o33lBtwyePBtiyBzgHdmQN3bXEAY', ' 杜 喜 ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuialiaBbYXI6sEHW3tibnRpZiaice1m5CzqRklTmft5T94MPwqC8LxqJyUoJibehPnymfsy9jA1ssQIwUTHVO2MPKkwE/0', '1427964371000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1562', '1', 'o33lBt6seqBYZKgh7__dysE_hUoY', ' A d u ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshPFA3ibXdOJK0zHQ3avLfIiaSicFvbjvYsFxdf8GGOricibkGzrSdJiasopxfEiajwWaicxfKPK1aGoD9F6DXvIcFvLia6N/0', '1429611499000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1563', '1', 'o33lBt4eBBFFO2u4hfY28Ry9vN-U', ' 安 静 ', '1', '徐汇', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA4sLtic6pgG7zUaCzjlhwaYibN3EWrJM3fVrgzZsicXgnmdtric9DlhyibzDx0SHnpedwXcBBaE2icUE3A/0', '1429947807000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1564', '1', 'o33lBt1Hv-EjBBCMsVvWhbrz8lKY', ' 花 久 美 ', '1', '泰州', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIPt0Erg6HKiaYL3XXyBiblEabkYRSiaiauCtNmo6MQKHheeSiat4lF8IGbrmyavib15KLlEq1qvLfpHOWQ/0', '1440408128000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1565', '1', 'o33lBt-zyAy1Humy_NW8lplcBH3c', ' 可 可 ', '2', '柳州', '中国', '广西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshPFA3ibXdOJK0icfwytVEedvicwQ3FiaFVMC7gvSn1Oxv5ibR0nP9aHaEWsL4qtic1SvXqKRUdV0WHsHSTXV2ClNRIlz/0', '1432717169000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1566', '1', 'o33lBt_L0lpsBx9Etdh9MrlKKXd4', ' 夜 未 央 ', '1', '朝阳', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELSfbvMgyDgqEB6jnFt5a29ry1TFjIKTVcs5mxMZ0deVpgWjGqoJibjficz7KYUCMufrb7vAnNNnPsA/0', '1439127019000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1567', '1', 'o33lBtyC4whTOlC_RcZJB8ci_mPI', ' 萱 萱 ', '2', '昆明', '中国', '云南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHpED4laKMoWDztWzxATdC6s9lIQZRHtpQ4UzFdQM7jnuYYszgUaV3m0WIz6cW0gmzN07NXwgVTuAwANGiagKEAbz/0', '1432716862000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1568', '1', 'o33lBt3ohgQvuJjrr6MG0LCw3dA0', ' G G ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNuLtPiaF79IpYqMKSbktcz2TRfygu6YM2JuOFgzwDlVicLz8ickbtRFSnCN99w0G14dYW8zvW5wD4w/0', '1440585547000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1569', '1', 'o33lBt0-x92aL7YFkVMWuYtUjzE0', ' 童 话 @ @ @ ', '1', '濮阳', '中国', '河南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1nYwicVOdicEmgryd6XhSgGaHFJDm4zb2icKAEb7MrUUPEElqONaia4dyrLeUmwGxYQib2y0Ue94W59CoA/0', '1432606299000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1570', '1', 'o33lBt5H3g0lOrxSbNEMjUyz5CUE', ' 领 金 财 务 ', '2', '', '中国', '重庆', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshPFA3ibXdOJKib8Bt1wBxUNag472pUrAkBjSwoXUqPKQvZZuWdiax95QBsrBX5ypibzOh1Nd2PFjfNEApibZjF7m0icA/0', '1440583574000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1571', '1', 'o33lBtx2Qm7V-QrugPOa4ehzy6wI', ' 花 宝 宝  ', '2', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHpED4laKMoWDwY7vfPqrx7ympzbFwCBsuo877b9B1HtnGSQ8GdIHib5XicibhXLxFuKyaibTuf1AKcJqnkyA77r1bqn/0', '1440584169000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1572', '1', 'o33lBtwLArbUSMCxWf9nAZnVLK4o', ' 高 雯 ', '2', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHpED4laKMoWDz9s7uTdGyvZI3U6hicPG7Zwib8ez4nibhl6x9oY32nCQAUm8bCdd7KH4wXjjSNMqNeEibPhXnGtbzDN/0', '1432286488000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1573', '1', 'o33lBtyJ6izaBZ3Qzp2Cci8h-2nI', ' 啊 磊 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELqFicTtzP8ViaImLUsewiakFuYeDs6icric4xEbiccmhvmkhBp1tEb5iazvqnU3ia81ulUmYNNPhPUN4TppA/0', '1432286537000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1574', '1', 'o33lBty-CkPeLKzkXywj1xrRGL4E', ' 1 2 3 z ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshPFA3ibXdOJK3oNCBx9476ibfBgcwqdO7y0aRtIImVcJDWdKaDVy3iagUDNweMR0JUsIkgbkHB0jO9pWIaCzHDaxK/0', '1432286457000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1575', '1', 'o33lBt8HZ6gTPyk2pdrgHRPKmfaY', ' 一 切 的 一 切   � � ', '2', '朝阳', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshPFA3ibXdOJKyhvpvhWick59EJaWq86GdhTxFLW7AFczPbfDrGoKUNar8jtfYWJymUeYqlFRDC9oRNBf7xdNiaeHJ/0', '1440587002000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1576', '1', 'o33lBt8xJcPqHjluPPXFVTporE_U', ' 淘 宝 店 铺 号         1 8 7 9 9 9 9 ', '2', '金华', '中国', '浙江', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHpED4laKMoWD1xUbbiakZeiawgjR5IPLJkbefBPicPDJhXreHnczytzVQicvY41tqicPPtFibjiaLdicjH028ywECiafIVlK/0', '1440583690000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1577', '1', 'o33lBtzwXTYvexNXc2PMAf-jkxjw', ' a r n o ', '1', '深圳', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1mianubgat840YsFEnTUX0m87PFBhssmwxkzRg6aCRpdXowiaZLsJHOAtzdpnDuoCGTwsgZcmqjBhFg/0', '1432717729000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1578', '1', 'o33lBt-KbgpHJK7qGEnnh5gd4WOU', ' 旺 旺 旺 ', '1', '柳州', '中国', '广西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI0Nltqq9ChWXa7DEJQZygPRPbb7xTYrZUn7OxWIlqu37RF8tTFpbctqUopEknEADSqFw1x7E4Cibw/0', '1432716908000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1579', '1', 'o33lBt6iNEvu2FfWOfDeIzRt6vyA', ' � � V i c k y   � � ', '2', '朝阳', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuialiaBbYXI6sMkszeajO8M7V8rrAf8JhSiaOoicicEeiba6kicRaIeQOKhK1UBaTv2qicvLGmhXdrL0SmVdbwVdlIVYrB/0', '1440585071000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1580', '1', 'o33lBt_ZcVP7ifRWDKfNTdFTm9GQ', ' m i 雨 泪 ❤ ️ 碎 ', '2', '邯郸', '中国', '河北', 'zh_CN', 'http://wx.qlogo.cn/mmopen/h5ndnicia3Rkw9R27OlfWPHoW6He1w9Oq1C8s8vUibUiawzPic1UmicIzy2atfVL3bljxAFaPPPcnJY5z4FvzKv9aGUO1hl9tWWELO/0', '1432286422000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1581', '1', 'o33lBt1wRrNLHUBVICPGjigMiaAI', ' 杨 丹 ', '1', '', '中国', '贵州', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM52vG8V5veNKjU8e5kMnGCcuESTnTILItovhHfzqrmueR7Qm3psdY9OmWvUKxEibXiaxXqvNibg0B12KnGKwicMeqWwXKU8jXfG9Us/0', '1440584791000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1582', '1', 'o33lBt4bAG5kQ7hvRSD-lgSgwrtU', ' 亚 洲 杯 ', '2', '东莞', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuialiaBbYXI6sPXlgtsXC1icib5B2FbXOlMM4r5cfeicLsOAox3DQstJRtUCKJCc7zv6Oa51As7icdHrujgAfYY97FJZ/0', '1440586427000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1583', '1', 'o33lBtwF6Jhle1tx6YjAO37vj1No', ' 龙 哥 ', '1', '深圳', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshPFA3ibXdOJK4b1pWicZoTX0mKIyEJpibSWkIjrdibrtps5gdQmG3icrWy3HhNicmQEiasd400tGEnXQ7UfL5IJySGwGF/0', '1440584548000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1584', '1', 'o33lBtzoWgoHZP4F1rf2qHDYTVoo', ' 一 二 三 亖 ', '1', '北帕默斯顿', '澳大利亚', '北部地区', 'zh_CN', 'http://wx.qlogo.cn/mmopen/sdXe7M2egibW5MjcC0HIUgOAzkw1tbdfZsY5oBARSpSomZnpx8jm5sZlTBWTJ5sTZWxiamJ08NBN8lfdw5L1LdtbEjjZV0ibqtP/0', '1440585672000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1585', '1', 'o33lBt90dhhy50dH2dT_niVMBRMU', ' 王 庆 阳 ', '1', '渭南', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHpED4laKMoWD0G4qvyUCqPcOtpfueKXZMtGn0JkaQrxh1AwJiaA7Zm7IMbYbqBYVqjb12JlflaPEhTZGKGDpVVPw/0', '1431234155000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1586', '1', 'o33lBtwwTpfseijaBjGvr85vgzsI', ' 一 事 无 成 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/sdXe7M2egibW5MjcC0HIUgJYjMjxWv3jgJp9J84ss7VlqibUmDpicSqxNPclcGFvawpibz095X7xTV7PTpqumAQ7x6FOQdMSCLhD/0', '1432286438000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1587', '1', 'o33lBtwsgr0qUHM5sEmmzZkUwylk', ' 怪 我 过 份 美 丽 ', '2', '', '中国香港', '黄大仙区', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1lHL3ibjzPCIO23pahb7f50LibXj7XKc4tUOZWiaIecAtJw1OQB6jLT7bnaWtvFXoYfglsLmOHmxtzLl4Ro2KmleoD/0', '1440584857000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1588', '1', 'o33lBtzQPWTc9X-kPoNQpl4v2dbA', ' ☞ 你 真 逗 ☜ ', '1', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr4ftSnibBTfMibgqOR3JCbhCEMROfavmHKNTHqWmJhqJT4sffIUVg1lq9sGGicFpyXiaTEbaDRYNnxpBETH23kHpl8/0', '1440583711000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1589', '1', 'o33lBt2ylyphz9buW9ShRRwybJsQ', ' 孙 竹 伟 ', '1', '徐汇', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabWNNSj9H6v5cT6ATWw8wuFe97N307CHeELu2JnCfVhcYuYCWK8GtfJxNGUGsf7uTevoFibQU3E8EZ/0', '1432946516000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1590', '1', 'o33lBt49EqK4_J05FkzV5XwI5fzE', ' v g g j v f ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCsbKtnG0ZvoaQibAUFX9dib5WMyp0mjmnFP5RSZW9BGeP9n4OQXj6iaqicyBpcFpUibO0q8Kzb8DNA5ZUSicXCHvmCS46/0', '1440583600000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1591', '1', 'o33lBt9t4iY6yhJxmisY1fZU2mdg', '   1 2 3 4 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/0vN7h0icqp66sxkGns8JKvsibiaOICsdLgK8XgGEV1tvtib5h9JPics04hmq9LzQ39D0b9dUcUIVIUlwmaia106JJoxEo6oWRa4c1o/0', '1432286453000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1592', '1', 'o33lBt8WJcBmziIcbOEc3J1Kh3qA', ' 破 哥 ', '1', '泉州', '中国', '福建', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabSqOB2CVPsvl1dWsUCibuLP5OONJ6EZtOIVPAeAg4nzahrBVqZfC80UKcrSQGFHVibwtm1wfvZw7uy/0', '1440585293000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1593', '1', 'o33lBt4VOcpqOQEUxPPUS9DLoN30', ' 女 汉 子 也 有 柔 情 时 ', '2', '大兴', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHpjfyfOTa6ZNicxT6Obriatr1XRbg6JrYM5ulEibsskkTteYarlMKx0ThjIovgqdDSmkMSRwju8dmwaZO6FficlgEjib/0', '1440586073000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1594', '1', 'o33lBtwmmiPGk3GuTRfMDEuSUANk', '  ', '1', '', '安道尔', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBgplv4qJqAs9lkZdptQEA5KFP5y4nqxRfmjUunurTOxcjXoUK1FK3XZxVeGaOSPiasGBCCHo8FZ7BstxGWry5ic9E4M46y7StRA/0', '1440583893000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1595', '1', 'o33lBtwXO3Na5dHJyg_4zoL8YkHY', ' 约 驾 客 服 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsjFLYXuFSeicvibn99K31plhIxntG6c1ZISqWm0mWMExXcSX2N2vnXjtJwHYkAs4nBBG8cZIcxfeUmKZyzYmEvLfa/0', '1440586721000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1596', '1', 'o33lBtzrZUxGTahubqAzsm6SaSdg', ' 我 不 是 土 豪 ', '2', '', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuyha6jTsbyRUOW6AgNLRv9ESEcSw97l757TUDYbpNfQGybIXuPdm8YY16eagh7aria0qFgbq6PAUefqTJgaiaKEy/0', '1440586905000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1597', '1', 'o33lBt026HsWV4hxUizc_SDlPy0c', ' 峰 ', '1', '南京', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHore5YPzUic8FJdL5o5U1gR9RmiaibJCFmFiarQdu2FL8BVxaOUouPgE831nze8ZIR4WrSTN4MXuS00P3huVwvEMVGh/0', '1432606271000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1598', '1', 'o33lBt8zL_YUkncWq4yjx__LhMio', ' 娇 香 世 家 ', '2', '', '中国', '天津', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5AGrn2EpHCLrlUHibd6t4ODxIaBGdtqHaqF0F6lpFJoPqeBTzlSA5iaDiaJM3Jaiae1AzzwZNE1EofOPialhQicucwBGLAx6BOh3nPo/0', '1440585964000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1599', '1', 'o33lBt7D08S0GXeaYOaw3sOVzJrg', ' R a i n b o w ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr8iaXsf8YlB1E5Pq34EiaY8vcSlVDibs0sfqevTmvvvib9G05iayJB22lO0wQ3Dh6FfKh9MUOArT4VKcKIWpPhB89YL/0', '1429600474000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1600', '1', 'o33lBt1FdLB0HaaTBpBFMDgguP9k', ' d r a g o n - 惰 ', '1', '杨浦', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Nc5ibKmjHqIUy2vnibXu3EEoWdGZqASEBW7reVVcQTnrskW29KUrIpeT9XkHdHNIyXhOQUvtOcQOYyljQkO4FPQ1ngIdwvlyhM/0', '1432717000000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1601', '1', 'o33lBtxYEsMGN0YZaI2J-Jcn2gak', ' 心 阳 ', '1', '杭州', '中国', '浙江', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHpKkgT9h4KZpoQ7y0cBkHa9ZrcvVxJ9EnJYOYwicwKE6xJ4kqMnJC2wvkebGTTT0DORsg2YMYyW584sNWyRRkJey/0', '1432716914000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1602', '1', 'o33lBt4M4yzALjWAxf0EWW3xpVzI', ' 蕾 拉 小 姐 ', '2', '望德堂区', '中国', '澳门', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsiaTjQQKPriaSvqcBPIr7uB72LhPmnlODoPHkbHuBnsiaMgxQaZchldt4QuzFeJWyoGDltu5NI1G2icbzzevRvlhb89/0', '1440584835000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1603', '1', 'o33lBtwQfaoz4VFrxd_drP7qrT_Y', ' 世 界 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM46ONANGNjhU0KFzJIndnmo29gvQcQ9VNBUd6U5wb3ibBY8oiaEeslKiaDpyvwArCIdWotRPT59pbSH8sLE3IgW6vt84Vc5z3C6gY/0', '1432717024000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1604', '1', 'o33lBt1bVHvfbsTEPlriNPYU4GIQ', ' 多 么 哇 塞 的 姑 娘 ', '2', '佛山', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsjPlq6RAwBKKibxFSQy8clicT2AoImdFshtMEny4BUD2dNNBZZWnPiakxFqTc8wSbmW1yMn9xzAJpPTYQf6WTKgibDZ/0', '1440585328000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1605', '1', 'o33lBtx9sl2HRvd5tjxPbdtuScVw', ' 幸 福 来 敲 门 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsiaMIcmtJialKLeDZYNfeG3U0bG5HvYxsyf5tyu0iauGTJUNyNlOyFjOicicamWGtU0a1LAR3uFyfsroA9j1KS3e0CPq/0', '1432286526000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1606', '1', 'o33lBt2rnpEzLwCryhy0QrZb1xQk', ' 郁 . 轻 . 砂 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCtYXmrALIPwDOW4kFOTYGGSa7toY3AF4icnZqnFKAZvic4TGw6A55GrXzDteSpHtAESB9yAYkicb1zLQnRQeLU5WxU/0', '1432717179000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1607', '1', 'o33lBtyeBYwnYxNQwhLW-eZmmrQo', ' 快 乐 女 人 ', '2', '东莞', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsiaBSFWG6E1y9sX09vNHDibDIfzLmLzByJO7WsnBYFxRhjNxajJUanTibLUFibRW1Fjn379YpXcK40Cib2u6uObK0sGu/0', '1432286532000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1608', '1', 'o33lBtxWqkEyiT8EYyCDaVKbx--Q', ' 榆 木 。 ', '2', '', '捷克共和国', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabaSb5OX7dCa9mtoiamAAg53W7BDe1GYibicHUXBGR1S6wAJBuVhpOAsq7gR5ohnOBcKqjAENATNeDn7/0', '1432286474000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1609', '1', 'o33lBt6Zey0M52UM5EWYLZgXDE0E', ' 陈 金 龙 ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2picglhRiaZcwUJLxMV5ChvxH1ntppe0LdgvTQSibRb3jvSLp6udxdqicwnkLSsp9bsicLBIWJwtEpgUyR/0', '1455930727000', '', '', '100');
INSERT INTO `cmswing_wx_user` VALUES ('1610', '1', 'o33lBt6VlJLy9ZMRRDAP17YHMszI', ' 无 敌 大 美 兔 ', '2', '朝阳', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHqG70am30u0xjnmRzYE4ULibxiaia76OibXRYd1rv6dcKdDF1N5rnN6tCibPxErVAqPUbCe5QRHA19pAFhupXicn6hF9Y/0', '1440585978000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1611', '1', 'o33lBt9tafiPIfOKhvQEpmOdyDlc', ' 蝴 蝶 效 应 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1kyFicdCmdln2pficG62icB6vxSlZ4hcHYiagzagU5rrLsRQXibFOIhQveLvaOen6CgPz0uQ38kNN6If74Wc3TSzYNz9/0', '1440585620000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1612', '1', 'o33lBt7QRYM5NcZ8DNgV0io9a7Fw', ' 卢 � � 静 宸 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHqjK3pRW6ReF6Tapw4NLVQkMtcAEGvTNfA5xbBIHxaTjcKzxBOibDBHIEkx90PZjOtjds1Mf6auB5vDSU9LVhkMp/0', '1440585023000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1613', '1', 'o33lBt0vJC-CX0fGXzUs7ZUZDdOI', ' 阿 金 ', '2', '金华', '中国', '浙江', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHqNcLBwyJrGnvzFyeV8ia49ZfyeJrtQmickytRgwpnrnZJkpBtqUg6sXdKibq3pkXasLsT7hzicf1Klq0YAu0KstjSD/0', '1448908622000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1614', '1', 'o33lBt0vLQF0je3NLvCP8xRSsNyc', ' 不 潮 不 酷 不 帅 气 ', '1', '石嘴山', '中国', '宁夏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1nMMlcFv9o1tsejm1Aod3V752cn6tAApTjpsPfweG8ViasfESPbKG4eiaVocz3z4PML9YbibFJkRCicgOWnt8ULNmr2/0', '1447868819000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1615', '1', 'o33lBt5rDWwP568rq1YaOpGQph_4', ' 程 程 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHrgvYVVl35WIXiaVK23PP69g2e8NfyqJHvkQoaTIJTyoHLjR2ONUftggOc2gJ1gLKe1avYHBD61NlfXvKG5vg9HH/0', '1432717167000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1616', '1', 'o33lBt_whLcW4teLSWRLSP1PbIws', ' A 兰 敏 ', '2', '武汉', '中国', '湖北', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2pice0WOpLv95Rqia8Lr1DUExlI2UUiaLIMyMHEo610ibaWfOdSEuCgAtK6fDCa86U8HuTOOTnR4kLicKib/0', '1453306766000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1617', '1', 'o33lBt-RK6WVJhOMP0hL73zpf0FU', ' 1 2 3 ', '1', '', '丹麦', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsj5RVdtHJkjSt5Z3vDbbcdL3N4kD4nSKUy2gZ1qcQM7eHD7egG1BeWHpB0Yf987x6hSGsCDWzJ1xmhC3tRtOlA3/0', '1432716976000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1618', '1', 'o33lBt2nOy_Osh2NziXnzLIBQALk', ' 残 阳 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/oG5Aqnzg8ozrLfrcRvicQYcXFricOT5bStAUBOaKsIIdtEHbicK2l8Vnhr4WPE8KbMGZM0wWwIWpZLrogL4ibk9TNiaoOWxAN8SXD/0', '1440583798000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1619', '1', 'o33lBtz7dWN12qaCBGq1uDGJYBiI', ' B o n n i e ', '2', '', '博茨瓦纳', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/39vnA4SRXWj8moyMV1c4RwlOtvX9DuhV4XicBn0NPK39XibK15MiaMcpEtgbgVVedbIVnGBxahUDMbItQItVpeAcspIEHljQIOic/0', '1429564000000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1620', '1', 'o33lBtwmp2Auunk0XixOUBnTJmgs', ' 沐 汐 ', '1', '', '毛里求斯', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2p2vcRPKH8177jTwUKgpaKTMjKMTM58G2DHRohAKTkiaNb5Gt810Lpox9ap3CjxTwruRzn0icVCMP4C/0', '1432717028000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1621', '1', 'o33lBt3cmgS-ngqkx4AV1_Cjzxi8', ' 臻 磊 文 化 - 国 栋 ', '1', '杭州', '中国', '浙江', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5YGCiaCLzcLkLpIvL8heGY9jQKgnicoquCCghOw0NZyGmHhibNLC0dZl53T8LBIgafELQcWM6c5w0j6HicndGotPSnXOsVqD4n7AE/0', '1440585165000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1622', '1', 'o33lBt9-N3N8Grp-dPxeJYY-xNPo', ' 守 望 & 人 生 ', '1', '苏州', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCup6kRBBiamqp7waYovHYtNER71hA5PFxHFJFF2ibKh6AO9UiagTo2ASQYIACQp5zvxGjicuYl4OaBibibllJ6S9w7l45/0', '1427980681000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1623', '1', 'o33lBt3KPbUXnVPFRWELZUw3ZqTs', ' 桃 夭 ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2pyAokfLDl4vQRbJ5SVmzqQibgibQatuFZ5picO1ISyic8dfJgRpmXI4olWe19gDhjhwyG99qjHds1BKf/0', '1442807791000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1624', '1', 'o33lBtwfcvSBrzDbRN03V0PN-duE', ' M ', '2', '衡阳', '中国', '湖南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabTg0N7oBq4E1ic0yPaunCfFQvld2yiak8JsZq9nLPxSeMibuZM4oYuf8vNSnuS814bzFiameiaSCLIX9R/0', '1440585361000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1625', '1', 'o33lBt8jQaNNxYn5mjisjvK_X5r0', ' 心 情 ', '2', '怀化', '中国', '湖南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsiaBSFWG6E1y9sjYazhADp0icXa6a7IR3wic8BB8VtV5icVfEL1NiaJQKEuRKg4VgrB0nw7S331pCXekkGV29Fs8ic7oz/0', '1440585825000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1626', '1', 'o33lBt6i-XfEpVN0iVrXru-ulOfA', ' 小 黑 子 ', '2', '', '爱尔兰', '奥法利', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsg5NgkIryPqOgmyKgVzf0kAz36nOuTCiby8ibIDxUAnjdtJThhxtamdFgEEqnuZCGOoulykcsiaBfN9t3DNkW6DNOic/0', '1440584249000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1627', '1', 'o33lBt0woCBjMPcQKht2Nf9yVgLA', ' 小 钱 钱 ， 好 甜 甜 ', '2', '廊坊', '中国', '河北', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1nMMlcFv9o1tuZbT0YNwLm10ktQ1Yia8h2Ooxx7gqLmLsicoCdvKR6aEviazATIvEzvlTIFhibvUFHdxz3ic382wFPIW/0', '1432179894000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1628', '1', 'o33lBt9lWZA8cW0P9HUWqsEfLnJM', ' C r a z y   Z h a n g ', '1', '淮安', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/39vnA4SRXWhNecoatPajp7LUaN7U2Cr76b2ay1uSt9FGicdCu0CJDDVGxIakaMqBUIR4A18e1tEmZdeaUexumtO01S4Mk0Kbg/0', '1431612869000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1629', '1', 'o33lBt7gpmhntNflAEWdwQUeUmz0', ' ✨ 杨 梅 果 ✨ ', '2', '长沙', '中国', '湖南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabfpG2BrZnVibcuibHqicfISz4VJBjG96jEY9Gc28JD6h6XtObEKfTjQiaiba3fPWM9wr1ZKiaNC2RKiawCR/0', '1435329112000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1630', '1', 'o33lBt2U_o4vQb_BVxvnLHaXTbSE', ' 邻 家 小 妹 ', '2', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1keV7j0646usR4Apbsbe7ElLeITjictDfk5ZHoamicJWSfFohGCVaRlz4VYx157ESvUyNgj50vtYWUBuL4icNuKZDe/0', '1432605927000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1631', '1', 'o33lBtxlRUkZlx-T-fn3xCu3s6MQ', ' ゝ β ī n ｇ   ゞ ', '1', '东莞', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/2rmYeSicd841EtN7EUyjYWFWGwadic4sic0PVv9ibkRACLQ8ll4VgRe24zyaq91GSY8BFEZWpOqRzib1UVls8uQDxlZ9rl2knxibTb/0', '1440583784000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1632', '1', 'o33lBt5hTzOja017Sy9kN_-86gNI', ' 朱 洁 ', '2', '武汉', '中国', '湖北', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabQZ6BAIwpXmORGRJic80KBFpkqvA3kG7YxcTJE2GDemia24WIeZmsQMOrNGBx56u8FKrK3B9Jiblgs6/0', '1435216422000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1633', '1', 'o33lBt5IixEOAXIoH34f-Q11Hsbg', ' 花 好 月 圆 ', '1', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCsGOhLqIduyy7ICjfRZco8t9Xs4xaKkzqibsGroK0w8g0gjeicTlR1pFRYNj3bibHze3bdP2BzpQJ6Ry1Y9pve4bIN/0', '1429549904000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1634', '1', 'o33lBt23-TwyPdQ_U7lHgwmzxsiM', ' 陈 嘉 欣 ', '1', '徐汇', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIaGg41670MuDibCjZToVKdhxibhPH1PMc13uqO5xV9gY7znq0nD8kbM6C8xAB6HB00BUholWDEW72VuPnTRz7tYtCick2Tj4cLTY/0', '1432019959000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1635', '1', 'o33lBt9sPEn46zscYbzLFr5Md5QE', ' 翟 菀 通 ', '0', '清远', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgWa4kJc1piciaKVE2ktcZDHRDCV1OIR96ibXjWBASBTJzO1HF73z3MqYvmEiaB4sNUmLMvgo1d8s8FjFiaqh3FeBV2l/0', '1432606151000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1636', '1', 'o33lBt0JtRX8iJwMirUIbOBrQmN0', ' 奔 波 ', '1', '苏州', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabcmhjL4zve2kmDqicDFvpFfpABicWXbU52NHcicJdPicib4PN0q7mRSFMBBQcSTzCylVYqPibNkgsIDa6x/0', '1427986478000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1637', '1', 'o33lBt7jG1MDppCf4ZEGrwYx3oaw', ' S O R B O 官 方 微 信 号 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1mxaqAknWGymsWu7HS5eDQa5T8NPedZAYwHPRqEhvRaQxnvcnaTgXogrV8xsI68UiaPtFhV5QEGfqhCRHVCrALJE/0', '1432716733000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1638', '1', 'o33lBt_RbpHyJYLr906kOZBdQ6Zk', ' 刘 钰 ', '2', '朝阳', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4bqRTES5uxdryA9LIgzxJazv4haYQtso8GmwxtRUSDaVCsKjH23NicVPLazQnQ2luGpibbnfQDuzpbB0BjxiaFg38Fzra1xjHOj8/0', '1440586811000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1639', '1', 'o33lBtxnF4ye6M_SBJbfmKa5Qg1o', ' 霖 ', '1', '东莞', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshuEt7PzpB8zQ4FicXrnt0FkmYhY60WFtN701pnWIlhOZFJHv6eWEuX8UnoLlcYFUxI0gyBVcGxM0S1b3tuzSyal/0', '1427971527000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1640', '1', 'o33lBtz0WMKYgrwabtz_iGlTl8tU', ' 小 嫩 肉 ', '2', '朝阳', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCulpYNsjW4Homs7pTBbGCKBrEloLBG1knRuOmy3P7hnUw3LWHrF1XJGkPYvHiceaOTp2AtKZ9CwGUkSGGdy8Xia7N/0', '1440584972000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1641', '1', 'o33lBt3IPARLo2oQfitKvm5TUAyY', ' 嫣 然 ', '2', '桂林', '中国', '广西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/EibjpUjmSl19nwq5hDR0GaAoI66ZKqq9Uq3ncofStc770FLS534BjkEJVNTOLcUXhibP24ppIjrODpWPMZpYOc6JgEeyMcoiaLL/0', '1432716931000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1642', '1', 'o33lBt2yEAgfgc24qrfcOJZd8HDU', ' 屹 舟 音 响 — — 骆 珍 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsj9hf9dFoR3lG7gZKhZfibibLmk2VKqCv0ksmjy8GCHRS22l1ERzmuyF3FkazWW9zd7u3KNdpibpwpxOGanicFZjc39/0', '1440585547000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1643', '1', 'o33lBtxPOnHwSQoHhqo8ilwBdfBk', ' 转 身 遇 到 你 ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/0X16uwiauYicArXwcUAYk6HnnsIUxMTOR9lcvzDYz9P9NnNA75QO5ojU8v6cDcspibvGeG5wWXpuj5Ixll8G0A4F6GegzEtcFMb/0', '1427684103000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1644', '1', 'o33lBt4bHJdg9tT7niCIJNwJSVRY', ' 可 可 ', '2', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsg7B7KDUDg2hLAluMicsJlbPLguoI9ic3OHLewqsqCErMOJspQPfp2Q62ooL0dxX0ePylQW1Dyibh04rCLVBP4dohF/0', '1440584376000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1645', '1', 'o33lBtwBkQbQAuGdyCzyxYwp_bvw', ' 图 图 饰 品 3 0 2 2 - 1 ', '1', '成都', '中国', '四川', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2p038kVb4EuGrnrQAvC82LTqzRfMbBGEt9y2epibGLkY3MtmMBqLeK3ZkqRveHibibSLu2meWaiawlldY/0', '1453057823000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1646', '1', 'o33lBt9A91IZktr_apfh7aKB09Wk', ' 周 梦 琦    ', '2', '常州', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabdGOsAZJhiaicLfCJm2nEagtVOOQ7ib7F6DeJuibbQZvOZ6Wmvv5TbVm8eialeRV2RBqicqHVDc82JjIDd/0', '1429503549000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1647', '1', 'o33lBt4dRpiREVG9SXfNlnqqWHCg', ' 小 马 哥 ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabXkxk1H9cmyHhwTWIqmerb5ou2hjDOBibTrE6Olv0XtZdjHmzZqbDGw6jRON2lwGOJwfOPkHxwF8c/0', '1456127477000', '', '小马哥', '100');
INSERT INTO `cmswing_wx_user` VALUES ('1648', '1', 'o33lBtxKhdY8CJlSspkQ1tMCs-uc', ' 南 宫 宇 轩 ', '1', '太原', '中国', '山西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2p6qKlaSEkvCPWR3l9ZEsWugpTbXiaANc9swxTNlRc1QOxsic8Adf1KzRxibSZq766dBd9EuOpiaiaEX9X/0', '1440238518000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1649', '1', 'o33lBt8mLR4wJmH6nHSNAoISowCQ', ' 9 头 身 美 女 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHqkYC6dPtIdEZqlhQDy34A3JnXKELmTrffQVsrT8DqSYg8SplKdmu8HVVjP9krIC4UicY9ibWQN8PcicjoD8TEtCgE/0', '1440584689000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1650', '1', 'o33lBt35oTip-vBsRgJky_kMgf54', ' 一 曲 微 茫 ', '1', '深圳', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCslAz03U5t5LQNia5am3Yf9teuKp4ia605lkBExatXzkuTHKMJe0pPSgpGmawMVuIjV3pcC30G0EonFW9njuXFqN4/0', '1441939167000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1651', '1', 'o33lBt8akMgPKz9Dx-Cj2Ib8ZIZw', ' 红 发 旗 舰 店 ', '2', '苏州', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/S7uPXqWxo0gjzl0hpJfMmAG3sGlCSLj6OwAzCT0HPsYKoCTD3Cx0t1XWQlEj4QwJ1YU1upD6aQuSVo1MFiaYNAIaAMpibsKDZQ/0', '1431596730000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1652', '1', 'o33lBt3jij0WS6-ra26Ve8-TIrMA', ' 静 静 ', '2', '深圳', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsg0DIWMjkeoFstuVheOothG3PwjElLGR6HI3MsDDUVqCLicdDCsqBZiaLwNuaFY5h0WmAF0icFVeUYV7TNFy3wTkmk/0', '1440583638000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1653', '1', 'o33lBt4Q6gvl4HDLJp4oJUS9sThs', ' 起 风 了 ', '1', '昆明', '中国', '云南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgMegW8FF1VSBrhvEoHqsg4t0ghlX5PqZK0Bn6dQBicaLMbCoKbaFiaE67yajkulWX6ehnGZNrIjsvEAFLibLsSYnia/0', '1440583651000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1654', '1', 'o33lBt5qTBET8zJ7rjg3hVrkUkV4', ' S u n n y - s o o b ', '1', '', '法国', '阿尔勒', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsjt2zMtDTibp31IWCsdwCosFwZKtor33Z9gFPaSUAtEcDdcJjicchRodRHROpSyOlkA1vqiaATNCpZmTicufbQSVicBk/0', '1432716701000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1655', '1', 'o33lBt-WjCm1PdBuugz34hq_SJpI', ' 小 翠 ', '2', '石家庄', '中国', '河北', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1nMMlcFv9o1tmCOnzQFMGISwITSSMl2dAEF2eILucwuibrjiaKBd6NPyToXeGSUAgs6icPCRkj1ImIzN0tAvQGsx8ib/0', '1452043760000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1656', '1', 'o33lBt9tBC5EPnTNyWChKvZnzYNI', ' 孤 ┏   ( ^ ω ^ ) = ☞ 娜 ', '2', '', '奥地利', '萨尔茨堡', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabXs05Qfy4DPVuOYms1mLRIGEDpxDHWhNaq4XIatIhv1mZ80fDFlm0pnaqYeEGsq2Nfib2dicm8Qgos/0', '1427684365000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1657', '1', 'o33lBtwoBTIobd1dC-ChYKg8mEAk', ' 蔡 蔡 ', '2', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Nc5ibKmjHqIUy2vnibXu3EEuagJBfR7crHxIqUt2hfO1PUvO4TFORRyHLsRYibJq8ibr5MLHTqlah2jJfqHD92XccnaxGhia9BStA/0', '1427768734000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1658', '1', 'o33lBt8wuWxJGY2-B4OPET-Ef-t0', ' t h e   s a l t w a t e r   r o o m ', '2', '', '阿尔及利亚', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHpC2zFdLCQS8Ipf7e2EDQ07ZBvLpK3leTickwJicTLMvSWw2neZkA6Ro8Yiamp53AgRt52xYTQicvhOxKMe06x97icJq/0', '1432716934000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1659', '1', 'o33lBt_cM-YWAHtbUG5X7Je57brY', ' 与 我 共 梦 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr8iaXsf8YlB1AicQEs2w0xNiaT32MIIBa7icKF7Sw2LiaTAGrBvmdzdIlhM5c8JzDicwlOhMW96QQuhTjSayX1qvBicF6/0', '1432286408000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1660', '1', 'o33lBt_VzBFHkLKCE8Xf8U_6ipnk', ' 安 远 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsiaeBRqhYJia1tuFjtwZmZT25ZrYXUhMgMYa8mzJfx41Z2lzjIEGXMEYzmRPaldBicmWSByafRTo2tiaiawWTVyiahia8T/0', '1432286505000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1661', '1', 'o33lBt01bvGr7NLKGMWrOGh9G25I', ' 婷 子 ', '2', '吉安', '中国', '江西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1nMMlcFv9o1tn0jYFlcWB1RRAmx4NhkXDU7WLhXD8slBHC2Siaj6FruozloibdO3YgPhH12MSUEdCjABlLNuBrPJP/0', '1440587015000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1662', '1', 'o33lBtxTZpoexCU0JKly-J5uygKI', ' 爱 情 乞 丐 ', '1', '深圳', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsj0J8wTXCrjYNMnkO8u598FIes2uW4xzehg3ZqVzsyN4K0Ucrclzpfr65zpG7EnBjV3LzR6fVgO2kpuovKLyrEl/0', '1440585076000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1663', '1', 'o33lBt0rbze-XWuDffsyFMxDlpYw', ' 结 结 ', '2', '沙坪坝', '中国', '重庆', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsiatt6sicqSN1dYQcqczbeMz8uwPq5FicnMDreCvNugDf1K1sMFsCrJjFiaCgdePB2gj4tEicZ9MUPLG39W2YbvicyhIT/0', '1432019649000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1664', '1', 'o33lBt7uw3CLwEH6w9ikv91BZmFQ', ' 不 二 周 助 ', '2', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr8iaXsf8YlB1D07RZ1sXp7SYAqmHDv0pR7AeP2brpYJjMADd9yVX43JREvkdbflBNofCrrA5nicYLgqU42YcOpB8/0', '1429611454000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1665', '1', 'o33lBt2wxk33vPtD1pMU72JRBLDU', ' N o   p r o m i s e s ', '1', '惠州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr8iaXsf8YlB1Dl59fd2GrUicjfIRrCafl0tPqU1Gqfo4pdW3DxVXGn7qVWPAZBhmTKu6BD570rnFxBuTj8DpOL9N/0', '1440587005000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1666', '1', 'o33lBt1tB1ToiddIRckg1TVYoSv0', ' 江 南 名 媛 ', '2', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCs4fULwibACmvaK6eFkuchZKFdBGKiak8FtK8hERoJVAHnhhEN0ckZoYcHfzmOzZR0ZYicZfXHC7icKn9vTnJss2B22/0', '1432286477000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1667', '1', 'o33lBt4ovMZuUnWRXtPPaOKq7iTs', ' 薛 丽 ', '2', '', '中国', '香港', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHrPjcnMI1yytISVJvUyqrpMYg5qEicV9IcOrbsHqYWmSu70ZpfaUSe1bgSfHxfb08ldQdCNQyLqE8RicpSC3aQtgp/0', '1440586856000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1668', '1', 'o33lBt8gTtAKiciZgADWwCrtsBzA', ' A   小 龙 ', '1', '珠海', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2p0ibQu3mkQtFL435UianVjicnQc6thicB3m86gUW2kyiaz37cdpb0qzwzguslicvstnnoqeSFVGUAKic6gY/0', '1440586757000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1669', '1', 'o33lBt9-6O7etK9Vj3Sj2HuGlZ3g', ' A N   楠 ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabY0K3vstZPKKayAh15VosvJTZ8giaD4l6cXWibCRRibBSKjribFibkCH9sGTuQLJlIgCrSOrUuFCQ9bl2/0', '1429840314000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1670', '1', 'o33lBt8BJ_YipJc4DaYLCOPzaqSg', ' 工 作 小 号 朋 友 勿 加 ', '1', '揭阳', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCZic8lU6ppxW8WOBlrp4O8grb7wXCiaLpkmkpUn11tP1tMRP0d5xkku2dbqg9MAASz4FgOhmTpauXmRNbNIGxtdNEd6lVSytMcU/0', '1432716935000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1671', '1', 'o33lBtx1elfCUN9eUfi0xOnMRG0A', ' P r i s o n e r  ', '2', '', '中国', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsiaFMqibibVhDpopUbaaCaVJvYS4BrMXyPt4qt3gvL5r9BvcreFywEy3RctNicw3WabLD0kI1l8xEUhlOGleEtwaeso/0', '1440585657000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1672', '1', 'o33lBtydRZqLCjAh1qFdhdmCxEwo', ' 泓 盛 壁 纸 （ 沐 沐 ） ', '2', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHpHEpnW8CE9Hwl46nFesa2UMFIY8BndLibyC3pE3XWQ2mXXZ681gQXuDTCLWBy2QVcx4Z6DDzSE2Ntg1jWmkTMibp/0', '1429331262000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1673', '1', 'o33lBt6bBvfv7VkfWFU6uKRFyR94', ' 沈 阳 田 律 师 ', '2', '沈阳', '中国', '辽宁', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabfw21uXUKsKkTF6hhJHjM89sB3vWiaibnk9WUjo5ib1SjywouyNktJhEpv5iaIdrMicfMbZdWldpUKPEe/0', '1431938987000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1674', '1', 'o33lBt1pfqCI59QrQK_YP_Mh9yjQ', ' 陌 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/MHHethDRz5JD2UicNBxCdnJyZOufetKQsfz5ibMAjooComd2q45W5VSibR0DoibVH0SqMsmBa3hDaTRaA8eWhTgn94LicXtDAQJ50/0', '1440586106000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1675', '1', 'o33lBt50KJZQfhCqjQOl69I36wf0', ' 科 学 养 猪 ', '2', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCsb5ywUiaYBbnz3KvpmVm5UBkeRcRibQ1672BY8UXt2vsOwNypGffTtBfgtRPjABC8gJuQyoZOwqazA5A0H6xromN/0', '1432606264000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1676', '1', 'o33lBt2fj_qSVrAOB6An3IMg1rSY', ' 龙 城 行 者 ', '1', '湘潭', '中国', '湖南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsiaEDoxH6QDXknwrpxOuDnbrGt7ZibxulC6mnkboanf1ge02EPoXORaY6ibqZXjkZt5ibcG3rdUwNibA17YxSv7osGns/0', '1432286442000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1677', '1', 'o33lBt6corOUHUwW8AggGOIaxF7M', ' 招 工 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHqC42lzd0M6Y2BwjaTYqLoZq8u3dulAl9ajqWEUJZ3ia0ghfIPicqGiafLVIYJDPCzyOh5Rib2Iq76RsoE8NUx7SeVF/0', '1440584865000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1678', '1', 'o33lBt0zLwx8Qb3YJyi8LhVqdnoE', ' L J H . 贵 云 ', '1', '厦门', '中国', '福建', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2pyljXheBye7tVnPk9PyXvTsWTbLqjeK37kwk71VCnyCUPpbDIWSk6vBAlfRfLgGBicarCul53Chf0/0', '1447222768000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1679', '1', 'o33lBt1LmZUg5PQWQuN02Ww010_U', ' 阿 阿 阿 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6iceIOlCw7oKkABQajyOwPGH5n43nkS45TibEgmSSpjRparR3EgnJEWFj0nFmetOQujibCvlsbLCRt2WVhYAOLOZnU86srdz0drQ/0', '1440583753000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1680', '1', 'o33lBt9AcrB_ayjphdo-t_cTEW1M', ' 迪 塞 尔 ● 瑟 克 赛 斯 ', '1', '檀香山', '美国', '夏威夷', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1nMMlcFv9o1tkbHUlDmZ7vfXr9JtDJhUg2G3ofuBDtRc8cGDRN0ypkNIxxb84CCt57GGKdow31WtfWWR9K1FTtC/0', '1442912833000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1681', '1', 'o33lBtzSQcXjInF91oIfWOCf71ak', ' 周 菁 ', '2', '', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1kGyn96Iv8CT1MqcQeupialZMPyiaI8BL4QlBKVYKOtz6XBqzgqZmGiccNRFwnfHPvnth3Gz7bzatH25s9cbTaoGicS/0', '1440586992000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1682', '1', 'o33lBtypksLinnVt1U0091SuVHo8', ' 狐 狸 未 出 嫁 ', '2', '大庆', '中国', '黑龙江', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsj5W8ibiangtyH1OhN9K7tpOYxicTIUjaqU32ytpa4KaibHojxkSk7qJXUpUeOE7GoNczEmjDnlVickuNmUQFxnicmwaD/0', '1432716982000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1683', '1', 'o33lBt_fXR2W1jnW9--DdHrsHkPA', ' 嘉 嘉 ', '2', '深圳', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2p3JiatWRiaIcFrAibMM2sUAFNvTHhSasVEP83O5QrSKHxNaHY6eluol2PgcHib23FB5qLCADLUAHr8DT/0', '1440586191000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1684', '1', 'o33lBt_NxUCwoJe2iYLbriwfa8Ss', ' b a b y ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/dTLpCOsPWicCww62P1QMclLSsxx9cacKUcIfoA9kAoE4z6dXdicc7Zy7z12vr6HZ6WCYDkar9RtFY3ZOl2yWALMnZlkQ4vt33A/0', '1432716698000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1685', '1', 'o33lBt_nyiJ-ENpDiEv2Zt3eMz00', ' 1 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Nc5ibKmjHqIUy2vnibXu3EEp5h3x40C8BibGtxkE4Cib3uYVjwRoljRk5McbZHtMQZ22lb8KWf9lpnH1fj7fqyHRWKRAp71apSOx/0', '1440586136000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1686', '1', 'o33lBt9aOjU6WxvUW5L-M2odnkPw', ' 媚 不 可 挡 ', '2', '', '智利', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCvkdnTHOxnAE9icwpEk9xxKDBRJpndvp3WM7Zwr8nWyLib45stJbrkhPZwR6ZE2ZnbicvicmINQ3BB8wZ0XnHFu3Sicq/0', '1440584627000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1687', '1', 'o33lBt3dE9ABSqO2PeWXrldccRq0', ' 达 舒 妮 ， 休 闲 鞋 著 名 品 牌 ', '2', '揭阳', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4QeOw76sbibm2wEJkesdF4FkJfEa0MyQnFEEHSB7RJKUg6KppBpd03k9JUZfeRYaoj8RTP5DoWWf3qxRGvRaXyerrGQYlmHcGQ/0', '1444845234000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1688', '1', 'o33lBtxuADJ5vJyBsVXpnfiSk3uQ', ' 旭 ', '2', '邢台', '中国', '河北', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7lLW4aW2EREBeicScWzCCicfsNr2ZdY7RiaqDrRNYqvIAQEAriaM55EaSqEPbuyh1BNIE9eia8AvzuGhDaA1ib9wlfU3P5GaUu2qT0o/0', '1427942394000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1689', '1', 'o33lBt2HzEvcSqLPQGku3fHI2WTk', ' 广 播 站 9 号 站 � � � � ', '1', '营口', '中国', '辽宁', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabY2qGlbiaTUjYbkF1EAuicOiczr8byhZ4dck4icRTibcUkRQaek3tTuDpiawwSIOib9eGuUcGX75eG5sStR/0', '1432621343000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1690', '1', 'o33lBt1ynkXRGG3Y6aO9jd21e39s', ' 晟 鑫 发 品 全 涛 ', '1', '厦门', '中国', '福建', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabTtz4kAAd6dcnu3HDDVFv4ibc0RxbkO5t1ovjGUe74KNeCOd4zMIah8etmWcssxXFj1IK9m3Dr5tU/0', '1442504750000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1691', '1', 'o33lBtx9yuOaQXqN65LABtWNd7NE', ' 酷 海 风 波 ', '1', '株洲', '中国', '湖南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHo0DsjV0jJqt4ow0Fsaa5H5q46SeWJ2ibb377DEtaBqsnbxIRClOXxjJvuiabzWqUcEvg3iaWzfO3ibWVaycJmMHepY/0', '1432472051000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1692', '1', 'o33lBt4RlT4f6E8MdWXV3TpQ_P9Q', ' J i n i w u M i n i ', '1', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr8iaXsf8YlB1Mw5zEiatNqRicYKDK9czItWIRdmNibzOUAicScqAe3QJozKX8vLLWYkBpiaKCZ9ic3eLpmM8rcQCmZiafv/0', '1440584086000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1693', '1', 'o33lBt7nYaSgoiqgzJ4JSD6hKTOc', ' 淘 宝 运 营 ， 李 ', '1', '合肥', '中国', '安徽', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshERPmTMe3UBeIostk24WXxqaE0DnDfI6TV1gziaLcxBCMejWyHuYtxuoJdB3TKW4ibX0Rxp2ic0DcqR9AxpqKw0FS/0', '1429235593000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1694', '1', 'o33lBt8K5_qH39OK28LBJ5LY4ccA', ' 春 暖 花 开 ', '2', '武威', '中国', '甘肃', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHrTibeDlfr8rEzwgh2icJOY5JK9WPy3L1yx2tzH8urEc0DsD79duxc3ibltKf2YrF50YO9UKUeQNW2hYTCUsRXLJUl/0', '1432717181000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1695', '1', 'o33lBt1c9t-4KaPc9l9C4gQH4Nfk', ' A l b e r t - L ', '1', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCtwAnlQsvnSody4ib1vhC4AIiaRJJFo54cztUBe8MFZ8ZlZNAWMrlGwVC8nzal7sDRII9FxczLcSf3yhtIYExJeaL/0', '1446792078000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1696', '1', 'o33lBt0CgfQ8hntVEgkp0CpXlYr0', ' C h r i s t y ', '0', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2p7heBJUyyvUfUCmqvZx8Bw9150HcmCMhAcysX4ZT7iacj5V788wVQEANZGVk5eL1fF6fkuJeDuVpl/0', '1438500889000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1697', '1', 'o33lBt7zLaKwIUbCgJYV6BI5PQSo', ' 时 事 关 注 ', '1', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHrlRBWogs4vQSFiaD8CKjzEdpeJeOR76Tet63UTO33YxQpRrWXD2u9aCABR7kLto5QDQRgw0CHTssVJCicMVk934X/0', '1444787353000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1698', '1', 'o33lBt8E7Ipn34nw31LhTFQsIySw', ' P O T A T O ', '1', '营口', '中国', '辽宁', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr8iaXsf8YlB1CI4qNtGAu8P6Dc5G8962bD4XwFVWgmVwM4T93ticicXyOR4PicbIanujT0iapwZwfQqJKqSubsS6UmX/0', '1430077802000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1699', '1', 'o33lBtwxT_yvvy4r8RzjJ5FHz_oI', ' 二 马 ', '1', '海淀', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2p30EF29iboicIuichrhFESaa9HjwVMRb9Xl9QTk1jSibx4ib56jTk0WSS1uuPialLQf1EZjQPcIKcZhLoE/0', '1432544726000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1700', '1', 'o33lBt9NKq2gW0IEFUIJC2nZyJ3c', ' j h b s b b ', '1', '', '阿拉伯联合酋长国', '迪拜', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuot1V3MIOm4tTtV1bdMryJbmtolH5drMqZWlRzN9tcoQ0zR4aPgxNK0R7Ax7iauMPw0ic8HFEJOicaicxvFiclTtIKB/0', '1452509042000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1701', '1', 'o33lBt0fTj-VIqr7ObpLtO9toxrs', ' 威 尼 斯 的 湖 ', '2', '温州', '中国', '浙江', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr8iaXsf8YlB1K0UhOYMJnbsmnz7XhT0ehNjp9IPeIczicgYaNsjfxZ6dWshOh5xyicDMl8ckwazo02YIMEGQVhQlS/0', '1432606823000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1702', '1', 'o33lBt2OTgwHcsM78Gv1Xxecq3KU', ' 简 ', '1', '沙坪坝', '中国', '重庆', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1nMMlcFv9o1thtZdbD9EE2KBwgVvjc0PpuNibX4qudasm1YkFoNwMnmoetmPhe3kib1T4bqLgk0oAhyxwv7nKG1t4/0', '1433220464000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1703', '1', 'o33lBt8yYLYRvfMlITL43r1DzvS4', ' A 呦 喂 � � 二 姐 来 了 ', '2', '', '阿尔巴尼亚', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr8iaXsf8YlB1IWgkghnauEeja0uh0pAYs7rUSPamgqu9c3cCkU91xyhn1ukxdaeg2RRAVYhib7YjAJk71Wjeryuh/0', '1440586446000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1704', '1', 'o33lBt9k5lyOgDdvqXYM5qnhvMxE', ' 微 语 ', '2', '', '埃及', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCs2lZCXB5ExC0plvyZUCGtCNPLxf311lrRQNRAGXxY5ugljdovNpmNpkfyVgLq8v6xUcTgTvJTficRiacDY6Tdz5y/0', '1440584658000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1705', '1', 'o33lBt86GvmIS0dhDt4sat-1gboc', ' 胡 y i _ m i k o ', '2', '', '阿尔巴尼亚', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsjHvT8CgDlk2TJDfrd4KaHgIj5K6AN6RpzZdFk76sOA3GNtGKEa1qzqj26ScnVEVN119QgTlB5hYT24nmnRC9jD/0', '1432717036000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1706', '1', 'o33lBt_OHIJcBsvksQcpQeXxY4Zk', '   丁 颜 男 ', '0', '清远', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHrLc0aJCqatLXzyZDo5OBOrJ0oVPqicETn3ks3YzsicAC6iamRpXfV9dmfweENicsEaibfMp1SD4pMVAq5I5BDmOmfAp/0', '1432544671000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1707', '1', 'o33lBt1lTSYG75inEZDMny_FQPOY', ' 陈 唯 忆 ', '2', '安庆', '中国', '安徽', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2p0TsWnVK5C4HhWBBHHWgDgYNQ1oY2oh8TcQ9rELdNCWcek4RLvr4RxCpibroXWe5bEXZlDkTm4MaE/0', '1432716929000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1708', '1', 'o33lBt63KCrD2nXpVQhRBXnrOEZ4', ' 阿 让 ', '2', '西安', '中国', '陕西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1nMMlcFv9o1tod6h2crozw3BvckQml8JODg5XKxRibvNbtwnoqszdkYH5WXd9R7tUiaEatp2Zuur42r2vZqrdNDSy/0', '1429611498000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1709', '1', 'o33lBt6ihAItTWZecr5S1OZhKbxs', ' 居 然 ', '1', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHpqSicffsc1Ix3t8RzzTSllO41alialw2r9jrF3leyoQygI4HRZMUtiaGTt0nfRdHptNSMISGBWCiaCq9xAmxicymz68/0', '1440583621000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1710', '1', 'o33lBt5xtfvdEZ3xC9XZwJhpezfc', ' 小 雅 ', '2', '盐城', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1mC9gASz98WEluICu5YiavsB0eJdReiazV2plGbaNlImOJKBfohQssvmVBQDH1xqwoLUrzn1Yq4AtcLUGxkVKg46R/0', '1440583792000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1711', '1', 'o33lBt5MfbEQqKie90E4AR1Gl3aQ', ' 小 白 兔 ', '2', '巴南', '中国', '重庆', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHr8iaXsf8YlB1Nibvt3dhMepKLhSCaQva6Z8fibgb8WuJVib0Qxic73NNcRWwfljQYXmwy18ergbricybHYGiatJEWxG6x/0', '1432621259000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1712', '1', 'o33lBtz2GmUyFnrbClDOvxSSFWSM', ' 两 碗 正 能 量 • H e n r y ', '1', '', '新西兰', '北岸', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2p9B7NBib9fsS8YWr4XwPIsbnbvicjhJ13zDLqPSz7Hhq8iczBL5Fd26THuS12SzMuCTcVZIEyDyZLt8/0', '1444832579000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1713', '1', 'o33lBt4WmmoFUUWbViOIUA0PEy4A', ' 子 雲 ', '1', '九江', '中国', '江西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiaba0tewhlmZpyftApbY15M42iba69w9IAyZ3FoicOLmI3pypBiaMtXhNMfy9uZQOw8JWbL5Ib2bffMJT/0', '1441337603000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1714', '1', 'o33lBt5UXyTihSDnT1aCoEgATwVs', ' 阿 丁 ', '1', '柳州', '中国', '广西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2pzHJMqxVsCeKEUyZ1WbdFfibuqjKic2hiczr5FuCMvr3nSgwOAYkJskg1PeDy6A9GoKE7VbfviaNhhpx/0', '1440585422000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1715', '1', 'o33lBt1KbBtCnh_wUN90Rig_WQKE', ' 灵 ', '2', '', '中国香港', '南区', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsiasOd4TXj1HWzYpxhsiarvWx6N6KpTdsHQYC0T7ZCnxDlD76kr9eUcACiawIehWibJGxr7Q4XyrI2EUpGkuoy1iaZeV/0', '1432716779000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1716', '1', 'o33lBt9hLXTDMG_PRxqO6fWJlmcA', ' 六 月 。 ', '2', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCvOzrV4IxKmpQfeb1BPE32PWJQQ36uRg0k8jARXmbrDxr93iaialRW8u4pWvMvlTGcoSpRic7IL5gv1moj9IMD7BYr/0', '1432716940000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1717', '1', 'o33lBt-Z0ym6qbTQWDN7eUPecoJo', '       海 阔 天 空 ', '1', '亳州', '中国', '安徽', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsgrIx3NJyK2p1V48Zgicky9qooYqDMmypHKcJdqmSCQaLgf5L0unibmaoDHF6pVbzmjV8TgUhcHsBxkqDqdwQmFQ2/0', '1432742439000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1718', '1', 'o33lBtzEolPxQ8IWTntzFytvkNBI', ' S h i n i n g  财 务 ', '2', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Nc5ibKmjHqIUy2vnibXu3EEsLeveguOVibCia5ETTgGpMBcAutrHBK3arsrAXiaraupYyL7LxhiboG4SGp7XkhCTQBTj6tzDIBwc8m/0', '1440585081000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1719', '1', 'o33lBt7hiJzJmoJliHWeUrWbLTqs', ' 大 加 一 起 玩 ', '1', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/sEAesBFgsjSwPDKTRTzn7DJsVMCjl0r0KY1MqRDMzmzFDHJInY74jiaf2icfUoLITJ2atAhic09v04IFVJflCjSF7c5HyFKiajJQ/0', '1440585424000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1720', '1', 'o33lBt9ebdo7uQj-PeMdJDI9Q360', ' 木 茜 ', '2', '', '法国', '巴黎', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5AGrn2EpHCLrlUHibd6t4OD5WTF9p2Yj02RfY9Q81f2yicnlX81vjLW7WDswoOHia6nNMhSwe2es4tW0U19iaXwIrMu1gGKKeiaLUI/0', '1432716856000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1721', '1', 'o33lBt7HasIvzYZ8mivYX7bDbDyk', ' 么 么  ε  � � ', '1', '柳州', '中国', '广西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHqDX3tqAc1Stia3ECdNPz9XNu2UTETSBqNvVoJE14n5BuY9jcJen0XVNXgibMUtPhZ3n3Rkg7T3UM4klvyk73iatox/0', '1432606139000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1722', '1', 'o33lBtyMt3rVgh4cP6J9Y1cluxNc', ' 小 明 ', '2', '', '挪威', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshDlQQBOoibUYNbn9mtC24eDj3oAOoN6J5R7juX1dw8YRdib4uMDOxpvwBb31sfhR7zPxFMKglCK6lsOA6O8OXNdz/0', '1446041966000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1723', '1', 'o33lBt_-eaTAuJ6JtYamefa8db-8', ' ︶    子 明 ℡ ', '1', '', '泰国', '普吉', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Xp4GibCIbZHp5QfMp08hbywWGrz6VdGnuVHD1csGZmTVlNMwrzcMhVtpic9xrHia59cxand41ypictfUxYN9sGUZ8IxdV3TOOU61/0', '1445887298000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1724', '1', 'o33lBt_8y8Xlm-RT8mXm8c90IJos', ' 静 夜 无 痕 ', '2', '漯河', '中国', '河南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuc26zx2tSiabd3xU3Om9ueoTBXpaR7vP2KRwKJjknF01qGGAKTiaibwT7WtIBoN9Y7t3GSnNUVaiaMiax2c43WstSka/0', '1440584300000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1725', '1', 'o33lBt6mpbSHX8LFPAxxD8az2rvM', ' 明 洞 优 汇 红 包 跨 年 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshtsflBCld4yiaClnXlK5tXdYuFybO4wwObMnhtYZZsTIRPev82QrewGdFcEVwGsr8Yw2ic84ZIeic6mgTvicOEjn8G/0', '1440584720000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1726', '1', 'o33lBt947S1ZPKpYQ_Out3qYNWhg', ' 彬 彬 ', '2', '贺州', '中国', '广西', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsjt2zMtDTibp36X91NEeibibicGeXFPe6DEwReEK5UZSIXbmQDPjZcexfcs9KgicPGQsPm2U6TLibDiccc7kOqQz2dWWFF/0', '1432716880000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1727', '1', 'o33lBt1m3pt3cHoOHmb0JmiG882Y', ' 咀 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCts4CyVxDVQku7SKVTiafhLuQYOjxtGbKcs1WnjFB5u5hciaer1tvOiaia26FW1plQOjcLUwJeXiaCepoaMGUIib0Eodib/0', '1440586240000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1728', '1', 'o33lBt7KIYTGlzPrRLxOZ8LT9s-Q', ' 一 个 人 的 寂 寞 ', '2', '', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/GAu2xIQCMOYSWdkBFaY778Vdua5SJzaHmHlJ6dA6dgV4YiapPibvlB0ick1bwPcrKp2tXYE3Pug8BqgNe40pdqrRHkPlibEXFXSic/0', '1440583914000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1729', '1', 'o33lBtwyVlFfP4iDgz-z9MZbIJrg', ' 我 就 擦 了 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCsAro2KFW8uickAw8Kqtb99TUQh0SfibicfM8m2a52vx5bC6ZUchyOwqx7PI5T6mpkRoDoTTtyqdSjabNB6vNWFvf1/0', '1432621326000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1730', '1', 'o33lBt-gX0ErKUwko80UWzuWgA5g', ' 静 静 ', '2', '', '阿尔巴尼亚', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAKpRWicMbNbaUYB5xvGJpKaz1Bosiak2eQEBmTn2s9EppwsB5uhWxgY2pz8HKaDqgmeG9sZC8RU5DbDYp9Eib4ZZP36jYHMhqibaI/0', '1440585498000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1731', '1', 'o33lBt9N3tLOiH73HzZZoX1keC2g', ' 阿 丹 ', '2', '', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshPskMg7bGfuJiaz88ZOX7W6nIgwJfpc4otPctO0IMbkbgngsWicu0ibicEUfq2YrX533zrZsluNNdpKVlSbM5KQf0ia/0', '1432606154000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1732', '1', 'o33lBtzkqddJwvFCc5xGXmwU3mUk', ' 李 艳 ', '2', '东城', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1kF6btvbzpCAxQvGWbEfXERLibe9FGaSk5dZxBbnVPhnHhKhzSW1KkJ0roQJuBJcLK4vpxxW6nzRzjWHE8tr7DuX/0', '1440584614000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1733', '1', 'o33lBtxKFRzcN9qCqxOpD23BHs38', ' 傻 瓜 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCvEGbJY7ImPmgnRbOGmFm7fiacjE2e6iakephDrCfxQH1rpbnxg1gUa7QVKBicZLEcic9rHV9434Q3kEcIIbUaeeh8E/0', '1432716680000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1734', '1', 'o33lBt9P9hbpWhqURZn83tP5Yr0s', ' 百 花 谷 ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCsueSwMh3oyZFFic8WOfib6y5wohuBk6giaI9CY599XUYokVILGvEppFWmPicgMTylZZ3uCMJpVAib9uFOMIxruTC6jic/0', '1440585575000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1735', '1', 'o33lBt1MBH34FJ8VA5YVUWzo-5Ak', ' l o l i ', '0', '', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/3icaBo1PsEFWzdDH1vshS8tVVS8Ly4gCsiaxvq4DcuenvawGDZJITJx6E16MmBjWyG7P0BYNT9ppkiajSibFz7o8LDNZqog2lHwj/0', '1440586934000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1736', '1', 'o33lBt5KkyElTwiwga46DXePvcrQ', ' V C 速 度 ', '1', '', '中国', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMsjW1L26LW0Xjeb8CGOVC06ftSsr2T69ARUBloWXMVbDhicVepa6SFOPZEibVWNmPtloNv5R0SxNuqNENh5OCXwSdb/0', '1440585768000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1737', '1', 'o33lBt2z3ViC_GrF3TgPN_C9Y7hE', ' 红 发 旗 舰 店 ', '1', '苏州', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCuXcvStwc05Pls9IJRibSxuDSjxW761IAbx1zLl4BmUzDO2N0kgDibbq1eXASS12fb8x9tJ5HrqRiblAruXO8hYxUI/0', '1431647212000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1738', '1', 'o33lBt9UMDQADei_UTi0WbBov9cg', ' 易 方 达 ', '2', '', '爱尔兰', '都柏林', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RonyQJdLyCsE3e6x8MDGkGc8HvkgnYeXg5epXW1Z2jrwHib4M7gWq6MejyicMnicXibsTyNmwSQAdgehPhkYK7MI8RwXWORJnc0a/0', '1440585266000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1739', '1', 'o33lBt44AAJXHkxTbVcfIUGiZ76g', ' 九 久 竹 心 ', '1', '武汉', '中国', '湖北', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5ZOJc7aSAUC8PJQL6tf8icZL0G9roCKgVshQcyf545JLia7DTjlGibEdZnezwmuMay5XibtEoaJaNbuRLRbibQCmahDSe0q70tLv3w/0', '1440583644000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1740', '1', 'o33lBt9engNFDVfzKn_CpSH-oQwo', ' 每 天 能 有 您 而 H A P P Y ', '1', '武汉', '中国', '湖北', 'zh_CN', 'http://wx.qlogo.cn/mmopen/fW7UrE4OMshaS9mcGS7BXProCRVmaa6LZuRicuB0VNUdekMGasIWODYwBjueToO8yyUad8AYNia60MAmh9X7ZGthiaSba2ZVOAt/0', '1440584191000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1741', '1', 'o33lBtwG7y_dhqdfNdl2ThG55njs', ' 筱 幽 ', '2', '', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/tqRiaNianNl1nZWqUlDfkfGu8D8qVQ1oCOLY83lz6s9cF3Wia0FmR7fJ3A4ssaLVWmfh16ico7f4CeSkNwTy9axTkicEcoyUPlnnC/0', '1440584323000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1742', '1', 'o33lBt2sWA229EzwT-ZAysCEmTlI', ' 陈 晨 ', '2', '', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/z1rcoMwS0kYFia88Q4ZZ4iathXgFb1iaGFDu1upUwj64AgGBzicBibGC4EzTgzR84nao9UBYR4LbsQmMeBPricEDE6n3LJd75kpIps/0', '1440586950000', '', '', '0');
INSERT INTO `cmswing_wx_user` VALUES ('1743', '1', 'o33lBt9Y9Dx2FZcKU3o_o8xDDbFw', ' M o o n c h e r r y ', '1', '武汉', '中国', '湖北', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6cYDypRBYFtic0VaDVu8DqlX1N5iaribVenAqdUn4zajVpseqfAaTTmS0xRndxC8eUnO0M1ZgCoPnVibcicgAq5jfGxIAtn6aN5Uyk/0', '1440583567000', '', '', '0');

-- -----------------------------
-- Table structure for `cmswing_zoning`
-- -----------------------------
DROP TABLE IF EXISTS `cmswing_zoning`;
CREATE TABLE `cmswing_zoning` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `provinces` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cmswing_zoning`
-- -----------------------------
INSERT INTO `cmswing_zoning` VALUES ('12', '华东', '310000,320000,330000,340000,360000');
INSERT INTO `cmswing_zoning` VALUES ('13', '华北', '110000,120000,130000,140000,150000,370000');
INSERT INTO `cmswing_zoning` VALUES ('14', '华中', '410000,420000,430000');
INSERT INTO `cmswing_zoning` VALUES ('15', '华南', '350000,440000,450000,460000');
INSERT INTO `cmswing_zoning` VALUES ('16', '东北', '210000,220000,230000');
INSERT INTO `cmswing_zoning` VALUES ('17', '西北', '610000,620000,630000,640000,650000');
INSERT INTO `cmswing_zoning` VALUES ('18', '西南', '500000,510000,520000,530000,540000');
INSERT INTO `cmswing_zoning` VALUES ('20', '港澳台', '710000,810000,820000');