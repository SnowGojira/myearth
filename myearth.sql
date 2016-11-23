/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : myearth

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-11-23 23:38:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mes_action
-- ----------------------------
DROP TABLE IF EXISTS `mes_action`;
CREATE TABLE `mes_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of mes_action
-- ----------------------------
INSERT INTO `mes_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `mes_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `mes_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `mes_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `mes_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `mes_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `mes_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `mes_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `mes_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `mes_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `mes_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for mes_action_log
-- ----------------------------
DROP TABLE IF EXISTS `mes_action_log`;
CREATE TABLE `mes_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of mes_action_log
-- ----------------------------
INSERT INTO `mes_action_log` VALUES ('1', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-22 08:02登录了后台', '1', '1479772920');
INSERT INTO `mes_action_log` VALUES ('2', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-22 08:19登录了后台', '1', '1479773998');
INSERT INTO `mes_action_log` VALUES ('3', '10', '1', '2130706433', 'Menu', '122', '操作url：/myearth/index.php?s=/admin/menu/add.html', '1', '1479774073');
INSERT INTO `mes_action_log` VALUES ('4', '10', '1', '2130706433', 'Menu', '122', '操作url：/myearth/index.php?s=/admin/menu/edit.html', '1', '1479774115');
INSERT INTO `mes_action_log` VALUES ('5', '11', '1', '2130706433', 'category', '39', '操作url：/myearth/index.php?s=/admin/category/add.html', '1', '1479774167');
INSERT INTO `mes_action_log` VALUES ('6', '11', '1', '2130706433', 'category', '40', '操作url：/myearth/index.php?s=/admin/category/add.html', '1', '1479774202');
INSERT INTO `mes_action_log` VALUES ('7', '11', '1', '2130706433', 'category', '41', '操作url：/myearth/index.php?s=/admin/category/add.html', '1', '1479774234');
INSERT INTO `mes_action_log` VALUES ('8', '11', '1', '2130706433', 'category', '42', '操作url：/myearth/index.php?s=/admin/category/add.html', '1', '1479774270');
INSERT INTO `mes_action_log` VALUES ('9', '11', '1', '2130706433', 'category', '43', '操作url：/myearth/index.php?s=/admin/category/add.html', '1', '1479774289');
INSERT INTO `mes_action_log` VALUES ('10', '11', '1', '2130706433', 'category', '44', '操作url：/myearth/index.php?s=/admin/category/add.html', '1', '1479774307');
INSERT INTO `mes_action_log` VALUES ('11', '11', '1', '2130706433', 'category', '45', '操作url：/myearth/index.php?s=/admin/category/add.html', '1', '1479774325');
INSERT INTO `mes_action_log` VALUES ('12', '11', '1', '2130706433', 'category', '46', '操作url：/myearth/index.php?s=/admin/category/add.html', '1', '1479774344');
INSERT INTO `mes_action_log` VALUES ('13', '11', '1', '2130706433', 'category', '47', '操作url：/myearth/index.php?s=/admin/category/add.html', '1', '1479774477');
INSERT INTO `mes_action_log` VALUES ('14', '11', '1', '2130706433', 'category', '42', '操作url：/myearth/index.php?s=/admin/category/edit.html', '1', '1479774607');
INSERT INTO `mes_action_log` VALUES ('15', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-22 13:07登录了后台', '1', '1479791224');
INSERT INTO `mes_action_log` VALUES ('16', '8', '1', '2130706433', 'attribute', '33', '操作url：/myearth/index.php?s=/Admin/Attribute/update.html', '1', '1479791452');
INSERT INTO `mes_action_log` VALUES ('17', '8', '1', '2130706433', 'attribute', '34', '操作url：/myearth/index.php?s=/Admin/Attribute/update.html', '1', '1479791642');
INSERT INTO `mes_action_log` VALUES ('18', '8', '1', '2130706433', 'attribute', '24', '操作url：/myearth/index.php?s=/Admin/Attribute/update.html', '1', '1479791721');
INSERT INTO `mes_action_log` VALUES ('19', '8', '1', '2130706433', 'attribute', '35', '操作url：/myearth/index.php?s=/Admin/Attribute/update.html', '1', '1479791765');
INSERT INTO `mes_action_log` VALUES ('20', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479791801');
INSERT INTO `mes_action_log` VALUES ('21', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479792163');
INSERT INTO `mes_action_log` VALUES ('22', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479792251');
INSERT INTO `mes_action_log` VALUES ('23', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479792276');
INSERT INTO `mes_action_log` VALUES ('24', '11', '1', '2130706433', 'category', '39', '操作url：/myearth/index.php?s=/Admin/Category/edit.html', '1', '1479792327');
INSERT INTO `mes_action_log` VALUES ('25', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479792393');
INSERT INTO `mes_action_log` VALUES ('26', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479792421');
INSERT INTO `mes_action_log` VALUES ('27', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479792521');
INSERT INTO `mes_action_log` VALUES ('28', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479792539');
INSERT INTO `mes_action_log` VALUES ('29', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479792589');
INSERT INTO `mes_action_log` VALUES ('30', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479792664');
INSERT INTO `mes_action_log` VALUES ('31', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479792685');
INSERT INTO `mes_action_log` VALUES ('32', '11', '1', '2130706433', 'category', '2', '操作url：/myearth/index.php?s=/Admin/Category/remove/id/2.html', '1', '1479794171');
INSERT INTO `mes_action_log` VALUES ('33', '11', '1', '2130706433', 'category', '1', '操作url：/myearth/index.php?s=/Admin/Category/remove/id/1.html', '1', '1479794175');
INSERT INTO `mes_action_log` VALUES ('34', '8', '1', '2130706433', 'attribute', '34', '操作url：/myearth/index.php?s=/Admin/Attribute/update.html', '1', '1479795046');
INSERT INTO `mes_action_log` VALUES ('35', '8', '1', '2130706433', 'attribute', '33', '操作url：/myearth/index.php?s=/Admin/Attribute/update.html', '1', '1479795072');
INSERT INTO `mes_action_log` VALUES ('36', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479795286');
INSERT INTO `mes_action_log` VALUES ('37', '10', '1', '2130706433', 'Menu', '2', '操作url：/myearth/index.php?s=/Admin/Menu/edit.html', '1', '1479795360');
INSERT INTO `mes_action_log` VALUES ('38', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-22 21:08登录了后台', '1', '1479820138');
INSERT INTO `mes_action_log` VALUES ('39', '10', '1', '2130706433', 'Menu', '123', '操作url：/myearth/index.php?s=/Admin/Menu/add.html', '1', '1479820255');
INSERT INTO `mes_action_log` VALUES ('40', '7', '1', '2130706433', 'model', '2', '操作url：/myearth/index.php?s=/Admin/Model/update.html', '1', '1479830467');
INSERT INTO `mes_action_log` VALUES ('41', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-23 08:14登录了后台', '1', '1479860056');
INSERT INTO `mes_action_log` VALUES ('42', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-23 08:37登录了后台', '1', '1479861479');
INSERT INTO `mes_action_log` VALUES ('43', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-23 13:26登录了后台', '1', '1479878765');
INSERT INTO `mes_action_log` VALUES ('44', '11', '1', '2130706433', 'category', '43', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479896778');
INSERT INTO `mes_action_log` VALUES ('45', '11', '1', '2130706433', 'category', '44', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479896807');
INSERT INTO `mes_action_log` VALUES ('46', '11', '1', '2130706433', 'category', '45', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479896840');
INSERT INTO `mes_action_log` VALUES ('47', '11', '1', '2130706433', 'category', '46', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479896868');
INSERT INTO `mes_action_log` VALUES ('48', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-23 21:13登录了后台', '1', '1479906788');
INSERT INTO `mes_action_log` VALUES ('49', '11', '1', '2130706433', 'category', '43', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479906803');
INSERT INTO `mes_action_log` VALUES ('50', '11', '1', '2130706433', 'category', '44', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479906804');
INSERT INTO `mes_action_log` VALUES ('51', '11', '1', '2130706433', 'category', '45', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479906805');
INSERT INTO `mes_action_log` VALUES ('52', '11', '1', '2130706433', 'category', '46', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479906806');
INSERT INTO `mes_action_log` VALUES ('53', '11', '1', '2130706433', 'category', '40', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479907511');
INSERT INTO `mes_action_log` VALUES ('54', '11', '1', '2130706433', 'category', '41', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479907552');
INSERT INTO `mes_action_log` VALUES ('55', '11', '1', '2130706433', 'category', '42', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479907577');
INSERT INTO `mes_action_log` VALUES ('56', '11', '1', '2130706433', 'category', '43', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479908131');
INSERT INTO `mes_action_log` VALUES ('57', '11', '1', '2130706433', 'category', '44', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479908139');
INSERT INTO `mes_action_log` VALUES ('58', '11', '1', '2130706433', 'category', '45', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479908153');
INSERT INTO `mes_action_log` VALUES ('59', '11', '1', '2130706433', 'category', '46', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1479908163');
INSERT INTO `mes_action_log` VALUES ('60', '10', '1', '2130706433', 'Menu', '124', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1479913098');
INSERT INTO `mes_action_log` VALUES ('61', '10', '1', '2130706433', 'Menu', '1', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1479914352');
INSERT INTO `mes_action_log` VALUES ('62', '10', '1', '2130706433', 'Menu', '43', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1479914358');

-- ----------------------------
-- Table structure for mes_addons
-- ----------------------------
DROP TABLE IF EXISTS `mes_addons`;
CREATE TABLE `mes_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of mes_addons
-- ----------------------------
INSERT INTO `mes_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `mes_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `mes_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `mes_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `mes_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `mes_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `mes_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for mes_attachment
-- ----------------------------
DROP TABLE IF EXISTS `mes_attachment`;
CREATE TABLE `mes_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of mes_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for mes_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mes_attribute`;
CREATE TABLE `mes_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of mes_attribute
-- ----------------------------
INSERT INTO `mes_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `mes_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `mes_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `mes_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '静态页面时，此字段无效', '1', '', '2', '0', '1', '1479791722', '1383891243', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `mes_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `mes_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `mes_attribute` VALUES ('33', 'isStatic', '是否静态页面', 'int(2) UNSIGNED NOT NULL', 'num', '0', '很重要，懂的人来操作！！0--非静态，1--静态', '1', '', '2', '0', '1', '1479795073', '1479791452', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `mes_attribute` VALUES ('34', 'staticName', '静态模板名称', 'varchar(255) NOT NULL', 'string', '', '很重要，懂的人来操作！！静态页面根目录开始的文件路径信息，包括文件后缀。', '1', '', '2', '0', '1', '1479795046', '1479791642', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `mes_attribute` VALUES ('35', 'subtitle', '副标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '2', '0', '1', '1479791765', '1479791765', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for mes_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `mes_auth_extend`;
CREATE TABLE `mes_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of mes_auth_extend
-- ----------------------------
INSERT INTO `mes_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `mes_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `mes_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `mes_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `mes_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `mes_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `mes_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `mes_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for mes_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `mes_auth_group`;
CREATE TABLE `mes_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_auth_group
-- ----------------------------
INSERT INTO `mes_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `mes_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- ----------------------------
-- Table structure for mes_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `mes_auth_group_access`;
CREATE TABLE `mes_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for mes_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `mes_auth_rule`;
CREATE TABLE `mes_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_auth_rule
-- ----------------------------
INSERT INTO `mes_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `mes_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `mes_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');

-- ----------------------------
-- Table structure for mes_category
-- ----------------------------
DROP TABLE IF EXISTS `mes_category`;
CREATE TABLE `mes_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of mes_category
-- ----------------------------
INSERT INTO `mes_category` VALUES ('39', 'proj_introduction', '项目介绍', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '0', '0', '1', '1', '0', '', '', '1479774167', '1479792327', '1', '0');
INSERT INTO `mes_category` VALUES ('40', 'Special Project', '特色项目', '39', '0', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1479774202', '1479907511', '1', '0');
INSERT INTO `mes_category` VALUES ('41', 'Promotion Project', '背景提升', '39', '0', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1479774234', '1479907552', '1', '0');
INSERT INTO `mes_category` VALUES ('42', 'Study Tour Project', '游学项目', '39', '0', '10', '', '', '', '', '', '', '', '2', '2', '0', '0', '1', '1', '0', '', '', '1479774270', '1479907577', '1', '0');
INSERT INTO `mes_category` VALUES ('43', 'America', '美国游学', '42', '0', '10', '', '', '遇见未来领袖，邂逅美式风情', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1479774289', '1479908131', '1', '23');
INSERT INTO `mes_category` VALUES ('44', 'England', '英国游学', '42', '0', '10', '', '', '学霸养成计划，碰撞英伦文化', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1479774307', '1479908139', '1', '24');
INSERT INTO `mes_category` VALUES ('45', 'Russia', '俄罗斯游学', '42', '0', '10', '', '', '探秘艺术殿堂，魅力名城之旅', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1479774325', '1479908153', '1', '25');
INSERT INTO `mes_category` VALUES ('46', 'Australia', '澳大利亚游学', '42', '0', '10', '', '', '筑梦古典澳洲，启程精彩研学', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1479774344', '1479908163', '1', '26');
INSERT INTO `mes_category` VALUES ('47', 'counselling', '达人咨询', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1479774477', '1479774477', '1', '0');

-- ----------------------------
-- Table structure for mes_channel
-- ----------------------------
DROP TABLE IF EXISTS `mes_channel`;
CREATE TABLE `mes_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_channel
-- ----------------------------
INSERT INTO `mes_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `mes_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `mes_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for mes_config
-- ----------------------------
DROP TABLE IF EXISTS `mes_config`;
CREATE TABLE `mes_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_config
-- ----------------------------
INSERT INTO `mes_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'OneThink内容管理框架', '0');
INSERT INTO `mes_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'OneThink内容管理框架', '1');
INSERT INTO `mes_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '8');
INSERT INTO `mes_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `mes_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `mes_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `mes_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `mes_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `mes_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `mes_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `mes_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `mes_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `mes_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `mes_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `mes_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `mes_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `mes_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `mes_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `mes_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `mes_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `mes_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `mes_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `mes_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `mes_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `mes_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `mes_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `mes_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- ----------------------------
-- Table structure for mes_contact
-- ----------------------------
DROP TABLE IF EXISTS `mes_contact`;
CREATE TABLE `mes_contact` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  `create_time` int(10) NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_contact
-- ----------------------------
INSERT INTO `mes_contact` VALUES ('3', '胡瀚文', '13558771839', 'tianyi1213@163.com', '我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的我写的', '1479912361', '1');

-- ----------------------------
-- Table structure for mes_document
-- ----------------------------
DROP TABLE IF EXISTS `mes_document`;
CREATE TABLE `mes_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `subtitle` varchar(255) DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(250) NOT NULL DEFAULT '' COMMENT '描述',
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
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of mes_document
-- ----------------------------
INSERT INTO `mes_document` VALUES ('4', '1', '', '我是俄罗斯大狗熊', '哇哇~~~~~~~~~~~！！', '45', '', '0', '0', '2', '2', '0', '0', '1', '1', '0', '0', '2', '0', '0', '1', '1479795000', '1479908029', '1');
INSERT INTO `mes_document` VALUES ('2', '1', '', '到月球去旅行', 'hiahiahia', '40', '', '0', '0', '2', '2', '0', '0', '2', '1', '1479794040', '0', '3', '0', '0', '1', '1479794040', '1479794745', '1');
INSERT INTO `mes_document` VALUES ('5', '1', '', '我是俄罗斯大饼兄', '圆你超级美国梦，开启留学新时代', '45', '', '0', '0', '2', '2', '0', '0', '2', '1', '0', '0', '2', '0', '0', '2', '1479823800', '1479823914', '1');
INSERT INTO `mes_document` VALUES ('6', '1', '', '“Go Campus”美国奖学金计划', '留学就业一体化，创造留学新篇章', '40', '“想和你分享的，是我从未想到过的成功故事”\r\n  说起留学，很多人可能都会第一时间想到“遥不可及的美国梦”，我也一样。本以为留学的大门会因此关上，但不曾想，美国公费留学带来了另一个选择。\r\n', '0', '0', '2', '2', '0', '0', '4', '1', '0', '0', '4', '0', '0', '3', '1479829200', '1479830653', '1');
INSERT INTO `mes_document` VALUES ('7', '1', '', '新西兰青年人才计划', '世界顶级商学院的金融学术，造就未来商业领袖', '40', '“选择新西兰，选择另一种人生”\r\n如果说不满意现在的生活，有机会可以选择另一种人生，那为什么不去尝试？\r\n而最简单的方法就是出国留学。很多人应该都会根据学校的世界排名情况来选择学校。', '0', '0', '2', '2', '0', '0', '5', '1', '0', '0', '6', '0', '0', '2', '1479829800', '1479830679', '1');
INSERT INTO `mes_document` VALUES ('8', '1', '', '新加坡ECS未来商界经营训练营', '美国哈佛领导精英养成计划', '41', '  新加坡国立大学管理学院美国国际管理教育联合会（AACSB）认证的亚太地区七所商学院之一 . 国际排名：EMBA亚太地区前3名（亚洲《世界经理人》），MBA亚太地区前3名（亚洲《Asia Inc》）。', '0', '0', '2', '2', '0', '0', '6', '1', '0', '0', '1', '0', '0', '1', '1479829800', '1479830717', '1');
INSERT INTO `mes_document` VALUES ('9', '1', '', '哈佛经典领导课程，塑造明日商界奇迹', '美式教育零距离12日冬令营', '41', '享誉全球的美国思想库－哈弗大学，历史上先后诞生了八位美国总统，四十位诺贝尔奖得主和三十位普利策奖得主。哈佛大学的一举一动决定着全球的社会发展和经济的走向，', '0', '0', '2', '2', '0', '0', '7', '1', '0', '0', '2', '0', '0', '2', '1479829800', '1479830700', '1');
INSERT INTO `mes_document` VALUES ('10', '1', '', '费城假日，邂逅一段尘封往事', '游学剑桥之学霸养成记', '43', '零距离贴近美国校园生活，与美国小伙伴同吃同住，感受地道校园文化，提高口语和听力，与此同时，我们还将带你入住当地友好家庭，体验美国人的家庭文化。', '0', '0', '2', '2', '0', '0', '8', '1', '0', '0', '2', '0', '0', '1', '1479829800', '1479830548', '1');
INSERT INTO `mes_document` VALUES ('11', '1', '', '学术剑桥，碰撞英伦文化', '俄罗斯魅力名城游学之旅', '44', '剑桥深度入校学习体验，带你走进异国他乡的世界，感受世界顶级学府的学术氛围，体验学霸们的求学之旅，邂逅文艺复兴时期的艺术殿堂', '0', '0', '2', '2', '0', '0', '9', '1', '0', '0', '0', '0', '0', '1', '1479829800', '1479830573', '1');
INSERT INTO `mes_document` VALUES ('12', '1', '', '探秘世界顶级艺术殿堂', '', '45', '世界顶级芭蕾学校”瓦冈诺娃芭蕾学院”是世界上最著名和最有影响力的芭蕾舞学校之一，长期以来为著名的莫斯科大剧院和彼得堡马林斯基剧院等输送无数人才和芭蕾舞大师。', '0', '0', '2', '2', '0', '0', '10', '1', '0', '0', '0', '0', '0', '3', '1479830100', '1479830593', '1');
INSERT INTO `mes_document` VALUES ('13', '1', '', '精彩纷呈的澳洲研学之旅', '参与项目：英国游学之《学术剑桥，碰撞英伦文化》', '46', '在悉尼大学，与同学们一起体验古典名校的文化风采，参与各种文化娱乐活动，融入本土生活氛围，近距离体验澳洲人文文化。全程沉浸在纯正的澳式英语环境中，让学员体验前所未有的语言冲击，迅速提升学员的口语能力，并结识新朋友。', '0', '0', '2', '2', '0', '0', '11', '1', '0', '0', '0', '0', '0', '1', '1479830220', '1479830617', '1');
INSERT INTO `mes_document` VALUES ('14', '1', '', '寻英记：玩味英式风情', '参与项目：英国游学之《学术剑桥，碰撞英伦文化》', '47', '姓名：黄同学 我这人最大一个爱好就是看英剧，不过发现了一大特点就是英国人似乎很喜欢自己举办各种各样的party。英剧看多了，自然也就对英国有了很多天马行空的期待，也一直很想要去了解下英国人真正的生活方式。', '0', '0', '2', '2', '0', '0', '12', '1', '0', '0', '1', '0', '0', '5', '1479830880', '1479894209', '1');
INSERT INTO `mes_document` VALUES ('15', '1', '', '游学日记', '一次跨越时空的历练', '47', '姓名：贾同学 飞机坐太久，身体都快麻木，好在最后终于平安地到达目的地——英国，我来啦！ 一直以来，对于英国都很是向往呢，那里不仅有神秘的巨石阵，还有十分古老的皇室家族……', '0', '0', '2', '2', '0', '0', '20', '1', '0', '0', '1', '0', '0', '4', '1479830940', '1479894226', '1');
INSERT INTO `mes_document` VALUES ('16', '1', '', '来，我们做个交换', '参与项目：英国游学之《学术剑桥，碰撞英伦文化》', '47', '姓名：林同学 小时候，就曾经和小伙伴写过交换日记，那时候的经历现在看起来都很幼稚，不过就是写一些琐事；长大后，和别人交流的就是自己的意见了。“如何更有效率地和别人交换意见”也是我在这一次的游学中学到的心得。', '0', '0', '2', '2', '0', '0', '19', '1', '0', '0', '0', '0', '0', '1', '1479862140', '1479894746', '1');
INSERT INTO `mes_document` VALUES ('17', '1', '', '朋友在澳洲，“朋友在中国”', '参与项目：澳大利亚游学之《精彩纷呈的澳洲研学之旅》', '47', '姓名：叶同学 进行分班测试的那天是我来澳洲游学的第2天，测试的标准是不同的英语水平。测试之后，大家就被分到了最适合自己的班级。和我也一样，刚刚进到班级里面，每个人彼此看到的都是新面孔，所以大家一开始都还是挺害羞的.', '0', '0', '2', '2', '0', '0', '21', '1', '0', '0', '0', '0', '0', '3', '1479878940', '1479894256', '1');
INSERT INTO `mes_document` VALUES ('18', '1', '', '时间证明能力，能力基于实践', '参与项目：“Go Campus”美国奖学金计划', '47', '姓名：杨同学 托福／雅思：雅思6.5 GPA：3.04 申请到的学校：卫斯理大学 申请专业：MBA专业 每年学生仅需支付：16000美元（二年共支付32000美元） \r\n图书馆里安静得只能听见笔尖行走的声音，明媚的阳光从窗户透过来，洒在我身上，十分慵懒安逸。可是我却无心品鉴这样的舒适，因为无数的案例在吸引着我', '0', '0', '2', '2', '0', '0', '22', '1', '0', '0', '2', '0', '0', '2', '1479878940', '1479894751', '1');

-- ----------------------------
-- Table structure for mes_document_article
-- ----------------------------
DROP TABLE IF EXISTS `mes_document_article`;
CREATE TABLE `mes_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `isStatic` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否静态页面',
  `staticName` varchar(255) NOT NULL COMMENT '静态模板名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of mes_document_article
-- ----------------------------
INSERT INTO `mes_document_article` VALUES ('4', '0', '', '', '0', '0', '');
INSERT INTO `mes_document_article` VALUES ('5', '0', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '', '0', '0', '');
INSERT INTO `mes_document_article` VALUES ('6', '0', '', '', '0', '1', 'project-sdetailed1.html');
INSERT INTO `mes_document_article` VALUES ('7', '0', '', '', '0', '1', 'project-sdetailed2.html');
INSERT INTO `mes_document_article` VALUES ('8', '0', '', '', '0', '1', 'project-bdetailed1.html');
INSERT INTO `mes_document_article` VALUES ('9', '0', '', '', '0', '1', 'project-bdetailed2.html');
INSERT INTO `mes_document_article` VALUES ('10', '0', '', '', '0', '1', 'project-tdetailed1-1.html');
INSERT INTO `mes_document_article` VALUES ('11', '0', '', '', '0', '1', 'project-tdetailed2-1.html');
INSERT INTO `mes_document_article` VALUES ('12', '0', '', '', '0', '1', 'project-tdetailed3-1.html');
INSERT INTO `mes_document_article` VALUES ('13', '0', '', '', '0', '1', 'project-tdetailed4-1.html');
INSERT INTO `mes_document_article` VALUES ('14', '0', '', '', '0', '1', 'consulting-detailed11.html');
INSERT INTO `mes_document_article` VALUES ('15', '0', '', '', '0', '1', 'consulting-detailed9.html');
INSERT INTO `mes_document_article` VALUES ('2', '0', '呵呵呵呵呵呵呵呵呵呵呵！！！！！！！！！！！！！！！！', '', '0', '0', '');
INSERT INTO `mes_document_article` VALUES ('16', '0', '', '', '0', '1', 'consulting-detailed10.html');
INSERT INTO `mes_document_article` VALUES ('17', '0', '', '', '0', '1', 'consulting-detailed7.html');
INSERT INTO `mes_document_article` VALUES ('18', '0', '', '', '0', '1', 'consulting-detailed4.html');

-- ----------------------------
-- Table structure for mes_document_download
-- ----------------------------
DROP TABLE IF EXISTS `mes_document_download`;
CREATE TABLE `mes_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of mes_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for mes_file
-- ----------------------------
DROP TABLE IF EXISTS `mes_file`;
CREATE TABLE `mes_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of mes_file
-- ----------------------------

-- ----------------------------
-- Table structure for mes_hooks
-- ----------------------------
DROP TABLE IF EXISTS `mes_hooks`;
CREATE TABLE `mes_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_hooks
-- ----------------------------
INSERT INTO `mes_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `mes_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `mes_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `mes_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `mes_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `mes_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `mes_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `mes_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `mes_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `mes_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `mes_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for mes_member
-- ----------------------------
DROP TABLE IF EXISTS `mes_member`;
CREATE TABLE `mes_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of mes_member
-- ----------------------------
INSERT INTO `mes_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '10', '9', '0', '1479772882', '2130706433', '1479906788', '1');

-- ----------------------------
-- Table structure for mes_menu
-- ----------------------------
DROP TABLE IF EXISTS `mes_menu`;
CREATE TABLE `mes_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_menu
-- ----------------------------
INSERT INTO `mes_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('2', '文章', '0', '3', 'Article/mydocument', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `mes_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `mes_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('16', '用户', '0', '2', 'User/index', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `mes_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `mes_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `mes_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `mes_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `mes_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `mes_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `mes_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `mes_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `mes_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `mes_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `mes_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `mes_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `mes_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `mes_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `mes_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `mes_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `mes_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `mes_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `mes_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `mes_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `mes_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `mes_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `mes_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `mes_menu` VALUES ('43', '扩展', '0', '8', 'Addons/index', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `mes_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `mes_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `mes_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `mes_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `mes_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `mes_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `mes_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `mes_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `mes_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `mes_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `mes_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `mes_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `mes_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `mes_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `mes_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('68', '系统', '0', '6', 'Config/group', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `mes_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `mes_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `mes_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `mes_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `mes_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `mes_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `mes_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
INSERT INTO `mes_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0');
INSERT INTO `mes_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `mes_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `mes_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `mes_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `mes_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `mes_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `mes_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `mes_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `mes_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `mes_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `mes_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `mes_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `mes_menu` VALUES ('93', '其他', '0', '7', 'other', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `mes_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `mes_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('122', '类型管理', '0', '9', 'category/index', '1', '', '', '0');
INSERT INTO `mes_menu` VALUES ('123', '轮播', '0', '4', 'Slide/index', '0', '', '', '0');
INSERT INTO `mes_menu` VALUES ('124', '留言', '0', '5', 'Contact/index', '0', '', '', '0');

-- ----------------------------
-- Table structure for mes_model
-- ----------------------------
DROP TABLE IF EXISTS `mes_model`;
CREATE TABLE `mes_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of mes_model
-- ----------------------------
INSERT INTO `mes_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `mes_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"35\",\"33\",\"34\",\"12\",\"24\",\"5\",\"20\"],\"2\":[\"25\",\"26\",\"2\",\"9\",\"10\",\"11\",\"13\",\"14\",\"16\",\"17\",\"19\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1479830467', '1', 'MyISAM');
INSERT INTO `mes_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');

-- ----------------------------
-- Table structure for mes_picture
-- ----------------------------
DROP TABLE IF EXISTS `mes_picture`;
CREATE TABLE `mes_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_picture
-- ----------------------------
INSERT INTO `mes_picture` VALUES ('1', '/Uploads/Picture/2016-11-22/5833d4f7e753c.jpg', '', '4b51f47e1aea4ceb8a7ecd210538ca73', '29771ead7c7f48d90eed610a79d0f84f95e512c5', '1', '1479791863');
INSERT INTO `mes_picture` VALUES ('2', '/Uploads/Picture/2016-11-22/5833dd974dbb7.jpg', '', 'b75c3c480d966b4dc97b271dc61b8706', '0e551f748497396c0accee15fc921637223f9586', '1', '1479794071');
INSERT INTO `mes_picture` VALUES ('3', '/Uploads/Picture/2016-11-22/5834445929f60.png', '', '6a43bf9dc382d194aa534a7ba57ac212', '10652d53341c05d5c204c833e97216b11da621b1', '1', '1479820377');
INSERT INTO `mes_picture` VALUES ('4', '/Uploads/Picture/2016-11-22/583468a49c152.jpg', '', 'acb7111e9f79240083b44355b6c39dc1', '8f7f96ef611338dd535fd185e2a57e7b3f82dcbc', '1', '1479829668');
INSERT INTO `mes_picture` VALUES ('5', '/Uploads/Picture/2016-11-22/5834691ef0cc8.jpg', '', '54c1902d9001ade020a2ef8f4d63ed3a', '4193be7a795b459ab304a923ac8d61439c35d2d8', '1', '1479829790');
INSERT INTO `mes_picture` VALUES ('6', '/Uploads/Picture/2016-11-22/5834696190ce1.jpg', '', '98c61098c7d7ccb29ed3a32ccaae86f9', '368489373b70dcaede57e6780076019a91719ee1', '1', '1479829857');
INSERT INTO `mes_picture` VALUES ('7', '/Uploads/Picture/2016-11-22/583469a5416d8.jpg', '', '69c36a4c38531113642b19344abfd3bd', '0050fd29221127708b0ee93b1557d671c5ee383a', '1', '1479829925');
INSERT INTO `mes_picture` VALUES ('8', '/Uploads/Picture/2016-11-22/58346a3e8637f.jpg', '', 'af9a665d1716f50f4f41684377cadba9', 'ce03651ec22f2c22609a5b555e19ccf703e83c82', '1', '1479830078');
INSERT INTO `mes_picture` VALUES ('9', '/Uploads/Picture/2016-11-22/58346a7629fa5.jpg', '', 'db7e12c0a4374803d91f6e24f312c5b7', '6ecb4afb5979336db0c2bc65a81e3ceea5aac34d', '1', '1479830134');
INSERT INTO `mes_picture` VALUES ('10', '/Uploads/Picture/2016-11-22/58346ac9bf183.jpg', '', '1b12cdf521753b374b93905f952e615a', 'c276edf5d9cea9e844a1f75c173c0b884f66fcf1', '1', '1479830217');
INSERT INTO `mes_picture` VALUES ('11', '/Uploads/Picture/2016-11-22/58346af8db18a.jpg', '', '581785052ac64889629aaeaf98487b32', 'e6d16f187db3085ad226344d405a42f1f67e5f4d', '1', '1479830264');
INSERT INTO `mes_picture` VALUES ('12', '/Uploads/Picture/2016-11-23/58346d79b3378.jpg', '', '204ee4ae259b86197d1d06bf28469d32', '7ed96aaa054e63b5a5b147557aab0b9dc793c5a7', '1', '1479830905');
INSERT INTO `mes_picture` VALUES ('13', '/Uploads/Picture/2016-11-23/58346e77862d5.jpg', '', '1ef084f1890b6fa3b2d46b88382820cb', '88a3c31701c240f789e16645bbd74c1cb5d74326', '1', '1479831159');
INSERT INTO `mes_picture` VALUES ('14', '/Uploads/Picture/2016-11-23/583470cadd1aa.jpg', '', 'c2bb5c85d2123a1be97b3e412ce5f02a', '1f2d1378e9aeac01917698f39c2c844dc4526a80', '1', '1479831754');
INSERT INTO `mes_picture` VALUES ('15', '/Uploads/Picture/2016-11-23/58347106c121b.jpg', '', '408eb6f2ffcaebcfd5101950446ff896', '44e500f2d3ce4e9bcbadec9b2ca0b7154a125343', '1', '1479831814');
INSERT INTO `mes_picture` VALUES ('16', '/Uploads/Picture/2016-11-23/5834df85a69d4.png', '', 'f4158e89e15d090343b019141a1306d2', '00960d94b08cce5e6f6b4cdfa78d94b4c1fa23d9', '1', '1479860101');
INSERT INTO `mes_picture` VALUES ('17', '/Uploads/Picture/2016-11-23/5834dfcf8344c.png', '', 'a87e8f4488eb23580baef1308cd729cb', '2be0bac625626558fae91db9e7c6ec7f31d8b26c', '1', '1479860175');
INSERT INTO `mes_picture` VALUES ('18', '/Uploads/Picture/2016-11-23/5834dfe93c952.png', '', 'd2aa52c32ed887b14c40f0d857781c67', '65e054be3a78e8d7d878c0016b068e7876ebaef6', '1', '1479860201');
INSERT INTO `mes_picture` VALUES ('19', '/Uploads/Picture/2016-11-23/5834e7a956947.jpg', '', 'e8ad318da7177ad62e51aaade088ad4d', '81622ac4d71bcdee0392111f23dadb52ba7556c2', '1', '1479862185');
INSERT INTO `mes_picture` VALUES ('20', '/Uploads/Picture/2016-11-23/583528ab3307f.jpg', '', '8c170f044b38e51fb4315bcc1c3898ef', '851eac67dfd134c7459ac444f16d520967875dd0', '1', '1479878827');
INSERT INTO `mes_picture` VALUES ('21', '/Uploads/Picture/2016-11-23/583529235a8d0.jpg', '', 'bca0bfb44087b2c15a7b45e1251c27b9', '5e8f4cdfe345b365aa95b8720707c5400ba09281', '1', '1479878947');
INSERT INTO `mes_picture` VALUES ('22', '/Uploads/Picture/2016-11-23/58352951a7db9.jpg', '', '26fd686af76e38daaefc1ecf1dc2e566', 'b455b7a198ac17d03123938fbd8a01cf1051842c', '1', '1479878993');
INSERT INTO `mes_picture` VALUES ('23', '/Uploads/Picture/2016-11-23/58356ec14e6e5.png', '', '0c6c9e5850d0d2afedab6d9cb300504a', 'c29371ddb602705339f3d5ed4e24f9349f8b8176', '1', '1479896769');
INSERT INTO `mes_picture` VALUES ('24', '/Uploads/Picture/2016-11-23/58356ee0a589e.png', '', '1ac3c90a9c8847a0b802f3ef3f02dbe0', 'cb6a39aff1685eb74ec44f4841127ae654fb455b', '1', '1479896800');
INSERT INTO `mes_picture` VALUES ('25', '/Uploads/Picture/2016-11-23/58356efd47f1b.png', '', 'ef1163d26c80cd00a694d96a90139bc7', '658faa6d160620636cef7d6826d330d3455f6564', '1', '1479896829');
INSERT INTO `mes_picture` VALUES ('26', '/Uploads/Picture/2016-11-23/58356f229a023.png', '', 'da0dfb5026c62c4a3306f10aade5c581', 'ad8df52a8e6412f0615da8e904d65b1d3cb9c85b', '1', '1479896866');

-- ----------------------------
-- Table structure for mes_slide
-- ----------------------------
DROP TABLE IF EXISTS `mes_slide`;
CREATE TABLE `mes_slide` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pos` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-首页',
  `url` varchar(255) NOT NULL DEFAULT '0' COMMENT '种类id',
  `entity_id` int(10) NOT NULL DEFAULT '0' COMMENT '实体id',
  `cover_id` int(10) NOT NULL DEFAULT '0' COMMENT '封面图片id',
  `title_pic_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '轮播图片说明',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '2--禁用，1--可用，-1--删除',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `shopid` int(10) NOT NULL COMMENT '0--所有商店',
  `home_show` int(2) NOT NULL DEFAULT '0' COMMENT '0--首页不显示；1--首页显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_slide
-- ----------------------------
INSERT INTO `mes_slide` VALUES ('9', '1', 'Home/Custom/detail', '7', '14', '0', '新西兰人才计划', '1', '1478068362', '1479861450', '69', '1');
INSERT INTO `mes_slide` VALUES ('10', '1', '0', '6', '13', '0', '“Go Campus”美国奖学金计划', '1', '1479821326', '1479861444', '0', '0');
INSERT INTO `mes_slide` VALUES ('11', '1', '0', '0', '15', '16', '首页', '1', '1479831820', '1479861436', '0', '0');

-- ----------------------------
-- Table structure for mes_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `mes_ucenter_admin`;
CREATE TABLE `mes_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of mes_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for mes_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `mes_ucenter_app`;
CREATE TABLE `mes_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of mes_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for mes_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `mes_ucenter_member`;
CREATE TABLE `mes_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of mes_ucenter_member
-- ----------------------------
INSERT INTO `mes_ucenter_member` VALUES ('1', 'admin', '0f84b87991a7d300a25319b6efe6a5e9', 'tianyi1213@163.com', '', '1479772882', '2130706433', '1479906788', '2130706433', '1479772882', '1');

-- ----------------------------
-- Table structure for mes_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `mes_ucenter_setting`;
CREATE TABLE `mes_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of mes_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for mes_url
-- ----------------------------
DROP TABLE IF EXISTS `mes_url`;
CREATE TABLE `mes_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of mes_url
-- ----------------------------

-- ----------------------------
-- Table structure for mes_userdata
-- ----------------------------
DROP TABLE IF EXISTS `mes_userdata`;
CREATE TABLE `mes_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mes_userdata
-- ----------------------------
