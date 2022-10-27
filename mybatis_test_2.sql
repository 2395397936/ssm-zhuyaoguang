/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : mybatis_test_2

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 27/10/2022 16:32:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accessory
-- ----------------------------
DROP TABLE IF EXISTS `accessory`;
CREATE TABLE `accessory`  (
  `accessory_id` int(0) NOT NULL AUTO_INCREMENT,
  `fruit_id` int(0) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`accessory_id`) USING BTREE,
  INDEX `accessory_commodities_null_fk`(`fruit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accessory
-- ----------------------------

-- ----------------------------
-- Table structure for commodities
-- ----------------------------
DROP TABLE IF EXISTS `commodities`;
CREATE TABLE `commodities`  (
  `fruit_id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `locality` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`fruit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodities
-- ----------------------------
INSERT INTO `commodities` VALUES (1, '黄桃1', 2.55, '西藏', '2022-10-26 17:39:39');
INSERT INTO `commodities` VALUES (2, '火龙果', 30, '山东', '2022-07-24 17:39:39');
INSERT INTO `commodities` VALUES (3, '蜜桃', 4.5, '西藏', '2021-05-29 17:39:39');
INSERT INTO `commodities` VALUES (4, '西瓜', 4.5, '重庆', '2022-05-26 17:39:39');
INSERT INTO `commodities` VALUES (5, '李子', 6.5, '重庆', '2022-11-24 17:39:39');
INSERT INTO `commodities` VALUES (6, '荔枝', 5, '山东', '2023-07-11 17:39:39');
INSERT INTO `commodities` VALUES (7, '龙眼', 5.5, '浙江', '2022-08-24 17:39:39');
INSERT INTO `commodities` VALUES (9, '苹果', 5.5, '山东', '2022-07-24 17:39:39');
INSERT INTO `commodities` VALUES (10, '菠萝蜜', 2.3, '重庆', '2022-05-24 17:39:39');
INSERT INTO `commodities` VALUES (12, '草莓', 23.53, '浙江', '2022-10-26 17:39:39');
INSERT INTO `commodities` VALUES (13, '中', 33.1, '浙江', '2022-10-27 10:25:56');
INSERT INTO `commodities` VALUES (14, '山竹', 33.6, '西藏', '2022-10-27 10:26:23');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_id` int(0) NOT NULL AUTO_INCREMENT,
  `course_code` int(0) NULL DEFAULT NULL,
  `course_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `course_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `semester` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `course_hour` int(0) NULL DEFAULT NULL,
  `course_credit` float NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 1001, '高等数学', '基础学科', '2022上', 32, 4);
INSERT INTO `course` VALUES (2, 1002, '线性代数', '基础学科', '2022上', 24, 2);
INSERT INTO `course` VALUES (3, 1003, 'JAVA', '专业基础', '2022上', 32, 2.5);
INSERT INTO `course` VALUES (4, 1004, '概率论', '基础学科', '2022上', 24, 3);
INSERT INTO `course` VALUES (5, 1005, '大学物理', '基础学科', '2023下', 12, 1.5);
INSERT INTO `course` VALUES (6, 1006, '高级JAVA', '专业基础', '2023下', 32, 4);

