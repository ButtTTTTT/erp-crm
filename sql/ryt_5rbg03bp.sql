/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : ryt_5rbg03bp

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2023-07-28 12:17:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `crm_comment`
-- ----------------------------
DROP TABLE IF EXISTS `crm_comment`;
CREATE TABLE `crm_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `content` varchar(512) DEFAULT NULL COMMENT '回复内容',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户跟进记录表';

-- ----------------------------
-- Records of crm_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_customer`
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer`;
CREATE TABLE `crm_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `code` varchar(32) DEFAULT '' COMMENT '客户编号',
  `name` varchar(64) DEFAULT '' COMMENT '客户名称',
  `linkman` varchar(64) DEFAULT '' COMMENT '联系人',
  `phone` varchar(64) DEFAULT '' COMMENT '联系电话',
  `region` varchar(64) DEFAULT '' COMMENT '地区',
  `customer_industry` varchar(64) DEFAULT '' COMMENT '客户行业',
  `customer_rank` varchar(64) DEFAULT '' COMMENT '客户级别',
  `customer_status` varchar(64) DEFAULT '' COMMENT '客户状态',
  `clues_name` varchar(64) DEFAULT '' COMMENT '线索名称',
  `clues_source` varchar(64) DEFAULT '' COMMENT '线索来源',
  `clues_status` varchar(64) DEFAULT '' COMMENT '线索状态',
  `deal_status` char(1) DEFAULT '0' COMMENT '是否成交(0未成交 1成交)',
  `status` char(1) DEFAULT '1' COMMENT '状态(0线索 1客户 2公海)',
  `owner` varchar(64) DEFAULT NULL COMMENT '负责人',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志(0代表存在 2代表删除)',
  `version` int(11) DEFAULT '0' COMMENT '版本',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `last_update_record` varchar(255) DEFAULT '' COMMENT '最后跟进记录',
  `last_followup_time` datetime DEFAULT NULL COMMENT '最后跟进时间',
  `next_followup_time` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `pre_owner` varchar(64) DEFAULT '' COMMENT '前负责人',
  `to_pool_time` datetime DEFAULT NULL COMMENT '转公海时间',
  `to_customer_time` datetime DEFAULT NULL COMMENT '转客户时间',
  `pool_type` varchar(64) DEFAULT '' COMMENT '公海类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户表';

