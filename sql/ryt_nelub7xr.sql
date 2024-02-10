/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : ryt_nelub7xr

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2023-07-26 17:19:51
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='客户跟进记录表';

-- ----------------------------
-- Records of crm_comment
-- ----------------------------
INSERT INTO `crm_comment` VALUES ('1', '2', '1', 'admin', '2023-03-14 16:23:28', '', null);
INSERT INTO `crm_comment` VALUES ('2', '2', 's', 'admin', '2023-07-07 12:01:17', '', null);
INSERT INTO `crm_comment` VALUES ('3', '2', 'sw', 'admin', '2023-07-07 14:44:14', '', null);
INSERT INTO `crm_comment` VALUES ('4', '2', 'sss', 'admin', '2023-07-08 17:34:23', '', null);
INSERT INTO `crm_comment` VALUES ('5', '3', 'xxxx', 'admin', '2023-07-08 17:40:38', '', null);
INSERT INTO `crm_comment` VALUES ('6', '4', 'xxx', 'admin', '2023-07-08 21:08:31', '', null);
INSERT INTO `crm_comment` VALUES ('7', '3', 'dd', 'admin', '2023-07-15 17:06:50', '', null);
INSERT INTO `crm_comment` VALUES ('8', '5', 'dd', 'admin', '2023-07-15 18:15:30', '', null);
INSERT INTO `crm_comment` VALUES ('9', '3', 'aa', 'admin', '2023-07-15 18:26:41', '', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='客户表';

-- ----------------------------
-- Records of crm_customer
-- ----------------------------
INSERT INTO `crm_customer` VALUES ('1', '', '王五', '1', '1561838977', '上海市', '房地产', 'A', '测试客户', '1', '抖音', '无效', '0', '1', 'admin', '0', '0', 'admin', '2023-03-03 11:29:16', 'admin', '2023-07-12 15:15:38', null, '', null, null, 'admin', null, '2023-07-12 15:15:13', '');
INSERT INTO `crm_customer` VALUES ('2', '', '1', '1', '15000000000', '上海市', '房地产', 'A', '签单客户', '1', '', '', '1', '1', '12', '0', '0', 'admin', '2023-03-14 16:10:50', 'admin', '2023-07-08 17:34:23', null, 'sss', '2023-07-08 17:34:23', '2023-07-09 00:00:00', 'admin', null, '2023-03-14 16:14:35', '');
INSERT INTO `crm_customer` VALUES ('3', '', 'test', 'test', '15000000000', '', '房地产', 'A', '', '', '', '', '1', '1', 'admin', '0', '0', 'admin', '2023-03-14 16:37:01', 'admin', '2023-07-15 18:26:41', null, 'aa', '2023-07-15 18:26:41', '2023-07-17 00:00:00', '', null, null, 'normal');
INSERT INTO `crm_customer` VALUES ('4', '21', 's', 'sd', '15699999999', '北京市', '房地产', 'A', '签单客户', '', '', '', '0', '2', 'admin', '0', '0', 'admin', '2023-07-07 14:49:44', 'admin', '2023-07-08 21:08:31', 'xxxx', 'xxx', '2023-07-08 21:08:31', '2023-07-09 00:00:00', 'admin', '2023-07-09 09:36:43', null, 'normal');
INSERT INTO `crm_customer` VALUES ('5', '', '张三', '张三', '13000000000', '', '', '', '签单客户', '', '', '', '1', '1', 'admin', '0', '0', 'admin', '2023-07-08 19:14:41', 'admin', '2023-07-15 18:15:30', null, 'dd', '2023-07-15 18:15:30', '2023-07-16 00:00:00', '', null, null, '');
INSERT INTO `crm_customer` VALUES ('6', '', '李四', '李四', '13000000000', '', '', '', '', '', '', '', '1', '1', 'admin', '0', '0', 'admin', '2023-07-08 19:24:44', '', '2023-07-08 19:25:38', null, '', null, null, '', null, null, '');
INSERT INTO `crm_customer` VALUES ('7', '', '王六', '张三', '15619308962', '北京市', '', 'B', '意向客户', '线索2', '百度', '有效', '0', '1', '12', '0', '0', 'admin', '2023-07-12 15:14:19', '', '2023-07-12 20:02:24', null, '', null, null, 'admin', null, '2023-07-12 20:02:24', '');
INSERT INTO `crm_customer` VALUES ('8', '', '', 's', '15000000000', '北京市', '', '', '', 's', '抖音', '无效', '0', '0', 'admin', '0', '0', 'admin', '2023-07-12 20:04:04', 'admin', '2023-07-26 17:18:58', null, '', null, null, 'admin', null, null, '');
INSERT INTO `crm_customer` VALUES ('9', '', '', '的', '13000000000', '', '', '', '', '所属', '', '', '0', '0', 'admin', '0', '0', 'admin', '2023-07-12 20:04:24', '', null, null, '', null, null, 'admin', null, null, '');

-- ----------------------------
-- Table structure for `crm_order`
-- ----------------------------
DROP TABLE IF EXISTS `crm_order`;
CREATE TABLE `crm_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of crm_order
-- ----------------------------
INSERT INTO `crm_order` VALUES ('1', '1', '2', '1.00', 'admin', 'admin', '2023-07-07 12:11:34', '', null, null, '1');
INSERT INTO `crm_order` VALUES ('2', '2', '3', '2.00', 'admin', 'admin', '2023-07-07 12:13:11', '', null, null, '1');
INSERT INTO `crm_order` VALUES ('3', '003', '5', '2000.00', 'admin', 'admin', '2023-07-08 19:15:35', '', null, null, '1');
INSERT INTO `crm_order` VALUES ('4', '04', '6', '5000.00', 'admin', 'admin', '2023-07-08 19:25:17', '', null, null, '1');

-- ----------------------------
-- Table structure for `erp_client`
-- ----------------------------
DROP TABLE IF EXISTS `erp_client`;
CREATE TABLE `erp_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `client_nickname` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `client_phone` varchar(50) DEFAULT NULL COMMENT '客户手机',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT '客户收货地址',
  `gender` int(11) DEFAULT NULL COMMENT '性别 先生:0 女士:1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='库存客户表';

-- ----------------------------
-- Records of erp_client
-- ----------------------------
INSERT INTO `erp_client` VALUES ('13', '1', '15619308912', '11', '0');
INSERT INTO `erp_client` VALUES ('15', '1', '15619207543', '1', null);
INSERT INTO `erp_client` VALUES ('21', 'xxx', '13000000000', 'xxx', null);

-- ----------------------------
-- Table structure for `erp_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order`;
CREATE TABLE `erp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售订单ID',
  `order_name` varchar(255) DEFAULT NULL COMMENT '订单名称',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `tax_info_id` int(11) DEFAULT NULL COMMENT '开票信息ID',
  `total_price` double(16,2) DEFAULT NULL COMMENT '订单金额',
  `actual_payment` double(16,2) DEFAULT NULL COMMENT '实付金额',
  `handler_name` varchar(125) DEFAULT NULL COMMENT '经手人姓名',
  `client_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tax_need` int(11) DEFAULT NULL COMMENT '是否需要开票',
  `order_no` varchar(32) DEFAULT NULL,
  `detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='库存销售订单表';

-- ----------------------------
-- Records of erp_order
-- ----------------------------
INSERT INTO `erp_order` VALUES ('13', '1', '2023-03-02 16:23:48.354000', null, null, '1.00', '1', '14', '1', '0', null, null);
INSERT INTO `erp_order` VALUES ('20', null, '2023-07-22 13:16:45.000000', '2', '1.00', '1.00', '1', '1', null, null, '1', '3');
INSERT INTO `erp_order` VALUES ('21', null, '2023-07-22 13:24:58.860000', '5', '4.00', '5.00', '4', '5', null, null, '5', '5');

-- ----------------------------
-- Table structure for `erp_product`
-- ----------------------------
DROP TABLE IF EXISTS `erp_product`;
CREATE TABLE `erp_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `product_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `product_model` varchar(50) DEFAULT NULL COMMENT '型号',
  `product_unit` varchar(50) DEFAULT NULL COMMENT '单位',
  `product_price` double(16,2) unsigned DEFAULT NULL COMMENT '销售价格',
  `product_remark` varchar(120) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='库存产品表';

-- ----------------------------
-- Records of erp_product
-- ----------------------------
INSERT INTO `erp_product` VALUES ('1', 'xx护肤品', 'xx', '个', '100.00', 'xxx');

-- ----------------------------
-- Table structure for `erp_product_sn`
-- ----------------------------
DROP TABLE IF EXISTS `erp_product_sn`;
CREATE TABLE `erp_product_sn` (
  `sn_uuid` varchar(255) NOT NULL DEFAULT '',
  `sn_code` varchar(255) DEFAULT NULL COMMENT '商品sn条码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `product_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `status` int(11) DEFAULT NULL COMMENT '在库: 0 已出库: 1',
  PRIMARY KEY (`sn_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品条码表';

-- ----------------------------
-- Records of erp_product_sn
-- ----------------------------
INSERT INTO `erp_product_sn` VALUES ('d5642af4-b8d5-11ed-bb0c-00ff08b5c9d3', '1', '2023-03-02 16:39:44', '1', '0');
INSERT INTO `erp_product_sn` VALUES ('f4fc9efe-b0f2-49ae-800f-460ae7486da5', '02', '2023-07-09 16:42:11', '2', '1');

-- ----------------------------
-- Table structure for `erp_retail`
-- ----------------------------
DROP TABLE IF EXISTS `erp_retail`;
CREATE TABLE `erp_retail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '零售出货单ID',
  `flow_id` int(11) DEFAULT NULL COMMENT '库存流水ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `actual_payment` double(16,2) DEFAULT NULL COMMENT '实付金额',
  `handler_name` varchar(50) DEFAULT NULL COMMENT '经手人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sn_uuid` varchar(255) DEFAULT NULL COMMENT '商品条码 UUID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='零售出库表';

-- ----------------------------
-- Records of erp_retail
-- ----------------------------
INSERT INTO `erp_retail` VALUES ('1', '1', '2023-03-14 17:42:28', '1.00', '1', null, null);
INSERT INTO `erp_retail` VALUES ('2', '1', '2023-07-18 16:11:35', '2.00', '2', null, 'xxxxxxxx');

-- ----------------------------
-- Table structure for `erp_stock_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_order`;
CREATE TABLE `erp_stock_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '进货单ID',
  `flow_id` int(11) DEFAULT NULL COMMENT '订单流水ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `total_price` double(16,2) DEFAULT NULL COMMENT '应付总金额',
  `actual_payment` double(16,2) DEFAULT NULL COMMENT '实付总金额',
  `supplier_name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `handler_name` varchar(120) DEFAULT NULL COMMENT '经手人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='进货流水单表';

-- ----------------------------
-- Records of erp_stock_order
-- ----------------------------
INSERT INTO `erp_stock_order` VALUES ('1', '1', '2023-07-19 20:46:35', '10.00', '20.00', 'xxx', '张三', 'xx');

-- ----------------------------
-- Table structure for `erp_storage_flow`
-- ----------------------------
DROP TABLE IF EXISTS `erp_storage_flow`;
CREATE TABLE `erp_storage_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存流水ID',
  `product_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `order_type` int(11) DEFAULT NULL COMMENT '流水类型: 采购入库 00, 零售退货入库 01, 工程退货入库 02, 零售出库 10, 工程出库 11, 采购出库 12',
  `price` double(16,2) DEFAULT NULL COMMENT '流水金额',
  `remark` varchar(120) DEFAULT NULL COMMENT '备注',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='库存流水表';

-- ----------------------------
-- Records of erp_storage_flow
-- ----------------------------
INSERT INTO `erp_storage_flow` VALUES ('13', '1', '3', null, '1.00', '1', '0');
INSERT INTO `erp_storage_flow` VALUES ('21', '12', '10', null, '35.00', 'xx', '0');

-- ----------------------------
-- Table structure for `erp_tags`
-- ----------------------------
DROP TABLE IF EXISTS `erp_tags`;
CREATE TABLE `erp_tags` (
  `tag_uuid` varchar(255) NOT NULL COMMENT '标签 UUID',
  `tag_name` varchar(255) DEFAULT NULL COMMENT '标签名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `color` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标签颜色',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`tag_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

-- ----------------------------
-- Records of erp_tags
-- ----------------------------
INSERT INTO `erp_tags` VALUES ('af134692-d072-49d7-891f-e80d60c38f14', 'xxx', 'xxx', null, '2023-07-09 17:46:06');

-- ----------------------------
-- Table structure for `erp_tags_map`
-- ----------------------------
DROP TABLE IF EXISTS `erp_tags_map`;
CREATE TABLE `erp_tags_map` (
  `tag_uuid` varchar(255) DEFAULT NULL COMMENT '产品条码 UUID',
  `product_id` int(11) DEFAULT NULL COMMENT '产品 ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签映射表';

-- ----------------------------
-- Records of erp_tags_map
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_tax_info`
-- ----------------------------
DROP TABLE IF EXISTS `erp_tax_info`;
CREATE TABLE `erp_tax_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '开票信息 ID',
  `taxpayer_id` varchar(255) DEFAULT NULL COMMENT '纳税人识别号',
  `company_name` varchar(120) DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(120) DEFAULT NULL COMMENT '公司地址',
  `contact_tel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `bank_account` varchar(120) DEFAULT NULL COMMENT '银行账户',
  `deposit_bank` varchar(120) DEFAULT NULL COMMENT '开户行',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='库存开票信息表';

-- ----------------------------
-- Records of erp_tax_info
-- ----------------------------
INSERT INTO `erp_tax_info` VALUES ('13', 'xxxxxxxxxxxxxxxxxx', '1', '1', '15618208954', '1', '1');
INSERT INTO `erp_tax_info` VALUES ('16', '123xxxxxxxxxxxxxx', 'xx', 'xx', '13000000000', null, null);

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
INSERT INTO `sys_config` VALUES ('1', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-02-28 12:18:32', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('2', '客户管理-公海规则', 'crm.pool.days', '10', 'Y', 'admin', '2023-02-28 12:18:32', '', null, '超过时间未跟进将客户移入公海，单位：天');

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
INSERT INTO `sys_dept` VALUES ('100', '0', '0', 'tenant4', '0', 'tenant4', '00000000000', 'admin@admin.com', '0', '0', 'admin', '2023-02-28 12:18:33', 'admin', '2023-02-28 12:18:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

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
INSERT INTO `sys_dict_data` VALUES ('127', '0', '待审核', '0', 'order_review_status', null, 'default', 'N', '0', 'admin', '2023-07-07 12:21:24', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('128', '0', '审核通过', '1', 'order_review_status', null, 'default', 'N', '0', 'admin', '2023-07-07 12:21:37', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('129', '0', '审核不通过', '2', 'order_review_status', null, 'default', 'N', '0', 'admin', '2023-07-07 12:21:50', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('130', '0', '在出库', '0', 'status', null, 'default', 'N', '0', 'admin', '2023-07-21 09:42:28', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('131', '0', '已出库', '1', 'status', null, 'default', 'N', '0', 'admin', '2023-07-21 09:42:36', '', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

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
INSERT INTO `sys_dict_type` VALUES ('108', '订单状态', 'order_review_status', '0', 'admin', '2023-07-07 12:20:33', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('109', '商品条码状态', 'status', '0', 'admin', '2023-07-21 09:42:02', '', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('1', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-02-28 12:18:45');
INSERT INTO `sys_logininfor` VALUES ('2', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-02-28 12:19:00');
INSERT INTO `sys_logininfor` VALUES ('3', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-03 11:23:03');
INSERT INTO `sys_logininfor` VALUES ('4', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-03 14:47:30');
INSERT INTO `sys_logininfor` VALUES ('5', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-03 14:47:41');
INSERT INTO `sys_logininfor` VALUES ('6', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-06 10:21:13');
INSERT INTO `sys_logininfor` VALUES ('7', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-06 10:21:23');
INSERT INTO `sys_logininfor` VALUES ('8', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-03-06 11:28:46');
INSERT INTO `sys_logininfor` VALUES ('9', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-06 12:23:40');
INSERT INTO `sys_logininfor` VALUES ('10', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-06 15:43:58');
INSERT INTO `sys_logininfor` VALUES ('11', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-03-06 16:06:47');
INSERT INTO `sys_logininfor` VALUES ('12', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-06 16:07:01');
INSERT INTO `sys_logininfor` VALUES ('13', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-03-06 16:15:38');
INSERT INTO `sys_logininfor` VALUES ('14', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-06 16:15:52');
INSERT INTO `sys_logininfor` VALUES ('15', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-06 17:05:25');
INSERT INTO `sys_logininfor` VALUES ('16', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-06 18:23:51');
INSERT INTO `sys_logininfor` VALUES ('17', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-07 09:49:20');
INSERT INTO `sys_logininfor` VALUES ('18', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-07 09:51:16');
INSERT INTO `sys_logininfor` VALUES ('19', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-07 10:58:24');
INSERT INTO `sys_logininfor` VALUES ('20', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-07 11:39:40');
INSERT INTO `sys_logininfor` VALUES ('21', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-07 12:14:55');
INSERT INTO `sys_logininfor` VALUES ('22', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-07 14:28:33');
INSERT INTO `sys_logininfor` VALUES ('23', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-07 19:04:32');
INSERT INTO `sys_logininfor` VALUES ('24', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-07 20:52:35');
INSERT INTO `sys_logininfor` VALUES ('25', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-07 21:01:03');
INSERT INTO `sys_logininfor` VALUES ('26', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-07 21:18:07');
INSERT INTO `sys_logininfor` VALUES ('27', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-08 08:49:53');
INSERT INTO `sys_logininfor` VALUES ('28', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-08 09:03:48');
INSERT INTO `sys_logininfor` VALUES ('29', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-08 09:04:00');
INSERT INTO `sys_logininfor` VALUES ('30', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-08 09:12:19');
INSERT INTO `sys_logininfor` VALUES ('31', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-08 09:12:30');
INSERT INTO `sys_logininfor` VALUES ('32', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-08 10:48:37');
INSERT INTO `sys_logininfor` VALUES ('33', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-03-08 10:49:23');
INSERT INTO `sys_logininfor` VALUES ('34', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-08 12:02:04');
INSERT INTO `sys_logininfor` VALUES ('35', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-08 17:54:37');
INSERT INTO `sys_logininfor` VALUES ('36', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-08 17:54:51');
INSERT INTO `sys_logininfor` VALUES ('37', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-08 19:11:30');
INSERT INTO `sys_logininfor` VALUES ('38', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-09 08:46:09');
INSERT INTO `sys_logininfor` VALUES ('39', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-09 16:27:08');
INSERT INTO `sys_logininfor` VALUES ('40', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-09 17:12:26');
INSERT INTO `sys_logininfor` VALUES ('41', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-09 18:30:06');
INSERT INTO `sys_logininfor` VALUES ('42', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-10 11:52:49');
INSERT INTO `sys_logininfor` VALUES ('43', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-03-10 11:53:47');
INSERT INTO `sys_logininfor` VALUES ('44', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-14 11:47:20');
INSERT INTO `sys_logininfor` VALUES ('45', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-03-14 11:59:10');
INSERT INTO `sys_logininfor` VALUES ('46', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-14 11:59:35');
INSERT INTO `sys_logininfor` VALUES ('47', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-14 14:39:29');
INSERT INTO `sys_logininfor` VALUES ('48', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-14 15:56:42');
INSERT INTO `sys_logininfor` VALUES ('49', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-14 17:35:11');
INSERT INTO `sys_logininfor` VALUES ('50', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-15 18:13:30');
INSERT INTO `sys_logininfor` VALUES ('51', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-16 09:29:00');
INSERT INTO `sys_logininfor` VALUES ('52', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-16 16:15:45');
INSERT INTO `sys_logininfor` VALUES ('53', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-16 18:52:49');
INSERT INTO `sys_logininfor` VALUES ('54', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-16 19:06:33');
INSERT INTO `sys_logininfor` VALUES ('55', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-03-16 19:06:54');
INSERT INTO `sys_logininfor` VALUES ('56', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-16 19:06:58');
INSERT INTO `sys_logininfor` VALUES ('57', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-24 11:37:33');
INSERT INTO `sys_logininfor` VALUES ('58', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-03-24 12:21:22');
INSERT INTO `sys_logininfor` VALUES ('59', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-13 16:16:38');
INSERT INTO `sys_logininfor` VALUES ('60', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-04-13 16:17:36');
INSERT INTO `sys_logininfor` VALUES ('61', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-13 16:43:14');
INSERT INTO `sys_logininfor` VALUES ('62', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-04-13 16:49:37');
INSERT INTO `sys_logininfor` VALUES ('63', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2023-04-13 16:56:01');
INSERT INTO `sys_logininfor` VALUES ('64', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-13 16:56:07');
INSERT INTO `sys_logininfor` VALUES ('65', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-14 11:15:55');
INSERT INTO `sys_logininfor` VALUES ('66', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-04-14 11:40:45');
INSERT INTO `sys_logininfor` VALUES ('67', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-14 11:41:00');
INSERT INTO `sys_logininfor` VALUES ('68', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-04-14 12:02:11');
INSERT INTO `sys_logininfor` VALUES ('69', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-14 15:22:42');
INSERT INTO `sys_logininfor` VALUES ('70', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-17 20:37:03');
INSERT INTO `sys_logininfor` VALUES ('71', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-04-17 20:40:43');
INSERT INTO `sys_logininfor` VALUES ('72', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-18 11:36:17');
INSERT INTO `sys_logininfor` VALUES ('73', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-18 11:36:37');
INSERT INTO `sys_logininfor` VALUES ('74', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-18 11:40:30');
INSERT INTO `sys_logininfor` VALUES ('75', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-18 11:40:41');
INSERT INTO `sys_logininfor` VALUES ('76', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-18 11:46:26');
INSERT INTO `sys_logininfor` VALUES ('77', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-18 11:46:35');
INSERT INTO `sys_logininfor` VALUES ('78', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-18 16:11:23');
INSERT INTO `sys_logininfor` VALUES ('79', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-20 15:30:23');
INSERT INTO `sys_logininfor` VALUES ('80', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-20 15:30:35');
INSERT INTO `sys_logininfor` VALUES ('81', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-21 12:21:15');
INSERT INTO `sys_logininfor` VALUES ('82', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2023-04-21 12:21:24');
INSERT INTO `sys_logininfor` VALUES ('83', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-21 12:21:31');
INSERT INTO `sys_logininfor` VALUES ('84', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-21 14:12:17');
INSERT INTO `sys_logininfor` VALUES ('85', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-21 14:12:27');
INSERT INTO `sys_logininfor` VALUES ('86', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-24 11:31:37');
INSERT INTO `sys_logininfor` VALUES ('87', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-24 11:31:46');
INSERT INTO `sys_logininfor` VALUES ('88', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-24 14:05:18');
INSERT INTO `sys_logininfor` VALUES ('89', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-24 14:05:26');
INSERT INTO `sys_logininfor` VALUES ('90', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-24 14:54:30');
INSERT INTO `sys_logininfor` VALUES ('91', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-24 14:54:40');
INSERT INTO `sys_logininfor` VALUES ('92', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-04-24 15:23:42');
INSERT INTO `sys_logininfor` VALUES ('93', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-24 15:23:52');
INSERT INTO `sys_logininfor` VALUES ('94', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-24 15:24:01');
INSERT INTO `sys_logininfor` VALUES ('95', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-24 16:25:11');
INSERT INTO `sys_logininfor` VALUES ('96', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-04-24 17:05:49');
INSERT INTO `sys_logininfor` VALUES ('97', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-25 12:05:33');
INSERT INTO `sys_logininfor` VALUES ('98', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-28 10:47:50');
INSERT INTO `sys_logininfor` VALUES ('99', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-04-28 16:19:46');
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-05-01 15:31:38');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-03 17:33:05');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-03 17:33:18');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-06-03 17:33:31');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-04 11:11:02');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-06-04 11:11:17');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-06-04 12:13:59');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-06-13 17:08:20');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-06-17 12:49:48');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-07 11:58:42');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-07 14:43:37');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-08 12:03:02');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-08 14:03:13');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-08 17:32:27');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-08 19:02:43');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-08 20:43:42');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-08 20:43:51');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-08 20:46:41');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-08 21:05:09');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-09 08:49:18');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-09 08:49:30');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-09 09:14:50');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-09 15:31:27');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-09 16:19:55');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-09 17:40:26');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-09 18:28:28');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-12 15:13:34');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-12 19:42:33');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-12 19:42:43');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-12 19:43:13');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-14 20:14:45');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-14 20:15:20');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-14 20:15:32');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-15 17:05:41');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-07-15 17:05:49');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-15 17:05:57');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-07-15 17:06:14');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-15 17:06:19');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-15 17:10:56');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-15 17:11:17');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-17 19:30:26');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-17 19:30:40');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-07-17 20:01:53');
INSERT INTO `sys_logininfor` VALUES ('143', '12', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-17 20:02:10');
INSERT INTO `sys_logininfor` VALUES ('144', '12', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-17 20:02:34');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-17 20:02:46');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2023-07-17 20:03:11');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-17 20:03:24');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-18 08:48:12');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-18 14:53:03');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-18 16:22:41');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-18 16:23:25');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-18 16:32:18');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-18 18:46:54');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-18 18:47:04');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-18 19:11:50');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-18 20:05:46');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-19 11:29:03');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-19 12:00:58');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-19 14:39:43');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-19 19:58:42');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-19 20:30:37');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-20 11:27:26');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-20 14:34:56');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-20 15:30:43');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-20 16:27:11');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-20 17:28:52');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-20 19:23:15');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-20 19:23:26');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-20 19:25:13');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-20 21:12:41');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-21 09:39:36');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 12:22:00');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 12:22:41');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 14:08:59');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-07-22 15:12:18');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 19:54:10');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-22 19:55:44');
INSERT INTO `sys_logininfor` VALUES ('178', 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-22 19:56:02');
INSERT INTO `sys_logininfor` VALUES ('179', 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-22 19:56:12');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 19:56:31');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-22 19:56:59');
INSERT INTO `sys_logininfor` VALUES ('182', 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 19:57:23');
INSERT INTO `sys_logininfor` VALUES ('183', 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-22 19:58:21');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 19:58:32');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-22 20:00:08');
INSERT INTO `sys_logininfor` VALUES ('186', 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 20:00:19');
INSERT INTO `sys_logininfor` VALUES ('187', 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-22 20:00:35');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 20:00:46');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-22 20:01:48');
INSERT INTO `sys_logininfor` VALUES ('190', 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-07-22 20:02:17');
INSERT INTO `sys_logininfor` VALUES ('191', 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 20:02:22');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-26 17:18:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=2031 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

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
INSERT INTO `sys_menu` VALUES ('106', '系统参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-01-11 19:11:40', 'admin', '2023-07-20 15:03:01', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-01-11 19:11:40', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2022-01-11 19:11:40', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '用户在线信息', '1', '10', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-01-11 19:11:40', 'admin', '2023-07-20 14:43:01', '在线用户菜单');
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
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-01-11 19:11:40', '', null, '');
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
INSERT INTO `sys_menu` VALUES ('2006', '公海信息', '0', '100', 'crm/pool', null, null, '1', '0', 'M', '0', '0', '', 'upload', 'admin', '2022-01-12 19:23:39', 'admin', '2023-07-20 15:53:11', '');
INSERT INTO `sys_menu` VALUES ('2007', '销售线索', '0', '101', 'crm/clues', null, null, '1', '0', 'M', '0', '0', '', 'druid', 'admin', '2022-01-12 19:25:51', 'admin', '2023-07-20 14:45:30', '');
INSERT INTO `sys_menu` VALUES ('2008', '客户管理', '0', '102', 'crm/customer', null, null, '1', '0', 'M', '0', '0', '', 'user', 'admin', '2022-01-12 19:26:15', 'admin', '2022-01-12 19:50:13', '');
INSERT INTO `sys_menu` VALUES ('2009', '公海信息', '2006', '100', 'list', 'crm/pool/list', null, '1', '0', 'C', '0', '0', 'crm:pool:list', 'upload', 'admin', '2022-01-12 19:33:38', 'admin', '2023-07-20 15:53:04', '');
INSERT INTO `sys_menu` VALUES ('2010', '我的线索', '2007', '100', 'person', 'crm/clues/person-list', null, '1', '0', 'C', '0', '0', 'crm:clues:person:list', 'fullscreen', 'admin', '2022-01-12 19:37:30', 'admin', '2023-07-20 15:51:31', '');
INSERT INTO `sys_menu` VALUES ('2011', '整体线索', '2007', '101', 'list', 'crm/clues/list', null, '1', '0', 'C', '0', '0', 'crm:clues:list', 'build', 'admin', '2022-01-12 19:38:49', 'admin', '2023-07-20 15:01:34', '');
INSERT INTO `sys_menu` VALUES ('2012', '我的客户', '2008', '100', 'person', 'crm/customer/person-list', null, '1', '0', 'C', '0', '0', 'crm:customer:person:list', 'people', 'admin', '2022-01-12 19:42:14', 'admin', '2023-07-20 15:02:40', '');
INSERT INTO `sys_menu` VALUES ('2013', '整体客户', '2008', '101', 'list', 'crm/customer/list', null, '1', '0', 'C', '0', '0', 'crm:customer:list', 'peoples', 'admin', '2022-01-12 19:42:44', 'admin', '2023-07-20 15:02:34', '');
INSERT INTO `sys_menu` VALUES ('2014', '成交信息', '2008', '102', 'deal', 'crm/customer/deal-list', null, '1', '0', 'C', '0', '0', 'crm:customer:deal:list', 'select', 'admin', '2022-01-12 19:43:37', 'admin', '2023-07-20 15:02:21', '');
INSERT INTO `sys_menu` VALUES ('2015', '订单管理', '0', '103', 'crm/order', null, null, '1', '0', 'M', '0', '0', '', 'server', 'admin', '2022-01-19 10:20:01', 'admin', '2023-07-20 14:47:16', '');
INSERT INTO `sys_menu` VALUES ('2016', '我的订单', '2015', '0', 'crm/customer', 'crm/order/person-list', null, '1', '0', 'C', '0', '0', 'crm:order:person:list', 'row', 'admin', '2022-01-19 10:20:36', 'admin', '2023-07-20 15:03:16', '');
INSERT INTO `sys_menu` VALUES ('2017', '客户订单', '2015', '1', 'crm/order', 'crm/order/list', null, '1', '0', 'C', '0', '0', 'crm:order:list', 'excel', 'admin', '2022-01-19 11:07:45', 'admin', '2023-07-20 15:03:35', '');
INSERT INTO `sys_menu` VALUES ('2018', '产品信息', '0', '1', 'product', null, null, '1', '0', 'M', '0', '0', '', 'redis', 'admin', '2023-03-06 10:49:49', 'admin', '2023-07-20 21:16:42', '');
INSERT INTO `sys_menu` VALUES ('2019', '库存产品信息', '2018', '1', 'product', 'erp/product/index', null, '1', '0', 'C', '0', '0', 'crm:order:list', 'github', 'admin', '2023-03-06 10:51:03', 'admin', '2023-07-20 14:58:44', '');
INSERT INTO `sys_menu` VALUES ('2020', '库存管理', '0', '1', 'erp', null, null, '1', '0', 'M', '0', '0', '', 'shopping', 'admin', '2023-03-09 18:32:10', 'admin', '2023-07-20 21:15:37', '');
INSERT INTO `sys_menu` VALUES ('2021', '库存客户信息', '2020', '1', 'client', 'erp/client/index', null, '1', '0', 'C', '0', '0', '', 'peoples', 'admin', '2023-03-09 18:33:31', 'admin', '2023-07-20 14:59:30', '');
INSERT INTO `sys_menu` VALUES ('2022', '库存流水列表', '2020', '2', 'flow', 'erp/flow/index', null, '1', '0', 'C', '0', '0', '', 'table', 'admin', '2023-03-09 18:40:16', 'admin', '2023-07-20 14:59:44', '');
INSERT INTO `sys_menu` VALUES ('2023', '开票信息列表', '2020', '3', 'info', 'erp/info/index', null, '1', '0', 'C', '0', '0', '', 'form', 'admin', '2023-03-09 18:41:45', 'admin', '2023-07-20 15:00:00', '');
INSERT INTO `sys_menu` VALUES ('2024', '销售管理', '0', '1', 'sale', null, null, '1', '0', 'M', '0', '0', null, 'excel', 'admin', '2023-03-09 18:50:03', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '库存销售订单信息', '2024', '1', 'order', 'erp/order/manager', null, '1', '0', 'C', '0', '0', '', 'nested', 'admin', '2023-03-09 18:51:02', 'admin', '2023-07-20 15:00:34', '');
INSERT INTO `sys_menu` VALUES ('2026', '零售出库管理', '2024', '2', 'retail', 'erp/retail/index', null, '1', '0', 'C', '0', '0', '', 'row', 'admin', '2023-03-09 18:53:04', 'admin', '2023-07-20 15:00:41', '');
INSERT INTO `sys_menu` VALUES ('2027', '进货流水单管理', '2020', '4', 'stock', 'erp/stock/index', '', '1', '0', 'C', '0', '0', '', 'guide', 'admin', '2023-03-09 18:54:49', 'admin', '2023-07-20 15:00:20', '');
INSERT INTO `sys_menu` VALUES ('2028', '商品条码信息', '2018', '2', 'sn', 'erp/sn/index', null, '1', '0', 'C', '0', '0', '', 'phone', 'admin', '2023-03-09 18:59:20', 'admin', '2023-07-20 14:58:50', '');
INSERT INTO `sys_menu` VALUES ('2029', '标签信息', '2018', '3', 'tags', 'erp/tags/index', null, '1', '0', 'C', '0', '0', '', 'size', 'admin', '2023-03-09 19:04:18', 'admin', '2023-07-20 14:58:58', '');
INSERT INTO `sys_menu` VALUES ('2030', '标签关联映射', '2018', '4', 'map', 'erp/map/index', null, '1', '0', 'C', '0', '0', '', 'tree', 'admin', '2023-03-09 19:05:36', 'admin', '2023-07-20 14:59:13', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1', '线索', '1', 'com.ruoyi.crm.controller.CrmCluesController.add()', 'POST', '1', 'admin', null, '/crm/clues', '127.0.0.1', '内网IP', '{\"cluesName\":\"1\",\"cluesStatus\":\"无效\",\"id\":1,\"owner\":\"admin\",\"dealStatus\":\"0\",\"params\":{},\"linkman\":\"1\",\"createBy\":\"admin\",\"createTime\":1677814156296,\"phone\":\"1561838977\",\"cluesSource\":\"抖音\",\"region\":\"上海市\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 11:29:16');
INSERT INTO `sys_oper_log` VALUES ('2', '线索', '2', 'com.ruoyi.crm.controller.CrmCluesController.transfer()', 'POST', '1', 'admin', null, '/crm/clues/transfer', '127.0.0.1', '内网IP', '[1] admin', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 11:29:22');
INSERT INTO `sys_oper_log` VALUES ('3', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"checkbox\",\"orderNum\":\"1\",\"menuName\":\"ERP\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"erp\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-06 10:49:49');
INSERT INTO `sys_oper_log` VALUES ('4', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"color\",\"orderNum\":\"1\",\"menuName\":\"client\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"erp/client\",\"component\":\"erp/client/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-06 10:51:03');
INSERT INTO `sys_oper_log` VALUES ('5', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"color\",\"orderNum\":\"1\",\"menuName\":\"client\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"client\",\"component\":\"erp/client/index\",\"children\":[],\"createTime\":1678071063000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-06 10:53:29');
INSERT INTO `sys_oper_log` VALUES ('6', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"color\",\"orderNum\":\"1\",\"menuName\":\"client\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"client\",\"component\":\"crm/pool/list\",\"children\":[],\"createTime\":1678071063000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-06 11:01:16');
INSERT INTO `sys_oper_log` VALUES ('7', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"color\",\"orderNum\":\"1\",\"menuName\":\"client\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"client\",\"component\":\"crm/pool/index\",\"children\":[],\"createTime\":1678071063000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-06 11:02:52');
INSERT INTO `sys_oper_log` VALUES ('8', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"color\",\"orderNum\":\"1\",\"menuName\":\"client\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"client\",\"component\":\"crm/pool/index\",\"children\":[],\"createTime\":1678071063000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"s\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-07 09:53:15');
INSERT INTO `sys_oper_log` VALUES ('9', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"1\",\"menuName\":\"库存管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"erp\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:32:10');
INSERT INTO `sys_oper_log` VALUES ('10', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"1\",\"menuName\":\"库存客户\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"erp/client\",\"component\":\"erp/client/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:33:31');
INSERT INTO `sys_oper_log` VALUES ('11', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"color\",\"orderNum\":\"1\",\"menuName\":\"client\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"clients\",\"component\":\"crm/pool/index\",\"children\":[],\"createTime\":1678071063000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"crm:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:36:10');
INSERT INTO `sys_oper_log` VALUES ('12', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"checkbox\",\"orderNum\":\"1\",\"menuName\":\"ERP\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"erps\",\"children\":[],\"createTime\":1678070989000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:37:19');
INSERT INTO `sys_oper_log` VALUES ('13', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"1\",\"menuName\":\"库存客户\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"client\",\"component\":\"erp/client/index\",\"children\":[],\"createTime\":1678358011000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:38:03');
INSERT INTO `sys_oper_log` VALUES ('14', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"2\",\"menuName\":\"库存流水\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"flow\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:40:16');
INSERT INTO `sys_oper_log` VALUES ('15', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"2\",\"menuName\":\"库存流水\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"flow\",\"component\":\"erp/flow/index\",\"children\":[],\"createTime\":1678358416000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2022,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:40:44');
INSERT INTO `sys_oper_log` VALUES ('16', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"3\",\"menuName\":\"开票信息\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"info\",\"component\":\"erp/info/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:41:45');
INSERT INTO `sys_oper_log` VALUES ('17', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":\"1\",\"menuName\":\"销售管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"sale\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:50:03');
INSERT INTO `sys_oper_log` VALUES ('18', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"库存销售订单\",\"params\":{},\"parentId\":2024,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"erp/order/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:51:02');
INSERT INTO `sys_oper_log` VALUES ('19', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":\"1\",\"menuName\":\"库存销售订单\",\"params\":{},\"parentId\":2024,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"erp/order/index\",\"children\":[],\"createTime\":1678359062000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:51:39');
INSERT INTO `sys_oper_log` VALUES ('20', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":\"2\",\"menuName\":\"零售出库\",\"params\":{},\"parentId\":2024,\"isCache\":\"0\",\"path\":\"retail\",\"component\":\"erp/retail/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:53:04');
INSERT INTO `sys_oper_log` VALUES ('21', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"erp/stock/index\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"进货流水单\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"stock\",\"component\":\"进货流水单\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:54:50');
INSERT INTO `sys_oper_log` VALUES ('22', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"进货流水单\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"stock\",\"component\":\"erp/stock/index\",\"children\":[],\"createTime\":1678359289000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:55:05');
INSERT INTO `sys_oper_log` VALUES ('23', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"redis\",\"orderNum\":\"1\",\"menuName\":\"产品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"product\",\"children\":[],\"createTime\":1678070989000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:56:29');
INSERT INTO `sys_oper_log` VALUES ('24', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"github\",\"orderNum\":\"1\",\"menuName\":\"库存产品\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"product\",\"component\":\"erp/product/index\",\"children\":[],\"createTime\":1678071063000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"crm:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:57:31');
INSERT INTO `sys_oper_log` VALUES ('25', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"phone\",\"orderNum\":\"2\",\"menuName\":\"商品条码\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"sn\",\"component\":\"erp/sn/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 18:59:20');
INSERT INTO `sys_oper_log` VALUES ('26', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"size\",\"orderNum\":\"3\",\"menuName\":\"标签管理\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"tags\",\"component\":\"erp/tags/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 19:04:18');
INSERT INTO `sys_oper_log` VALUES ('27', '菜单管理', '1', 'com.ec.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"4\",\"menuName\":\"标签映射\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"map\",\"component\":\"erp/map/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-09 19:05:36');
INSERT INTO `sys_oper_log` VALUES ('28', '字典类型', '9', 'com.ec.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', '1', 'admin', null, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 14:46:00');
INSERT INTO `sys_oper_log` VALUES ('29', '字典类型', '9', 'com.ec.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', '1', 'admin', null, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 14:49:14');
INSERT INTO `sys_oper_log` VALUES ('30', '字典类型', '9', 'com.ec.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', '1', 'admin', null, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 14:49:19');
INSERT INTO `sys_oper_log` VALUES ('31', '参数管理', '1', 'com.ec.web.controller.system.SysConfigController.add()', 'POST', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"1\",\"configKey\":\"1\",\"createBy\":\"admin\",\"configType\":\"Y\",\"configValue\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 14:53:45');
INSERT INTO `sys_oper_log` VALUES ('32', '参数管理', '3', 'com.ec.web.controller.system.SysConfigController.remove()', 'DELETE', '1', 'admin', null, '/system/config/3', '127.0.0.1', '内网IP', '{configIds=3}', null, '1', '内置参数【1】不能删除 ', '2023-03-14 14:53:56');
INSERT INTO `sys_oper_log` VALUES ('33', '参数管理', '3', 'com.ec.web.controller.system.SysConfigController.remove()', 'DELETE', '1', 'admin', null, '/system/config/3', '127.0.0.1', '内网IP', '{configIds=3}', null, '1', '内置参数【1】不能删除 ', '2023-03-14 14:54:10');
INSERT INTO `sys_oper_log` VALUES ('34', '参数管理', '2', 'com.ec.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"1\",\"configKey\":\"1\",\"createBy\":\"admin\",\"createTime\":1678776825000,\"updateBy\":\"admin\",\"configId\":3,\"configType\":\"N\",\"configValue\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 15:14:48');
INSERT INTO `sys_oper_log` VALUES ('35', '参数管理', '3', 'com.ec.web.controller.system.SysConfigController.remove()', 'DELETE', '1', 'admin', null, '/system/config/3', '127.0.0.1', '内网IP', '{configIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 15:14:53');
INSERT INTO `sys_oper_log` VALUES ('36', '线索', '1', 'com.ec.crm.controller.CrmCluesController.add()', 'POST', '1', 'admin', null, '/crm/clues', '127.0.0.1', '内网IP', '{\"cluesName\":\"1\",\"id\":2,\"owner\":\"admin\",\"dealStatus\":\"0\",\"params\":{},\"linkman\":\"1\",\"createBy\":\"admin\",\"createTime\":1678781450280,\"phone\":\"15000000000\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 16:10:50');
INSERT INTO `sys_oper_log` VALUES ('37', '线索', '2', 'com.ec.crm.controller.CrmCluesController.transfer()', 'POST', '1', 'admin', null, '/crm/clues/transfer', '127.0.0.1', '内网IP', '[2] admin', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 16:10:56');
INSERT INTO `sys_oper_log` VALUES ('38', '线索', '2', 'com.ec.crm.controller.CrmCluesController.toCustomer()', 'PUT', '1', 'admin', null, '/crm/clues/to-customer', '127.0.0.1', '内网IP', '{\"customerStatus\":\"签单客户\",\"customerRank\":\"\",\"name\":\"1\",\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 16:14:35');
INSERT INTO `sys_oper_log` VALUES ('39', '跟进记录', '1', 'com.ec.crm.controller.CrmCommentController.add()', 'POST', '1', 'admin', null, '/crm/comment', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1678868608272,\"customerId\":2,\"content\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 16:23:28');
INSERT INTO `sys_oper_log` VALUES ('40', '客户', '1', 'com.ec.crm.controller.CrmCustomerController.add()', 'POST', '1', 'admin', null, '/crm/customer', '127.0.0.1', '内网IP', '{\"id\":3,\"owner\":\"admin\",\"customerIndustry\":\"房地产\",\"dealStatus\":\"0\",\"params\":{},\"linkman\":\"test\",\"createBy\":\"admin\",\"createTime\":1678783020974,\"phone\":\"15000000000\",\"name\":\"test\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 16:37:01');
INSERT INTO `sys_oper_log` VALUES ('41', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.toPool()', 'POST', '1', 'admin', null, '/crm/customer/to-pool', '127.0.0.1', '内网IP', '[3] normal', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 16:37:09');
INSERT INTO `sys_oper_log` VALUES ('42', '零售出库', '1', 'com.ec.erp.controller.ErpRetailController.add()', 'POST', '1', 'admin', null, '/erp/retail', '127.0.0.1', '内网IP', '{\"actualPayment\":1,\"createTime\":1678786947971,\"handlerName\":\"1\",\"id\":1,\"params\":{},\"flowId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 17:42:28');
INSERT INTO `sys_oper_log` VALUES ('43', '用户管理', '5', 'com.ec.web.controller.system.SysUserController.export()', 'POST', '1', 'admin', null, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', null, '0', null, '2023-03-14 18:51:38');
INSERT INTO `sys_oper_log` VALUES ('44', '用户管理', '1', 'com.ec.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$e32X27UTY9dZTvlPXpYVr.kJ/n5BFPysrAc2sHzF38zftEfO9JdXi\",\"postIds\":[],\"nickName\":\"admin2\",\"params\":{},\"userName\":\"admin2\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 18:55:35');
INSERT INTO `sys_oper_log` VALUES ('45', '用户管理', '3', 'com.ec.web.controller.system.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/system/user/2', '127.0.0.1', '内网IP', '{userIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-14 18:55:39');
INSERT INTO `sys_oper_log` VALUES ('46', '岗位管理', '5', 'com.ec.web.controller.system.SysPostController.export()', 'POST', '1', 'admin', null, '/system/post/export', '127.0.0.1', '内网IP', '{\"flag\":false,\"params\":{}}', null, '0', null, '2023-03-24 11:53:49');
INSERT INTO `sys_oper_log` VALUES ('47', '岗位管理', '5', 'com.ec.web.controller.system.SysPostController.export()', 'POST', '1', 'admin', null, '/system/post/export', '127.0.0.1', '内网IP', '{\"flag\":false,\"params\":{}}', null, '0', null, '2023-03-24 11:58:00');
INSERT INTO `sys_oper_log` VALUES ('48', '岗位管理', '5', 'com.ec.web.controller.system.SysPostController.export()', 'POST', '1', 'admin', null, '/system/post/export', '127.0.0.1', '内网IP', '{\"flag\":false,\"params\":{}}', null, '0', null, '2023-03-24 11:58:20');
INSERT INTO `sys_oper_log` VALUES ('49', '岗位管理', '5', 'com.ec.web.controller.system.SysPostController.export()', 'POST', '1', 'admin', null, '/system/post/export', '127.0.0.1', '内网IP', '{\"flag\":false,\"params\":{}}', null, '0', null, '2023-03-24 11:58:49');
INSERT INTO `sys_oper_log` VALUES ('50', '岗位管理', '1', 'com.ec.web.controller.system.SysPostController.add()', 'POST', '1', 'admin', null, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"0\",\"flag\":false,\"postId\":1,\"params\":{},\"createBy\":\"admin\",\"postName\":\"1\",\"postCode\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-24 11:59:03');
INSERT INTO `sys_oper_log` VALUES ('51', '岗位管理', '5', 'com.ec.web.controller.system.SysPostController.export()', 'POST', '1', 'admin', null, '/system/post/export', '127.0.0.1', '内网IP', '{\"flag\":false,\"params\":{}}', null, '0', null, '2023-03-24 11:59:06');
INSERT INTO `sys_oper_log` VALUES ('52', '用户管理', '1', 'com.ec.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$ybGcUIAcuCcVUsTcRBRa8uWxj80pqY7xQiwQGabHHJksmEHBSyyrq\",\"postIds\":[],\"nickName\":\"1\",\"params\":{},\"userName\":\"12\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-06-04 11:14:29');
INSERT INTO `sys_oper_log` VALUES ('53', '用户管理', '2', 'com.ec.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"3\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"12\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1685848469000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-06-04 12:34:52');
INSERT INTO `sys_oper_log` VALUES ('54', '用户管理', '2', 'com.ec.web.controller.system.SysUserController.resetPwd()', 'PUT', '1', 'admin', null, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$Vs0692eRT0btl1njmDMIqO0R9gaFgq0u.WVif.UWyP/wpFx.rHaTu\",\"updateBy\":\"admin\",\"params\":{},\"userId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-06-04 12:35:01');
INSERT INTO `sys_oper_log` VALUES ('55', '角色管理', '1', 'com.ec.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"2\",\"roleName\":\"2\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-06-04 12:35:25');
INSERT INTO `sys_oper_log` VALUES ('56', '用户管理', '4', 'com.ec.web.controller.system.SysUserController.insertAuthRole()', 'PUT', '1', 'admin', null, '/system/user/authRole', '127.0.0.1', '内网IP', '3 [2]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-06-04 12:35:34');
INSERT INTO `sys_oper_log` VALUES ('57', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.edit()', 'PUT', '1', 'admin', null, '/crm/customer', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1678868608000,\"code\":\"\",\"customerRank\":\"A\",\"cluesName\":\"1\",\"cluesStatus\":\"\",\"lastFollowupTime\":1678782208000,\"delFlag\":\"0\",\"customerStatus\":\"签单客户\",\"updateBy\":\"admin\",\"id\":2,\"owner\":\"admin\",\"toCustomerTime\":1678781675000,\"preOwner\":\"admin\",\"customerIndustry\":\"房地产\",\"updateTime\":1688702456077,\"dealStatus\":\"0\",\"params\":{},\"poolType\":\"\",\"version\":0,\"lastUpdateRecord\":\"1\",\"linkman\":\"1\",\"createBy\":\"admin\",\"createTime\":1678781450000,\"phone\":\"15000000000\",\"name\":\"1\",\"cluesSource\":\"\",\"region\":\"上海市\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 12:00:56');
INSERT INTO `sys_oper_log` VALUES ('58', '跟进记录', '1', 'com.ec.crm.controller.CrmCommentController.add()', 'POST', '1', 'admin', null, '/crm/comment', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1688788876573,\"customerId\":2,\"content\":\"s\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 12:01:16');
INSERT INTO `sys_oper_log` VALUES ('59', '订单', '1', 'com.ec.crm.controller.CrmOrderController.add()', 'POST', '1', 'admin', null, '/crm/order', '127.0.0.1', '内网IP', '{\"owner\":\"admin\",\"amount\":1,\"orderNo\":\"1\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1688702544030,\"customerId\":2,\"status\":\"0\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [F:\\mk\\xmrep\\jk\\erp-crm\\crm\\target\\classes\\mapper\\crm\\CrmOrderMapper.xml]\r\n### The error may involve com.ec.crm.mapper.CrmOrderMapper.insertCrmOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crm_order          ( order_no,                                           customer_id,                                           amount,                                           owner,                                           create_by,                                           create_time,                                                                                  status )           values ( ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                                                                  ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-07-07 12:02:24');
INSERT INTO `sys_oper_log` VALUES ('60', '订单', '1', 'com.ec.crm.controller.CrmOrderController.add()', 'POST', '1', 'admin', null, '/crm/order', '127.0.0.1', '内网IP', '{\"owner\":\"admin\",\"amount\":1,\"orderNo\":\"1\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1688702549703,\"customerId\":2,\"status\":\"0\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [F:\\mk\\xmrep\\jk\\erp-crm\\crm\\target\\classes\\mapper\\crm\\CrmOrderMapper.xml]\r\n### The error may involve com.ec.crm.mapper.CrmOrderMapper.insertCrmOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crm_order          ( order_no,                                           customer_id,                                           amount,                                           owner,                                           create_by,                                           create_time,                                                                                  status )           values ( ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                                                                  ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-07-07 12:02:29');
INSERT INTO `sys_oper_log` VALUES ('61', '订单', '1', 'com.ec.crm.controller.CrmOrderController.add()', 'POST', '1', 'admin', null, '/crm/order', '127.0.0.1', '内网IP', '{\"owner\":\"admin\",\"amount\":1,\"orderNo\":\"1\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1688703093660,\"customerId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 12:11:33');
INSERT INTO `sys_oper_log` VALUES ('62', '订单', '2', 'com.ec.crm.controller.CrmOrderController.approve()', 'PUT', '1', 'admin', null, '/crm/order/approve/1', '127.0.0.1', '内网IP', '1', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 12:11:38');
INSERT INTO `sys_oper_log` VALUES ('63', '订单', '1', 'com.ec.crm.controller.CrmOrderController.add()', 'POST', '1', 'admin', null, '/crm/order', '127.0.0.1', '内网IP', '{\"owner\":\"admin\",\"amount\":2,\"orderNo\":\"2\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1688703190878,\"customerId\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 12:13:10');
INSERT INTO `sys_oper_log` VALUES ('64', '订单', '2', 'com.ec.crm.controller.CrmOrderController.approve()', 'PUT', '1', 'admin', null, '/crm/order/approve/2', '127.0.0.1', '内网IP', '2', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 12:13:16');
INSERT INTO `sys_oper_log` VALUES ('65', '字典类型', '1', 'com.ec.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单状态\",\"params\":{},\"dictType\":\"order_review_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 12:20:33');
INSERT INTO `sys_oper_log` VALUES ('66', '字典数据', '1', 'com.ec.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"order_review_status\",\"dictLabel\":\"待审核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 12:21:25');
INSERT INTO `sys_oper_log` VALUES ('67', '字典数据', '1', 'com.ec.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"order_review_status\",\"dictLabel\":\"审核通过\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 12:21:37');
INSERT INTO `sys_oper_log` VALUES ('68', '字典数据', '1', 'com.ec.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"order_review_status\",\"dictLabel\":\"审核不通过\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 12:21:50');
INSERT INTO `sys_oper_log` VALUES ('69', '跟进记录', '1', 'com.ec.crm.controller.CrmCommentController.add()', 'POST', '1', 'admin', null, '/crm/comment', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1688745600000,\"customerId\":2,\"content\":\"sw\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 14:44:14');
INSERT INTO `sys_oper_log` VALUES ('70', '客户', '1', 'com.ec.crm.controller.CrmCustomerController.add()', 'POST', '1', 'admin', null, '/crm/customer', '127.0.0.1', '内网IP', '{\"id\":4,\"owner\":\"admin\",\"dealStatus\":\"0\",\"params\":{},\"linkman\":\"sd\",\"createBy\":\"admin\",\"createTime\":1688712584312,\"phone\":\"15699999999\",\"name\":\"s\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 14:49:44');
INSERT INTO `sys_oper_log` VALUES ('71', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.toPool()', 'POST', '1', 'admin', null, '/crm/customer/to-pool', '127.0.0.1', '内网IP', '[4] normal', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-07 14:49:53');
INSERT INTO `sys_oper_log` VALUES ('72', '跟进记录', '1', 'com.ec.crm.controller.CrmCommentController.add()', 'POST', '1', 'admin', null, '/crm/comment', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1688832000000,\"customerId\":2,\"content\":\"sss\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 17:34:23');
INSERT INTO `sys_oper_log` VALUES ('73', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.transfer()', 'POST', '1', 'admin', null, '/crm/customer/transfer', '127.0.0.1', '内网IP', '[2] 12', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 17:34:36');
INSERT INTO `sys_oper_log` VALUES ('74', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.toPool()', 'POST', '1', 'admin', null, '/crm/customer/to-pool', '127.0.0.1', '内网IP', '[4] high', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 17:35:58');
INSERT INTO `sys_oper_log` VALUES ('75', '跟进记录', '1', 'com.ec.crm.controller.CrmCommentController.add()', 'POST', '1', 'admin', null, '/crm/comment', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1688832000000,\"customerId\":3,\"content\":\"xxxx\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 17:40:38');
INSERT INTO `sys_oper_log` VALUES ('76', '客户', '1', 'com.ec.crm.controller.CrmCustomerController.add()', 'POST', '1', 'admin', null, '/crm/customer', '127.0.0.1', '内网IP', '{\"id\":5,\"owner\":\"admin\",\"dealStatus\":\"0\",\"params\":{},\"linkman\":\"张三\",\"createBy\":\"admin\",\"createTime\":1688814880505,\"phone\":\"13000000000\",\"name\":\"张三\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 19:14:40');
INSERT INTO `sys_oper_log` VALUES ('77', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.edit()', 'PUT', '1', 'admin', null, '/crm/customer', '127.0.0.1', '内网IP', '{\"code\":\"\",\"customerRank\":\"\",\"cluesName\":\"\",\"cluesStatus\":\"\",\"delFlag\":\"0\",\"customerStatus\":\"签单客户\",\"updateBy\":\"admin\",\"id\":5,\"owner\":\"admin\",\"preOwner\":\"\",\"customerIndustry\":\"\",\"updateTime\":1688814913373,\"dealStatus\":\"0\",\"params\":{},\"poolType\":\"\",\"version\":0,\"lastUpdateRecord\":\"\",\"linkman\":\"张三\",\"createBy\":\"admin\",\"createTime\":1688814881000,\"phone\":\"13000000000\",\"name\":\"张三\",\"cluesSource\":\"\",\"region\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 19:15:13');
INSERT INTO `sys_oper_log` VALUES ('78', '订单', '1', 'com.ec.crm.controller.CrmOrderController.add()', 'POST', '1', 'admin', null, '/crm/order', '127.0.0.1', '内网IP', '{\"owner\":\"admin\",\"amount\":2000,\"orderNo\":\"003\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1688814934979,\"customerId\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 19:15:35');
INSERT INTO `sys_oper_log` VALUES ('79', '订单', '2', 'com.ec.crm.controller.CrmOrderController.approve()', 'PUT', '1', 'admin', null, '/crm/order/approve/3', '127.0.0.1', '内网IP', '3', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 19:15:43');
INSERT INTO `sys_oper_log` VALUES ('80', '客户', '1', 'com.ec.crm.controller.CrmCustomerController.add()', 'POST', '1', 'admin', null, '/crm/customer', '127.0.0.1', '内网IP', '{\"id\":6,\"owner\":\"admin\",\"dealStatus\":\"0\",\"params\":{},\"linkman\":\"李四\",\"createBy\":\"admin\",\"createTime\":1688815484114,\"phone\":\"13000000000\",\"name\":\"李四\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 19:24:44');
INSERT INTO `sys_oper_log` VALUES ('81', '订单', '1', 'com.ec.crm.controller.CrmOrderController.add()', 'POST', '1', 'admin', null, '/crm/order', '127.0.0.1', '内网IP', '{\"owner\":\"admin\",\"amount\":5000,\"orderNo\":\"04\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1688815516814,\"customerId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 19:25:16');
INSERT INTO `sys_oper_log` VALUES ('82', '订单', '2', 'com.ec.crm.controller.CrmOrderController.approve()', 'PUT', '1', 'admin', null, '/crm/order/approve/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 19:25:37');
INSERT INTO `sys_oper_log` VALUES ('83', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.edit()', 'PUT', '1', 'admin', null, '/crm/customer', '127.0.0.1', '内网IP', '{\"code\":\"21\",\"customerRank\":\"A\",\"cluesName\":\"\",\"cluesStatus\":\"\",\"remark\":\"xxxx\",\"delFlag\":\"0\",\"customerStatus\":\"签单客户\",\"updateBy\":\"admin\",\"id\":4,\"owner\":\"admin\",\"preOwner\":\"\",\"customerIndustry\":\"房地产\",\"updateTime\":1688821618940,\"dealStatus\":\"0\",\"params\":{},\"poolType\":\"high\",\"version\":0,\"lastUpdateRecord\":\"\",\"linkman\":\"sd\",\"createBy\":\"admin\",\"createTime\":1688712584000,\"phone\":\"15699999999\",\"name\":\"s\",\"cluesSource\":\"\",\"region\":\"北京市\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 21:06:58');
INSERT INTO `sys_oper_log` VALUES ('84', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.toPool()', 'POST', '1', 'admin', null, '/crm/customer/to-pool', '127.0.0.1', '内网IP', '[4] normal', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 21:07:09');
INSERT INTO `sys_oper_log` VALUES ('85', '跟进记录', '1', 'com.ec.crm.controller.CrmCommentController.add()', 'POST', '1', 'admin', null, '/crm/comment', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1688832000000,\"customerId\":4,\"content\":\"xxx\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 21:08:30');
INSERT INTO `sys_oper_log` VALUES ('86', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.toPool()', 'POST', '1', 'admin', null, '/crm/customer/to-pool', '127.0.0.1', '内网IP', '[4] normal', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-08 21:09:01');
INSERT INTO `sys_oper_log` VALUES ('87', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.toPool()', 'POST', '1', 'admin', null, '/crm/customer/to-pool', '127.0.0.1', '内网IP', '[4] normal', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 08:57:49');
INSERT INTO `sys_oper_log` VALUES ('88', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.toPool()', 'POST', '1', 'admin', null, '/crm/customer/to-pool', '127.0.0.1', '内网IP', '[4] normal', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 09:36:43');
INSERT INTO `sys_oper_log` VALUES ('89', '库存产品', '1', 'com.ec.erp.controller.ErpProductController.add()', 'POST', '1', 'admin', null, '/erp/product', '127.0.0.1', '内网IP', '{\"productModel\":\"xx\",\"num\":0,\"productUnit\":\"个\",\"params\":{},\"productName\":\"xx护肤品\",\"tags\":[],\"id\":1,\"productPrice\":10}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 15:50:47');
INSERT INTO `sys_oper_log` VALUES ('90', '库存产品', '2', 'com.ec.erp.controller.ErpProductController.edit()', 'PUT', '1', 'admin', null, '/erp/product', '127.0.0.1', '内网IP', '{\"productModel\":\"xx\",\"num\":0,\"productRemark\":\"xxx\",\"productUnit\":\"个\",\"params\":{},\"productName\":\"xx护肤品\",\"tags\":[],\"id\":1,\"productPrice\":100}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 15:51:06');
INSERT INTO `sys_oper_log` VALUES ('91', '商品条码', '1', 'com.ec.erp.controller.ErpProductSnController.add()', 'POST', '1', 'admin', null, '/erp/sn', '127.0.0.1', '内网IP', '{\"snCode\":\"02\",\"productId\":1,\"createTime\":1688890905560,\"params\":{},\"status\":0}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sn_uuid\' doesn\'t have a default value\r\n### The error may exist in file [F:\\mk\\xmrep\\jk\\erp-crm\\erp\\target\\classes\\mapper\\erp\\ErpProductSnMapper.xml]\r\n### The error may involve com.ec.erp.mapper.ErpProductSnMapper.insertErpProductSn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_product_sn          ( sn_code,                                           create_time,                                           product_id,                                           status )           values ( ?,                                           ?,                                           ?,                                           ? )\r\n### Cause: java.sql.SQLException: Field \'sn_uuid\' doesn\'t have a default value\n; Field \'sn_uuid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sn_uuid\' doesn\'t have a default value', '2023-07-09 16:21:45');
INSERT INTO `sys_oper_log` VALUES ('92', '商品条码', '1', 'com.ec.erp.controller.ErpProductSnController.add()', 'POST', '1', 'admin', null, '/erp/sn', '127.0.0.1', '内网IP', '{\"snCode\":\"02\",\"productId\":1,\"createTime\":1688891356819,\"params\":{},\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 16:29:16');
INSERT INTO `sys_oper_log` VALUES ('93', '商品条码', '1', 'com.ec.erp.controller.ErpProductSnController.add()', 'POST', '1', 'admin', null, '/erp/sn', '127.0.0.1', '内网IP', '{\"snCode\":\"02\",\"productId\":2,\"createTime\":1688891516039,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 16:31:56');
INSERT INTO `sys_oper_log` VALUES ('94', '商品条码', '3', 'com.ec.erp.controller.ErpProductSnController.remove()', 'DELETE', '1', 'admin', null, '/erp/sn/%20uuid()%20,UUID()', '127.0.0.1', '内网IP', '{snUuids= uuid() ,UUID()}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 16:40:58');
INSERT INTO `sys_oper_log` VALUES ('95', '商品条码', '3', 'com.ec.erp.controller.ErpProductSnController.remove()', 'DELETE', '1', 'admin', null, '/erp/sn/%20uuid()', '127.0.0.1', '内网IP', '{snUuids= uuid()}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2023-07-09 16:41:04');
INSERT INTO `sys_oper_log` VALUES ('96', '商品条码', '3', 'com.ec.erp.controller.ErpProductSnController.remove()', 'DELETE', '1', 'admin', null, '/erp/sn/%20uuid()', '127.0.0.1', '内网IP', '{snUuids= uuid()}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2023-07-09 16:41:08');
INSERT INTO `sys_oper_log` VALUES ('97', '商品条码', '3', 'com.ec.erp.controller.ErpProductSnController.remove()', 'DELETE', '1', 'admin', null, '/erp/sn/%20uuid()', '127.0.0.1', '内网IP', '{snUuids= uuid()}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2023-07-09 16:41:20');
INSERT INTO `sys_oper_log` VALUES ('98', '商品条码', '1', 'com.ec.erp.controller.ErpProductSnController.add()', 'POST', '1', 'admin', null, '/erp/sn', '127.0.0.1', '内网IP', '{\"snCode\":\"02\",\"productId\":2,\"createTime\":1688892130994,\"snUuid\":\"f4fc9efe-b0f2-49ae-800f-460ae7486da5\",\"params\":{},\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 16:42:11');
INSERT INTO `sys_oper_log` VALUES ('99', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.edit()', 'PUT', '1', 'admin', null, '/crm/customer', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1688832000000,\"code\":\"\",\"customerRank\":\"A\",\"cluesName\":\"\",\"cluesStatus\":\"\",\"lastFollowupTime\":1688809238000,\"delFlag\":\"0\",\"customerStatus\":\"\",\"updateBy\":\"admin\",\"id\":3,\"owner\":\"admin\",\"preOwner\":\"\",\"customerIndustry\":\"房地产\",\"updateTime\":1688892348497,\"dealStatus\":\"1\",\"params\":{},\"poolType\":\"normal\",\"version\":0,\"lastUpdateRecord\":\"xxxx\",\"linkman\":\"test\",\"createBy\":\"admin\",\"createTime\":1678783021000,\"phone\":\"15000000000\",\"name\":\"test\",\"cluesSource\":\"\",\"region\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 16:45:48');
INSERT INTO `sys_oper_log` VALUES ('100', '标签', '1', 'com.ec.erp.controller.ErpTagsController.add()', 'POST', '1', 'admin', null, '/erp/tags', '127.0.0.1', '内网IP', '{\"createTime\":1688895733939,\"remark\":\"xxx\",\"params\":{},\"tagName\":\"xxx\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'tag_uuid\' doesn\'t have a default value\r\n### The error may exist in file [F:\\mk\\xmrep\\jk\\erp-crm\\erp\\target\\classes\\mapper\\erp\\ErpTagsMapper.xml]\r\n### The error may involve com.ec.erp.mapper.ErpTagsMapper.insertErpTags-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_tags          ( tag_name,                                           remark,                                           create_time )           values ( ?,                                           ?,                                           ? )\r\n### Cause: java.sql.SQLException: Field \'tag_uuid\' doesn\'t have a default value\n; Field \'tag_uuid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'tag_uuid\' doesn\'t have a default value', '2023-07-09 17:42:14');
INSERT INTO `sys_oper_log` VALUES ('101', '标签', '1', 'com.ec.erp.controller.ErpTagsController.add()', 'POST', '1', 'admin', null, '/erp/tags', '127.0.0.1', '内网IP', '{\"createTime\":1688895917296,\"tagUuid\":\"43b9f5d5-e9af-407f-8543-8bd2d1168a84\",\"remark\":\"xxx\",\"params\":{},\"tagName\":\"xxx\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 17:45:17');
INSERT INTO `sys_oper_log` VALUES ('102', '标签', '1', 'com.ec.erp.controller.ErpTagsController.add()', 'POST', '1', 'admin', null, '/erp/tags', '127.0.0.1', '内网IP', '{\"createTime\":1688895917066,\"tagUuid\":\"e003cb28-f158-4370-a0df-cef9a76d4671\",\"remark\":\"xxx\",\"params\":{},\"tagName\":\"xxx\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 17:45:17');
INSERT INTO `sys_oper_log` VALUES ('103', '标签', '3', 'com.ec.erp.controller.ErpTagsController.remove()', 'DELETE', '1', 'admin', null, '/erp/tags/e003cb28-f158-4370-a0df-cef9a76d4671', '127.0.0.1', '内网IP', '{tagUuids=e003cb28-f158-4370-a0df-cef9a76d4671}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 17:45:27');
INSERT INTO `sys_oper_log` VALUES ('104', '标签', '3', 'com.ec.erp.controller.ErpTagsController.remove()', 'DELETE', '1', 'admin', null, '/erp/tags/43b9f5d5-e9af-407f-8543-8bd2d1168a84', '127.0.0.1', '内网IP', '{tagUuids=43b9f5d5-e9af-407f-8543-8bd2d1168a84}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 17:45:29');
INSERT INTO `sys_oper_log` VALUES ('105', '标签', '1', 'com.ec.erp.controller.ErpTagsController.add()', 'POST', '1', 'admin', null, '/erp/tags', '127.0.0.1', '内网IP', '{\"createTime\":1688895966112,\"tagUuid\":\"af134692-d072-49d7-891f-e80d60c38f14\",\"remark\":\"xxx\",\"params\":{},\"tagName\":\"xxx\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-09 17:46:06');
INSERT INTO `sys_oper_log` VALUES ('106', '标签映射', '2', 'com.ec.erp.controller.ErpTagsMapController.edit()', 'PUT', '1', 'admin', null, '/erp/map', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"tagUuid\":\"af134692-d072-49d7-891f-e80d60c38f14\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2023-07-09 18:31:24');
INSERT INTO `sys_oper_log` VALUES ('107', '标签映射', '2', 'com.ec.erp.controller.ErpTagsMapController.edit()', 'PUT', '1', 'admin', null, '/erp/map', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"tagUuid\":\"af134692-d072-49d7-891f-e80d60c38f14\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2023-07-09 18:31:40');
INSERT INTO `sys_oper_log` VALUES ('108', '标签映射', '2', 'com.ec.erp.controller.ErpTagsMapController.edit()', 'PUT', '1', 'admin', null, '/erp/map', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"tagUuid\":\"af134692-d072-49d7-891f-e80d60c38f14\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2023-07-09 18:32:08');
INSERT INTO `sys_oper_log` VALUES ('109', '标签映射', '2', 'com.ec.erp.controller.ErpTagsMapController.edit()', 'PUT', '1', 'admin', null, '/erp/map', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"tagUuid\":\"af134692-d072-49d7-891f-e80d60c38f14\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2023-07-09 18:34:16');
INSERT INTO `sys_oper_log` VALUES ('110', '标签映射', '2', 'com.ec.erp.controller.ErpTagsMapController.edit()', 'PUT', '1', 'admin', null, '/erp/map', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"tagUuid\":\"af134692-d072-49d7-891f-e80d60c38f14\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2023-07-09 18:37:19');
INSERT INTO `sys_oper_log` VALUES ('111', '标签映射', '2', 'com.ec.erp.controller.ErpTagsMapController.edit()', 'PUT', '1', 'admin', null, '/erp/map', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"tagUuid\":\"af134692-d072-49d7-891f-e80d60c38f14\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2023-07-09 18:37:33');
INSERT INTO `sys_oper_log` VALUES ('112', '标签映射', '2', 'com.ec.erp.controller.ErpTagsMapController.edit()', 'PUT', '1', 'admin', null, '/erp/map', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"tagUuid\":\"af134692-d072-49d7-891f-e80d60c38f14\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2023-07-09 18:41:22');
INSERT INTO `sys_oper_log` VALUES ('113', '线索', '1', 'com.ec.crm.controller.CrmCluesController.add()', 'POST', '1', 'admin', null, '/crm/clues', '127.0.0.1', '内网IP', '{\"cluesName\":\"线索2\",\"cluesStatus\":\"有效\",\"id\":7,\"owner\":\"admin\",\"dealStatus\":\"0\",\"params\":{},\"linkman\":\"张三\",\"createBy\":\"admin\",\"createTime\":1689146058512,\"phone\":\"15619308962\",\"cluesSource\":\"百度\",\"region\":\"北京市\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 15:14:18');
INSERT INTO `sys_oper_log` VALUES ('114', '线索', '2', 'com.ec.crm.controller.CrmCluesController.transfer()', 'POST', '1', 'admin', null, '/crm/clues/transfer', '127.0.0.1', '内网IP', '[7] admin', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 15:14:26');
INSERT INTO `sys_oper_log` VALUES ('115', '线索', '2', 'com.ec.crm.controller.CrmCluesController.transfer()', 'POST', '1', 'admin', null, '/crm/clues/transfer', '127.0.0.1', '内网IP', '[7] 12', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 15:14:34');
INSERT INTO `sys_oper_log` VALUES ('116', '线索', '2', 'com.ec.crm.controller.CrmCluesController.toCustomer()', 'PUT', '1', 'admin', null, '/crm/clues/to-customer', '127.0.0.1', '内网IP', '{\"customerStatus\":\"测试客户\",\"customerRank\":\"A\",\"name\":\"王五\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 15:15:13');
INSERT INTO `sys_oper_log` VALUES ('117', '客户', '2', 'com.ec.crm.controller.CrmCustomerController.edit()', 'PUT', '1', 'admin', null, '/crm/customer', '127.0.0.1', '内网IP', '{\"code\":\"\",\"customerRank\":\"A\",\"cluesName\":\"1\",\"cluesStatus\":\"无效\",\"delFlag\":\"0\",\"customerStatus\":\"测试客户\",\"updateBy\":\"admin\",\"id\":1,\"owner\":\"admin\",\"toCustomerTime\":1689146113000,\"preOwner\":\"admin\",\"customerIndustry\":\"房地产\",\"updateTime\":1689146137595,\"dealStatus\":\"0\",\"params\":{},\"poolType\":\"\",\"version\":0,\"lastUpdateRecord\":\"\",\"linkman\":\"1\",\"createBy\":\"admin\",\"createTime\":1677814156000,\"phone\":\"1561838977\",\"name\":\"王五\",\"cluesSource\":\"抖音\",\"region\":\"上海市\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 15:15:37');
INSERT INTO `sys_oper_log` VALUES ('118', '线索', '2', 'com.ec.crm.controller.CrmCluesController.toCustomer()', 'PUT', '1', 'admin', null, '/crm/clues/to-customer', '127.0.0.1', '内网IP', '{\"customerStatus\":\"意向客户\",\"customerRank\":\"B\",\"name\":\"王六\",\"id\":7}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 20:02:24');
INSERT INTO `sys_oper_log` VALUES ('119', '线索', '1', 'com.ec.crm.controller.CrmCluesController.add()', 'POST', '1', 'admin', null, '/crm/clues', '127.0.0.1', '内网IP', '{\"cluesName\":\"s\",\"id\":8,\"owner\":\"admin\",\"dealStatus\":\"0\",\"params\":{},\"linkman\":\"s\",\"createBy\":\"admin\",\"createTime\":1689163443958,\"phone\":\"是\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 20:04:03');
INSERT INTO `sys_oper_log` VALUES ('120', '线索', '1', 'com.ec.crm.controller.CrmCluesController.add()', 'POST', '1', 'admin', null, '/crm/clues', '127.0.0.1', '内网IP', '{\"cluesName\":\"所属\",\"id\":9,\"owner\":\"admin\",\"dealStatus\":\"0\",\"params\":{},\"linkman\":\"的\",\"createBy\":\"admin\",\"createTime\":1689163464451,\"phone\":\"13000000000\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 20:04:24');
INSERT INTO `sys_oper_log` VALUES ('121', '线索', '2', 'com.ec.crm.controller.CrmCluesController.transfer()', 'POST', '1', 'admin', null, '/crm/clues/transfer', '127.0.0.1', '内网IP', '[8,9] admin', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 20:04:32');
INSERT INTO `sys_oper_log` VALUES ('122', '线索', '2', 'com.ec.crm.controller.CrmCluesController.edit()', 'PUT', '1', 'admin', null, '/crm/clues', '127.0.0.1', '内网IP', '{\"code\":\"\",\"customerRank\":\"\",\"cluesName\":\"s\",\"cluesStatus\":\"\",\"delFlag\":\"0\",\"customerStatus\":\"\",\"updateBy\":\"admin\",\"id\":8,\"owner\":\"admin\",\"preOwner\":\"admin\",\"customerIndustry\":\"\",\"updateTime\":1689163498132,\"dealStatus\":\"0\",\"params\":{},\"poolType\":\"\",\"version\":0,\"lastUpdateRecord\":\"\",\"linkman\":\"s\",\"createBy\":\"admin\",\"createTime\":1689163444000,\"phone\":\"15000000000\",\"name\":\"\",\"cluesSource\":\"\",\"region\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 20:04:58');
INSERT INTO `sys_oper_log` VALUES ('123', '线索', '2', 'com.ec.crm.controller.CrmCluesController.transfer()', 'POST', '1', 'admin', null, '/crm/clues/transfer', '127.0.0.1', '内网IP', '[8,9] 12', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 20:05:14');
INSERT INTO `sys_oper_log` VALUES ('124', '线索', '2', 'com.ec.crm.controller.CrmCluesController.transfer()', 'POST', '1', 'admin', null, '/crm/clues/transfer', '127.0.0.1', '内网IP', '[8,9] admin', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-12 20:05:26');
INSERT INTO `sys_oper_log` VALUES ('125', '跟进记录', '1', 'com.ec.crm.controller.CrmCommentController.add()', 'POST', '1', 'admin', null, '/crm/comment', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1689436800000,\"customerId\":3,\"content\":\"dd\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-15 17:06:50');
INSERT INTO `sys_oper_log` VALUES ('126', '跟进记录', '1', 'com.ec.crm.controller.CrmCommentController.add()', 'POST', '1', 'admin', null, '/crm/comment', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1689436800000,\"customerId\":5,\"content\":\"dd\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-15 18:15:30');
INSERT INTO `sys_oper_log` VALUES ('127', '跟进记录', '1', 'com.ec.crm.controller.CrmCommentController.add()', 'POST', '1', 'admin', null, '/crm/comment', '127.0.0.1', '内网IP', '{\"nextFollowupTime\":1689523200000,\"customerId\":3,\"content\":\"aa\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-15 18:26:41');
INSERT INTO `sys_oper_log` VALUES ('128', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":16,\"clientInfo\":{\"id\":16,\"clientNickname\":\"a\",\"params\":{},\"clientPhone\":\"a\"},\"params\":{},\"taxInfo\":{\"params\":{},\"id\":15,\"taxpayerId\":\"a\"},\"createTime\":1689593561000,\"taxNeed\":1,\"id\":15,\"taxInfoId\":15,\"productList\":[{\"num\":0,\"params\":{},\"tags\":[]},{\"num\":0,\"params\":{},\"tags\":[]},{\"num\":0,\"params\":{},\"tags\":[]}]}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-17 19:32:41');
INSERT INTO `sys_oper_log` VALUES ('129', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientInfo\":{\"params\":{}},\"params\":{},\"taxInfo\":{\"params\":{}},\"createTime\":1689593565637,\"taxNeed\":0,\"productList\":[]}', '{\"msg\":\"org.springframework.jdbc.BadSqlGrammarException: \\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\r\\n### The error may exist in file [F:\\\\mk\\\\erp-crm-git\\\\erp-crm\\\\erp\\\\target\\\\classes\\\\mapper\\\\erp\\\\ErpClientMapper.xml]\\r\\n### The error may involve com.ec.erp.mapper.ErpClientMapper.insertErpClient-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into erp_client\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\",\"code\":500}', '0', null, '2023-07-17 19:32:45');
INSERT INTO `sys_oper_log` VALUES ('130', '用户管理', '2', 'com.ec.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"2\",\"roleName\":\"2\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"3\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"params\":{},\"userName\":\"12\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1685848469000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-17 20:03:03');
INSERT INTO `sys_oper_log` VALUES ('131', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientInfo\":{\"params\":{}},\"params\":{},\"taxInfo\":{\"params\":{}},\"createTime\":1689663565390,\"taxNeed\":0,\"productList\":[{\"num\":0,\"params\":{},\"tags\":[]}]}', '{\"msg\":\"org.springframework.jdbc.BadSqlGrammarException: \\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\r\\n### The error may exist in file [F:\\\\mk\\\\erp-crm-git\\\\erp-crm\\\\erp\\\\target\\\\classes\\\\mapper\\\\erp\\\\ErpClientMapper.xml]\\r\\n### The error may involve com.ec.erp.mapper.ErpClientMapper.insertErpClient-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into erp_client\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\",\"code\":500}', '0', null, '2023-07-18 14:59:25');
INSERT INTO `sys_oper_log` VALUES ('132', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":17,\"clientInfo\":{\"id\":17,\"clientNickname\":\"1\",\"params\":{},\"clientPhone\":\"1\"},\"params\":{},\"taxInfo\":{\"params\":{}},\"createTime\":1689663597827,\"taxNeed\":0,\"id\":16,\"productList\":[{\"num\":0,\"params\":{},\"tags\":[]}]}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 14:59:57');
INSERT INTO `sys_oper_log` VALUES ('133', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientInfo\":{\"params\":{}},\"params\":{},\"taxInfo\":{\"params\":{}},\"createTime\":1689663600084,\"taxNeed\":0,\"productList\":[]}', '{\"msg\":\"org.springframework.jdbc.BadSqlGrammarException: \\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\r\\n### The error may exist in file [F:\\\\mk\\\\erp-crm-git\\\\erp-crm\\\\erp\\\\target\\\\classes\\\\mapper\\\\erp\\\\ErpClientMapper.xml]\\r\\n### The error may involve com.ec.erp.mapper.ErpClientMapper.insertErpClient-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into erp_client\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\",\"code\":500}', '0', null, '2023-07-18 15:00:00');
INSERT INTO `sys_oper_log` VALUES ('134', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientInfo\":{\"params\":{}},\"params\":{},\"taxInfo\":{\"params\":{}},\"createTime\":1689663642454,\"taxNeed\":0,\"productList\":[]}', '{\"msg\":\"org.springframework.jdbc.BadSqlGrammarException: \\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\r\\n### The error may exist in file [F:\\\\mk\\\\erp-crm-git\\\\erp-crm\\\\erp\\\\target\\\\classes\\\\mapper\\\\erp\\\\ErpClientMapper.xml]\\r\\n### The error may involve com.ec.erp.mapper.ErpClientMapper.insertErpClient-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into erp_client\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\",\"code\":500}', '0', null, '2023-07-18 15:00:42');
INSERT INTO `sys_oper_log` VALUES ('135', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":18,\"clientInfo\":{\"shippingAddress\":\"1\",\"id\":18,\"clientNickname\":\"2\",\"params\":{}},\"params\":{},\"taxInfo\":{\"params\":{}},\"createTime\":1689663744076,\"taxNeed\":0,\"id\":17,\"productList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 15:02:24');
INSERT INTO `sys_oper_log` VALUES ('136', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientInfo\":{\"params\":{}},\"params\":{},\"taxInfo\":{\"params\":{}},\"createTime\":1689663747225,\"taxNeed\":0,\"productList\":[]}', '{\"msg\":\"org.springframework.jdbc.BadSqlGrammarException: \\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\r\\n### The error may exist in file [F:\\\\mk\\\\erp-crm-git\\\\erp-crm\\\\erp\\\\target\\\\classes\\\\mapper\\\\erp\\\\ErpClientMapper.xml]\\r\\n### The error may involve com.ec.erp.mapper.ErpClientMapper.insertErpClient-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into erp_client\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\",\"code\":500}', '0', null, '2023-07-18 15:02:27');
INSERT INTO `sys_oper_log` VALUES ('137', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":19,\"clientInfo\":{\"shippingAddress\":\"1\",\"id\":19,\"clientNickname\":\"1\",\"params\":{},\"clientPhone\":\"1\"},\"params\":{},\"taxInfo\":{\"params\":{}},\"createTime\":1689663895788,\"taxNeed\":0,\"id\":18,\"productList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 15:05:09');
INSERT INTO `sys_oper_log` VALUES ('138', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":20,\"clientInfo\":{\"id\":20,\"clientNickname\":\"3\",\"params\":{},\"clientPhone\":\"3\"},\"params\":{},\"taxInfo\":{\"params\":{}},\"createTime\":1689664969272,\"taxNeed\":0,\"id\":19,\"productList\":[{\"num\":0,\"params\":{},\"tags\":[]},{\"num\":0,\"params\":{},\"tags\":[]}]}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 15:23:11');
INSERT INTO `sys_oper_log` VALUES ('139', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":\"1\",\"menuName\":\"库存销售订单\",\"params\":{},\"parentId\":2024,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"erp/order/manager\",\"children\":[],\"createTime\":1678359062000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 15:45:09');
INSERT INTO `sys_oper_log` VALUES ('140', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"totalPrice\":1,\"detailId\":1,\"handlerName\":\"1\",\"params\":{},\"actualPayment\":1,\"createTime\":1689666374899,\"taxInfoId\":1}', '{\"msg\":\"java.lang.NullPointerException: Cannot invoke \\\"com.ec.erp.domain.ErpClient.getId()\\\" because the return value of \\\"com.ec.erp.domain.ErpOrder.getClientInfo()\\\" is null\",\"code\":500}', '0', null, '2023-07-18 15:46:14');
INSERT INTO `sys_oper_log` VALUES ('141', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":1,\"totalPrice\":1,\"detailId\":1,\"handlerName\":\"1\",\"params\":{},\"actualPayment\":1,\"createTime\":1689666379990,\"taxInfoId\":1}', '{\"msg\":\"java.lang.NullPointerException: Cannot invoke \\\"com.ec.erp.domain.ErpClient.getId()\\\" because the return value of \\\"com.ec.erp.domain.ErpOrder.getClientInfo()\\\" is null\",\"code\":500}', '0', null, '2023-07-18 15:46:20');
INSERT INTO `sys_oper_log` VALUES ('142', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":1,\"totalPrice\":1,\"detailId\":1,\"handlerName\":\"1\",\"params\":{},\"actualPayment\":1,\"createTime\":1689666403686,\"taxInfoId\":1}', '{\"msg\":\"java.lang.NullPointerException: Cannot invoke \\\"com.ec.erp.domain.ErpClient.getId()\\\" because the return value of \\\"com.ec.erp.domain.ErpOrder.getClientInfo()\\\" is null\",\"code\":500}', '0', null, '2023-07-18 15:47:03');
INSERT INTO `sys_oper_log` VALUES ('143', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":1,\"totalPrice\":1,\"detailId\":1,\"handlerName\":\"1\",\"params\":{},\"actualPayment\":1,\"createTime\":1689666440395,\"taxInfoId\":1}', '{\"msg\":\"java.lang.NullPointerException: Cannot invoke \\\"com.ec.erp.domain.ErpClient.getId()\\\" because the return value of \\\"com.ec.erp.domain.ErpOrder.getClientInfo()\\\" is null\",\"code\":500}', '0', null, '2023-07-18 15:47:52');
INSERT INTO `sys_oper_log` VALUES ('144', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":\"1\",\"menuName\":\"库存销售订单\",\"params\":{},\"parentId\":2024,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"erp/order/business\",\"children\":[],\"createTime\":1678359062000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 15:55:08');
INSERT INTO `sys_oper_log` VALUES ('145', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":\"1\",\"menuName\":\"库存销售订单\",\"params\":{},\"parentId\":2024,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"erp/order/bussiness\",\"children\":[],\"createTime\":1678359062000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 15:57:51');
INSERT INTO `sys_oper_log` VALUES ('146', '零售出库', '1', 'com.ec.erp.controller.ErpRetailController.add()', 'POST', '1', 'admin', null, '/erp/retail', '127.0.0.1', '内网IP', '{\"actualPayment\":2,\"createTime\":1689667895342,\"handlerName\":\"2\",\"id\":2,\"params\":{},\"flowId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 16:11:35');
INSERT INTO `sys_oper_log` VALUES ('147', '零售出库', '2', 'com.ec.erp.controller.ErpRetailController.edit()', 'PUT', '1', 'admin', null, '/erp/retail', '127.0.0.1', '内网IP', '{\"actualPayment\":2,\"createTime\":1689667895000,\"snUuid\":\"aa\",\"handlerName\":\"2\",\"id\":2,\"params\":{},\"flowId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 16:11:43');
INSERT INTO `sys_oper_log` VALUES ('148', '零售出库', '2', 'com.ec.erp.controller.ErpRetailController.edit()', 'PUT', '1', 'admin', null, '/erp/retail', '127.0.0.1', '内网IP', '{\"actualPayment\":2,\"createTime\":1689667895000,\"snUuid\":\"123wer234123\",\"handlerName\":\"2\",\"id\":2,\"params\":{},\"flowId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 19:11:03');
INSERT INTO `sys_oper_log` VALUES ('149', '零售出库', '2', 'com.ec.erp.controller.ErpRetailController.edit()', 'PUT', '1', 'admin', null, '/erp/retail', '127.0.0.1', '内网IP', '{\"actualPayment\":2,\"createTime\":1689667895000,\"snUuid\":\"xxxxxxxx\",\"handlerName\":\"2\",\"id\":2,\"params\":{},\"flowId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 19:11:20');
INSERT INTO `sys_oper_log` VALUES ('150', '库存开票信息', '2', 'com.ec.erp.controller.ErpTaxInfoController.edit()', 'PUT', '1', 'admin', null, '/erp/info', '127.0.0.1', '内网IP', '{\"bankAccount\":\"1\",\"depositBank\":\"1\",\"companyName\":\"1\",\"params\":{},\"contactTel\":\"15618208954\",\"companyAddress\":\"1\",\"id\":13,\"taxpayerId\":\"xxxxxxxxxxxxxxxxxx\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 20:18:54');
INSERT INTO `sys_oper_log` VALUES ('151', '库存开票信息', '3', 'com.ec.erp.controller.ErpTaxInfoController.remove()', 'DELETE', '1', 'admin', null, '/erp/info/14', '127.0.0.1', '内网IP', '{ids=14}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 20:18:57');
INSERT INTO `sys_oper_log` VALUES ('152', '库存开票信息', '3', 'com.ec.erp.controller.ErpTaxInfoController.remove()', 'DELETE', '1', 'admin', null, '/erp/info/15', '127.0.0.1', '内网IP', '{ids=15}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-18 20:18:59');
INSERT INTO `sys_oper_log` VALUES ('153', '库存客户', '3', 'com.ec.erp.controller.ErpClientController.remove()', 'DELETE', '1', 'admin', null, '/erp/client/20', '127.0.0.1', '内网IP', '{ids=20}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-19 19:59:25');
INSERT INTO `sys_oper_log` VALUES ('154', '库存客户', '3', 'com.ec.erp.controller.ErpClientController.remove()', 'DELETE', '1', 'admin', null, '/erp/client/19,18,17,16,14', '127.0.0.1', '内网IP', '{ids=19,18,17,16,14}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-19 19:59:31');
INSERT INTO `sys_oper_log` VALUES ('155', '库存客户', '1', 'com.ec.erp.controller.ErpClientController.add()', 'POST', '1', 'admin', null, '/erp/client', '127.0.0.1', '内网IP', '{\"shippingAddress\":\"xxx\",\"id\":21,\"clientNickname\":\"xxx\",\"params\":{},\"clientPhone\":\"13000000000\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-19 20:30:51');
INSERT INTO `sys_oper_log` VALUES ('156', '库存流水', '3', 'com.ec.erp.controller.ErpStorageFlowController.remove()', 'DELETE', '1', 'admin', null, '/erp/flow/14,15,16,17,18,19,20', '127.0.0.1', '内网IP', '{ids=14,15,16,17,18,19,20}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-19 20:41:44');
INSERT INTO `sys_oper_log` VALUES ('157', '库存流水', '1', 'com.ec.erp.controller.ErpStorageFlowController.add()', 'POST', '1', 'admin', null, '/erp/flow', '127.0.0.1', '内网IP', '{\"amount\":10,\"productId\":12,\"orderId\":0,\"remark\":\"xx\",\"params\":{},\"price\":35,\"id\":21}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-19 20:42:34');
INSERT INTO `sys_oper_log` VALUES ('158', '库存开票信息', '1', 'com.ec.erp.controller.ErpTaxInfoController.add()', 'POST', '1', 'admin', null, '/erp/info', '127.0.0.1', '内网IP', '{\"companyName\":\"xx\",\"params\":{},\"contactTel\":\"13000000000\",\"companyAddress\":\"xx\",\"id\":16,\"taxpayerId\":\"123xxxxxxxxxxxxxx\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-19 20:45:13');
INSERT INTO `sys_oper_log` VALUES ('159', '进货流水单', '1', 'com.ec.erp.controller.ErpStockOrderController.add()', 'POST', '1', 'admin', null, '/erp/stock', '127.0.0.1', '内网IP', '{\"supplierName\":\"xxx\",\"totalPrice\":10,\"handlerName\":\"张三\",\"remark\":\"xx\",\"params\":{},\"actualPayment\":20,\"createTime\":1689770795356,\"id\":1,\"flowId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-19 20:46:35');
INSERT INTO `sys_oper_log` VALUES ('160', '用户管理', '1', 'com.ec.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$HoPc2H4Z5jTCqFp6Jtz/T./GXGut9NixQdFcV4ycKXevvLYQWQWW2\",\"postIds\":[],\"nickName\":\"test\",\"deptId\":100,\"params\":{},\"userName\":\"test\",\"userId\":4,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 11:28:19');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":\"1\",\"menuName\":\"库存销售订单\",\"params\":{},\"parentId\":2024,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"erp/order/manager\",\"children\":[],\"createTime\":1678359062000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 11:41:29');
INSERT INTO `sys_oper_log` VALUES ('162', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":1,\"totalPrice\":1,\"detailId\":1,\"handlerName\":\"1\",\"params\":{},\"actualPayment\":1,\"createTime\":1689824718768,\"taxInfoId\":1}', '{\"msg\":\"java.lang.NullPointerException: Cannot invoke \\\"com.ec.erp.domain.ErpClient.getId()\\\" because the return value of \\\"com.ec.erp.domain.ErpOrder.getClientInfo()\\\" is null\",\"code\":500}', '0', null, '2023-07-20 11:45:18');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"time-range\",\"orderNum\":\"101\",\"menuName\":\"销售线索\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/clues\",\"children\":[],\"createTime\":1641986751000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:38:39');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"101\",\"menuName\":\"整体线索\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"list\",\"component\":\"crm/clues/list\",\"children\":[],\"createTime\":1641987529000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2011,\"menuType\":\"C\",\"perms\":\"crm:clues:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:39:00');
INSERT INTO `sys_oper_log` VALUES ('165', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"100\",\"menuName\":\"公海信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/pool\",\"children\":[],\"createTime\":1641986619000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:39:19');
INSERT INTO `sys_oper_log` VALUES ('166', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":\"103\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/order\",\"children\":[],\"createTime\":1642558801000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2015,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:39:46');
INSERT INTO `sys_oper_log` VALUES ('167', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"整体订单\",\"params\":{},\"parentId\":2015,\"isCache\":\"0\",\"path\":\"crm/order\",\"component\":\"crm/order/list\",\"children\":[],\"createTime\":1642561665000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"crm:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:39:57');
INSERT INTO `sys_oper_log` VALUES ('168', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"销售订单\",\"params\":{},\"parentId\":2015,\"isCache\":\"0\",\"path\":\"crm/order\",\"component\":\"crm/order/list\",\"children\":[],\"createTime\":1642561665000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"crm:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:40:07');
INSERT INTO `sys_oper_log` VALUES ('169', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"客户订单\",\"params\":{},\"parentId\":2015,\"isCache\":\"0\",\"path\":\"crm/order\",\"component\":\"crm/order/list\",\"children\":[],\"createTime\":1642561665000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"crm:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:40:21');
INSERT INTO `sys_oper_log` VALUES ('170', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"online\",\"orderNum\":\"10\",\"menuName\":\"用户在线信息\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"online\",\"component\":\"monitor/online/index\",\"children\":[],\"createTime\":1641899500000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":109,\"menuType\":\"C\",\"perms\":\"monitor:online:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:43:01');
INSERT INTO `sys_oper_log` VALUES ('171', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"100\",\"menuName\":\"公海信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/pool\",\"children\":[],\"createTime\":1641986619000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:45:09');
INSERT INTO `sys_oper_log` VALUES ('172', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"druid\",\"orderNum\":\"101\",\"menuName\":\"销售线索\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/clues\",\"children\":[],\"createTime\":1641986751000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:45:30');
INSERT INTO `sys_oper_log` VALUES ('173', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"103\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/order\",\"children\":[],\"createTime\":1642558801000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2015,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:47:16');
INSERT INTO `sys_oper_log` VALUES ('174', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"redis\",\"orderNum\":\"1\",\"menuName\":\"产品信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"product\",\"children\":[],\"createTime\":1678070989000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:58:33');
INSERT INTO `sys_oper_log` VALUES ('175', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"github\",\"orderNum\":\"1\",\"menuName\":\"库存产品信息\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"product\",\"component\":\"erp/product/index\",\"children\":[],\"createTime\":1678071063000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"crm:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:58:44');
INSERT INTO `sys_oper_log` VALUES ('176', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"phone\",\"orderNum\":\"2\",\"menuName\":\"商品条码信息\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"sn\",\"component\":\"erp/sn/index\",\"children\":[],\"createTime\":1678359560000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2028,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:58:50');
INSERT INTO `sys_oper_log` VALUES ('177', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"size\",\"orderNum\":\"3\",\"menuName\":\"标签信息\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"tags\",\"component\":\"erp/tags/index\",\"children\":[],\"createTime\":1678359858000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2029,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:58:58');
INSERT INTO `sys_oper_log` VALUES ('178', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"4\",\"menuName\":\"标签关联映射\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"map\",\"component\":\"erp/map/index\",\"children\":[],\"createTime\":1678359936000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2030,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:59:13');
INSERT INTO `sys_oper_log` VALUES ('179', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"1\",\"menuName\":\"库存客户信息\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"client\",\"component\":\"erp/client/index\",\"children\":[],\"createTime\":1678358011000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:59:30');
INSERT INTO `sys_oper_log` VALUES ('180', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"2\",\"menuName\":\"库存流水列表\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"flow\",\"component\":\"erp/flow/index\",\"children\":[],\"createTime\":1678358416000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2022,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 14:59:44');
INSERT INTO `sys_oper_log` VALUES ('181', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"3\",\"menuName\":\"开票信息列表\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"info\",\"component\":\"erp/info/index\",\"children\":[],\"createTime\":1678358505000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2023,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:00:00');
INSERT INTO `sys_oper_log` VALUES ('182', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"进货流水单查询\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"stock\",\"component\":\"erp/stock/index\",\"children\":[],\"createTime\":1678359289000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:00:08');
INSERT INTO `sys_oper_log` VALUES ('183', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"进货流水单管理\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"stock\",\"component\":\"erp/stock/index\",\"children\":[],\"createTime\":1678359289000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:00:20');
INSERT INTO `sys_oper_log` VALUES ('184', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":\"1\",\"menuName\":\"库存销售订单信息\",\"params\":{},\"parentId\":2024,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"erp/order/manager\",\"children\":[],\"createTime\":1678359062000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:00:34');
INSERT INTO `sys_oper_log` VALUES ('185', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":\"2\",\"menuName\":\"零售出库管理\",\"params\":{},\"parentId\":2024,\"isCache\":\"0\",\"path\":\"retail\",\"component\":\"erp/retail/index\",\"children\":[],\"createTime\":1678359184000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2026,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:00:41');
INSERT INTO `sys_oper_log` VALUES ('186', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"download\",\"orderNum\":\"100\",\"menuName\":\"公海信息\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"list\",\"component\":\"crm/pool/list\",\"children\":[],\"createTime\":1641987218000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2009,\"menuType\":\"C\",\"perms\":\"crm:pool:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:01:00');
INSERT INTO `sys_oper_log` VALUES ('187', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"drag\",\"orderNum\":\"100\",\"menuName\":\"我的线索\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"person\",\"component\":\"crm/clues/person-list\",\"children\":[],\"createTime\":1641987450000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2010,\"menuType\":\"C\",\"perms\":\"crm:clues:person:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:01:19');
INSERT INTO `sys_oper_log` VALUES ('188', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"101\",\"menuName\":\"整体线索\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"list\",\"component\":\"crm/clues/list\",\"children\":[],\"createTime\":1641987529000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2011,\"menuType\":\"C\",\"perms\":\"crm:clues:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:01:34');
INSERT INTO `sys_oper_log` VALUES ('189', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"100\",\"menuName\":\"我的客户\",\"params\":{},\"parentId\":2008,\"isCache\":\"0\",\"path\":\"person\",\"component\":\"crm/customer/person-list\",\"children\":[],\"createTime\":1641987734000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2012,\"menuType\":\"C\",\"perms\":\"crm:customer:person:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:01:55');
INSERT INTO `sys_oper_log` VALUES ('190', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"101\",\"menuName\":\"整体客户\",\"params\":{},\"parentId\":2008,\"isCache\":\"0\",\"path\":\"list\",\"component\":\"crm/customer/list\",\"children\":[],\"createTime\":1641987764000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2013,\"menuType\":\"C\",\"perms\":\"crm:customer:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:02:04');
INSERT INTO `sys_oper_log` VALUES ('191', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"select\",\"orderNum\":\"102\",\"menuName\":\"成交信息\",\"params\":{},\"parentId\":2008,\"isCache\":\"0\",\"path\":\"deal\",\"component\":\"crm/customer/deal-list\",\"children\":[],\"createTime\":1641987817000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"crm:customer:deal:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:02:21');
INSERT INTO `sys_oper_log` VALUES ('192', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"101\",\"menuName\":\"整体客户\",\"params\":{},\"parentId\":2008,\"isCache\":\"0\",\"path\":\"list\",\"component\":\"crm/customer/list\",\"children\":[],\"createTime\":1641987764000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2013,\"menuType\":\"C\",\"perms\":\"crm:customer:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:02:34');
INSERT INTO `sys_oper_log` VALUES ('193', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"100\",\"menuName\":\"我的客户\",\"params\":{},\"parentId\":2008,\"isCache\":\"0\",\"path\":\"person\",\"component\":\"crm/customer/person-list\",\"children\":[],\"createTime\":1641987734000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2012,\"menuType\":\"C\",\"perms\":\"crm:customer:person:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:02:40');
INSERT INTO `sys_oper_log` VALUES ('194', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"edit\",\"orderNum\":\"7\",\"menuName\":\"系统参数设置\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"config\",\"component\":\"system/config/index\",\"children\":[],\"createTime\":1641899500000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":106,\"menuType\":\"C\",\"perms\":\"system:config:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:03:01');
INSERT INTO `sys_oper_log` VALUES ('195', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":\"0\",\"menuName\":\"我的订单\",\"params\":{},\"parentId\":2015,\"isCache\":\"0\",\"path\":\"crm/customer\",\"component\":\"crm/order/person-list\",\"children\":[],\"createTime\":1642558836000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2016,\"menuType\":\"C\",\"perms\":\"crm:order:person:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:03:16');
INSERT INTO `sys_oper_log` VALUES ('196', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":\"1\",\"menuName\":\"客户订单\",\"params\":{},\"parentId\":2015,\"isCache\":\"0\",\"path\":\"crm/order\",\"component\":\"crm/order/list\",\"children\":[],\"createTime\":1642561665000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"crm:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:03:36');
INSERT INTO `sys_oper_log` VALUES ('197', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"fullscreen\",\"orderNum\":\"100\",\"menuName\":\"我的线索\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"person\",\"component\":\"crm/clues/person-list\",\"children\":[],\"createTime\":1641987450000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2010,\"menuType\":\"C\",\"perms\":\"crm:clues:person:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:51:31');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"international\",\"orderNum\":\"100\",\"menuName\":\"公海信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/pool\",\"children\":[],\"createTime\":1641986619000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:52:00');
INSERT INTO `sys_oper_log` VALUES ('199', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"international\",\"orderNum\":\"100\",\"menuName\":\"公海信息\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"list\",\"component\":\"crm/pool/list\",\"children\":[],\"createTime\":1641987218000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2009,\"menuType\":\"C\",\"perms\":\"crm:pool:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:52:09');
INSERT INTO `sys_oper_log` VALUES ('200', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"upload\",\"orderNum\":\"100\",\"menuName\":\"公海信息\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"list\",\"component\":\"crm/pool/list\",\"children\":[],\"createTime\":1641987218000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2009,\"menuType\":\"C\",\"perms\":\"crm:pool:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:53:04');
INSERT INTO `sys_oper_log` VALUES ('201', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"upload\",\"orderNum\":\"100\",\"menuName\":\"公海信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm/pool\",\"children\":[],\"createTime\":1641986619000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 15:53:11');
INSERT INTO `sys_oper_log` VALUES ('202', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"1\",\"menuName\":\"库存管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"erp\",\"children\":[],\"createTime\":1678357930000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 21:15:37');
INSERT INTO `sys_oper_log` VALUES ('203', '菜单管理', '2', 'com.ec.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"redis\",\"orderNum\":\"1\",\"menuName\":\"产品信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"product\",\"children\":[],\"createTime\":1678070989000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-20 21:16:42');
INSERT INTO `sys_oper_log` VALUES ('204', '字典类型', '1', 'com.ec.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"商品条码状态\",\"params\":{},\"dictType\":\"status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-21 09:42:02');
INSERT INTO `sys_oper_log` VALUES ('205', '字典数据', '1', 'com.ec.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"status\",\"dictLabel\":\"在出库\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-21 09:42:28');
INSERT INTO `sys_oper_log` VALUES ('206', '字典数据', '1', 'com.ec.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"status\",\"dictLabel\":\"已出库\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-21 09:42:36');
INSERT INTO `sys_oper_log` VALUES ('207', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":1,\"totalPrice\":1,\"detailId\":1,\"handlerName\":\"1\",\"params\":{},\"actualPayment\":1,\"createTime\":1689905531640,\"taxInfoId\":1}', '{\"msg\":\"java.lang.NullPointerException: Cannot invoke \\\"com.ec.erp.domain.ErpClient.getId()\\\" because the return value of \\\"com.ec.erp.domain.ErpOrder.getClientInfo()\\\" is null\",\"code\":500}', '0', null, '2023-07-21 10:12:11');
INSERT INTO `sys_oper_log` VALUES ('208', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":1,\"orderNo\":\"1\",\"totalPrice\":1,\"detailId\":2,\"handlerName\":\"1\",\"params\":{},\"actualPayment\":1,\"createTime\":1690002171824,\"taxInfoId\":2}', '{\"msg\":\"java.lang.NullPointerException: Cannot invoke \\\"com.ec.erp.domain.ErpClient.getId()\\\" because the return value of \\\"com.ec.erp.domain.ErpOrder.getClientInfo()\\\" is null\",\"code\":500}', '0', null, '2023-07-22 13:02:51');
INSERT INTO `sys_oper_log` VALUES ('209', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":1,\"orderNo\":\"1\",\"totalPrice\":1,\"detailId\":2,\"handlerName\":\"1\",\"params\":{},\"actualPayment\":1,\"createTime\":1690003005392,\"id\":20,\"taxInfoId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 13:16:45');
INSERT INTO `sys_oper_log` VALUES ('210', '库存销售订单', '2', 'com.ec.erp.controller.ErpOrderController.edit()', 'PUT', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":1,\"orderNo\":\"1\",\"totalPrice\":1,\"detailId\":4,\"handlerName\":\"1\",\"params\":{},\"actualPayment\":1,\"createTime\":1690003005000,\"id\":20,\"taxInfoId\":2,\"productList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 13:16:54');
INSERT INTO `sys_oper_log` VALUES ('211', '库存销售订单', '2', 'com.ec.erp.controller.ErpOrderController.edit()', 'PUT', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":1,\"orderNo\":\"1\",\"totalPrice\":1,\"detailId\":3,\"handlerName\":\"1\",\"params\":{},\"actualPayment\":1,\"createTime\":1690003005000,\"id\":20,\"taxInfoId\":2,\"productList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 13:24:47');
INSERT INTO `sys_oper_log` VALUES ('212', '库存销售订单', '1', 'com.ec.erp.controller.ErpOrderController.add()', 'POST', '1', 'admin', null, '/erp/order', '127.0.0.1', '内网IP', '{\"clientId\":5,\"orderNo\":\"5\",\"totalPrice\":4,\"detailId\":5,\"handlerName\":\"4\",\"params\":{},\"actualPayment\":5,\"createTime\":1690003498860,\"id\":21,\"taxInfoId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 13:24:58');
INSERT INTO `sys_oper_log` VALUES ('213', '库存销售订单', '3', 'com.ec.erp.controller.ErpOrderController.remove()', 'DELETE', '1', 'admin', null, '/erp/order/15', '127.0.0.1', '内网IP', '{ids=15}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 13:25:02');
INSERT INTO `sys_oper_log` VALUES ('214', '库存销售订单', '3', 'com.ec.erp.controller.ErpOrderController.remove()', 'DELETE', '1', 'admin', null, '/erp/order/16,17,14,18,19', '127.0.0.1', '内网IP', '{ids=16,17,14,18,19}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 13:25:10');
INSERT INTO `sys_oper_log` VALUES ('215', '用户管理', '2', 'com.ec.web.controller.system.SysUserController.resetPwd()', 'PUT', '1', 'admin', null, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$VY6VNLFFDaUeeQvAbX6Huuo0.eOYdDRDhxHcPhHOACAYw6S6gtKPe\",\"updateBy\":\"admin\",\"params\":{},\"userId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 19:56:56');
INSERT INTO `sys_oper_log` VALUES ('216', '角色管理', '2', 'com.ec.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1685853325000,\"menuCheckStrictly\":true,\"roleKey\":\"2\",\"roleName\":\"2\",\"deptIds\":[100],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 19:59:46');
INSERT INTO `sys_oper_log` VALUES ('217', '用户管理', '4', 'com.ec.web.controller.system.SysUserController.insertAuthRole()', 'PUT', '1', 'admin', null, '/system/user/authRole', '127.0.0.1', '内网IP', '4 [2]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 20:00:01');
INSERT INTO `sys_oper_log` VALUES ('218', '角色管理', '2', 'com.ec.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1685853325000,\"menuCheckStrictly\":true,\"roleKey\":\"2\",\"roleName\":\"2\",\"deptIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 20:01:11');
INSERT INTO `sys_oper_log` VALUES ('219', '角色管理', '1', 'com.ec.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"3\",\"roleName\":\"3\",\"deptIds\":[],\"menuIds\":[2018,2019,2028,2029,2030,2020,2021,2022,2023,2027,2024,2025,2026,2006,2009,2007,2010,2011,2008,2012,2013,2014,2015,2016,2017,1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,109,1046,1047,1048],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 20:01:30');
INSERT INTO `sys_oper_log` VALUES ('220', '用户管理', '4', 'com.ec.web.controller.system.SysUserController.insertAuthRole()', 'PUT', '1', 'admin', null, '/system/user/authRole', '127.0.0.1', '内网IP', '4 [3]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-22 20:01:42');
INSERT INTO `sys_oper_log` VALUES ('221', '线索', '2', 'com.ec.crm.controller.CrmCluesController.edit()', 'PUT', '1', 'admin', null, '/crm/clues', '127.0.0.1', '内网IP', '{\"code\":\"\",\"customerRank\":\"\",\"cluesName\":\"s\",\"cluesStatus\":\"无效\",\"delFlag\":\"0\",\"customerStatus\":\"\",\"updateBy\":\"admin\",\"id\":8,\"owner\":\"admin\",\"preOwner\":\"admin\",\"customerIndustry\":\"\",\"updateTime\":1690363132194,\"dealStatus\":\"0\",\"params\":{},\"poolType\":\"\",\"version\":0,\"lastUpdateRecord\":\"\",\"linkman\":\"s\",\"createBy\":\"admin\",\"createTime\":1689163444000,\"phone\":\"15000000000\",\"name\":\"\",\"cluesSource\":\"抖音\",\"region\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-26 17:18:52');
INSERT INTO `sys_oper_log` VALUES ('222', '线索', '2', 'com.ec.crm.controller.CrmCluesController.edit()', 'PUT', '1', 'admin', null, '/crm/clues', '127.0.0.1', '内网IP', '{\"code\":\"\",\"customerRank\":\"\",\"cluesName\":\"s\",\"cluesStatus\":\"无效\",\"delFlag\":\"0\",\"customerStatus\":\"\",\"updateBy\":\"admin\",\"id\":8,\"owner\":\"admin\",\"preOwner\":\"admin\",\"customerIndustry\":\"\",\"updateTime\":1690363138213,\"dealStatus\":\"0\",\"params\":{},\"poolType\":\"\",\"version\":0,\"lastUpdateRecord\":\"\",\"linkman\":\"s\",\"createBy\":\"admin\",\"createTime\":1689163444000,\"phone\":\"15000000000\",\"name\":\"\",\"cluesSource\":\"抖音\",\"region\":\"北京市\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-07-26 17:18:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', '1', '1', '0', '0', 'admin', '2023-03-24 11:59:03', '', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2023-02-28 12:18:33', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '2', '2', '0', '1', '1', '1', '0', '0', 'admin', '2023-06-04 12:35:25', '', '2023-07-22 20:01:11', null);
INSERT INTO `sys_role` VALUES ('3', '3', '3', '0', '1', '1', '1', '0', '0', 'admin', '2023-07-22 20:01:30', '', null, null);

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
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '100');
INSERT INTO `sys_role_menu` VALUES ('3', '101');
INSERT INTO `sys_role_menu` VALUES ('3', '102');
INSERT INTO `sys_role_menu` VALUES ('3', '103');
INSERT INTO `sys_role_menu` VALUES ('3', '104');
INSERT INTO `sys_role_menu` VALUES ('3', '105');
INSERT INTO `sys_role_menu` VALUES ('3', '106');
INSERT INTO `sys_role_menu` VALUES ('3', '107');
INSERT INTO `sys_role_menu` VALUES ('3', '108');
INSERT INTO `sys_role_menu` VALUES ('3', '109');
INSERT INTO `sys_role_menu` VALUES ('3', '500');
INSERT INTO `sys_role_menu` VALUES ('3', '501');
INSERT INTO `sys_role_menu` VALUES ('3', '1001');
INSERT INTO `sys_role_menu` VALUES ('3', '1002');
INSERT INTO `sys_role_menu` VALUES ('3', '1003');
INSERT INTO `sys_role_menu` VALUES ('3', '1004');
INSERT INTO `sys_role_menu` VALUES ('3', '1005');
INSERT INTO `sys_role_menu` VALUES ('3', '1006');
INSERT INTO `sys_role_menu` VALUES ('3', '1007');
INSERT INTO `sys_role_menu` VALUES ('3', '1008');
INSERT INTO `sys_role_menu` VALUES ('3', '1009');
INSERT INTO `sys_role_menu` VALUES ('3', '1010');
INSERT INTO `sys_role_menu` VALUES ('3', '1011');
INSERT INTO `sys_role_menu` VALUES ('3', '1012');
INSERT INTO `sys_role_menu` VALUES ('3', '1013');
INSERT INTO `sys_role_menu` VALUES ('3', '1014');
INSERT INTO `sys_role_menu` VALUES ('3', '1015');
INSERT INTO `sys_role_menu` VALUES ('3', '1016');
INSERT INTO `sys_role_menu` VALUES ('3', '1017');
INSERT INTO `sys_role_menu` VALUES ('3', '1018');
INSERT INTO `sys_role_menu` VALUES ('3', '1019');
INSERT INTO `sys_role_menu` VALUES ('3', '1020');
INSERT INTO `sys_role_menu` VALUES ('3', '1021');
INSERT INTO `sys_role_menu` VALUES ('3', '1022');
INSERT INTO `sys_role_menu` VALUES ('3', '1023');
INSERT INTO `sys_role_menu` VALUES ('3', '1024');
INSERT INTO `sys_role_menu` VALUES ('3', '1025');
INSERT INTO `sys_role_menu` VALUES ('3', '1026');
INSERT INTO `sys_role_menu` VALUES ('3', '1027');
INSERT INTO `sys_role_menu` VALUES ('3', '1028');
INSERT INTO `sys_role_menu` VALUES ('3', '1029');
INSERT INTO `sys_role_menu` VALUES ('3', '1030');
INSERT INTO `sys_role_menu` VALUES ('3', '1031');
INSERT INTO `sys_role_menu` VALUES ('3', '1032');
INSERT INTO `sys_role_menu` VALUES ('3', '1033');
INSERT INTO `sys_role_menu` VALUES ('3', '1034');
INSERT INTO `sys_role_menu` VALUES ('3', '1035');
INSERT INTO `sys_role_menu` VALUES ('3', '1036');
INSERT INTO `sys_role_menu` VALUES ('3', '1037');
INSERT INTO `sys_role_menu` VALUES ('3', '1038');
INSERT INTO `sys_role_menu` VALUES ('3', '1039');
INSERT INTO `sys_role_menu` VALUES ('3', '1040');
INSERT INTO `sys_role_menu` VALUES ('3', '1041');
INSERT INTO `sys_role_menu` VALUES ('3', '1042');
INSERT INTO `sys_role_menu` VALUES ('3', '1043');
INSERT INTO `sys_role_menu` VALUES ('3', '1044');
INSERT INTO `sys_role_menu` VALUES ('3', '1045');
INSERT INTO `sys_role_menu` VALUES ('3', '1046');
INSERT INTO `sys_role_menu` VALUES ('3', '1047');
INSERT INTO `sys_role_menu` VALUES ('3', '1048');
INSERT INTO `sys_role_menu` VALUES ('3', '2006');
INSERT INTO `sys_role_menu` VALUES ('3', '2007');
INSERT INTO `sys_role_menu` VALUES ('3', '2008');
INSERT INTO `sys_role_menu` VALUES ('3', '2009');
INSERT INTO `sys_role_menu` VALUES ('3', '2010');
INSERT INTO `sys_role_menu` VALUES ('3', '2011');
INSERT INTO `sys_role_menu` VALUES ('3', '2012');
INSERT INTO `sys_role_menu` VALUES ('3', '2013');
INSERT INTO `sys_role_menu` VALUES ('3', '2014');
INSERT INTO `sys_role_menu` VALUES ('3', '2015');
INSERT INTO `sys_role_menu` VALUES ('3', '2016');
INSERT INTO `sys_role_menu` VALUES ('3', '2017');
INSERT INTO `sys_role_menu` VALUES ('3', '2018');
INSERT INTO `sys_role_menu` VALUES ('3', '2019');
INSERT INTO `sys_role_menu` VALUES ('3', '2020');
INSERT INTO `sys_role_menu` VALUES ('3', '2021');
INSERT INTO `sys_role_menu` VALUES ('3', '2022');
INSERT INTO `sys_role_menu` VALUES ('3', '2023');
INSERT INTO `sys_role_menu` VALUES ('3', '2024');
INSERT INTO `sys_role_menu` VALUES ('3', '2025');
INSERT INTO `sys_role_menu` VALUES ('3', '2026');
INSERT INTO `sys_role_menu` VALUES ('3', '2027');
INSERT INTO `sys_role_menu` VALUES ('3', '2028');
INSERT INTO `sys_role_menu` VALUES ('3', '2029');
INSERT INTO `sys_role_menu` VALUES ('3', '2030');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '100', 'admin', '管理员', '00', 'admin@admin.com', '00000000000', '1', '', '$2a$10$XBvAT5ncZm.jHYgMJifWvunU4aJTtkxdWi4dIjzO0Xt46LA8c8K/O', '0', '0', '127.0.0.1', '2023-07-26 17:18:07', 'admin', '2023-02-28 12:18:33', '', '2023-07-26 17:18:06', '管理员');
INSERT INTO `sys_user` VALUES ('2', null, 'admin2', 'admin2', '00', '', '', '0', '', '$2a$10$e32X27UTY9dZTvlPXpYVr.kJ/n5BFPysrAc2sHzF38zftEfO9JdXi', '0', '2', '', null, 'admin', '2023-03-14 18:55:35', '', null, null);
INSERT INTO `sys_user` VALUES ('3', '100', '12', '3', '00', '', '', '0', '', '$2a$10$Vs0692eRT0btl1njmDMIqO0R9gaFgq0u.WVif.UWyP/wpFx.rHaTu', '0', '0', '', null, 'admin', '2023-06-04 11:14:29', 'admin', '2023-07-17 20:03:03', null);
INSERT INTO `sys_user` VALUES ('4', '100', 'test', 'test', '00', '', '', '0', '', '$2a$10$VY6VNLFFDaUeeQvAbX6Huuo0.eOYdDRDhxHcPhHOACAYw6S6gtKPe', '0', '0', '127.0.0.1', '2023-07-22 20:02:22', 'admin', '2023-07-20 11:28:19', 'admin', '2023-07-22 20:02:22', null);

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
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '3');
