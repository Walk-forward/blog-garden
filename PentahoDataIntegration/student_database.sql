/*
 Navicat Premium Data Transfer

 Source Server Type    : MySQL
 Source Server Version : 50732

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 12/06/2021 18:07:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '班级编码（8位学校编码+2位班级编码）',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `school_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1101020101', '一班', '11010202');
INSERT INTO `class` VALUES ('1101020202', '二班', '11010201');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程编码',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '语文');
INSERT INTO `course` VALUES ('2', '数学');
INSERT INTO `course` VALUES ('3', '英语');

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school`  (
  `id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学校编码（6位区域编码+2位学校编码）',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校名称',
  `sys_area_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学校' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('11010201', '第一中学', '110102');
INSERT INTO `school` VALUES ('11010202', '第二中学', '110103');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学生编码（10位班级编码+2位学生编码）',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `class_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('110102010801', '张三', '1101020101');

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `student_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生编码',
  `course_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生课程中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES ('1', '110102010801', '1');
INSERT INTO `student_course` VALUES ('2', '110102010801', '2');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_area_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('100000', '0', '0,', '中国');
INSERT INTO `sys_area` VALUES ('110000', '100000', '0,100000,', '北京');
INSERT INTO `sys_area` VALUES ('110100', '110000', '0,100000,110000,', '北京市');
INSERT INTO `sys_area` VALUES ('110101', '110100', '0,100000,110000,110100,', '东城区');
INSERT INTO `sys_area` VALUES ('110102', '110100', '0,100000,110000,110100,', '西城区');
INSERT INTO `sys_area` VALUES ('110105', '110100', '0,100000,110000,110100,', '朝阳区');
INSERT INTO `sys_area` VALUES ('110106', '110100', '0,100000,110000,110100,', '丰台区');
INSERT INTO `sys_area` VALUES ('110107', '110100', '0,100000,110000,110100,', '石景山区');
INSERT INTO `sys_area` VALUES ('110108', '110100', '0,100000,110000,110100,', '海淀区');
INSERT INTO `sys_area` VALUES ('110109', '110100', '0,100000,110000,110100,', '门头沟区');
INSERT INTO `sys_area` VALUES ('110111', '110100', '0,100000,110000,110100,', '房山区');
INSERT INTO `sys_area` VALUES ('110112', '110100', '0,100000,110000,110100,', '通州区');
INSERT INTO `sys_area` VALUES ('110113', '110100', '0,100000,110000,110100,', '顺义区');
INSERT INTO `sys_area` VALUES ('110114', '110100', '0,100000,110000,110100,', '昌平区');
INSERT INTO `sys_area` VALUES ('110115', '110100', '0,100000,110000,110100,', '大兴区');
INSERT INTO `sys_area` VALUES ('110116', '110100', '0,100000,110000,110100,', '怀柔区');
INSERT INTO `sys_area` VALUES ('110117', '110100', '0,100000,110000,110100,', '平谷区');
INSERT INTO `sys_area` VALUES ('110228', '110100', '0,100000,110000,110100,', '密云县');
INSERT INTO `sys_area` VALUES ('110229', '110100', '0,100000,110000,110100,', '延庆县');

SET FOREIGN_KEY_CHECKS = 1;
