/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : erp-crm-master

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2023-07-26 17:19:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `master_tenant`
-- ----------------------------
DROP TABLE IF EXISTS `master_tenant`;
CREATE TABLE `master_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `url` varchar(255) DEFAULT NULL COMMENT '数据库连接URL',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `database_name` varchar(64) DEFAULT NULL COMMENT '数据库名',
  `host_name` varchar(64) DEFAULT NULL COMMENT '数据库主机名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` char(1) DEFAULT '1' COMMENT '状态(1正常 2停止)',
  `expiration_date` datetime DEFAULT NULL COMMENT '到期日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_tenant` (`tenant`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COMMENT='主租户表';

-- ----------------------------
-- Records of master_tenant
-- ----------------------------
INSERT INTO `master_tenant` VALUES ('1', 'tenant1', 'jdbc:mysql://localhost:3306/ec_KWEbSrWI?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'ec_KWEbSrWI', '8CB7go3k', 'ec_KWEbSrWI', null, '2023-03-24 12:22:03', '1', '2023-07-27 00:00:00');
INSERT INTO `master_tenant` VALUES ('11', 'tenant14', 'jdbc:mysql://localhost:3306/rycrm-tenant-1?useSSL=false', 'root', 'eoruvx', 'rycrm-tenant-1', 'localhost', null, '1', null);
INSERT INTO `master_tenant` VALUES ('22', 'superAdmin', 'jdbc:mysql://localhost:3306/ryt_5RBg03bP?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'ryt_5RBg03bP', 'ddNMC5l4', 'ryt_5RBg03bP', 'localhost', '2025-02-26 20:21:27', '1', '2028-02-06 00:00:00');
INSERT INTO `master_tenant` VALUES ('23', 'tenant4', 'jdbc:mysql://localhost:3306/ryt_Nelub7xR?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'ryt_Nelub7xR', 'DNTQQ7xm', 'ryt_Nelub7xR', null, '2025-02-28 12:18:34', '1', '2025-03-30 12:18:34');
INSERT INTO `master_tenant` VALUES ('25', 'tenant6', 'tenant6', 'admin', '8CB7go3k', 'tenant', 'localhost', null, '1', '2025-04-01 00:00:00');
INSERT INTO `master_tenant` VALUES ('28', 'tenant7', 'jdbc:mysql://localhost:3306/ryt_ZGcRZYiF?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'ryt_ZGcRZYiF', 'cdw1xhwg', 'ryt_ZGcRZYiF', null, '2023-03-06 11:35:01', '1', '2023-03-13 11:35:01');
INSERT INTO `master_tenant` VALUES ('29', 'tenant8', 'jdbc:mysql://localhost:3306/ryt_uDXuF2H1?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'ryt_uDXuF2H1', 'WRhuFrWJ', 'ryt_uDXuF2H1', null, '2023-03-06 11:41:15', '1', '2023-03-13 11:41:15');
INSERT INTO `master_tenant` VALUES ('30', 'tenant9', 'jdbc:mysql://localhost:3306/ryt_naRCWCBv?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'ryt_naRCWCBv', 'cyVBv0fZ', 'ryt_naRCWCBv', null, '2023-03-06 11:49:33', '1', '2023-03-13 11:49:33');
INSERT INTO `master_tenant` VALUES ('31', 'tenant10', 'jdbc:mysql://localhost:3306/ryt_dygNreg0?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'ryt_dygNreg0', 'nFlCIytb', 'ryt_dygNreg0', null, '2023-03-08 10:49:50', '1', '2023-03-15 10:49:50');
INSERT INTO `master_tenant` VALUES ('32', 'tenant25', 'jdbc:mysql://localhost:3306/ec_kF9hgAsR?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'ec_kF9hgAsR', 'day6xeC1', 'ec_kF9hgAsR', null, '2023-07-22 15:11:53', '1', '2023-07-29 15:11:53');
INSERT INTO `master_tenant` VALUES ('33', 'tenant27', 'jdbc:mysql://localhost:3306/ec_0iF0QhOb?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'ec_0iF0QhOb', 'c3v49eBg', 'ec_0iF0QhOb', null, '2023-07-22 16:12:07', '1', '2023-07-29 16:12:07');
INSERT INTO `master_tenant` VALUES ('34', 'tenant26', 'jdbc:mysql://localhost:3306/ec_ntWQWasn?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'ec_ntWQWasn', 'alSBKMF5', 'ec_ntWQWasn', null, '2023-07-22 16:35:10', '1', '2023-07-29 16:35:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
