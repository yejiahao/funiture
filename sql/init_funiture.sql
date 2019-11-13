/*
 Navicat Premium Data Transfer

 Source Server         : vmx
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : vmx.yejh.cn:3306
 Source Schema         : furniture

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 04/07/2019 11:48:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `read_times` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish_time` datetime(0) NOT NULL,
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `operate_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'test1', 3, 'test', '2016-03-08 00:00:00', 'kanwangzjm@163.com', '127.0.0.1', '2016-03-08 21:34:53');
INSERT INTO `article` VALUES (2, 'test1', 1, 'test', '2016-03-08 21:38:12', 'kanwangzjm@163.com', '127.0.0.1', '2016-03-08 21:38:12');

-- ----------------------------
-- Table structure for captcha_code
-- ----------------------------
DROP TABLE IF EXISTS `captcha_code`;
CREATE TABLE `captcha_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `try_times` int(11) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `expire_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of captcha_code
-- ----------------------------
INSERT INTO `captcha_code` VALUES (1, '630ADD52AF4E87C8BA9863957BC1DBCE', '5YFN8', 1, 0, '2016-03-09 23:07:11', '2016-03-09 23:12:11');
INSERT INTO `captcha_code` VALUES (2, '45E3ACE043B1C7E40EF3EA35C84C4F2A', 'VUQFD', 1, 0, '2016-03-10 00:03:32', '2016-03-10 00:08:32');
INSERT INTO `captcha_code` VALUES (3, 'E6849EE4871CEA616EC3708F987805E2', 'PF63A', 1, 0, '2016-03-10 00:14:35', '2016-03-10 00:19:35');
INSERT INTO `captcha_code` VALUES (4, 'E6849EE4871CEA616EC3708F987805E2', 'WQSHT', 0, 3, '2016-03-10 00:17:18', '2016-03-10 00:22:18');
INSERT INTO `captcha_code` VALUES (5, 'CAB03325AEA8CAABD8971A5FAB58C7B6', 'SMPWZ', 0, 2, '2016-03-10 00:26:00', '2016-03-10 00:31:00');

-- ----------------------------
-- Table structure for configuration
-- ----------------------------
DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `v` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of configuration
-- ----------------------------
INSERT INTO `configuration` VALUES (1, 'mail.send.password', '880103', '发送邮件使用的密码', 'admin');
INSERT INTO `configuration` VALUES (2, 'mail.send.nickname', 'alert', '发送邮件使用的昵称', NULL);
INSERT INTO `configuration` VALUES (3, 'mail.send.from', 'kanwangzjm@126.com', '发送邮件使用的邮箱', 'jimin');
INSERT INTO `configuration` VALUES (4, 'mail.send.port', '25', '发送邮件使用的端口', 'admin');
INSERT INTO `configuration` VALUES (5, 'mail.send.smtp', 'smtp.126.com', '发送邮件使用的smtp协议', 'jimin');
INSERT INTO `configuration` VALUES (6, 'file.upload.path', '/Users/jimin/upload/', '文件上传路径', 'jimin');
INSERT INTO `configuration` VALUES (7, 'file.mapping.path', '/upload/', '上传的文件映射到本地的路径，便于文件通过url访问, ln -s 实际路径 新可访问路径', 'jimin');
INSERT INTO `configuration` VALUES (8, 'logback.filter.msg', '\"SQLTimeInterceptor\";\"sql with out get connection\"', 'logback邮件过滤的log', 'jimin');
INSERT INTO `configuration` VALUES (9, 'logback.email.open', 'false', 'logback是否开启邮件通知', 'jimin');
INSERT INTO `configuration` VALUES (10, 'sql.list.count', '100', 'sql结果集数量标识', 'jimin');
INSERT INTO `configuration` VALUES (11, 'slow.query.millseconds', '10000', 'slow query时间定义', 'jimin');
INSERT INTO `configuration` VALUES (12, 'root.user.name', 'kanwangzjm@163.com,kanwangzjm,jimin,admin', '系统root用户', NULL);
INSERT INTO `configuration` VALUES (13, 'access.whiteList', '', '不受权限拦截的页面', 'jimin');
INSERT INTO `configuration` VALUES (14, 'no.auth.page', '/sys/user/noAuth.do', '无权限访问页面', 'jimin');
INSERT INTO `configuration` VALUES (15, 'cookie.expire.seconds', '1800000', 'cookie失效时间，单位：秒', 'jimin');
INSERT INTO `configuration` VALUES (16, 'cookie.user.flag', '_U', 'cookie中用户信息的标识，特殊情况下可通过改这个值来让用户登录', 'jimin');
INSERT INTO `configuration` VALUES (17, 'captcha_code.invalid.minutes', '5', '验证码过期时间', 'admin');
INSERT INTO `configuration` VALUES (18, 'captcha_code.one_minute.max', '5', '一分钟一个sessionId生成验证码的最大次数', 'admin');
INSERT INTO `configuration` VALUES (19, 'captcha_code.validate.url', '/investment/save.json', '需要校验验证码的url请求列表', 'admin');
INSERT INTO `configuration` VALUES (20, 'http.max.thread', '20', 'http最大进程数', 'admin');
INSERT INTO `configuration` VALUES (21, 'http.default.connection.timeout', '60000', 'http默认连接超时时间, 毫秒', 'admin');
INSERT INTO `configuration` VALUES (22, 'http.default.socket.timeout', '60000', 'http默认socket超时时间，毫秒', 'admin');
INSERT INTO `configuration` VALUES (23, 'rabbitmq.default.queue.name', 'testQ', 'rabbitmq默认使用的队列名称', 'admin');
INSERT INTO `configuration` VALUES (24, 'not.allowed.urls', '', '临时不允许访问的url', 'admin');
INSERT INTO `configuration` VALUES (25, 'percent.allowed.urls', '/sys/role/page2.do,90;/sys/user/page.do,90', '切流量访问的url，配置为：url1,百分比1;url2,百分比2', 'admin');
INSERT INTO `configuration` VALUES (26, 'service.degarding.page', '/serviceDegarding.do', '因为切流量不允许访问指定页面跳转的页面', 'admin');
INSERT INTO `configuration` VALUES (27, 'url.qps.limiter', '/sys/role/page2.do,1;/sys/user/page.do,1', 'qps限制', NULL);
INSERT INTO `configuration` VALUES (28, 'default.executor.coreSize', '40', '默认核心池大小', NULL);
INSERT INTO `configuration` VALUES (29, 'default.executor.maxSize', '100', '默认最大线程数', NULL);
INSERT INTO `configuration` VALUES (30, 'default.executor.keepAlive.seconds', '120', '默认空闲等待时间， 单位：秒', NULL);
INSERT INTO `configuration` VALUES (31, 'default.executor.queueSize', '1000', '默认线程循环数组（队列）大小', NULL);
INSERT INTO `configuration` VALUES (32, 'proxy.keys', ' ', '需要代理的key，需要与*.proxy.ips配合使用', 'admin');
INSERT INTO `configuration` VALUES (33, 'proxy.visit.base.millseconds', '5000', '直连大于base时间才考虑代理', 'admin');
INSERT INTO `configuration` VALUES (35, 'proxy.flag', '0', '0:计算代理和直连最佳效果，1：强制使用代理，2：强制不使用代理', 'admin');
INSERT INTO `configuration` VALUES (36, 'machine.list', 'http://www.test.com:8080', '机器列表，格式为：[http://机器名1:端口1,http://机器名2:端口2]', 'admin');
INSERT INTO `configuration` VALUES (37, 'qps.limit.switch', 'off', '全局url qps开关，on:打开，off:关闭', NULL);

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operate_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `md5` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_info
-- ----------------------------
INSERT INTO `file_info` VALUES (11, '1.sh', '201511302336497.sh', 'kanwangzjm@163.com', '2015-11-30 23:36:49', '61c24e976cdb7f3fdda47b3e5ab1754f', 89);
INSERT INTO `file_info` VALUES (12, 'test', '201511302336496', 'kanwangzjm@163.com', '2015-11-30 23:36:49', '31c903aadcca5d0dbb5e2ba8bc5a48cc', 1445);
INSERT INTO `file_info` VALUES (13, 'dubbo原理与实战.pptx', '201511302337366.pptx', 'kanwangzjm@163.com', '2015-11-30 23:37:36', '0963435deda7a1b291dd17e8b24b0d46', 297656);
INSERT INTO `file_info` VALUES (14, 'Java 20年.pdf', '201512010021181.pdf', 'kanwangzjm@163.com', '2015-12-01 00:21:18', '8371feaa498775d4a9b39e8918326930', 3140974);
INSERT INTO `file_info` VALUES (15, 'Kafka自学文档.pdf', '201512010021188.pdf', 'kanwangzjm@163.com', '2015-12-01 00:21:18', '6fd300d2fdb7081ee1193d05e1c2a148', 469887);
INSERT INTO `file_info` VALUES (16, 'Memcached源码剖析笔记.pdf', '201512010021180.pdf', 'kanwangzjm@163.com', '2015-12-01 00:21:18', 'a5e3c666f1a42a971a3c0daeea8fcea3', 876544);

-- ----------------------------
-- Table structure for investment
-- ----------------------------
DROP TABLE IF EXISTS `investment`;
CREATE TABLE `investment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-1' COMMENT '所在地区',
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'M',
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `business_brand` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营品牌',
  `business_model` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-1' COMMENT '经营模式',
  `venue_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `business_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营面积',
  `contract_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同到期时间',
  `investment_amount` int(11) NULL DEFAULT NULL COMMENT '投资金额',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` int(11) NOT NULL DEFAULT 1,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of investment
-- ----------------------------
INSERT INTO `investment` VALUES (1, 'xx', '18612403296', '15812812311', 'fax', 'beijing', 'M', 'test@test.com', '466420182', 'brand', 'model', NULL, NULL, NULL, NULL, 'comment', '2016-03-08 22:13:33', 0, 'system', '2016-03-08 22:14:54');
INSERT INTO `investment` VALUES (2, 'xx', '18612403296', '15812812311', 'fax', 'beijing', 'M', 'test@test.com', '466420182', 'brand', 'model', 'venue', 'size', '2016-03-10', 10000, 'comment', '2016-03-08 22:19:54', 0, 'kanwangzjm@163.com', '2016-03-08 22:21:11');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(20) NULL DEFAULT 1,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 't1', '123', 1, '2015-11-04 23:28:55', NULL);
INSERT INTO `product` VALUES (2, 't2', '123', 1, '2015-11-04 23:29:06', NULL);
INSERT INTO `product` VALUES (3, 't3', '123', 1, '2015-11-04 23:29:14', NULL);
INSERT INTO `product` VALUES (4, 't4', '123', 1, '2015-11-04 23:29:25', NULL);
INSERT INTO `product` VALUES (5, 't5', '123', 1, '2015-11-04 23:29:31', NULL);
INSERT INTO `product` VALUES (6, 't6', '123', 1, '2015-11-04 23:29:38', NULL);
INSERT INTO `product` VALUES (7, 't7', '123', 1, '2015-11-04 23:29:44', NULL);
INSERT INTO `product` VALUES (8, 't8', '123', 1, '2015-11-04 23:29:50', NULL);
INSERT INTO `product` VALUES (9, 'test', 'test1', 1, '2016-03-07 22:05:53', NULL);
INSERT INTO `product` VALUES (10, 'test', 'test1', 0, '2016-03-07 23:31:02', '2016-03-07 23:35:52');
INSERT INTO `product` VALUES (11, 'test', 'test1', 1, '2016-03-07 23:36:09', '2016-03-07 23:36:09');

-- ----------------------------
-- Table structure for schedule_execute_result
-- ----------------------------
DROP TABLE IF EXISTS `schedule_execute_result`;
CREATE TABLE `schedule_execute_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_execute_result
-- ----------------------------
INSERT INTO `schedule_execute_result` VALUES (1, 'group.test_schedule.test', '2016-05-09 12:07:00', '2016-05-09 12:07:00', 2);
INSERT INTO `schedule_execute_result` VALUES (2, 'system_system.monitor', '2016-05-09 12:07:00', '2016-05-09 12:07:00', 1);
INSERT INTO `schedule_execute_result` VALUES (3, 'group.test_schedule.test', '2016-05-09 12:07:20', '2016-05-09 12:07:20', 1);
INSERT INTO `schedule_execute_result` VALUES (4, 'group.test_schedule.test', '2016-05-09 12:07:40', '2016-05-09 12:07:40', 1);
INSERT INTO `schedule_execute_result` VALUES (5, 'group.test_schedule.test', '2016-05-09 12:08:00', '2016-05-09 12:08:00', 1);
INSERT INTO `schedule_execute_result` VALUES (6, 'system_system.monitor', '2016-05-09 12:08:00', '2016-05-09 12:08:00', 1);
INSERT INTO `schedule_execute_result` VALUES (7, 'group.test_schedule.test', '2016-05-09 12:08:20', '2016-05-09 12:08:20', 1);
INSERT INTO `schedule_execute_result` VALUES (8, 'group.test_schedule.test', '2016-05-09 12:08:40', '2016-05-09 12:08:50', 1);
INSERT INTO `schedule_execute_result` VALUES (9, 'system.monitor', '2016-05-14 11:31:00', '2016-05-14 11:31:00', 1);
INSERT INTO `schedule_execute_result` VALUES (10, 'system.monitor', '2016-05-14 11:32:00', '2016-05-14 11:32:00', 1);
INSERT INTO `schedule_execute_result` VALUES (11, 'system.monitor', '2016-05-14 11:35:00', '2016-05-14 11:35:00', 1);
INSERT INTO `schedule_execute_result` VALUES (12, 'system.monitor', '2016-05-14 11:36:00', '2016-05-14 11:36:00', 1);
INSERT INTO `schedule_execute_result` VALUES (13, 'system.monitor', '2016-05-14 11:37:00', '2016-05-14 11:37:00', 1);
INSERT INTO `schedule_execute_result` VALUES (14, 'group.test-schedule.test', '2016-05-14 11:41:40', '2016-05-14 11:41:50', 1);
INSERT INTO `schedule_execute_result` VALUES (15, 'group.test-schedule.test', '2016-05-14 11:42:00', '2016-05-14 11:42:10', 1);
INSERT INTO `schedule_execute_result` VALUES (16, 'system-system.monitor', '2016-05-14 11:42:00', '2016-05-14 11:42:00', 1);
INSERT INTO `schedule_execute_result` VALUES (17, 'group.test-schedule.test', '2016-05-14 11:42:20', '2016-05-14 11:42:30', 1);
INSERT INTO `schedule_execute_result` VALUES (18, 'group.test_schedule.test', '2016-05-14 11:42:40', '2016-05-14 11:42:50', 1);
INSERT INTO `schedule_execute_result` VALUES (19, 'group.test_schedule.test', '2016-05-14 11:43:00', '2016-05-14 11:43:10', 1);
INSERT INTO `schedule_execute_result` VALUES (20, 'system_system.monitor', '2016-05-14 11:43:00', '2016-05-14 11:43:00', 1);
INSERT INTO `schedule_execute_result` VALUES (21, 'group.test_schedule.test', '2016-05-14 11:43:20', '2016-05-14 11:43:30', 1);
INSERT INTO `schedule_execute_result` VALUES (22, 'group.test_schedule.test', '2016-05-14 11:43:40', '2016-05-14 11:43:50', 1);
INSERT INTO `schedule_execute_result` VALUES (23, 'group.test_schedule.test', '2016-05-14 11:44:00', '2016-05-14 11:44:10', 1);
INSERT INTO `schedule_execute_result` VALUES (24, 'system_system.monitor', '2016-05-14 11:44:00', '2016-05-14 11:44:00', 1);
INSERT INTO `schedule_execute_result` VALUES (25, 'group.test_schedule.test', '2016-05-14 11:44:20', '2016-05-14 11:44:30', 1);
INSERT INTO `schedule_execute_result` VALUES (26, 'group.test_schedule.test', '2016-05-14 11:44:40', '2016-05-14 11:44:50', 1);
INSERT INTO `schedule_execute_result` VALUES (27, 'group.test_schedule.test', '2016-05-14 11:45:00', '2016-05-14 11:45:10', 1);
INSERT INTO `schedule_execute_result` VALUES (28, 'system_system.monitor', '2016-05-14 11:45:00', '2016-05-14 11:45:00', 1);
INSERT INTO `schedule_execute_result` VALUES (29, 'group.test_schedule.test', '2016-05-14 11:45:20', '2016-05-14 11:45:30', 1);
INSERT INTO `schedule_execute_result` VALUES (30, 'group.test_schedule.test', '2016-05-14 11:45:40', '2016-05-14 11:45:50', 1);
INSERT INTO `schedule_execute_result` VALUES (31, 'group.test_schedule.test', '2016-05-14 11:46:00', '2016-05-14 11:46:10', 1);
INSERT INTO `schedule_execute_result` VALUES (32, 'system_system.monitor', '2016-05-14 11:46:00', '2016-05-14 11:46:00', 1);
INSERT INTO `schedule_execute_result` VALUES (33, 'group.test_schedule.test', '2016-05-14 11:46:20', '2016-05-14 11:46:30', 1);
INSERT INTO `schedule_execute_result` VALUES (34, 'group.test_schedule.test', '2016-05-14 11:46:40', '2016-05-14 11:46:50', 1);
INSERT INTO `schedule_execute_result` VALUES (35, 'group.test_schedule.test', '2016-05-14 11:47:00', '2016-05-14 11:47:10', 1);
INSERT INTO `schedule_execute_result` VALUES (36, 'system_system.monitor', '2016-05-14 11:47:00', '2016-05-14 11:47:00', 1);
INSERT INTO `schedule_execute_result` VALUES (37, 'group.test_schedule.test', '2016-05-14 11:47:20', '2016-05-14 11:47:30', 1);
INSERT INTO `schedule_execute_result` VALUES (38, 'group.test_schedule.test', '2016-05-14 11:47:40', '2016-05-14 11:47:50', 1);
INSERT INTO `schedule_execute_result` VALUES (39, 'group.test_schedule.test', '2016-05-14 11:48:00', '2016-05-14 11:48:10', 1);
INSERT INTO `schedule_execute_result` VALUES (40, 'system_system.monitor', '2016-05-14 11:48:00', '2016-05-14 11:48:00', 1);
INSERT INTO `schedule_execute_result` VALUES (41, 'system_system.monitor', '2016-05-14 11:49:00', '2016-05-14 11:49:00', 1);
INSERT INTO `schedule_execute_result` VALUES (42, 'system_system.monitor', '2016-05-14 11:50:00', '2016-05-14 11:50:00', 1);
INSERT INTO `schedule_execute_result` VALUES (43, 'system_system.monitor', '2016-05-14 11:51:00', '2016-05-14 11:51:00', 1);
INSERT INTO `schedule_execute_result` VALUES (44, 'group.test_schedule.test', '2016-05-14 11:51:20', '2016-05-14 11:51:30', 1);
INSERT INTO `schedule_execute_result` VALUES (45, 'group.test_schedule.test', '2016-05-14 11:51:40', '2016-05-14 11:51:50', 1);
INSERT INTO `schedule_execute_result` VALUES (46, 'group.test_schedule.test', '2016-05-14 11:52:00', '2016-05-14 11:52:10', 1);
INSERT INTO `schedule_execute_result` VALUES (47, 'system_system.monitor', '2016-05-14 11:52:00', '2016-05-14 11:52:00', 1);
INSERT INTO `schedule_execute_result` VALUES (48, 'group.test_schedule.test', '2016-05-14 11:52:20', '2016-05-14 11:52:30', 1);
INSERT INTO `schedule_execute_result` VALUES (49, 'group.test_schedule.test', '2016-05-14 11:52:40', '2016-05-14 11:52:50', 1);
INSERT INTO `schedule_execute_result` VALUES (50, 'group.test_schedule.test', '2016-05-14 11:53:00', '2016-05-14 11:53:10', 1);
INSERT INTO `schedule_execute_result` VALUES (51, 'system_system.monitor', '2016-05-14 11:53:00', '2016-05-14 11:53:00', 1);
INSERT INTO `schedule_execute_result` VALUES (52, 'group.test_schedule.test', '2016-05-14 11:53:20', '2016-05-14 11:53:30', 1);
INSERT INTO `schedule_execute_result` VALUES (53, 'group.test_schedule.test', '2016-05-14 11:53:40', '2016-05-14 11:53:50', 1);
INSERT INTO `schedule_execute_result` VALUES (54, 'group.test_schedule.test', '2016-05-14 11:54:00', '2016-05-14 11:54:10', 1);
INSERT INTO `schedule_execute_result` VALUES (55, 'system_system.monitor', '2016-05-14 11:54:00', '2016-05-14 11:54:00', 1);
INSERT INTO `schedule_execute_result` VALUES (56, 'group.test_schedule.test', '2016-05-14 11:54:20', '2016-05-14 11:54:30', 1);
INSERT INTO `schedule_execute_result` VALUES (57, 'group.test_schedule.test', '2016-05-14 11:54:40', '2016-05-14 11:54:50', 1);
INSERT INTO `schedule_execute_result` VALUES (58, 'group.test_schedule.test', '2016-05-14 11:55:00', '2016-05-14 11:55:00', 1);
INSERT INTO `schedule_execute_result` VALUES (59, 'system_system.monitor', '2016-05-14 11:55:00', '2016-05-14 11:55:00', 1);
INSERT INTO `schedule_execute_result` VALUES (60, 'group.test_schedule.test', '2016-05-14 11:55:20', '2016-05-14 11:55:20', 1);
INSERT INTO `schedule_execute_result` VALUES (61, 'group.test_schedule.test', '2016-05-14 11:55:40', '2016-05-14 11:55:40', 1);
INSERT INTO `schedule_execute_result` VALUES (62, 'system_system.monitor', '2016-05-14 11:56:00', '2016-05-14 11:56:00', 1);
INSERT INTO `schedule_execute_result` VALUES (63, 'group.test_schedule.test', '2016-05-14 11:56:00', '2016-05-14 11:56:10', 1);
INSERT INTO `schedule_execute_result` VALUES (64, 'group.test_schedule.test', '2016-05-14 11:56:20', '2016-05-14 11:56:30', 1);
INSERT INTO `schedule_execute_result` VALUES (65, 'group.test_schedule.test', '2016-05-14 11:56:40', '2016-05-14 11:56:50', 1);
INSERT INTO `schedule_execute_result` VALUES (66, 'group.test_schedule.test', '2016-05-14 11:57:00', '2016-05-14 11:57:10', 1);
INSERT INTO `schedule_execute_result` VALUES (67, 'group.test_schedule.test', '2016-05-14 11:57:20', '2016-05-14 11:57:30', 1);
INSERT INTO `schedule_execute_result` VALUES (68, 'group.test_schedule.test', '2016-05-14 11:57:40', '2016-05-14 11:57:50', 1);
INSERT INTO `schedule_execute_result` VALUES (69, 'group.test_schedule.test', '2016-05-14 11:58:00', '2016-05-14 11:58:10', 1);
INSERT INTO `schedule_execute_result` VALUES (70, 'group.test_schedule.test', '2016-05-14 11:58:20', '2016-05-14 11:58:30', 1);
INSERT INTO `schedule_execute_result` VALUES (71, 'group.test_schedule.test', '2016-05-14 11:58:40', '2016-05-14 11:58:50', 1);
INSERT INTO `schedule_execute_result` VALUES (72, 'group.test_schedule.test', '2016-05-14 11:59:00', '2016-05-14 11:59:10', 1);
INSERT INTO `schedule_execute_result` VALUES (73, 'group.test_schedule.test', '2016-05-14 11:59:20', '2016-05-14 11:59:30', 1);
INSERT INTO `schedule_execute_result` VALUES (74, 'group.test_schedule.test', '2016-05-14 11:59:40', '2016-05-14 11:59:50', 1);
INSERT INTO `schedule_execute_result` VALUES (75, 'group.test_schedule.test', '2016-05-14 12:00:00', '2016-05-14 12:00:10', 1);
INSERT INTO `schedule_execute_result` VALUES (76, 'group.test_schedule.test', '2016-05-14 12:00:20', NULL, 0);
INSERT INTO `schedule_execute_result` VALUES (77, 'group.test_schedule.test', '2016-05-14 12:01:00', '2016-05-14 12:01:10', 1);
INSERT INTO `schedule_execute_result` VALUES (78, 'group.test_schedule.test', '2016-05-14 12:01:20', '2016-05-14 12:01:30', 1);
INSERT INTO `schedule_execute_result` VALUES (79, 'group.test_schedule.test', '2016-05-14 12:01:40', '2016-05-14 12:01:50', 1);
INSERT INTO `schedule_execute_result` VALUES (80, 'group.test_schedule.test', '2016-05-14 12:02:00', '2016-05-14 12:02:10', 1);
INSERT INTO `schedule_execute_result` VALUES (81, 'group.test_schedule.test', '2016-05-14 12:02:20', '2016-05-14 12:02:30', 1);
INSERT INTO `schedule_execute_result` VALUES (82, 'group.test_schedule.test', '2016-05-14 12:02:40', '2016-05-14 12:02:50', 1);
INSERT INTO `schedule_execute_result` VALUES (83, 'group.test_schedule.test', '2016-05-14 12:03:00', '2016-05-14 12:03:10', 1);
INSERT INTO `schedule_execute_result` VALUES (84, 'group.test_schedule.test', '2016-05-14 12:03:20', '2016-05-14 12:03:30', 1);
INSERT INTO `schedule_execute_result` VALUES (85, 'group.test_schedule.test', '2016-05-14 12:03:40', '2016-05-14 12:03:50', 1);
INSERT INTO `schedule_execute_result` VALUES (86, 'group.test_schedule.test', '2016-05-14 12:04:00', '2016-05-14 12:04:10', 1);
INSERT INTO `schedule_execute_result` VALUES (87, 'group.test_schedule.test', '2016-05-14 12:04:20', '2016-05-14 12:04:30', 1);
INSERT INTO `schedule_execute_result` VALUES (88, 'group.test_schedule.test', '2016-05-14 12:04:40', '2016-05-14 12:04:50', 1);
INSERT INTO `schedule_execute_result` VALUES (89, 'group.test_schedule.test', '2016-05-14 12:05:00', '2016-05-14 12:05:10', 1);
INSERT INTO `schedule_execute_result` VALUES (90, 'group.test_schedule.test', '2016-05-14 12:25:00', '2016-05-14 12:25:00', 1);
INSERT INTO `schedule_execute_result` VALUES (91, 'group.test_schedule.test', '2016-05-14 12:25:20', '2016-05-14 12:25:20', 1);
INSERT INTO `schedule_execute_result` VALUES (92, 'group.test_schedule.test', '2016-05-14 12:25:40', '2016-05-14 12:25:40', 1);
INSERT INTO `schedule_execute_result` VALUES (93, 'group.test_schedule.test', '2016-05-14 12:26:00', '2016-05-14 12:26:00', 1);
INSERT INTO `schedule_execute_result` VALUES (94, 'group.test_schedule.test', '2016-05-14 12:26:40', '2016-05-14 12:26:50', 1);
INSERT INTO `schedule_execute_result` VALUES (95, 'group.test_schedule.test', '2016-05-14 12:27:00', '2016-05-14 12:27:10', 1);
INSERT INTO `schedule_execute_result` VALUES (96, 'group.test_schedule.test', '2016-05-14 12:27:20', '2016-05-14 12:27:30', 1);
INSERT INTO `schedule_execute_result` VALUES (97, 'group.test_schedule.test', '2016-05-14 12:27:40', '2016-05-14 12:27:50', 1);
INSERT INTO `schedule_execute_result` VALUES (98, 'group.test_schedule.test', '2016-05-14 12:28:00', '2016-05-14 12:28:10', 1);
INSERT INTO `schedule_execute_result` VALUES (99, 'group.test_schedule.test', '2016-05-14 12:28:20', '2016-05-14 12:28:30', 1);
INSERT INTO `schedule_execute_result` VALUES (100, 'group.test_schedule.test', '2016-05-14 12:28:40', '2016-05-14 12:28:50', 1);
INSERT INTO `schedule_execute_result` VALUES (101, 'group.test_schedule.test', '2016-05-14 12:29:00', '2016-05-14 12:29:10', 1);
INSERT INTO `schedule_execute_result` VALUES (102, 'group.test_schedule.test', '2016-05-14 12:29:20', '2016-05-14 12:29:30', 1);
INSERT INTO `schedule_execute_result` VALUES (103, 'group.test_schedule.test', '2016-05-14 12:29:40', '2016-05-14 12:29:50', 1);
INSERT INTO `schedule_execute_result` VALUES (104, 'group.test_schedule.test', '2016-05-14 12:30:00', '2016-05-14 12:30:10', 1);
INSERT INTO `schedule_execute_result` VALUES (105, 'group.test_schedule.test', '2016-05-14 12:30:20', '2016-05-14 12:30:30', 1);
INSERT INTO `schedule_execute_result` VALUES (106, 'group.test_schedule.test', '2016-05-14 12:30:40', '2016-05-14 12:30:50', 1);
INSERT INTO `schedule_execute_result` VALUES (107, 'group.test_schedule.test', '2016-05-14 12:31:00', '2016-05-14 12:31:10', 1);
INSERT INTO `schedule_execute_result` VALUES (108, 'group.test_schedule.test', '2016-05-14 12:31:20', '2016-05-14 12:31:30', 1);
INSERT INTO `schedule_execute_result` VALUES (109, 'system_system.monitor', '2016-05-26 10:20:00', '2016-05-26 10:20:00', 1);
INSERT INTO `schedule_execute_result` VALUES (110, 'system_system.monitor', '2016-05-26 10:21:00', '2016-05-26 10:21:00', 1);

-- ----------------------------
-- Table structure for schedule_job_setting
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_setting`;
CREATE TABLE `schedule_job_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `schedule_id`(`schedule_id`, `group_id`) USING BTREE,
  INDEX `class_path`(`class_path`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_setting
-- ----------------------------
INSERT INTO `schedule_job_setting` VALUES (1, 'schedule.test', 'group.test', '0/20 * * * * ?', 'com.app.mvc.schedule.jobs.ExampleScheduledJob', 0);
INSERT INTO `schedule_job_setting` VALUES (2, 'system.monitor', 'system', '0 0/1 * * * ?', 'com.app.mvc.schedule.jobs.SystemMonitorJob', 0);

-- ----------------------------
-- Table structure for short_url
-- ----------------------------
DROP TABLE IF EXISTS `short_url`;
CREATE TABLE `short_url`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `current` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NULL DEFAULT 1,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `invalid_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_current`(`current`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of short_url
-- ----------------------------
INSERT INTO `short_url` VALUES (1, 'http://www.test.com:8080/admin/page.do', 'e6NjQb', 1, '2016-04-07 22:00:00', NULL);
INSERT INTO `short_url` VALUES (2, '/index.jsp', 'aYn6Zn', 1, '2016-04-07 22:00:44', NULL);
INSERT INTO `short_url` VALUES (3, '/about.jsp', 'qyInYf', 1, '2016-04-07 22:01:01', NULL);
INSERT INTO `short_url` VALUES (4, 'test', 'test', 1, '2016-04-07 23:23:07', NULL);

-- ----------------------------
-- Table structure for sys_acl
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl`;
CREATE TABLE `sys_acl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `acl_module_id` int(11) NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_acl
-- ----------------------------
INSERT INTO `sys_acl` VALUES (1, '20160119011558_51', 'test1', 1, NULL, 0, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-19 01:16:01', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (2, '20160119011826_99', 'test2', 1, '', 1, 0, 1, '', 'admin', '2016-04-16 11:26:42', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (3, '20160119012159_66', 'test3', 1, '', 0, 0, 1, 'ssss', 'admin', '2016-04-12 00:15:37', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (4, '20160119012326_73', 'test4', 2, '^+$', 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-19 01:23:30', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (5, '20160120094725_82', 'test5', 2, '^/a/.*/b.json', 2, 1, 3, NULL, 'kanwangzjm@163.com', '2016-01-20 09:47:25', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (6, '20160120094752_37', 'test6', 2, '/a/.*/b.json$$', 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 09:47:52', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (7, '20160120100107_44', 'test7', 2, '/a/./b.json+$', 0, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 10:01:08', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (8, '20160120100153_46', 'test8', 2, '/a/4/b.jso+$', 2, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 10:01:53', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (9, '20160120100231_38', 'test9', 3, 's/a/5/b.jon', 1, 1, 6, NULL, 'kanwangzjm@163.com', '2016-01-20 10:02:31', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (10, '20160120100246_62', 'test10', 3, '/a/6/b.json', 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 10:02:46', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (11, '20160120100309_17', 'test11', 3, '/a/7/b.json', 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 10:03:09', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (12, '20160120100350_50', 'test12', 4, '/a/8/b.json', 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 10:03:50', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (13, '20160120101501_39', 'test13', 4, '/a/9/b.json', 0, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 10:15:01', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (14, '20160120101545_38', 'test14', 4, '/a/10/b.json', 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 10:15:45', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (15, '20160120101641_61', 'test15', 4, '/a/11/b.json', 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 10:16:41', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (16, '20160120101739_58', 'test16', 4, '/a/12/b.json', 0, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 10:17:39', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (17, '20160120101856_60', 'test17', 4, '/ab.json', 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-20 10:18:56', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (18, '20160121215956_18', 'test18', 4, '/a/(101|102|10)/b.json$', 0, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-21 21:59:56', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (19, '20160121220050_66', 'test19', 4, '', 1, 1, 1, '', 'admin', '2016-04-09 11:44:39', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (20, '20160121220237_88', 'test20', 1, NULL, 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-21 22:02:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (21, '20160121220709_67', 'test21', 1, NULL, 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-21 22:07:09', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (22, '20160121221029_72', 'test22', 1, NULL, 2, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-21 22:10:29', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (23, '20160121222341_67', 'test23', 1, NULL, 2, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-21 22:23:41', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (24, '20160121222415_39', 'test24', 1, NULL, 2, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-21 22:24:15', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (25, '20160121222503_4', 'test25', 1, NULL, 2, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-21 22:25:03', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (26, '20160121222504_86', 'test26', 1, NULL, 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-21 22:25:04', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (27, '20160121223721_82', 'test27', 1, NULL, 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-21 22:37:22', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES (28, '20160121223724_12', 'test28', 1, '', 1, 1, 2, 'sss', 'admin', '2016-05-21 10:12:18', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (29, '20160121223753_2', 'test29', 1, NULL, 1, 1, 1, NULL, 'kanwangzjm@163.com', '2016-01-21 22:38:18', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_acl_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl_module`;
CREATE TABLE `sys_acl_module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `level` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_acl_module
-- ----------------------------
INSERT INTO `sys_acl_module` VALUES (1, 'm1', 0, '0', 1, 1, '', 'admin', '2016-04-16 00:23:01', '127.0.0.1');
INSERT INTO `sys_acl_module` VALUES (2, 'm2', 0, '0', 1, 2, '', 'admin', '2016-04-16 00:23:09', '127.0.0.1');
INSERT INTO `sys_acl_module` VALUES (3, 'm3', 1, '0.1', 1, 1, '', 'admin', '2016-04-16 00:23:16', '127.0.0.1');
INSERT INTO `sys_acl_module` VALUES (4, 'm4', 1, '0.1', 1, 0, '', 'admin', '2016-04-16 00:23:25', '127.0.0.1');
INSERT INTO `sys_acl_module` VALUES (6, 'm6', 4, '0.1.4', 1, 1, '', 'admin', '2016-04-16 00:23:33', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `level` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seq` int(11) NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '技术组', 0, '0', 1, 'Tech', 0, 'kanwangzjm@163.com', '2016-04-03 23:54:51', '127.0.0.1');
INSERT INTO `sys_dept` VALUES (2, '后台开发', 0, '0.1', 1, 'java...', 1, 'kanwangzjm@163.com', '2016-04-03 23:59:21', '127.0.0.1');
INSERT INTO `sys_dept` VALUES (3, '前端开发', 0, '0.1', 2, '', 1, 'kanwangzjm@163.com', '2016-04-03 23:59:27', '127.0.0.1');
INSERT INTO `sys_dept` VALUES (4, 'DBA', 0, '0.1', 3, 'Database', 1, 'kanwangzjm@163.com', '2016-04-03 23:55:43', '127.0.0.1');
INSERT INTO `sys_dept` VALUES (7, 'UI', 0, '0.1.3', 3, 'ui', 3, 'kanwangzjm@163.com', '2016-04-04 10:20:05', '127.0.0.1');
INSERT INTO `sys_dept` VALUES (8, 'UE', 0, '0.1.3', 2, '', 3, 'kanwangzjm@163.com', '2016-04-03 23:59:44', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `old_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `new_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 1, 23, NULL, '{\\\"id\\\":23,\\\"code\\\":\\\"20160121222341_67\\\",\\\"name\\\":\\\"test\\\",\\\"aclModuleId\\\":1,\\\"type\\\":1,\\\"status\\\":1,\\\"seq\\\":1,\\\"operator\\\":\\\"kanwangzjm@163.com\\\",\\\"operateIp\\\":\\\"0:0:0:0:0:0:0:1\\\"}', 'kanwangzjm@163.com', '2016-01-21 22:23:41', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES (2, 1, 24, NULL, '{\"id\":24,\"code\":\"20160121222415_39\",\"name\":\"test\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'kanwangzjm@163.com', '2016-01-21 22:24:15', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES (3, 1, 25, NULL, '{\"id\":25,\"code\":\"20160121222503_4\",\"name\":\"test\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'kanwangzjm@163.com', '2016-01-21 22:25:03', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES (4, 1, 26, NULL, '{\"id\":26,\"code\":\"20160121222504_86\",\"name\":\"test\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'kanwangzjm@163.com', '2016-01-21 22:25:04', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES (5, 1, 27, NULL, '{\"id\":27,\"code\":\"20160121223721_82\",\"name\":\"test\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'kanwangzjm@163.com', '2016-01-21 22:37:22', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES (6, 1, 28, NULL, '{\"id\":28,\"code\":\"20160121223724_12\",\"name\":\"test\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'kanwangzjm@163.com', '2016-01-21 22:37:24', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES (7, 1, 29, NULL, '{\"id\":29,\"code\":\"20160121223753_2\",\"name\":\"test\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'kanwangzjm@163.com', '2016-01-21 22:38:18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES (8, 4, 5, NULL, '{\"id\":5,\"name\":\"ssss\",\"supplierId\":0,\"level\":\"0.1.3\",\"seq\":1,\"remark\":\"sdfsdf\",\"parentId\":3,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 22:52:03', '127.0.0.1');
INSERT INTO `sys_log` VALUES (9, 4, 5, '{\"id\":5,\"name\":\"ssss\",\"supplierId\":0,\"level\":\"0.1.3\",\"seq\":1,\"remark\":\"sdfsdf\",\"parentId\":3,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459695123000}', NULL, 'kanwangzjm@163.com', '2016-04-03 23:03:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES (10, 4, 6, NULL, '{\"id\":6,\"name\":\"test2\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":2,\"remark\":\"0000000\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:26:56', '127.0.0.1');
INSERT INTO `sys_log` VALUES (11, 4, 6, '{\"id\":6,\"name\":\"test2\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":2,\"remark\":\"0000000\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459697216000}', NULL, 'kanwangzjm@163.com', '2016-04-03 23:28:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES (12, 4, 2, '{\"id\":2,\"name\":\"test2\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"parentId\":1,\"operator\":\"system\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1453626339000}', '{\"id\":2,\"name\":\"test2\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"TEST\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:50:57', '127.0.0.1');
INSERT INTO `sys_log` VALUES (13, 4, 4, '{\"id\":4,\"name\":\"test4\",\"supplierId\":0,\"level\":\"0.2\",\"seq\":1,\"parentId\":2,\"operator\":\"system\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1453626396000}', '{\"id\":4,\"name\":\"test4\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"TEST4\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:51:13', '127.0.0.1');
INSERT INTO `sys_log` VALUES (14, 4, 2, '{\"id\":2,\"name\":\"test2\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"TEST\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459698657000}', '{\"id\":2,\"name\":\"å¼åç»\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"rd\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:52:38', '127.0.0.1');
INSERT INTO `sys_log` VALUES (15, 4, 2, '{\"id\":2,\"name\":\"å¼åç»\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"rd\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459698758000}', '{\"id\":2,\"name\":\"开发组\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"rd\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:54:26', '127.0.0.1');
INSERT INTO `sys_log` VALUES (16, 4, 1, '{\"id\":1,\"name\":\"test\",\"supplierId\":0,\"level\":\"0\",\"seq\":1,\"remark\":\"test\",\"parentId\":0,\"operator\":\"system\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1453519401000}', '{\"id\":1,\"name\":\"技术组\",\"supplierId\":0,\"level\":\"0\",\"seq\":1,\"remark\":\"Tech\",\"parentId\":0,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:54:51', '127.0.0.1');
INSERT INTO `sys_log` VALUES (17, 4, 2, '{\"id\":2,\"name\":\"开发组\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"rd\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459698866000}', '{\"id\":2,\"name\":\"Java开发\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"java\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:55:11', '127.0.0.1');
INSERT INTO `sys_log` VALUES (18, 4, 3, '{\"id\":3,\"name\":\"test3\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":0,\"parentId\":1,\"operator\":\"system\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1453626367000}', '{\"id\":3,\"name\":\"UI/UE\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":2,\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:55:25', '127.0.0.1');
INSERT INTO `sys_log` VALUES (19, 4, 4, '{\"id\":4,\"name\":\"test4\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"TEST4\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459698673000}', '{\"id\":4,\"name\":\"DBA\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":3,\"remark\":\"Database\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:55:43', '127.0.0.1');
INSERT INTO `sys_log` VALUES (20, 4, 2, '{\"id\":2,\"name\":\"Java开发\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"java\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459698911000}', '{\"id\":2,\"name\":\"Java开发\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"java...\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:56:33', '127.0.0.1');
INSERT INTO `sys_log` VALUES (21, 4, 2, '{\"id\":2,\"name\":\"Java开发\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"java...\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459698993000}', '{\"id\":2,\"name\":\"后台开发\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":1,\"remark\":\"java...\",\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:59:21', '127.0.0.1');
INSERT INTO `sys_log` VALUES (22, 4, 3, '{\"id\":3,\"name\":\"UI/UE\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":2,\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459698925000}', '{\"id\":3,\"name\":\"前端开发\",\"supplierId\":0,\"level\":\"0.1\",\"seq\":2,\"parentId\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:59:27', '127.0.0.1');
INSERT INTO `sys_log` VALUES (23, 4, 7, NULL, '{\"id\":7,\"name\":\"UI\",\"supplierId\":0,\"level\":\"0.1.3\",\"seq\":1,\"parentId\":3,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:59:35', '127.0.0.1');
INSERT INTO `sys_log` VALUES (24, 4, 8, NULL, '{\"id\":8,\"name\":\"UE\",\"supplierId\":0,\"level\":\"0.1.3\",\"seq\":2,\"parentId\":3,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-03 23:59:44', '127.0.0.1');
INSERT INTO `sys_log` VALUES (25, 4, 7, '{\"id\":7,\"name\":\"UI\",\"supplierId\":0,\"level\":\"0.1.3\",\"seq\":1,\"parentId\":3,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459699175000}', '{\"id\":7,\"name\":\"UI\",\"supplierId\":0,\"level\":\"0.1.3\",\"seq\":3,\"remark\":\"ui\",\"parentId\":3,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-04 10:20:05', '127.0.0.1');
INSERT INTO `sys_log` VALUES (26, 3, 4, NULL, '{\"id\":4,\"username\":\"zzz\",\"telephone\":\"123123123\",\"mail\":\"46642182@qq.com\",\"remark\":\"123123123\",\"deptId\":1,\"status\":1,\"supplierId\":0,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-04 12:18:18', '127.0.0.1');
INSERT INTO `sys_log` VALUES (27, 3, 3, '{\"id\":3,\"username\":\"123\",\"password\":\"123\",\"telephone\":\"123123\",\"mail\":\"11111\",\"deptId\":1,\"status\":2,\"supplierId\":0,\"operator\":\"jimin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459739358000}', '{\"id\":3,\"username\":\"123\",\"telephone\":\"123123\",\"mail\":\"11111@qq.com\",\"remark\":\"sss\",\"deptId\":1,\"status\":2,\"supplierId\":0,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-04 15:44:34', '127.0.0.1');
INSERT INTO `sys_log` VALUES (28, 3, 3, '{\"id\":3,\"username\":\"123\",\"password\":\"123\",\"telephone\":\"123123\",\"mail\":\"11111@qq.com\",\"remark\":\"sss\",\"deptId\":1,\"status\":2,\"supplierId\":0,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459755874000}', '{\"id\":3,\"username\":\"123\",\"telephone\":\"123123\",\"mail\":\"11111@qq.com\",\"remark\":\"ssssssss\",\"deptId\":1,\"status\":2,\"supplierId\":0,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\"}', 'kanwangzjm@163.com', '2016-04-04 15:44:54', '127.0.0.1');
INSERT INTO `sys_log` VALUES (29, 3, 5, NULL, '{\"id\":5,\"username\":\"jimin\",\"password\":\"405AFF4EDC042E7069FDB602CBE2C551\",\"telephone\":\"13301095253\",\"mail\":\"466420182@qq.com\",\"remark\":\"jimin\",\"deptId\":1,\"status\":1,\"supplierId\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-04 18:16:24', '127.0.0.1');
INSERT INTO `sys_log` VALUES (30, 3, 6, NULL, '{\"id\":6,\"username\":\"jimin.zheng\",\"password\":\"B2B4420A3B940A68FF0172AFDC4CD577\",\"telephone\":\"1111111111\",\"mail\":\"kanwangzjm@163.com\",\"remark\":\"sssss\",\"deptId\":2,\"status\":1,\"supplierId\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-04 18:18:49', '127.0.0.1');
INSERT INTO `sys_log` VALUES (31, 3, 7, NULL, '{\"id\":7,\"username\":\"kanwangzjm\",\"password\":\"CB9D8A7793319B16745E371AC9DEAB7A\",\"telephone\":\"1231231\",\"mail\":\"kanwangzjm@163.com\",\"remark\":\"ssss\",\"deptId\":1,\"status\":1,\"supplierId\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-04 18:20:14', '127.0.0.1');
INSERT INTO `sys_log` VALUES (32, 2, 5, NULL, '{\"id\":5,\"name\":\"test5\",\"parentId\":3,\"level\":\"0.1.3\",\"status\":1,\"seq\":1,\"remark\":\"ssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:14:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES (33, 2, 5, '{\"id\":5,\"name\":\"test5\",\"parentId\":3,\"level\":\"0.1.3\",\"status\":1,\"seq\":1,\"remark\":\"ssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460171646000}', '{\"id\":5,\"name\":\"test56\",\"parentId\":3,\"level\":\"0.1.3\",\"status\":1,\"seq\":1,\"remark\":\"ssss66666\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:22:32', '127.0.0.1');
INSERT INTO `sys_log` VALUES (34, 2, 6, NULL, '{\"id\":6,\"name\":\"sssss\",\"parentId\":4,\"level\":\"0.1.4\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:23:52', '127.0.0.1');
INSERT INTO `sys_log` VALUES (35, 2, 6, '{\"id\":6,\"name\":\"sssss\",\"parentId\":4,\"level\":\"0.1.4\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460172232000}', NULL, 'admin', '2016-04-09 11:24:10', '127.0.0.1');
INSERT INTO `sys_log` VALUES (36, 1, 3, '{\"id\":3,\"code\":\"20160119012159_66\",\"name\":\"test3\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":0,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"0:0:0:0:0:0:0:1\",\"operateTime\":1453137722000}', '{\"id\":3,\"name\":\"test3\",\"aclModuleId\":1,\"type\":0,\"status\":1,\"seq\":1,\"remark\":\"ssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:30:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES (37, 1, 28, '{\"id\":28,\"code\":\"20160121223724_12\",\"name\":\"test28\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"0:0:0:0:0:0:0:1\",\"operateTime\":1453387044000}', '{\"id\":28,\"name\":\"test28\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:34:25', '127.0.0.1');
INSERT INTO `sys_log` VALUES (38, 1, 28, '{\"id\":28,\"code\":\"20160121223724_12\",\"name\":\"test28\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460172865000}', '{\"id\":28,\"name\":\"test28\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:36:35', '127.0.0.1');
INSERT INTO `sys_log` VALUES (39, 1, 28, '{\"id\":28,\"code\":\"20160121223724_12\",\"name\":\"test28\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460172995000}', '{\"id\":28,\"name\":\"test28\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:36:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES (40, 1, 28, '{\"id\":28,\"code\":\"20160121223724_12\",\"name\":\"test28\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460173019000}', '{\"id\":28,\"name\":\"test28\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"remark\":\"sss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:37:45', '127.0.0.1');
INSERT INTO `sys_log` VALUES (41, 1, 2, '{\"id\":2,\"code\":\"20160119011826_99\",\"name\":\"test2\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":2,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"0:0:0:0:0:0:0:1\",\"operateTime\":1453137510000}', '{\"id\":2,\"name\":\"test2\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:41:49', '127.0.0.1');
INSERT INTO `sys_log` VALUES (42, 1, 3, '{\"id\":3,\"code\":\"20160119012159_66\",\"name\":\"test3\",\"aclModuleId\":1,\"type\":0,\"status\":1,\"seq\":1,\"remark\":\"ssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460172639000}', '{\"id\":3,\"name\":\"test3\",\"aclModuleId\":1,\"type\":0,\"status\":1,\"seq\":1,\"remark\":\"ssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:43:54', '127.0.0.1');
INSERT INTO `sys_log` VALUES (43, 1, 19, '{\"id\":19,\"code\":\"20160121220050_66\",\"name\":\"test19\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"0:0:0:0:0:0:0:1\",\"operateTime\":1453384850000}', '{\"id\":19,\"name\":\"test19\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":2,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:44:13', '127.0.0.1');
INSERT INTO `sys_log` VALUES (44, 1, 19, '{\"id\":19,\"code\":\"20160121220050_66\",\"name\":\"test19\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":2,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460173453000}', '{\"id\":19,\"name\":\"test19\",\"aclModuleId\":4,\"type\":1,\"status\":1,\"seq\":2,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:44:25', '127.0.0.1');
INSERT INTO `sys_log` VALUES (45, 1, 19, '{\"id\":19,\"code\":\"20160121220050_66\",\"name\":\"test19\",\"aclModuleId\":4,\"type\":1,\"status\":1,\"seq\":2,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460173465000}', '{\"id\":19,\"name\":\"test19\",\"aclModuleId\":4,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:44:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES (46, 3, 3, '{\"id\":3,\"username\":\"123\",\"password\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"telephone\":\"123123\",\"mail\":\"11111@qq.com\",\"remark\":\"ssssssss\",\"deptId\":1,\"status\":2,\"supplierId\":0,\"operator\":\"kanwangzjm@163.com\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459755894000}', '{\"id\":3,\"username\":\"123\",\"telephone\":\"123123\",\"mail\":\"11111@qq.com\",\"remark\":\"ssssssss\",\"deptId\":1,\"status\":0,\"supplierId\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 11:47:22', '127.0.0.1');
INSERT INTO `sys_log` VALUES (47, 2, 5, NULL, '{\"id\":5,\"name\":\"test5\",\"parentId\":2,\"level\":\"0.2\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 22:28:34', '127.0.0.1');
INSERT INTO `sys_log` VALUES (48, 2, 6, NULL, '{\"id\":6,\"name\":\"test6\",\"parentId\":0,\"level\":\"0\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 22:30:45', '127.0.0.1');
INSERT INTO `sys_log` VALUES (49, 2, 6, '{\"id\":6,\"name\":\"test6\",\"parentId\":0,\"level\":\"0\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460212245000}', '{\"id\":6,\"name\":\"test6\",\"parentId\":4,\"level\":\"0.1.4\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 22:30:51', '127.0.0.1');
INSERT INTO `sys_log` VALUES (50, 2, 5, '{\"id\":5,\"name\":\"test5\",\"parentId\":2,\"level\":\"0.2\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460212114000}', '{\"id\":5,\"name\":\"test5\",\"parentId\":6,\"level\":\"0.1.4.6\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-09 22:44:00', '127.0.0.1');
INSERT INTO `sys_log` VALUES (51, 2, 5, '{\"id\":5,\"name\":\"test5\",\"parentId\":6,\"level\":\"0.1.4.6\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460213040000}', NULL, 'admin', '2016-04-09 22:52:16', '127.0.0.1');
INSERT INTO `sys_log` VALUES (52, 3, 6, '{\"id\":6,\"username\":\"jimin.zheng\",\"password\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"telephone\":\"1111111111\",\"mail\":\"kanwangzjm@126.com\",\"remark\":\"sssss\",\"deptId\":2,\"status\":1,\"supplierId\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1459765097000}', '{\"id\":6,\"username\":\"jimin.zheng\",\"telephone\":\"11111111112\",\"mail\":\"kanwangzjm@126.com\",\"remark\":\"sssss\",\"deptId\":2,\"status\":1,\"supplierId\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-10 19:39:18', '127.0.0.1');
INSERT INTO `sys_log` VALUES (53, 5, 3, NULL, '{\"id\":3,\"name\":\"role3\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"asdfasdf\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-10 20:57:42', '127.0.0.1');
INSERT INTO `sys_log` VALUES (54, 5, 3, '{\"id\":3,\"name\":\"role3\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"asdfasdf\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460293062000}', NULL, 'admin', '2016-04-10 20:57:50', '127.0.0.1');
INSERT INTO `sys_log` VALUES (55, 5, 1, '{\"id\":1,\"name\":\"role1\",\"status\":1,\"supplierId\":0,\"type\":1,\"operator\":\"jimin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460286042000}', '{\"id\":1,\"name\":\"roleTest\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"test\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-10 21:04:38', '127.0.0.1');
INSERT INTO `sys_log` VALUES (56, 5, 2, '{\"id\":2,\"name\":\"role2\",\"status\":1,\"supplierId\":0,\"type\":1,\"operator\":\"jimin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460291344000}', '{\"id\":2,\"name\":\"role2\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"ssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-10 21:04:52', '127.0.0.1');
INSERT INTO `sys_log` VALUES (57, 5, 2, '{\"id\":2,\"name\":\"role2\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"ssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460293492000}', '{\"id\":2,\"name\":\"role2\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"sssssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-10 21:05:48', '127.0.0.1');
INSERT INTO `sys_log` VALUES (58, 5, 2, '{\"id\":2,\"name\":\"role2\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"sssssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460293548000}', NULL, 'admin', '2016-04-10 21:09:27', '127.0.0.1');
INSERT INTO `sys_log` VALUES (59, 5, 4, NULL, '{\"id\":4,\"name\":\"role\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"sss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-10 21:20:31', '127.0.0.1');
INSERT INTO `sys_log` VALUES (60, 5, 4, '{\"id\":4,\"name\":\"role\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"sss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460294431000}', NULL, 'admin', '2016-04-10 21:20:35', '127.0.0.1');
INSERT INTO `sys_log` VALUES (61, 5, 1, '{\"id\":1,\"name\":\"roleTest\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"test\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460293478000}', '{\"id\":1,\"name\":\"role111\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"test\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-10 21:20:40', '127.0.0.1');
INSERT INTO `sys_log` VALUES (62, 5, 1, '{\"id\":1,\"name\":\"role111\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"test\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460294440000}', '{\"id\":1,\"name\":\"超级管理员\",\"status\":1,\"supplierId\":0,\"type\":0,\"remark\":\"最高级别的管理员\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-10 21:27:24', '127.0.0.1');
INSERT INTO `sys_log` VALUES (63, 5, 5, NULL, '{\"id\":5,\"name\":\"普通管理员\",\"status\":1,\"supplierId\":0,\"type\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-10 21:27:36', '127.0.0.1');
INSERT INTO `sys_log` VALUES (64, 7, 1, '1', '1', 'admin', '2016-04-11 23:54:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES (65, 7, 1, '1', '3,1,20,26,28,27,21,29,2,25,22,24,23,18,13,16,12,17,19,14,15,9,10,11', 'admin', '2016-04-11 23:54:13', '127.0.0.1');
INSERT INTO `sys_log` VALUES (66, 1, 3, '{\"id\":3,\"code\":\"20160119012159_66\",\"name\":\"test3\",\"aclModuleId\":1,\"type\":0,\"status\":1,\"seq\":1,\"remark\":\"ssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460173434000}', '{\"id\":3,\"name\":\"test3\",\"aclModuleId\":1,\"type\":0,\"status\":0,\"seq\":1,\"remark\":\"ssss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-12 00:15:37', '127.0.0.1');
INSERT INTO `sys_log` VALUES (67, 7, 1, '3,1,20,26,28,27,21,29,2,25,22,24,23,18,13,16,12,17,19,14,15,9,10,11', '1,20,26,28,27,21,29,2,25,22,24,23,18,13,16,12,17,19,14,15,9,10,11,7,6,4,5,8', 'admin', '2016-04-12 00:29:03', '127.0.0.1');
INSERT INTO `sys_log` VALUES (68, 2, 1, '{\"id\":1,\"name\":\"test1\",\"parentId\":0,\"level\":\"0\",\"status\":1,\"seq\":1,\"operator\":\"jimin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1453612613000}', '{\"id\":1,\"name\":\"m1\",\"parentId\":0,\"level\":\"0\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-16 00:23:01', '127.0.0.1');
INSERT INTO `sys_log` VALUES (69, 2, 2, '{\"id\":2,\"name\":\"test2\",\"parentId\":0,\"level\":\"0\",\"status\":1,\"seq\":2,\"operator\":\"jimin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1453612642000}', '{\"id\":2,\"name\":\"m2\",\"parentId\":0,\"level\":\"0\",\"status\":1,\"seq\":2,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-16 00:23:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES (70, 2, 3, '{\"id\":3,\"name\":\"test3\",\"parentId\":1,\"level\":\"0.1\",\"status\":1,\"seq\":1,\"operator\":\"jimin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1453612667000}', '{\"id\":3,\"name\":\"m3\",\"parentId\":1,\"level\":\"0.1\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-16 00:23:16', '127.0.0.1');
INSERT INTO `sys_log` VALUES (71, 2, 4, '{\"id\":4,\"name\":\"test4\",\"parentId\":1,\"level\":\"0.1\",\"status\":1,\"seq\":0,\"operator\":\"jimin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1453612692000}', '{\"id\":4,\"name\":\"m4\",\"parentId\":1,\"level\":\"0.1\",\"status\":1,\"seq\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-16 00:23:25', '127.0.0.1');
INSERT INTO `sys_log` VALUES (72, 2, 6, '{\"id\":6,\"name\":\"test6\",\"parentId\":4,\"level\":\"0.1.4\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460212251000}', '{\"id\":6,\"name\":\"m6\",\"parentId\":4,\"level\":\"0.1.4\",\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-16 00:23:33', '127.0.0.1');
INSERT INTO `sys_log` VALUES (73, 7, 1, '1,20,26,28,27,21,29,2,25,22,24,23,18,13,16,12,17,19,14,15,9,10,11,7,6,4,5,8', '1,20,27,21,29,2,25,22,23,13,12,17,19,14,15,9,10,11,7,6,4,5,8', 'admin', '2016-04-16 00:52:19', '127.0.0.1');
INSERT INTO `sys_log` VALUES (74, 7, 1, '1,20,27,21,29,2,25,22,23,13,12,17,19,14,15,9,10,11,7,6,4,5,8', '1,20,27,21,29,2,25,22,23,13,12,17,19,14,15,9,10,11,7,6,4,8', 'admin', '2016-04-16 00:52:26', '127.0.0.1');
INSERT INTO `sys_log` VALUES (75, 7, 1, '1,20,27,21,29,2,25,22,23,13,12,17,19,14,15,9,10,11,7,6,4,8', '1,20,27,21,29,2,25,22,23,13,12,17,19,14,15,9,10,11', 'admin', '2016-04-16 00:53:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES (76, 7, 1, '1,20,27,21,29,2,25,22,23,13,12,17,19,14,15,9,10,11', '1,20,26,28,27,21,29,2,25,22,24,23,18,13,16,12,17,19,14,15,9,10,11,7', 'admin', '2016-04-16 10:31:45', '127.0.0.1');
INSERT INTO `sys_log` VALUES (77, 7, 5, '', '7,6,4,5,8', 'admin', '2016-04-16 10:35:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES (78, 7, 5, '7,6,4,5,8', '7,6,4,5', 'admin', '2016-04-16 10:36:05', '127.0.0.1');
INSERT INTO `sys_log` VALUES (79, 7, 5, '7,6,4,5', '9,7,6,4,5', 'admin', '2016-04-16 10:36:13', '127.0.0.1');
INSERT INTO `sys_log` VALUES (80, 7, 5, '9,7,6,4,5', '18,9,7,6,4,5', 'admin', '2016-04-16 10:36:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES (81, 7, 1, '1,20,26,28,27,21,29,2,25,22,24,23,18,13,16,12,17,19,14,15,9,10,11,7', '1,20,26,28,27,21,29,2,25,22,24,23,9,10,11,7', 'admin', '2016-04-16 11:18:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES (82, 7, 1, '1,20,26,28,27,21,29,2,25,22,24,23,9,10,11,7', '1,20,26,28,27,21,29,2,25,22,24,23,9,10,11,7', 'admin', '2016-04-16 11:18:26', '127.0.0.1');
INSERT INTO `sys_log` VALUES (83, 7, 1, '1,20,26,28,27,21,29,2,25,22,24,23,9,10,11,7', '1,20,26,28,27,21,29,2,25,22,24,23,16,7', 'admin', '2016-04-16 11:18:37', '127.0.0.1');
INSERT INTO `sys_log` VALUES (84, 7, 1, '1,20,26,28,27,21,29,2,25,22,24,23,16,7', '15,7', 'admin', '2016-04-16 11:19:14', '127.0.0.1');
INSERT INTO `sys_log` VALUES (85, 7, 5, '18,9,7,6,4,5', '9,7,6', 'admin', '2016-04-16 11:19:58', '127.0.0.1');
INSERT INTO `sys_log` VALUES (86, 7, 1, '15,7', '9,7', 'admin', '2016-04-16 11:24:15', '127.0.0.1');
INSERT INTO `sys_log` VALUES (87, 7, 1, '9,7', '9,7', 'admin', '2016-04-16 11:24:43', '127.0.0.1');
INSERT INTO `sys_log` VALUES (88, 7, 1, '9,7', '9,7', 'admin', '2016-04-16 11:26:04', '127.0.0.1');
INSERT INTO `sys_log` VALUES (89, 1, 2, '{\"id\":2,\"code\":\"20160119011826_99\",\"name\":\"test2\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460173309000}', '{\"id\":2,\"name\":\"test2\",\"aclModuleId\":1,\"type\":1,\"status\":0,\"seq\":1,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-04-16 11:26:42', '127.0.0.1');
INSERT INTO `sys_log` VALUES (90, 7, 1, '9,7', '18,7', 'admin', '2016-04-16 11:26:57', '127.0.0.1');
INSERT INTO `sys_log` VALUES (91, 6, 1, '1', '1,6', 'admin', '2016-04-16 22:58:46', '127.0.0.1');
INSERT INTO `sys_log` VALUES (92, 6, 1, '1,6', '1,6,5', 'admin', '2016-04-17 00:05:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES (93, 6, 5, '', '1', 'admin', '2016-04-17 00:29:46', '127.0.0.1');
INSERT INTO `sys_log` VALUES (94, 1, 28, '{\"id\":28,\"code\":\"20160121223724_12\",\"name\":\"test28\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":1,\"remark\":\"sss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460173065000}', '{\"id\":28,\"name\":\"test28\",\"aclModuleId\":1,\"type\":1,\"status\":1,\"seq\":2,\"remark\":\"sss\",\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-05-21 10:12:18', '127.0.0.1');
INSERT INTO `sys_log` VALUES (95, 3, 3, '{\"id\":3,\"username\":\"123\",\"telephone\":\"123123\",\"mail\":\"11111@qq.com\",\"remark\":\"ssssssss\",\"deptId\":1,\"status\":0,\"supplierId\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\",\"operateTime\":1460173642000}', '{\"id\":3,\"username\":\"123\",\"telephone\":\"123123\",\"mail\":\"11111@qq.com\",\"remark\":\"ssssssss\",\"deptId\":1,\"status\":0,\"supplierId\":0,\"operator\":\"admin\",\"operateIp\":\"127.0.0.1\"}', 'admin', '2016-05-21 11:09:28', '127.0.0.1');
INSERT INTO `sys_log` VALUES (96, 7, 1, '18,7', '18,7', 'admin', '2016-05-21 11:12:31', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 0, 0, 1, '最高级别的管理员', 'admin', '2016-04-10 21:27:24', '127.0.0.1');
INSERT INTO `sys_role` VALUES (5, '普通管理员', 0, 0, 1, '', 'admin', '2016-04-10 21:27:36', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_role_acl
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_acl`;
CREATE TABLE `sys_role_acl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `acl_id` int(11) NOT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_acl
-- ----------------------------
INSERT INTO `sys_role_acl` VALUES (210, 5, 9, 'admin', '2016-04-16 11:19:58', '127.0.0.1');
INSERT INTO `sys_role_acl` VALUES (211, 5, 7, 'admin', '2016-04-16 11:19:58', '127.0.0.1');
INSERT INTO `sys_role_acl` VALUES (212, 5, 6, 'admin', '2016-04-16 11:19:58', '127.0.0.1');
INSERT INTO `sys_role_acl` VALUES (221, 1, 18, 'admin', '2016-05-21 11:12:31', '127.0.0.1');
INSERT INTO `sys_role_acl` VALUES (222, 1, 7, 'admin', '2016-05-21 11:12:31', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (4, 1, 1, 'admin', '2016-04-17 00:05:41', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (5, 1, 6, 'admin', '2016-04-17 00:05:41', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (6, 1, 5, 'admin', '2016-04-17 00:05:41', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (7, 5, 1, 'admin', '2016-04-17 00:29:46', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `managed_supplier_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE,
  UNIQUE INDEX `idx_mail`(`mail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '18612403296', 'kanwangzjm@gmail.com', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 1, 1, 0, 'all', 'system', '2016-01-18 19:25:07', '127.0.0.1');
INSERT INTO `sys_user` VALUES (2, 'test@test.com', '11111111111', 'test@test.com', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 1, 0, 0, NULL, 'jimin', '2016-01-24 17:52:49', '127.0.0.1');
INSERT INTO `sys_user` VALUES (3, '123', '123123', '11111@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', 'ssssssss', 1, 0, 0, NULL, 'admin', '2016-05-21 11:09:28', '127.0.0.1');
INSERT INTO `sys_user` VALUES (4, 'zzz', '123123123', '466421823@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '123123123', 4, 1, 0, NULL, 'kanwangzjm@163.com', '2016-04-04 12:18:18', '127.0.0.1');
INSERT INTO `sys_user` VALUES (5, 'jimin', '13301095253', '466420182@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', 'jimin', 1, 1, 0, NULL, 'admin', '2016-04-04 18:16:22', '127.0.0.1');
INSERT INTO `sys_user` VALUES (6, 'jimin.zheng', '11111111112', 'kanwangzjm@126.com', 'E10ADC3949BA59ABBE56E057F20F883E', 'sssss', 2, 1, 0, NULL, 'admin', '2016-04-10 19:39:18', '127.0.0.1');
INSERT INTO `sys_user` VALUES (7, 'kanwangzjm', '1231231', 'kanwangzjm@163.com', 'E10ADC3949BA59ABBE56E057F20F883E', 'ssss', 1, 1, 0, NULL, 'admin', '2016-04-04 18:20:13', '127.0.0.1');

SET FOREIGN_KEY_CHECKS = 1;