-- ----------------------------
-- Table structure for course_list
-- ----------------------------
DROP TABLE IF EXISTS `course_list`;
CREATE TABLE `course_list`  (
  `course_list_id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NULL DEFAULT NULL,
  `term` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `academic_year` int(0) NULL DEFAULT NULL,
  `student_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `student_name` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `course_number` int(0) NULL DEFAULT NULL,
  `credit` float(5, 1) NULL DEFAULT NULL,
  `period` int(0) NULL DEFAULT NULL,
  `optional_course_number` int(0) NULL DEFAULT NULL,
  `compulsory_course_number` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`course_list_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_list
-- ----------------------------
INSERT INTO `course_list` VALUES (1, 1, '上', 2020, '12023020111', '张三', 4, 11.5, 128, 1, 3);
INSERT INTO `course_list` VALUES (2, 1, '下', 2021, '12023020111', '张三', 2, 5.5, 24, 1, 1);
INSERT INTO `course_list` VALUES (3, 1, '下', 2021, '12023020112', '李四', 2, 5.5, 24, 1, 1);

-- ----------------------------
-- Table structure for course_student_detail
-- ----------------------------
DROP TABLE IF EXISTS `course_student_detail`;
CREATE TABLE `course_student_detail`  (
  `course_student_detial_id` int(0) NOT NULL AUTO_INCREMENT,
  `course_list_id` int(0) NULL DEFAULT NULL,
  `course_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`course_student_detial_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_student_detail
-- ----------------------------
INSERT INTO `course_student_detail` VALUES (1, 1, 1);
INSERT INTO `course_student_detail` VALUES (2, 1, 3);
INSERT INTO `course_student_detail` VALUES (3, 1, 2);
INSERT INTO `course_student_detail` VALUES (4, 1, 4);
INSERT INTO `course_student_detail` VALUES (5, 2, 6);
INSERT INTO `course_student_detail` VALUES (6, 2, 5);

-- ----------------------------
-- Table structure for retailer
-- ----------------------------
DROP TABLE IF EXISTS `retailer`;
CREATE TABLE `retailer`  (
  `retailer_id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`retailer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retailer
-- ----------------------------
INSERT INTO `retailer` VALUES (1, '石思华2', '13777777776', '上海', 1, '2022-10-25 21:08:29');
INSERT INTO `retailer` VALUES (2, '小花', '13888585858', '上海市宝山区', 1, '2022-08-30 21:04:29');
INSERT INTO `retailer` VALUES (3, '小华', '18856258588', '上海市金山区', 1, '2022-10-15 21:04:29');
INSERT INTO `retailer` VALUES (4, '小明', '13652452588', '上海市虹口区', 0, '2022-10-08 21:04:29');
INSERT INTO `retailer` VALUES (5, '小李', '13758285285', '上海市普陀区', 1, '2021-05-25 21:04:29');
INSERT INTO `retailer` VALUES (6, '小王', '13345625405', '上海市普陀区', 1, '2024-07-25 21:04:29');
INSERT INTO `retailer` VALUES (7, '小赵', '13054475247', '上海市宝山区', 1, '2021-06-25 21:04:29');
INSERT INTO `retailer` VALUES (9, '小张', '13636838377', '上海市宝山区', 1, '2023-05-24 21:04:29');
INSERT INTO `retailer` VALUES (10, '小小', '13786775867', '上海市普陀区', 1, '2021-01-30 21:04:29');
INSERT INTO `retailer` VALUES (11, '小星', '13886686868', '上海市宝山区', 1, '2022-02-17 21:04:29');
INSERT INTO `retailer` VALUES (12, '小一', '13054475247', '上海市普陀区', 1, '2021-02-09 21:09:11');
INSERT INTO `retailer` VALUES (17, '马', '19823592981', 'sd', 1, '2022-10-26 14:43:50');
INSERT INTO `retailer` VALUES (18, 'ad', '16316562541', '重慶1', 1, '2022-10-26 16:55:39');
INSERT INTO `retailer` VALUES (19, '那', '15315313', 'dd', 1, '2022-10-26 16:56:31');
INSERT INTO `retailer` VALUES (20, '小阳', '1362562565', '重庆', 0, '2022-10-27 10:26:50');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_id` int(0) NOT NULL AUTO_INCREMENT,
  `student_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `student_name` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `college` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `admission_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '12023020111', '张三', '人工智能学院', '2021-09-01 15:25:55');
INSERT INTO `student` VALUES (2, '12023020112', '李四', '人工智能学院', '2021-09-01 15:25:55');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `telephone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhangsan', '111', '张三', '13023010102');
INSERT INTO `user` VALUES (2, 'dsg', '123', 'dd', '17320405374');

SET FOREIGN_KEY_CHECKS = 1;
