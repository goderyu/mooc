/*
Navicat MySQL Data Transfer

Source Server         : goderyu
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : mooc

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-07-28 08:31:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_login_log`;
CREATE TABLE `admin_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminId` int(255) NOT NULL COMMENT '用户ID',
  `aname` varchar(255) NOT NULL COMMENT '用户名',
  `loginIp` varchar(255) NOT NULL COMMENT '登录IP',
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间 数据库当前时间',
  `loginState` bit(1) NOT NULL COMMENT '登录状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_login_log
-- ----------------------------
INSERT INTO `admin_login_log` VALUES ('101', '1', 'admin', '0:0:0:0:0:0:0:1', '2018-05-20 18:12:14', '');
INSERT INTO `admin_login_log` VALUES ('102', '2', '聪dog', '0:0:0:0:0:0:0:1', '2018-05-20 18:12:40', '');
INSERT INTO `admin_login_log` VALUES ('103', '2', '聪dog', '127.0.0.1', '2018-05-20 18:13:45', '');
INSERT INTO `admin_login_log` VALUES ('104', '1', 'admin', '0:0:0:0:0:0:0:1', '2018-05-20 18:17:16', '');
INSERT INTO `admin_login_log` VALUES ('105', '2', '聪dog', '127.0.0.1', '2018-05-20 18:20:24', '');
INSERT INTO `admin_login_log` VALUES ('106', '1', 'admin', '0:0:0:0:0:0:0:1', '2018-05-22 19:19:49', '');
INSERT INTO `admin_login_log` VALUES ('107', '1', 'admin', '0:0:0:0:0:0:0:1', '2018-05-23 11:02:27', '');
INSERT INTO `admin_login_log` VALUES ('108', '1', 'admin', '0:0:0:0:0:0:0:1', '2018-05-23 13:38:34', '');
INSERT INTO `admin_login_log` VALUES ('109', '1', 'admin', '0:0:0:0:0:0:0:1', '2018-05-23 15:27:56', '');

-- ----------------------------
-- Table structure for `back_notice`
-- ----------------------------
DROP TABLE IF EXISTS `back_notice`;
CREATE TABLE `back_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noticeInfo` varchar(255) DEFAULT NULL COMMENT '公告内容',
  `adminId` int(11) DEFAULT NULL COMMENT '公告发布人',
  `noticeTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '公告发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of back_notice
-- ----------------------------
INSERT INTO `back_notice` VALUES ('1', '同志们！！！同志们好！！！同志们辛苦了！！！ ', '1', '2018-05-14 21:37:31');
INSERT INTO `back_notice` VALUES ('2', '请各位管理员在离开电脑时，做好锁屏工作，防止信息泄露。感谢配合！！！', '1', '2018-05-14 21:37:14');
INSERT INTO `back_notice` VALUES ('4', '请各位管理员在离开电脑时，做好锁屏工作，防止信息泄露。感谢配合！', '2', '2018-05-15 08:39:03');

-- ----------------------------
-- Table structure for `coursebase`
-- ----------------------------
DROP TABLE IF EXISTS `coursebase`;
CREATE TABLE `coursebase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL,
  `summary` mediumtext NOT NULL,
  `img` varchar(255) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `introduce` varchar(255) DEFAULT '计算机入门课',
  `teacherid` int(11) NOT NULL,
  `clickRate` int(11) NOT NULL DEFAULT '0' COMMENT '课程点击量',
  PRIMARY KEY (`id`),
  KEY `course` (`cname`),
  KEY `teacherid` (`teacherid`),
  CONSTRAINT `teacherid` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursebase
-- ----------------------------
INSERT INTO `coursebase` VALUES ('1', '组成原理', '本课程名为“魅力语言学”，实为语言研究入门，旨在为学生在大学阶段学习语言、研究语言打下初步的基础。具体而言，通过本课程的学习，学生能够了解语言学的基础知识（基本概念、基础理论）；对英语语言学产生兴趣；培养语言意识（对语言本身和语言使用的敏感性）；提高英语语言运用能力。本门课程主要涉及语言的起源、语言的本质特征、语音学、词汇学、语法学、语义学、语用学、语言的变体、标点符号等方面的基本知识和主要概念。通过一些并非完全学术的问题，引出一些语言现象，结合这些现象探讨语言的本质、规律和语言的使用。 ', 'img/course/zuchengyuanli.jpg', '2088', '计算机入门课', '1', '49');
INSERT INTO `coursebase` VALUES ('2', 'C语言设计', 'C语言是结构化程序设计语言中的优秀代表，多年来始终称雄程序语言排行榜的前三位。在这门课程中，我们将学到C语言程序的三种基本结构、模块化程序设计思想和实现手段以及C语言丰富的数据类型。通过这些知识的学习和编程实践，同学们可以掌握程序设计的基本方法；培养计算思维能力和利用计算机来分析问题、解决问题的能力。多阅读程序、多编程和上机调试程序，就能学好C语言程序设计。', 'img/course/cyuyan.jpg', '75', '计算机入门课', '2', '13');
INSERT INTO `coursebase` VALUES ('3', 'Java面向对象程序设计', '鼠标连接梦想，键盘写出辉煌', 'img/course/javacourse.jpg', '116', '计算机基础课', '1', '8');

-- ----------------------------
-- Table structure for `coursefirstcatalog`
-- ----------------------------
DROP TABLE IF EXISTS `coursefirstcatalog`;
CREATE TABLE `coursefirstcatalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `catalogname` varchar(255) NOT NULL,
  `ctext` longtext,
  `cvideo` varchar(255) DEFAULT NULL,
  `corder` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `courseid` FOREIGN KEY (`courseid`) REFERENCES `coursebase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursefirstcatalog
-- ----------------------------
INSERT INTO `coursefirstcatalog` VALUES ('26', '1', '计算机系统概述', '<p></p><p></p><p></p><p>\n计算机系统由“硬件”和“软件”两大部分组成。</p><p>\n\n<br></p><p></p><p><br></p><p></p><p><br></p>', 'video/e5b17ba8-dcf9-40ac-b679-9d0b9b5a2fcf.mp4', '0');
INSERT INTO `coursefirstcatalog` VALUES ('27', '1', '数据的表示、运算与校验', null, 'video/9d1d27af-beb9-4b2b-9850-735201d52438.mp4', '1');
INSERT INTO `coursefirstcatalog` VALUES ('28', '1', '新的章节', null, null, '2');
INSERT INTO `coursefirstcatalog` VALUES ('29', '3', '第一章目录', '<p></p><p>好几开收到货就看上山东矿机拉司机电话框架杀到了卡级上大号</p><p><img src=\"/mooc/static/img/course/c4a4e88e-3311-4c60-8f5f-ec5f641b71fe.png\" style=\"max-width: 100%; width: 326px; height: 238px;\"></p>', 'video/e70a780d-aa69-4fc9-bccc-17c1fe0de747.mp4', '1');
INSERT INTO `coursefirstcatalog` VALUES ('30', '3', '新的章节', null, null, '2');
INSERT INTO `coursefirstcatalog` VALUES ('31', '2', 'C语言概述', '<p></p><p>C语言哈哈哈哈哈哈哈哈哈哈哈哈好！</p><p></p>', null, '0');
INSERT INTO `coursefirstcatalog` VALUES ('32', '2', '程序的灵魂-算法', '<p></p><p>C语言算法哈哈哈哈哈哈哈哈哈哈哈哈好！</p><p></p>', null, '1');
INSERT INTO `coursefirstcatalog` VALUES ('33', '2', '数据类型、运算符与表达式', '<p></p><p>数据类型、运算符与表达式哈哈哈哈哈哈哈哈哈哈哈哈好！</p><p></p>', null, '2');

-- ----------------------------
-- Table structure for `coursesecondcatalog`
-- ----------------------------
DROP TABLE IF EXISTS `coursesecondcatalog`;
CREATE TABLE `coursesecondcatalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogid` int(11) NOT NULL,
  `subcatalogname` varchar(255) NOT NULL,
  `subctext` longtext,
  `subcvideo` varchar(255) DEFAULT NULL,
  `subcorder` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogid` (`catalogid`),
  CONSTRAINT `catalogid` FOREIGN KEY (`catalogid`) REFERENCES `coursefirstcatalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursesecondcatalog
-- ----------------------------
INSERT INTO `coursesecondcatalog` VALUES ('1', '26', '计算机的概念和类型', '<p></p><p>\n所谓“硬件”，是指计算机的实体部分，它由看得见摸得着的各种电子元器件，各类光、电、机设备的实物组成。如主机、外部设备等。\n\n</p>', 'video/b2217f1b-a8f9-4bfb-b4f4-cf4cf1a5e154.mp4', '0');
INSERT INTO `coursesecondcatalog` VALUES ('2', '27', '数据处理与存储', null, 'video/ed288998-601d-4533-91ec-16ca0485ecd2.mp4', '0');
INSERT INTO `coursesecondcatalog` VALUES ('3', '26', '计算机的诞生与发展', '<p></p><p>\n</p><p><span>1）</span>第一代计算机（<span>1946-1957</span>）——电子管时代</p>\n<p><span>2）</span>第二代计算机（<span>1958-1964</span>）——晶体管时代</p>\n<p><span>3）</span>第一代计算机（<span>1965-1971</span>）——中小规模集成电路时代</p>\n<p><span>4）</span>第一代计算机（<span>1972-</span>现在）——超大规模集成电路时代</p>\n<p>发展趋势：容量越来越小、体积越来越小、成本越来越低、运算速度越来越高。</p>\n\n', 'video/95610bf5-8e90-4430-a2ce-5b73bab3a52a.mp4', '1');
INSERT INTO `coursesecondcatalog` VALUES ('4', '26', '新的子章节', null, null, '2');
INSERT INTO `coursesecondcatalog` VALUES ('5', '28', '新的子章节', null, null, '0');
INSERT INTO `coursesecondcatalog` VALUES ('6', '29', '新的子章节大沙地', null, null, '0');
INSERT INTO `coursesecondcatalog` VALUES ('7', '29', '新的子章节', null, null, '1');
INSERT INTO `coursesecondcatalog` VALUES ('8', '31', 'C语言的发展过程', '<p>C语言发展过程</p>', 'video/test.mp4', '0');
INSERT INTO `coursesecondcatalog` VALUES ('9', '31', 'C语言的特点', '<p>C语言的特点有很多，巴拉巴拉...</p>', null, '1');
INSERT INTO `coursesecondcatalog` VALUES ('10', '32', '简单算法举例', '<p>简单算法举例：</p><p>巴拉巴拉...</p>', null, '0');
INSERT INTO `coursesecondcatalog` VALUES ('11', '32', '算法的特性', '<p>算法的特性：</p><p>有效解决数学问题，巴拉巴拉...</p>', null, '1');
INSERT INTO `coursesecondcatalog` VALUES ('12', '33', '常量与变量', '<p>常量与变量：</p><p>常量如1,2,3,；变量如a，b，c。巴拉巴拉...</p>', null, '0');
INSERT INTO `coursesecondcatalog` VALUES ('13', '33', '整型数据', '<p>整型数据：</p><p>是个整数。又分短整长整，int，short，long 等等。巴拉巴拉...</p>', null, '1');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `dname` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `dtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '部门创建时间',
  `dstatus` int(11) DEFAULT NULL COMMENT '部门状态1为可用 0为不可用',
  `describes` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------

-- ----------------------------
-- Table structure for `employee_info`
-- ----------------------------
DROP TABLE IF EXISTS `employee_info`;
CREATE TABLE `employee_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(255) DEFAULT NULL COMMENT '员工姓名',
  `esex` int(11) DEFAULT NULL COMMENT '员工性别',
  `ebirth` date DEFAULT NULL COMMENT '生日',
  `eidcard` varchar(255) DEFAULT NULL COMMENT '身份证号码',
  `ephone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `edeptID` int(11) DEFAULT NULL COMMENT '部门ID',
  `eroleID` int(11) DEFAULT NULL COMMENT '角色ID',
  `etime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '入职时间',
  `estatus` int(11) DEFAULT NULL COMMENT '状态1为在职 0为离职',
  `adminID` int(11) DEFAULT NULL COMMENT '账号id',
  `eHeadImg` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_info
-- ----------------------------
INSERT INTO `employee_info` VALUES ('1', '张三三', '0', '1996-10-29', '410182199610292918', '13027520263', '1037886044@qq.com', '0', '0', '2018-05-23 13:39:46', '1', '1', '/mooc/static/img/course/e16b72d5-fcd4-448d-8c04-01df6e4826d0.PNG');
INSERT INTO `employee_info` VALUES ('2', '张三', '1', '2018-05-07', '440100199003198787', '13027520297', '111@qq.com', '0', '8', '2018-05-20 18:21:33', '1', '2', '/mooc/static/img/course/11c47642-3a40-4d03-a646-70dcc3e0ca98.png');
INSERT INTO `employee_info` VALUES ('5', null, null, null, null, null, null, '0', '8', '2018-05-14 20:08:01', '0', '5', null);
INSERT INTO `employee_info` VALUES ('6', null, null, null, null, null, null, '0', '1', '2018-05-12 15:18:56', '1', '6', null);

-- ----------------------------
-- Table structure for `employee_login_info`
-- ----------------------------
DROP TABLE IF EXISTS `employee_login_info`;
CREATE TABLE `employee_login_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) NOT NULL COMMENT '管理员用户名',
  `apassword` varchar(255) NOT NULL COMMENT '管理员登录密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_login_info
-- ----------------------------
INSERT INTO `employee_login_info` VALUES ('1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `employee_login_info` VALUES ('2', 'aaa', '96E79218965EB72C92A549DD5A330112');
INSERT INTO `employee_login_info` VALUES ('5', 'bbb', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `employee_login_info` VALUES ('6', 'ccc', 'E10ADC3949BA59ABBE56E057F20F883E');

-- ----------------------------
-- Table structure for `fileku`
-- ----------------------------
DROP TABLE IF EXISTS `fileku`;
CREATE TABLE `fileku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `filedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `filename` varchar(100) NOT NULL,
  `filesrc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseid-file` (`courseid`),
  CONSTRAINT `courseid-file` FOREIGN KEY (`courseid`) REFERENCES `coursebase` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fileku
-- ----------------------------
INSERT INTO `fileku` VALUES ('14', '1', '2018-05-23 13:16:45', 'Spring预习.doc', 'file/ebcc6465-8e63-49cd-8d5f-136fff427682.doc');
INSERT INTO `fileku` VALUES ('15', '1', '2018-05-23 13:16:52', 'S3考试题.doc', 'file/71f3cab9-5c20-44fb-a237-5bb3d3755d9a.doc');
INSERT INTO `fileku` VALUES ('16', '1', '2018-05-23 13:16:58', '666.txt', 'file/b6927630-b2ae-48e1-a769-84d1c6ef91aa.txt');
INSERT INTO `fileku` VALUES ('17', '3', '2018-05-23 15:25:58', '201219636 陈玉涛_毕设说明书.pdf', 'file/9d92b4e6-c2d5-44e0-abd3-1f9881bb99f8.pdf');
INSERT INTO `fileku` VALUES ('18', '2', '2018-07-25 10:11:40', 'README.txt', 'file/README.txt');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `pTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `pInfo` varchar(255) DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '权限管理', '2018-05-14 21:32:14', '管理员的权限管理');
INSERT INTO `permission` VALUES ('3', '用户管理', '2018-05-10 20:32:49', '管理平台用户、老师');
INSERT INTO `permission` VALUES ('7', '资源管理', '2018-05-10 15:01:21', '管理平台资源');
INSERT INTO `permission` VALUES ('8', '公告管理', '2018-05-13 15:02:06', '管理平台系统公告');
INSERT INTO `permission` VALUES ('9', '平台统计', '2018-05-19 11:16:10', '统计平台各项信息');

-- ----------------------------
-- Table structure for `permission_child`
-- ----------------------------
DROP TABLE IF EXISTS `permission_child`;
CREATE TABLE `permission_child` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父标签id',
  `cname` varchar(255) NOT NULL COMMENT '列表名',
  `curl` varchar(255) NOT NULL COMMENT '跳转路径',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission_child
-- ----------------------------
INSERT INTO `permission_child` VALUES ('1', '1', '权限类管理', '/mooc/back/backpermission/permissions');
INSERT INTO `permission_child` VALUES ('2', '1', '角色管理', '/mooc/back/backrole/getRole');
INSERT INTO `permission_child` VALUES ('3', '1', '管理员管理', '/mooc/back/backadmin/getAllAdmin');
INSERT INTO `permission_child` VALUES ('8', '8', '查看公告', '/mooc/back/backnotice/getAllBackNotices');
INSERT INTO `permission_child` VALUES ('9', '3', '学生管理', '/mooc/back/userManager/getStudents');
INSERT INTO `permission_child` VALUES ('12', '3', '教师管理', '/mooc/back/teacherManager/getTeachers');
INSERT INTO `permission_child` VALUES ('13', '7', '课程管理', '/mooc/back/backCourse/toCourse');
INSERT INTO `permission_child` VALUES ('14', '9', '查看统计', '/mooc/back/statistics/toStatistics');
INSERT INTO `permission_child` VALUES ('15', '9', '课程统计', '/mooc/back/statistics/classStatistics');
INSERT INTO `permission_child` VALUES ('16', '9', '老师统计', '/mooc/back/statistics/teacherStatistics');
INSERT INTO `permission_child` VALUES ('17', '9', '学生统计', '/mooc/back/statistics/studentStatistics');
INSERT INTO `permission_child` VALUES ('18', '10', '456512123', '/mooc/back/backpermission/permissions');

-- ----------------------------
-- Table structure for `question_bank`
-- ----------------------------
DROP TABLE IF EXISTS `question_bank`;
CREATE TABLE `question_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `subjecttext` mediumtext NOT NULL,
  `optiona` mediumtext NOT NULL,
  `optionb` mediumtext NOT NULL,
  `optionc` mediumtext NOT NULL,
  `optiond` mediumtext NOT NULL,
  `correctoption` varchar(255) NOT NULL,
  `mediumtext` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_bank
-- ----------------------------

-- ----------------------------
-- Table structure for `reference`
-- ----------------------------
DROP TABLE IF EXISTS `reference`;
CREATE TABLE `reference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursedetailedid` int(11) NOT NULL,
  `reference` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coursedetailedid` (`coursedetailedid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reference
-- ----------------------------
INSERT INTO `reference` VALUES ('1', '1', '[1] 计算机组成与设计（第4版），David A. Patterson, John L. Hennessy编著，康继昌，樊晓桠，安建峰等译，北京：机械工业出版社，2011');
INSERT INTO `reference` VALUES ('2', '3', '《Java2核心技术（卷Ⅰ、卷Ⅱ）》 （美）Cay S. Horstmann Gary Cornell 著，朱志 等译，机械工业出版社');
INSERT INTO `reference` VALUES ('3', '3', '《Java编程思想》（美）Bruce Eckel著 京京工作室译，机械工业出版社');
INSERT INTO `reference` VALUES ('4', '3', '《Java语言与面向对象程序设计》印旻 ,  北京 清华大学出版社 2008,9');
INSERT INTO `reference` VALUES ('5', '2', '1.《C语言程序设计》，张毅坤等，北京：高等教育出版社，2011.2');
INSERT INTO `reference` VALUES ('6', '2', '2.《C语言入门经典(第4版)》，Ivor Horton著，杨浩(译)，北京：清华大学出版社，2008.4');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleCode` varchar(20) NOT NULL COMMENT '角色标识符',
  `roleName` varchar(20) NOT NULL COMMENT '角色名称',
  `roleDesc` varchar(20) NOT NULL COMMENT '角色简介',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'permissionAdmin', '权限管理员', '管理权限信息');
INSERT INTO `role` VALUES ('8', 'videoAdmin', '资源管理员', '管理平台资源');
INSERT INTO `role` VALUES ('10', 'noticeAdmin', '公告管理员', '管理系统公告');
INSERT INTO `role` VALUES ('11', 'admin', '超级管理员', '所有权限');

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色ID',
  `permissionId` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('3', '3', '1');
INSERT INTO `role_permission` VALUES ('14', '1', '1');
INSERT INTO `role_permission` VALUES ('15', '8', '7');
INSERT INTO `role_permission` VALUES ('16', '10', '8');

-- ----------------------------
-- Table structure for `student_course`
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_` (`userid`),
  KEY `courseid__` (`courseid`),
  CONSTRAINT `courseid__` FOREIGN KEY (`courseid`) REFERENCES `coursebase` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userid_` FOREIGN KEY (`userid`) REFERENCES `user_login_info` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES ('4', '18', '1');
INSERT INTO `student_course` VALUES ('13', '17', '2');
INSERT INTO `student_course` VALUES ('16', '22', '1');
INSERT INTO `student_course` VALUES ('17', '23', '1');
INSERT INTO `student_course` VALUES ('20', '30', '3');
INSERT INTO `student_course` VALUES ('21', '30', '1');
INSERT INTO `student_course` VALUES ('22', '29', '1');
INSERT INTO `student_course` VALUES ('49', '24', '1');
INSERT INTO `student_course` VALUES ('96', '1', '2');
INSERT INTO `student_course` VALUES ('120', '31', '2');

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `subjecttext` mediumtext NOT NULL,
  `optiona` mediumtext NOT NULL,
  `optionb` mediumtext NOT NULL,
  `optionc` mediumtext NOT NULL,
  `optiond` mediumtext NOT NULL,
  `correctoption` varchar(255) NOT NULL,
  `analysis` mediumtext,
  PRIMARY KEY (`id`),
  KEY `subject-taskid` (`taskid`),
  CONSTRAINT `subject-taskid` FOREIGN KEY (`taskid`) REFERENCES `task` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('4', '2', '对于第一台电子数字计算机ENIAC，下列描述正确的是（    ）', '存储器采用的是磁芯存储器 ', '中央处理器把运算器和控制器做在同一个芯片中', '基本元器件为体积很大的真空电子管  ', '采用的是冯若依曼体系结构', 'D', '提出冯若依曼体系结构后，美国军方催促项目尽管结束，所以没有来得及按冯若依曼体系来实现。');
INSERT INTO `subject` VALUES ('5', '2', '冯诺依曼关于现代计算机体系的理论贡献中,最重要的一点是(  )', '采用二进制代码来表示各类信息', '首次提出了存储程序的思想', '他首次提出了把计算机划分为5个主要部件的结构方案', '提出了指令的并行执行思路;', 'B', '---这项最重要，因为之前的计算机不能存储程序，这是一个理论突破');
INSERT INTO `subject` VALUES ('6', '2', '下列关于计算机的描述，错误的是(  )', '第一台微型计算机MCS-4，由intel公司1971年研制成功', '天河系列超级计算机，属于松散偶合型大型多机系统;', '第一台严格意义上的电子计算机，是1946年在宾西法尼亚大学研制成功.', '现代计算机的体系架构，已经彻底不采用冯诺依曼体系', 'D', '--现代计算机，特别是微机，仍然还是采用了冯诺依曼体系');
INSERT INTO `subject` VALUES ('7', '2', '我国的计算机起步较晚，为国防科技作出了重大贡献并被誉为“功勋计算机”是(  )', '大型晶体管计算机109乙', '大型晶体管计算机109丙', '银河系列巨型计算机', '天河系列的超级计算机', 'B', '无');
INSERT INTO `subject` VALUES ('8', '2', '下列关于计算机软硬件系统描述，其中错误的是(  )', '操作系统是计算机软硬件层次的分界面', '计算机系统主要由软件和硬件构成，两者互为依托和补充', '指令系统是计算机软硬件层次的分界面', '计算机的软硬件功能是逻辑等价的，因此某些软硬件模块可以固化或者软化', 'A', '无');
INSERT INTO `subject` VALUES ('9', '2', '某设备接口的数据位宽64，工作频率2600MHz，CPU主频3.2GHz，则设备带宽约为（  ）', '166400MBps', '20800MBps', '204800MBps', '25600MBps', 'B', '----带宽等于每次传输的字节数乘以传输频率。 这里的CPU主频为干扰项，不需要使用。');
INSERT INTO `subject` VALUES ('10', '3', '1221', '为期翁', '为期翁', '儿我去而我', '为期翁', 'A', '为期翁');
INSERT INTO `subject` VALUES ('11', '3', '大沙地', '打书打', '阿萨德', ' 撒大声地', ' dsadas', 'A', '奥术大师 啊');
INSERT INTO `subject` VALUES ('12', '4', '大沙地', 'dsadas', '大沙地', '大沙地', '大沙地', 'B', '额打所多所啊');

-- ----------------------------
-- Table structure for `systemcategory`
-- ----------------------------
DROP TABLE IF EXISTS `systemcategory`;
CREATE TABLE `systemcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '种类标识',
  `name` varchar(20) NOT NULL COMMENT '种类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemcategory
-- ----------------------------
INSERT INTO `systemcategory` VALUES ('1', 'academic', '学历');

-- ----------------------------
-- Table structure for `systemcategoryitem`
-- ----------------------------
DROP TABLE IF EXISTS `systemcategoryitem`;
CREATE TABLE `systemcategoryitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL COMMENT '父类ID',
  `item` varchar(255) DEFAULT NULL COMMENT '具体分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemcategoryitem
-- ----------------------------
INSERT INTO `systemcategoryitem` VALUES ('1', '1', '博士');
INSERT INTO `systemcategoryitem` VALUES ('2', '1', '硕士');
INSERT INTO `systemcategoryitem` VALUES ('3', '1', '本科');
INSERT INTO `systemcategoryitem` VALUES ('4', '1', '高中');
INSERT INTO `systemcategoryitem` VALUES ('5', '1', '初中');
INSERT INTO `systemcategoryitem` VALUES ('6', '1', '小学');
INSERT INTO `systemcategoryitem` VALUES ('7', '1', '其他');

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `taskname` varchar(255) NOT NULL,
  `starttime` date NOT NULL,
  `endtime` date NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `task-courseid` (`courseid`),
  CONSTRAINT `task-courseid` FOREIGN KEY (`courseid`) REFERENCES `coursebase` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('2', '1', '单元测验-第一单元', '2018-05-21', '2018-05-22', '1');
INSERT INTO `task` VALUES ('3', '1', '第二章测试', '2018-05-21', '2018-05-22', '0');
INSERT INTO `task` VALUES ('4', '3', 'C语言第一章测试', '2018-05-23', '2018-05-24', '1');

-- ----------------------------
-- Table structure for `task_complete`
-- ----------------------------
DROP TABLE IF EXISTS `task_complete`;
CREATE TABLE `task_complete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `selectresult` varchar(255) NOT NULL,
  `correctlv` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_task_complete` (`userid`),
  KEY `taskid_task_complete` (`taskid`),
  CONSTRAINT `taskid_task_complete` FOREIGN KEY (`taskid`) REFERENCES `task` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userid_task_complete` FOREIGN KEY (`userid`) REFERENCES `user_login_info` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_complete
-- ----------------------------
INSERT INTO `task_complete` VALUES ('4', '22', '2', 'C,B,B,D,C,C', '16.67%');
INSERT INTO `task_complete` VALUES ('5', '23', '2', 'A,B,B,C,C,C', '16.67%');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `teacheremail` varchar(50) DEFAULT NULL,
  `teacherImg` varchar(255) DEFAULT NULL,
  `teachersex` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user_login_info` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '17', '76954392@qq.com', null, '');
INSERT INTO `teacher` VALUES ('2', '11', null, null, '');

-- ----------------------------
-- Table structure for `theme`
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '课程id',
  `uid` int(11) NOT NULL COMMENT '创建此话题用户的id',
  `themetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '话题创建时间',
  `theme` varchar(255) NOT NULL COMMENT '话题内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES ('16', '1', '22', '2018-05-23 13:18:06', '杨春聪大帅比');
INSERT INTO `theme` VALUES ('17', '1', '22', '2018-05-23 13:27:21', '神挡杀神多');
INSERT INTO `theme` VALUES ('18', '3', '17', '2018-05-23 15:26:53', '单加傻乎乎就看到');

-- ----------------------------
-- Table structure for `theme_reply`
-- ----------------------------
DROP TABLE IF EXISTS `theme_reply`;
CREATE TABLE `theme_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL COMMENT '话题的id',
  `uid` int(11) NOT NULL COMMENT '回复话题人id',
  `replytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `replycontent` varchar(255) NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`),
  KEY `id` (`tid`),
  CONSTRAINT `id` FOREIGN KEY (`tid`) REFERENCES `theme` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of theme_reply
-- ----------------------------
INSERT INTO `theme_reply` VALUES ('55', '16', '22', '2018-05-23 13:18:12', '嗯');
INSERT INTO `theme_reply` VALUES ('56', '16', '22', '2018-05-23 13:18:16', '嗯');
INSERT INTO `theme_reply` VALUES ('57', '16', '22', '2018-05-23 13:18:24', '嗯');
INSERT INTO `theme_reply` VALUES ('58', '16', '22', '2018-05-23 13:18:26', '嗯');
INSERT INTO `theme_reply` VALUES ('59', '16', '17', '2018-05-23 13:19:31', '嗯');
INSERT INTO `theme_reply` VALUES ('60', '16', '17', '2018-05-23 13:24:17', '额');
INSERT INTO `theme_reply` VALUES ('61', '16', '22', '2018-05-23 13:24:47', '嗯嗯嗯');
INSERT INTO `theme_reply` VALUES ('62', '16', '22', '2018-05-23 13:24:58', '嗯嗯嗯');
INSERT INTO `theme_reply` VALUES ('63', '17', '22', '2018-05-23 13:27:25', '撒大声地');
INSERT INTO `theme_reply` VALUES ('64', '17', '17', '2018-05-23 13:30:27', '大沙地');
INSERT INTO `theme_reply` VALUES ('65', '17', '22', '2018-05-23 13:30:48', '大叔大婶');
INSERT INTO `theme_reply` VALUES ('66', '16', '23', '2018-05-23 15:18:45', '嗯');
INSERT INTO `theme_reply` VALUES ('67', '18', '17', '2018-05-23 15:26:58', '大沙地');

-- ----------------------------
-- Table structure for `user_basic_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_basic_info`;
CREATE TABLE `user_basic_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `email` varchar(255) DEFAULT NULL COMMENT '用户邮箱',
  `sex` int(1) DEFAULT NULL COMMENT '用户性别',
  `card` varchar(255) DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_basic_info
-- ----------------------------
INSERT INTO `user_basic_info` VALUES ('1', '1', '123456@qq.com', '1', '411202199604145019');
INSERT INTO `user_basic_info` VALUES ('3', '18', null, '0', null);
INSERT INTO `user_basic_info` VALUES ('4', '20', '123@qq.com', '0', '410182199610292918');
INSERT INTO `user_basic_info` VALUES ('5', '22', null, '0', null);
INSERT INTO `user_basic_info` VALUES ('6', '23', null, '0', null);
INSERT INTO `user_basic_info` VALUES ('7', '24', '1@qq.com', '1', '530802199005089624');
INSERT INTO `user_basic_info` VALUES ('8', '25', '2@qq.com', '1', '13030319870704800X');
INSERT INTO `user_basic_info` VALUES ('9', '26', '3@qq.com', '0', '230224197508162000');
INSERT INTO `user_basic_info` VALUES ('10', '27', '4@qq.com', '0', '440232199408109000');
INSERT INTO `user_basic_info` VALUES ('11', '31', '1333444@qq.com', '1', '411202199704145019');

-- ----------------------------
-- Table structure for `user_login_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_login_info`;
CREATE TABLE `user_login_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headImg` varchar(100) DEFAULT 'img/person.png',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `telephone` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login_info
-- ----------------------------
INSERT INTO `user_login_info` VALUES ('1', 'img/personage/5775e93d-514c-4229-8539-297b5c3887ea.jpg', 'goderyu', '18838003830', 'CFCD208495D565EF66E7DFF9F98764DA', '0');
INSERT INTO `user_login_info` VALUES ('11', 'img/person.png', 'aaaaa', '13027520104', '0B4E7A0E5FE84AD35FB5F95B9CEEAC79', '1');
INSERT INTO `user_login_info` VALUES ('17', 'img/personage/105bb326-eb67-4bc2-a3e8-5c2fb05a2f88.jpg', '杨学颖', '13027520121', 'E10ADC3949BA59ABBE56E057F20F883E', '1');
INSERT INTO `user_login_info` VALUES ('18', 'img/person.png', 'sdcasdsad', '13027520100', 'E10ADC3949BA59ABBE56E057F20F883E', '0');
INSERT INTO `user_login_info` VALUES ('20', 'img/person.png', 'DOG1', '13027520120', 'E10ADC3949BA59ABBE56E057F20F883E', '0');
INSERT INTO `user_login_info` VALUES ('22', 'img/person.png', '吴良学', '13027528888', 'E10ADC3949BA59ABBE56E057F20F883E', '0');
INSERT INTO `user_login_info` VALUES ('23', 'img/person.png', '王五我', '13027526666', 'E10ADC3949BA59ABBE56E057F20F883E', '0');
INSERT INTO `user_login_info` VALUES ('24', 'img/person.png', '张三', '13027520299', 'CFCD208495D565EF66E7DFF9F98764DA', '0');
INSERT INTO `user_login_info` VALUES ('25', 'img/person.png', '李四', '13027520298', 'E10ADC3949BA59ABBE56E057F20F883E', '0');
INSERT INTO `user_login_info` VALUES ('26', 'img/person.png', '王五', '13027520297', 'E10ADC3949BA59ABBE56E057F20F883E', '0');
INSERT INTO `user_login_info` VALUES ('27', 'img/person.png', '张三三', '15815815815', 'CFCD208495D565EF66E7DFF9F98764DA', '0');
INSERT INTO `user_login_info` VALUES ('28', 'img/person.png', 'goderyu1', '18838003831', 'CFCD208495D565EF66E7DFF9F98764DA', '0');
INSERT INTO `user_login_info` VALUES ('29', 'img/person.png', 'goderyu2', '18838845644', 'CFCD208495D565EF66E7DFF9F98764DA', '0');
INSERT INTO `user_login_info` VALUES ('30', 'img/person.png', 'goderyu2', '13939896520', 'CFCD208495D565EF66E7DFF9F98764DA', '0');
INSERT INTO `user_login_info` VALUES ('31', 'img/person.png', 'goderyu3', '15915915915', 'CFCD208495D565EF66E7DFF9F98764DA', '0');
INSERT INTO `user_login_info` VALUES ('32', 'img/person.png', 'goderyu4', '15315315315', '6D071901727AEC1BA6D8E2497EF5B709', '0');
