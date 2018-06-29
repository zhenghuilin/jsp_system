/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : jsp_final

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 29/06/2018 11:04:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for character
-- ----------------------------
DROP TABLE IF EXISTS `character`;
CREATE TABLE `character`  (
  `character` int(30) NOT NULL COMMENT '用户角色ID',
  `character_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户角色名',
  PRIMARY KEY (`character`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character
-- ----------------------------
INSERT INTO `character` VALUES (0, '管理员');
INSERT INTO `character` VALUES (1, '教师');
INSERT INTO `character` VALUES (2, '学生');
INSERT INTO `character` VALUES (3, '其他用户');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_id` int(30) NOT NULL COMMENT '课程编号',
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '课程名称',
  `course_infor` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '课程名称',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '老师姓名',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1111, 'JSP程序设计', 'JSP是一门很不错的课程，老师很nice。', '石老师');
INSERT INTO `course` VALUES (1112, 'Android应用开发', 'Android是一门很不错的课程，老师很nice。', '石老师');
INSERT INTO `course` VALUES (1113, 'Web程序设计', 'Web是一门很不错的课程，老师很nice。', '石老师');
INSERT INTO `course` VALUES (1114, 'java程序设计', 'java是一门很不错的课程，老师很nice。', '石老师');

-- ----------------------------
-- Table structure for know
-- ----------------------------
DROP TABLE IF EXISTS `know`;
CREATE TABLE `know`  (
  `know_id` int(30) NOT NULL AUTO_INCREMENT COMMENT '知识点ID',
  `know_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '知识点名',
  `course_id` int(30) NULL DEFAULT NULL COMMENT '课程编号',
  PRIMARY KEY (`know_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `paper_id` int(30) NOT NULL AUTO_INCREMENT COMMENT '试卷编号',
  `course_id` int(30) NULL DEFAULT NULL COMMENT '课程编号',
  `create_time` date NULL DEFAULT NULL COMMENT '试卷创建时间',
  `paper_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '试卷状态',
  PRIMARY KEY (`paper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (1, 1113, '2018-06-11', '未用');
INSERT INTO `paper` VALUES (2, 1111, '2018-06-14', '未用');

-- ----------------------------
-- Table structure for paper_content
-- ----------------------------
DROP TABLE IF EXISTS `paper_content`;
CREATE TABLE `paper_content`  (
  `paper_content_id` int(30) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `paper_id` int(30) NULL DEFAULT NULL COMMENT '试卷ID',
  `question_id` int(30) NULL DEFAULT NULL COMMENT '试题编号',
  PRIMARY KEY (`paper_content_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question_bank
-- ----------------------------
DROP TABLE IF EXISTS `question_bank`;
CREATE TABLE `question_bank`  (
  `question_id` int(30) NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `course_id` int(30) NULL DEFAULT NULL COMMENT '课程编号',
  `know_id` int(30) NULL DEFAULT NULL COMMENT '知识点编号',
  `question_type_id` int(30) NULL DEFAULT NULL COMMENT '试题类型ID',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '题干',
  `optionA` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '选项A',
  `optionB` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '选项B',
  `optionC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '选项C',
  `optionD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '选项D',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '答案',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_bank
-- ----------------------------
INSERT INTO `question_bank` VALUES (1, 1111, 1, 1, '下边哪个是JSP指令标记(      )', 'A.<%......%>', 'B. <%!……%>', 'C.<%@……%>', 'D. <%=……%>', 'C');
INSERT INTO `question_bank` VALUES (2, 1111, 2, 1, 'JavaBean的生命周期中，哪个是用来跟踪用户会话的(        )', 'A.session', 'B.request', 'C.page', 'D.application', 'B');
INSERT INTO `question_bank` VALUES (3, 1111, 3, 2, '下面哪个方法可使创建和获取session的方法是（     ）', 'A.session.setAttribute()', 'B.session.getAttribute()', 'C.session.invalidate()', 'D.session.removeAttribute()', 'A,B');

-- ----------------------------
-- Table structure for question_type
-- ----------------------------
DROP TABLE IF EXISTS `question_type`;
CREATE TABLE `question_type`  (
  `question_type_id` int(30) NOT NULL AUTO_INCREMENT COMMENT '试题类型ID',
  `question_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '试题类型名',
  PRIMARY KEY (`question_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_type
-- ----------------------------
INSERT INTO `question_type` VALUES (11, '简答题');

-- ----------------------------
-- Table structure for stu_course
-- ----------------------------
DROP TABLE IF EXISTS `stu_course`;
CREATE TABLE `stu_course`  (
  `stu_course_id` int(30) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '班级名',
  `course_id` int(30) NULL DEFAULT NULL COMMENT '课程编号',
  PRIMARY KEY (`stu_course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_course
-- ----------------------------
INSERT INTO `stu_course` VALUES (1, '计算机153班', 1111);
INSERT INTO `stu_course` VALUES (2, '计算机153班', 1112);
INSERT INTO `stu_course` VALUES (3, '计算机153班', 1113);
INSERT INTO `stu_course` VALUES (4, '计算机153班', 1114);

-- ----------------------------
-- Table structure for stu_score
-- ----------------------------
DROP TABLE IF EXISTS `stu_score`;
CREATE TABLE `stu_score`  (
  `score_id` int(30) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` int(30) NULL DEFAULT NULL COMMENT '学生学号',
  `task_id` int(30) NULL DEFAULT NULL COMMENT '考试任务ID',
  `re_single` int(30) NULL DEFAULT NULL COMMENT '单选题分数',
  `re_multiply` int(30) NULL DEFAULT NULL COMMENT '多选题分数',
  `re_total` int(30) NULL DEFAULT NULL COMMENT '总分',
  `input_time` date NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`score_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_score
-- ----------------------------
INSERT INTO `stu_score` VALUES (1, 3, 1, 60, 30, 90, '2018-06-06');
INSERT INTO `stu_score` VALUES (2, 4, 1, 80, 12, 92, '2018-06-06');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `task_id` int(30) NOT NULL AUTO_INCREMENT COMMENT '考试任务ID',
  `task_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '考试任务名',
  `task_time` int(30) NULL DEFAULT NULL COMMENT '考试时长',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `paper_id` int(30) NULL DEFAULT NULL COMMENT '试卷ID',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 'JSP期末模拟考试一', 120, '2018-06-12 15:18:12', '2018-06-16 15:18:16', 1);

-- ----------------------------
-- Table structure for teach_class
-- ----------------------------
DROP TABLE IF EXISTS `teach_class`;
CREATE TABLE `teach_class`  (
  `teach_id` int(30) NOT NULL COMMENT '教学班ID',
  `teach_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '教学班名字',
  `course_id` int(30) NULL DEFAULT NULL COMMENT '课程编号',
  PRIMARY KEY (`teach_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teach_class
-- ----------------------------
INSERT INTO `teach_class` VALUES (1, 'JSP程序设计', 1111);
INSERT INTO `teach_class` VALUES (2, 'Web程序设计', 1113);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(30) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名字',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户密码',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户头像',
  `character` int(30) NULL DEFAULT NULL COMMENT '用户角色',
  `user_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户状态',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学生所在班级',
  `ischeck` int(10) NULL DEFAULT NULL COMMENT '用户是否审核通过',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', NULL, 0, '1', NULL, 1);
INSERT INTO `user` VALUES (2, '石老师', '123456', NULL, 1, '0', NULL, 1);
INSERT INTO `user` VALUES (3, 'zhl', '123', NULL, 2, '0', '计算机153班', 1);
INSERT INTO `user` VALUES (4, 'buduf', '123456', NULL, 2, '0', '计算机153班', 1);
INSERT INTO `user` VALUES (5, '张三', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (6, '李四', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (7, 'WANGEWI', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (8, 'ASJGEDIU', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (9, '氨基酸格瑞', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (10, 'WEBROLH`', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (11, '就回去无人机和', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (12, 'jhasghu', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (13, 'jhasghu', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (14, 'jhasghu', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (15, 'a', '123456', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (16, 't', '123456', NULL, 3, '0', NULL, 0);
INSERT INTO `user` VALUES (17, 'booleen', 'jdgj', NULL, 3, '1', NULL, 0);
INSERT INTO `user` VALUES (18, 'sgahdg', '133', NULL, 3, '1', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