-- ----------------------------
-- Records of crm_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_order`
-- ----------------------------
DROP TABLE IF EXISTS `crm_order`;
CREATE TABLE `crm_order` (
  `id` bigint(20) NOT NULL,
  `order_no` varchar(32) NOT NULL COMMENT '订单编号',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `amount` decimal(19,2) DEFAULT '0.00' COMMENT '订单金额',
  `owner` varchar(64) DEFAULT NULL COMMENT '负责人',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT '1' COMMENT '状态(0待审核 1审核通过 2审核不通过)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_order_no` (`order_no`) USING BTREE,
  KEY `idx_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of crm_order
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-02-26 20:21:25', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('2', '客户管理-公海规则', 'crm.pool.days', '10', 'Y', 'admin', '2023-02-26 20:21:25', '', null, '超过时间未跟进将客户移入公海，单位：天');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', 'superAdmin', '0', 'admin', '00000000000', 'admin@admin.com', '0', '0', 'admin', '2023-02-26 20:21:26', 'admin', '2023-02-26 20:21:26');

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-01-11 19:11:40', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-01-11 19:11:40', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-01-11 19:11:40', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-01-11 19:11:40', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-01-11 19:11:40', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-01-11 19:11:40', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-01-11 19:11:40', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-01-11 19:11:40', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-01-11 19:11:40', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '北京市', '北京市', 'region_list', null, 'default', 'N', '0', 'admin', '2022-01-12 18:08:08', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('101', '0', '上海市', '上海市', 'region_list', null, 'default', 'N', '0', 'admin', '2022-01-12 18:08:15', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('102', '0', '广东省', '广东省', 'region_list', null, 'default', 'N', '0', 'admin', '2022-01-12 18:08:25', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('103', '0', '百度', '百度', 'clues_source', null, 'default', 'N', '0', 'admin', '2022-01-12 18:09:02', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('104', '1', '抖音', '抖音', 'clues_source', null, 'default', 'N', '0', 'admin', '2022-01-12 18:09:08', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('105', '2', '头条', '头条', 'clues_source', null, 'default', 'N', '0', 'admin', '2022-01-12 18:09:31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('106', '3', '电话', '电话', 'clues_source', null, 'default', 'N', '0', 'admin', '2022-01-12 18:09:40', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('107', '0', '有效', '有效', 'clues_status', null, 'default', 'N', '0', 'admin', '2022-01-12 18:09:59', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('108', '1', '无效', '无效', 'clues_status', null, 'default', 'N', '0', 'admin', '2022-01-12 18:10:06', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('109', '0', '计算机互联网', '计算机互联网', 'customer_industry', null, 'default', 'N', '0', 'admin', '2022-01-12 18:10:50', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('110', '1', '加工生产', '加工生产', 'customer_industry', null, 'default', 'N', '0', 'admin', '2022-01-12 18:11:02', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('111', '2', '房地产', '房地产', 'customer_industry', null, 'default', 'N', '0', 'admin', '2022-01-12 18:11:20', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('112', '3', '金融', '金融', 'customer_industry', null, 'default', 'N', '0', 'admin', '2022-01-12 18:11:34', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('113', '0', 'A', 'A', 'customer_rank', null, 'default', 'N', '0', 'admin', '2022-01-12 18:11:55', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('114', '1', 'B', 'B', 'customer_rank', null, 'default', 'N', '0', 'admin', '2022-01-12 18:11:59', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('115', '2', 'C', 'C', 'customer_rank', null, 'default', 'N', '0', 'admin', '2022-01-12 18:12:04', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('116', '3', 'D', 'D', 'customer_rank', null, 'default', 'N', '0', 'admin', '2022-01-12 18:12:10', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('117', '4', 'E', 'E', 'customer_rank', null, 'default', 'N', '0', 'admin', '2022-01-12 18:12:18', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('118', '0', '测试客户', '测试客户', 'customer_status', null, 'default', 'N', '0', 'admin', '2022-01-12 18:12:56', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('119', '1', '意向客户', '意向客户', 'customer_status', null, 'default', 'N', '0', 'admin', '2022-01-12 18:13:07', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('120', '2', '签单客户', '签单客户', 'customer_status', null, 'default', 'N', '0', 'admin', '2022-01-12 18:13:17', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('121', '3', '回款客户', '回款客户', 'customer_status', null, 'default', 'N', '0', 'admin', '2022-01-12 18:13:31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('122', '4', '上门客户', '上门客户', 'customer_status', null, 'default', 'N', '0', 'admin', '2022-01-12 18:13:42', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('123', '0', '普通', 'normal', 'pool_type', null, 'default', 'N', '0', 'admin', '2022-01-13 13:33:07', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('124', '1', '高级', 'high', 'pool_type', null, 'default', 'N', '0', 'admin', '2022-01-13 13:33:24', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('125', '0', '未成交', '0', 'deal_status', null, 'default', 'N', '0', 'admin', '2022-01-15 18:11:42', 'admin', '2022-01-15 18:12:15', null);
INSERT INTO `sys_dict_data` VALUES ('126', '1', '已成交', '1', 'deal_status', null, 'default', 'N', '0', 'admin', '2022-01-15 18:11:58', 'admin', '2022-01-15 18:12:09', null);

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-01-11 19:11:40', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-01-11 19:11:40', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-01-11 19:11:40', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-01-11 19:11:40', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-01-11 19:11:40', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-01-11 19:11:40', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-01-11 19:11:40', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-01-11 19:11:40', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-01-11 19:11:40', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-01-11 19:11:40', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '线索来源', 'clues_source', '0', 'admin', '2022-01-12 18:05:44', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('101', '线索状态', 'clues_status', '0', 'admin', '2022-01-12 18:05:59', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('102', '行业类别', 'customer_industry', '0', 'admin', '2022-01-12 18:06:30', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('103', '客户级别', 'customer_rank', '0', 'admin', '2022-01-12 18:06:42', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('104', '客户状态', 'customer_status', '0', 'admin', '2022-01-12 18:06:54', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('105', '所在地区', 'region_list', '0', 'admin', '2022-01-12 18:07:47', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('106', '公海类型', 'pool_type', '0', 'admin', '2022-01-13 13:28:04', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('107', '成交状态', 'deal_status', '0', 'admin', '2022-01-15 18:10:43', '', null, null);

-- ----------------------------
-- Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('1', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-26 20:21:41');
INSERT INTO `sys_logininfor` VALUES ('2', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-02-26 20:26:55');
INSERT INTO `sys_logininfor` VALUES ('3', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-26 20:52:53');
INSERT INTO `sys_logininfor` VALUES ('4', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-27 11:08:06');
INSERT INTO `sys_logininfor` VALUES ('5', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-27 12:05:37');
INSERT INTO `sys_logininfor` VALUES ('6', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-27 14:00:10');
INSERT INTO `sys_logininfor` VALUES ('7', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-27 14:33:03');
INSERT INTO `sys_logininfor` VALUES ('8', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-27 15:08:38');
INSERT INTO `sys_logininfor` VALUES ('9', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-27 15:15:28');
INSERT INTO `sys_logininfor` VALUES ('10', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-27 15:15:38');
INSERT INTO `sys_logininfor` VALUES ('11', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-27 16:12:40');
INSERT INTO `sys_logininfor` VALUES ('12', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-27 16:45:11');
INSERT INTO `sys_logininfor` VALUES ('13', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-27 17:33:08');
INSERT INTO `sys_logininfor` VALUES ('14', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-27 17:56:11');
INSERT INTO `sys_logininfor` VALUES ('15', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-27 17:56:24');
INSERT INTO `sys_logininfor` VALUES ('16', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-28 09:04:10');
INSERT INTO `sys_logininfor` VALUES ('17', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-28 11:03:33');
INSERT INTO `sys_logininfor` VALUES ('18', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-02-28 12:17:57');
INSERT INTO `sys_logininfor` VALUES ('19', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-28 12:19:10');
INSERT INTO `sys_logininfor` VALUES ('20', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-28 14:58:22');
INSERT INTO `sys_logininfor` VALUES ('21', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2023-02-28 15:58:27');
INSERT INTO `sys_logininfor` VALUES ('22', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-28 15:58:34');
INSERT INTO `sys_logininfor` VALUES ('23', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-28 16:38:10');
INSERT INTO `sys_logininfor` VALUES ('24', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-28 17:10:40');
INSERT INTO `sys_logininfor` VALUES ('25', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-28 18:01:06');
INSERT INTO `sys_logininfor` VALUES ('26', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-02-28 18:28:42');
INSERT INTO `sys_logininfor` VALUES ('27', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-28 18:29:58');
INSERT INTO `sys_logininfor` VALUES ('28', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-01 08:53:54');
INSERT INTO `sys_logininfor` VALUES ('29', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-01 09:45:11');
INSERT INTO `sys_logininfor` VALUES ('30', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-03 11:21:02');
INSERT INTO `sys_logininfor` VALUES ('31', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-03-03 11:21:37');
INSERT INTO `sys_logininfor` VALUES ('32', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-24 14:57:11');
INSERT INTO `sys_logininfor` VALUES ('33', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-03-24 15:01:32');
INSERT INTO `sys_logininfor` VALUES ('34', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2023-03-24 15:35:00');
INSERT INTO `sys_logininfor` VALUES ('35', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-14 12:15:42');
INSERT INTO `sys_logininfor` VALUES ('36', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-04-14 12:17:55');
INSERT INTO `sys_logininfor` VALUES ('37', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-14 14:19:38');
INSERT INTO `sys_logininfor` VALUES ('38', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-04-14 14:19:43');
INSERT INTO `sys_logininfor` VALUES ('39', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-14 14:31:29');
INSERT INTO `sys_logininfor` VALUES ('40', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-17 20:40:58');
INSERT INTO `sys_logininfor` VALUES ('41', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-18 11:18:18');
INSERT INTO `sys_logininfor` VALUES ('42', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-18 11:18:30');
INSERT INTO `sys_logininfor` VALUES ('43', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-04-18 11:36:08');
INSERT INTO `sys_logininfor` VALUES ('44', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-13 15:05:26');
INSERT INTO `sys_logininfor` VALUES ('45', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2023-06-13 15:05:33');
INSERT INTO `sys_logininfor` VALUES ('46', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-06-13 15:05:42');
INSERT INTO `sys_logininfor` VALUES ('47', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-06-13 15:09:03');
INSERT INTO `sys_logininfor` VALUES ('48', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-06-13 15:51:22');
INSERT INTO `sys_logininfor` VALUES ('49', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-06-13 15:54:39');
INSERT INTO `sys_logininfor` VALUES ('50', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-06-13 16:38:21');
INSERT INTO `sys_logininfor` VALUES ('51', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-06-13 17:07:37');
INSERT INTO `sys_logininfor` VALUES ('52', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-14 11:31:59');
INSERT INTO `sys_logininfor` VALUES ('53', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-06-14 11:32:15');
INSERT INTO `sys_logininfor` VALUES ('54', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-20 14:13:07');
INSERT INTO `sys_logininfor` VALUES ('55', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-20 14:13:17');
INSERT INTO `sys_logininfor` VALUES ('56', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-07-20 14:34:42');
INSERT INTO `sys_logininfor` VALUES ('57', 'superAdmin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '登录用户：superAdmin 不存在', '2023-07-28 12:12:38');
INSERT INTO `sys_logininfor` VALUES ('58', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-28 12:12:47');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2022 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '200', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2022-01-11 19:11:40', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-01-11 19:11:40', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-01-11 19:11:40', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-01-11 19:11:40', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-01-11 19:11:40', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-01-11 19:11:40', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-01-11 19:11:40', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-01-11 19:11:40', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-01-11 19:11:40', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2022-01-11 19:11:40', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '1', '10', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-01-11 19:11:40', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-01-11 19:11:40', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-01-11 19:11:40', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-01-11 19:11:40', 'admin', '2023-02-28 16:45:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '公海管理', '0', '100', 'crm/pool', null, null, '1', '0', 'M', '0', '1', '', 'peoples', 'admin', '2022-01-12 19:23:39', 'admin', '2023-02-28 14:58:40', '');
INSERT INTO `sys_menu` VALUES ('2007', '线索管理', '0', '101', 'crm/clues', null, null, '1', '0', 'M', '0', '1', '', 'time-range', 'admin', '2022-01-12 19:25:51', 'admin', '2023-02-28 14:58:59', '');
INSERT INTO `sys_menu` VALUES ('2008', '客户管理', '0', '102', 'crm/customer', null, null, '1', '0', 'M', '0', '1', '', 'user', 'admin', '2022-01-12 19:26:15', 'admin', '2023-02-28 14:59:05', '');
INSERT INTO `sys_menu` VALUES ('2009', '客户公海', '2006', '100', 'list', 'crm/pool/list', null, '1', '0', 'C', '0', '0', 'crm:pool:list', '#', 'admin', '2022-01-12 19:33:38', 'admin', '2022-01-12 19:59:51', '');
INSERT INTO `sys_menu` VALUES ('2010', '我的线索', '2007', '100', 'person', 'crm/clues/person-list', null, '1', '0', 'C', '0', '0', 'crm:clues:person:list', '#', 'admin', '2022-01-12 19:37:30', 'admin', '2022-01-12 19:47:18', '');
INSERT INTO `sys_menu` VALUES ('2011', '线索列表', '2007', '101', 'list', 'crm/clues/list', null, '1', '0', 'C', '0', '0', 'crm:clues:list', '#', 'admin', '2022-01-12 19:38:49', 'admin', '2022-01-12 19:50:03', '');
INSERT INTO `sys_menu` VALUES ('2012', '我的客户', '2008', '100', 'person', 'crm/customer/person-list', null, '1', '0', 'C', '0', '0', 'crm:customer:person:list', '#', 'admin', '2022-01-12 19:42:14', 'admin', '2022-01-12 19:47:26', '');
INSERT INTO `sys_menu` VALUES ('2013', '客户列表', '2008', '101', 'list', 'crm/customer/list', null, '1', '0', 'C', '0', '0', 'crm:customer:list', '#', 'admin', '2022-01-12 19:42:44', 'admin', '2022-01-12 19:50:29', '');
INSERT INTO `sys_menu` VALUES ('2014', '成交客户', '2008', '102', 'deal', 'crm/customer/deal-list', null, '1', '0', 'C', '0', '0', 'crm:customer:deal:list', '#', 'admin', '2022-01-12 19:43:37', 'admin', '2022-01-12 19:50:32', '');
INSERT INTO `sys_menu` VALUES ('2015', '业绩订单', '0', '103', 'crm/order', null, null, '1', '0', 'M', '0', '1', '', 'money', 'admin', '2022-01-19 10:20:01', 'admin', '2023-02-28 14:59:12', '');
INSERT INTO `sys_menu` VALUES ('2016', '我的订单', '2015', '0', 'crm/customer', 'crm/order/person-list', null, '1', '0', 'C', '0', '0', 'crm:order:person:list', '#', 'admin', '2022-01-19 10:20:36', 'admin', '2022-01-19 10:21:08', '');
INSERT INTO `sys_menu` VALUES ('2017', '订单列表', '2015', '1', 'crm/order', 'crm/order/list', null, '1', '0', 'C', '0', '0', 'crm:order:list', '#', 'admin', '2022-01-19 11:07:45', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '租户管理', '0', '1', 'system/tenant', null, null, '1', '0', 'M', '0', '0', '', 'example', 'admin', '2023-02-27 11:19:43', 'admin', '2023-02-27 16:53:25', '');
INSERT INTO `sys_menu` VALUES ('2019', '租户管理', '2018', '1', 'tenant', 'system/tenant/list', null, '1', '0', 'C', '0', '0', 'system:tenanst:list', 'edit', 'admin', '2023-02-27 15:10:47', 'admin', '2023-03-24 14:59:32', '');
INSERT INTO `sys_menu` VALUES ('2020', '查询', '2019', '1', '', null, null, '1', '0', 'F', '0', '0', 'system:tenant:query', '#', 'admin', '2023-02-28 16:45:30', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '修改', '2019', '2', '', null, null, '1', '0', 'F', '0', '0', '', '#', 'admin', '2023-02-28 17:11:58', 'admin', '2023-02-28 18:04:18', '');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"租户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"1\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 11:19:43');
INSERT INTO `sys_oper_log` VALUES ('2', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"租户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/order\",\"children\":[],\"createTime\":1677467983000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 12:10:02');
INSERT INTO `sys_oper_log` VALUES ('3', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"租户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/tenant\",\"children\":[],\"createTime\":1677467983000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 14:04:29');
INSERT INTO `sys_oper_log` VALUES ('4', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"租户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/order\",\"children\":[],\"createTime\":1677467983000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 14:07:59');
INSERT INTO `sys_oper_log` VALUES ('5', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"crm/order\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 15:10:47');
INSERT INTO `sys_oper_log` VALUES ('6', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"crm/order\",\"component\":\"crm/order/list\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"crm:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 15:12:15');
INSERT INTO `sys_oper_log` VALUES ('7', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"crm/tenant\",\"component\":\"crm/tenant/list\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"crm:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 15:14:29');
INSERT INTO `sys_oper_log` VALUES ('8', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"租户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/tenant\",\"children\":[],\"createTime\":1677467983000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 15:16:10');
INSERT INTO `sys_oper_log` VALUES ('9', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"租户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system/tenant\",\"children\":[],\"createTime\":1677467983000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 16:53:25');
INSERT INTO `sys_oper_log` VALUES ('10', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"system/tenant\",\"component\":\"system/tenant/list\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"crm:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 16:58:27');
INSERT INTO `sys_oper_log` VALUES ('11', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"system/tenant\",\"component\":\"system/tenant/list\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 16:59:45');
INSERT INTO `sys_oper_log` VALUES ('12', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"tenant\",\"component\":\"system/tenant/list\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 17:00:39');
INSERT INTO `sys_oper_log` VALUES ('13', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"post\",\"component\":\"system/post/index\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 17:37:41');
INSERT INTO `sys_oper_log` VALUES ('14', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"post\",\"component\":\"system/tenant/list\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 17:53:06');
INSERT INTO `sys_oper_log` VALUES ('15', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"tenant\",\"component\":\"system/tenant/list\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-27 17:55:18');
INSERT INTO `sys_oper_log` VALUES ('16', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"100\",\"menuName\":\"公海管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/pool\",\"children\":[],\"createTime\":1641986619000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 14:58:40');
INSERT INTO `sys_oper_log` VALUES ('17', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"time-range\",\"orderNum\":\"101\",\"menuName\":\"线索管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/clues\",\"children\":[],\"createTime\":1641986751000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 14:58:59');
INSERT INTO `sys_oper_log` VALUES ('18', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"102\",\"menuName\":\"客户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/customer\",\"children\":[],\"createTime\":1641986775000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 14:59:05');
INSERT INTO `sys_oper_log` VALUES ('19', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":\"103\",\"menuName\":\"业绩订单\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/order\",\"children\":[],\"createTime\":1642558801000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2015,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 14:59:12');
INSERT INTO `sys_oper_log` VALUES ('20', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"tenant\",\"component\":\"system/tenant/list\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:tenant:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 16:42:28');
INSERT INTO `sys_oper_log` VALUES ('21', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"test\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"tenant\",\"component\":\"system/tenant/list\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:tenanst:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 16:43:08');
INSERT INTO `sys_oper_log` VALUES ('22', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"岗位查询\",\"params\":{},\"parentId\":104,\"isCache\":\"0\",\"path\":\"\",\"component\":\"\",\"children\":[],\"createTime\":1641899500000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1021,\"menuType\":\"F\",\"perms\":\"system:post:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 16:45:00');
INSERT INTO `sys_oper_log` VALUES ('23', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"查询\",\"params\":{},\"parentId\":2019,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:tenant:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 16:45:30');
INSERT INTO `sys_oper_log` VALUES ('24', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"编辑\",\"params\":{},\"parentId\":2019,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 17:11:58');
INSERT INTO `sys_oper_log` VALUES ('25', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"修改\",\"params\":{},\"parentId\":2019,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1677575518000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"F\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 18:04:18');
INSERT INTO `sys_oper_log` VALUES ('26', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"ryt_5RBg03bP\",\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ryt_5RBg03bP?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"ddNMC5l4\",\"id\":22,\"tenant\":\"superAdmin\",\"status\":\"1\",\"username\":\"ryt_5RBg03bP\"}', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ryt_5rbg03bp.master_tenant\' doesn\'t exist\r\n### The error may exist in file [F:\\mk\\xmrep\\RuoyiCRM-master\\ruoyi-tenant\\target\\classes\\mapper\\tenant\\MasterTenantMapper.xml]\r\n### The error may involve com.ruoyi.tenant.mapper.MasterTenantMapper.checkTenantNameUnique-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(1) from master_tenant where tenant = ? limit 1\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ryt_5rbg03bp.master_tenant\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ryt_5rbg03bp.master_tenant\' doesn\'t exist', '2023-02-28 18:49:03');
INSERT INTO `sys_oper_log` VALUES ('27', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"ryt_5RBg03bP\",\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ryt_5RBg03bP?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"ddNMC5l4\",\"id\":22,\"tenant\":\"superAdmin\",\"status\":\"1\",\"username\":\"ryt_5RBg03bP\"}', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ryt_5rbg03bp.master_tenant\' doesn\'t exist\r\n### The error may exist in file [F:\\mk\\xmrep\\RuoyiCRM-master\\ruoyi-tenant\\target\\classes\\mapper\\tenant\\MasterTenantMapper.xml]\r\n### The error may involve com.ruoyi.tenant.mapper.MasterTenantMapper.checkTenantNameUnique-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(1) from master_tenant where tenant = ? limit 1\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ryt_5rbg03bp.master_tenant\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ryt_5rbg03bp.master_tenant\' doesn\'t exist', '2023-02-28 18:55:03');
INSERT INTO `sys_oper_log` VALUES ('28', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"ryt_5RBg03bP\",\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ryt_5RBg03bP?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"ddNMC5l4\",\"id\":22,\"tenant\":\"superAdmin\",\"status\":\"1\",\"username\":\"ryt_5RBg03bP\"}', '{\"msg\":\"修改租户\'superAdmin\'失败，租户名称已存在\",\"code\":500}', '0', null, '2023-02-28 18:56:33');
INSERT INTO `sys_oper_log` VALUES ('29', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"ryt_5RBg03bP\",\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ryt_5RBg03bP?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"ddNMC5l4\",\"id\":22,\"tenant\":\"superAdmin\",\"status\":\"1\",\"username\":\"ryt_5RBg03bP\"}', '{\"msg\":\"修改租户\'superAdmin\'失败，租户名称已存在\",\"code\":500}', '0', null, '2023-02-28 18:58:22');
INSERT INTO `sys_oper_log` VALUES ('30', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"ryt_5RBg03bP\",\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ryt_5RBg03bP?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"ddNMC5l4\",\"id\":22,\"tenant\":\"superAdmin\",\"status\":\"1\",\"username\":\"ryt_5RBg03bP\"}', '{\"msg\":\"修改租户\'superAdmin\'失败，租户名称已存在\",\"code\":500}', '0', null, '2023-02-28 18:58:33');
INSERT INTO `sys_oper_log` VALUES ('31', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"ryt_5RBg03bP\",\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ryt_5RBg03bP?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"ddNMC5l4\",\"id\":22,\"tenant\":\"superAdmin\",\"status\":\"1\",\"username\":\"ryt_5RBg03bP\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 19:07:24');
INSERT INTO `sys_oper_log` VALUES ('32', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost2\",\"databaseName\":\"ryt_5RBg03bP\",\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ryt_5RBg03bP?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"ddNMC5l4\",\"id\":22,\"tenant\":\"superAdmin\",\"status\":\"1\",\"username\":\"ryt_5RBg03bP\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 19:08:30');
INSERT INTO `sys_oper_log` VALUES ('33', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"ryt_5RBg03bP\",\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ryt_5RBg03bP?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"ddNMC5l4\",\"id\":22,\"tenant\":\"superAdmin\",\"expirationDate\":1738771200000,\"status\":\"1\",\"username\":\"ryt_5RBg03bP\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-02-28 19:17:24');
INSERT INTO `sys_oper_log` VALUES ('34', '岗位管理', '1', 'com.ruoyi.web.controller.system.SysTenantController.add()', 'POST', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"tenant5\",\"params\":{},\"url\":\"tenant5\",\"password\":\"root1234\",\"expirationDate\":1677600000000,\"status\":\"0\",\"username\":\"admin\"}', '{\"msg\":\"新增租户\'null\'失败，租户名称已存在\",\"code\":500}', '0', null, '2023-02-28 19:33:46');
INSERT INTO `sys_oper_log` VALUES ('35', '岗位管理', '1', 'com.ruoyi.web.controller.system.SysTenantController.add()', 'POST', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"tenant5\",\"params\":{},\"url\":\"tenant6\",\"password\":\"root1234\",\"expirationDate\":1677600000000,\"status\":\"0\",\"username\":\"admin\"}', '{\"msg\":\"新增租户\'null\'失败，租户名称已存在\",\"code\":500}', '0', null, '2023-02-28 19:33:53');
INSERT INTO `sys_oper_log` VALUES ('36', '岗位管理', '1', 'com.ruoyi.web.controller.system.SysTenantController.add()', 'POST', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"tenant-3\",\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/tenant-3?useSSL=false\",\"createBy\":\"admin\",\"password\":\"root1234\",\"id\":24,\"expirationDate\":1677686400000,\"status\":\"0\",\"username\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-01 08:59:17');
INSERT INTO `sys_oper_log` VALUES ('37', '岗位管理', '1', 'com.ruoyi.web.controller.system.SysTenantController.add()', 'POST', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"hostName\":\"localhost\",\"databaseName\":\"tenant\",\"params\":{},\"url\":\"tenant6\",\"createBy\":\"admin\",\"password\":\"root1234\",\"id\":25,\"tenant\":\"tenant6\",\"expirationDate\":1677600000000,\"status\":\"0\",\"username\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-01 09:02:21');
INSERT INTO `sys_oper_log` VALUES ('38', '岗位管理', '3', 'com.ruoyi.web.controller.system.SysTenantController.remove()', 'DELETE', '1', 'admin', null, '/system/tenant/24', '127.0.0.1', '内网IP', '{id=24}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-01 10:00:51');
INSERT INTO `sys_oper_log` VALUES ('39', '岗位管理', '3', 'com.ec.web.controller.system.SysTenantController.remove()', 'DELETE', '1', 'admin', null, '/system/tenant/26', '127.0.0.1', '内网IP', '{id=26}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-24 14:57:41');
INSERT INTO `sys_oper_log` VALUES ('40', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"1\",\"menuName\":\"租户管理\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"tenant\",\"component\":\"system/tenant/list\",\"children\":[],\"createTime\":1677481847000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:tenanst:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-24 14:59:32');
INSERT INTO `sys_oper_log` VALUES ('41', '岗位管理', '3', 'com.ec.web.controller.system.SysTenantController.remove()', 'DELETE', '1', 'admin', null, '/system/tenant/33', '127.0.0.1', '内网IP', '{id=33}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-06-13 15:54:21');
INSERT INTO `sys_oper_log` VALUES ('42', '岗位管理', '2', 'com.ec.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ec_KWEbSrWI?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"8CB7go3k\",\"id\":1,\"tenant\":\"tenant1\",\"expirationDate\":1717689600000,\"status\":\"1\",\"username\":\"ec_KWEbSrWI\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-06-13 16:43:02');
INSERT INTO `sys_oper_log` VALUES ('43', '岗位管理', '2', 'com.ec.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ec_KWEbSrWI?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"8CB7go3k\",\"id\":1,\"tenant\":\"tenant1\",\"expirationDate\":1686585600000,\"status\":\"1\",\"username\":\"ec_KWEbSrWI\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-06-13 16:58:02');
INSERT INTO `sys_oper_log` VALUES ('44', '岗位管理', '3', 'com.ec.web.controller.system.SysTenantController.remove()', 'DELETE', '1', 'admin', null, '/system/tenant/35', '127.0.0.1', '内网IP', '{id=35}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-06-13 16:58:12');
INSERT INTO `sys_oper_log` VALUES ('45', '租户管理', '3', 'com.ec.web.controller.system.SysTenantController.remove()', 'DELETE', '1', 'admin', null, '/system/tenant/27', '127.0.0.1', '内网IP', '{id=27}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:13:50');
INSERT INTO `sys_oper_log` VALUES ('46', '租户管理', '3', 'com.ec.web.controller.system.SysTenantController.remove()', 'DELETE', '1', 'admin', null, '/system/tenant/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:28:21');
INSERT INTO `sys_oper_log` VALUES ('47', '租户管理', '2', 'com.ec.web.controller.system.SysTenantController.edit()', 'PUT', '1', 'admin', null, '/system/tenant', '127.0.0.1', '内网IP', '{\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ec_KWEbSrWI?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"password\":\"8CB7go3k\",\"id\":1,\"tenant\":\"tenant1\",\"expirationDate\":1690387200000,\"status\":\"1\",\"username\":\"ec_KWEbSrWI\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:28:31');

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2023-02-26 20:21:26', '', null, '超级管理员');

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '100', 'admin', '管理员', '00', 'admin@admin.com', '00000000000', '1', '', '$2a$10$MjkFTnTlNl290IUPsre4A.1t/PWivUeZyhO/zmtQ44mFWz8M3t0Py', '0', '0', '127.0.0.1', '2023-07-28 12:12:47', 'admin', '2023-02-26 20:21:27', '', '2023-07-28 12:12:47', '管理员');

-- ----------------------------
-- Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
