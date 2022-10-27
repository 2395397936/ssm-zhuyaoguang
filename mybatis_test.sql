/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : mybatis_test

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 27/10/2022 16:44:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for batch
-- ----------------------------
DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch`  (
  `batch_id` int(0) NOT NULL AUTO_INCREMENT,
  `cus_id` int(0) NOT NULL COMMENT '创建批次用户id',
  `number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批次编码',
  `createtime` datetime(0) NOT NULL COMMENT '创建批次时间',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`batch_id`) USING BTREE,
  INDEX `FK_batch_1`(`cus_id`) USING BTREE,
  CONSTRAINT `FK_batch_id` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of batch
-- ----------------------------
INSERT INTO `batch` VALUES (1, 1, '00001', '2017-07-22 00:00:00', '首次购买');
INSERT INTO `batch` VALUES (2, 3, '00002', '2017-03-11 00:00:00', '委托购买');

-- ----------------------------
-- Table structure for batchdetail
-- ----------------------------
DROP TABLE IF EXISTS `batchdetail`;
CREATE TABLE `batchdetail`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `batch_id` int(0) NOT NULL COMMENT '批次id',
  `product_id` int(0) NOT NULL COMMENT '理财产品id',
  `product_num` int(0) NULL DEFAULT NULL COMMENT '理财产品购买数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_batchdetail_1`(`batch_id`) USING BTREE,
  INDEX `FK_batchdetail_2`(`product_id`) USING BTREE,
  CONSTRAINT `FK_batchdetai_1` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_batchdetai_2` FOREIGN KEY (`product_id`) REFERENCES `finacial_products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of batchdetail
-- ----------------------------
INSERT INTO `batchdetail` VALUES (1, 1, 1, 2);
INSERT INTO `batchdetail` VALUES (2, 1, 2, 1);
INSERT INTO `batchdetail` VALUES (3, 1, 3, 1);
INSERT INTO `batchdetail` VALUES (4, 2, 1, 2);
INSERT INTO `batchdetail` VALUES (5, 2, 2, 1);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `course_code` int(0) NULL DEFAULT NULL,
  `course_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `course_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `semester` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `course_hour` int(0) NULL DEFAULT NULL,
  `credit` float(2, 1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 1001, '高等数学', '基础学科', '2022上', 32, 4.0);
INSERT INTO `course` VALUES (2, 1002, '线性代数', '基础学科', '2022上', 24, 2.0);
INSERT INTO `course` VALUES (3, 1003, 'JAVA', '专业基础', '2022上', 32, 2.5);
INSERT INTO `course` VALUES (4, 1001, '概率论', '基础学科', '2022上', 24, 3.0);
INSERT INTO `course` VALUES (5, 1001, '大学物理', '基础学科', '2023下', 12, 1.5);
INSERT INTO `course` VALUES (6, 1001, '高级JAVA', '专业基础', '2023下', 32, 4.0);

-- ----------------------------
-- Table structure for course_choose
-- ----------------------------
DROP TABLE IF EXISTS `course_choose`;
CREATE TABLE `course_choose`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NULL DEFAULT NULL,
  `term` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `academic_year` int(0) NULL DEFAULT NULL,
  `student_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `student_name` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `course_number` int(0) NULL DEFAULT NULL,
  `credit` float(2, 1) NULL DEFAULT NULL,
  `period` int(0) NULL DEFAULT NULL,
  `optional_course_number` int(0) NULL DEFAULT NULL,
  `compulsory_courses_number` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_choose
-- ----------------------------

-- ----------------------------
-- Table structure for course_list
-- ----------------------------
DROP TABLE IF EXISTS `course_list`;
CREATE TABLE `course_list`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_course_id` int(0) NULL DEFAULT NULL,
  `schedule_id` int(0) NULL DEFAULT NULL,
  `course_code` int(0) NULL DEFAULT NULL,
  `course_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `course_hour` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_list
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cus_id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `acno` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡号',
  `gender` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`cus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '刘云', '6228286666666', '男', '13800000000');
INSERT INTO `customer` VALUES (2, '李健', '622848111111', '男', '13811111111');
INSERT INTO `customer` VALUES (3, '张丽丽', '622848333333', '女', '13822222222');

-- ----------------------------
-- Table structure for finacial_products
-- ----------------------------
DROP TABLE IF EXISTS `finacial_products`;
CREATE TABLE `finacial_products`  (
  `product_id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '理财产品名称',
  `price` float(10, 1) NOT NULL COMMENT '理财产品定价',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '理财产品描述',
  `pic` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '理财产品图片',
  `invasttime` datetime(0) NOT NULL COMMENT '理财产品收益日期',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finacial_products
-- ----------------------------
INSERT INTO `finacial_products` VALUES (1, '一起富', 5000.0, '投资少，风险小', 'img001', '2017-06-21 00:00:00');
INSERT INTO `finacial_products` VALUES (2, '惠薪富', 10000.0, '收益稳健', 'img002', '2017-05-03 00:00:00');
INSERT INTO `finacial_products` VALUES (3, '安富尊容', 15000.0, '年收益率提升5%', 'img003', '2017-07-18 00:00:00');
INSERT INTO `finacial_products` VALUES (4, '富津利', 2000.0, '企划收益率', 'img004', '2017-04-11 00:00:00');

-- ----------------------------
-- Table structure for gameplayer
-- ----------------------------
DROP TABLE IF EXISTS `gameplayer`;
CREATE TABLE `gameplayer`  (
  `id` int(0) NULL DEFAULT NULL,
  `name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gender` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `level` int(0) NULL DEFAULT NULL,
  `ptype` int(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gameplayer
-- ----------------------------
INSERT INTO `gameplayer` VALUES (1, '牛牛战士', '男', 31, 1);
INSERT INTO `gameplayer` VALUES (2, '芙蓉净月', '女', 22, 2);

-- ----------------------------
-- Table structure for magician_info
-- ----------------------------
DROP TABLE IF EXISTS `magician_info`;
CREATE TABLE `magician_info`  (
  `range` int(0) NULL DEFAULT NULL,
  `power` int(0) NULL DEFAULT NULL,
  `gpid` int(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of magician_info
-- ----------------------------
INSERT INTO `magician_info` VALUES (213, 210, 2);

-- ----------------------------
-- Table structure for pro_mapping_usr
-- ----------------------------
DROP TABLE IF EXISTS `pro_mapping_usr`;
CREATE TABLE `pro_mapping_usr`  (
  `pid` int(0) NULL DEFAULT NULL,
  `uid` int(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_mapping_usr
-- ----------------------------
INSERT INTO `pro_mapping_usr` VALUES (1, 1);
INSERT INTO `pro_mapping_usr` VALUES (1, 2);
INSERT INTO `pro_mapping_usr` VALUES (1, 3);
INSERT INTO `pro_mapping_usr` VALUES (1, 4);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `productName` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'apple');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `student_name` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `college` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `admission_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '12023020111', '张三', '理学院', '2022-09-01 15:25:55');
INSERT INTO `student` VALUES (2, '12023020112', '李四', '人工智能学院', '2022-09-01 09:25:00');
INSERT INTO `student` VALUES (3, '10000000000', '赵六', '人工智能学院', '2022-10-08 21:06:14');
INSERT INTO `student` VALUES (4, '10000000000', '赵六', 'good', '2022-10-08 21:07:47');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gender` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张三', '111', '男', 'zhangsan@126.com', '河南省', '郑州市', '1991-04-23');
INSERT INTO `user` VALUES (2, '李四', '222', '男', '2222@126.com', '河北省', '邯郸市', '1989-10-13');
INSERT INTO `user` VALUES (3, '刘丽', '333', '女', '3333@126.com', '江苏省', '苏州市', '1994-06-09');
INSERT INTO `user` VALUES (4, '孙丽', '444', '女', '4444@126.com', '四川省', '成都市', '1992-11-07');
INSERT INTO `user` VALUES (6, '李磊磊', '123qwe', '男', 'lileilei@126.com', '云南', '大理', '1992-01-01');
INSERT INTO `user` VALUES (7, '孙佳佳', '5555', '男', '5555@126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (8, '孙佳佳', '5555', '男', '5555@126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (9, '孙佳佳', '5555', '男', '5555@126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (10, '孙佳佳', '5555', '男', '5555@126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (11, '孙佳佳', '5555', '男', '5555@126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (12, '孙佳佳', '5555', '男', '5555@126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (13, '孙佳佳', '5555', '男', '5555@126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (14, '孙佳佳', '5555', '男', '5555@126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (15, '孙佳佳', '5555', '男', '5555@126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (19, '孙丽', '5555', '男', '5555126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (20, '圭佳', '5555', '男', '5555126.com', '湖北省', '武汉市', '1991-02-16');
INSERT INTO `user` VALUES (21, '圭佳', '5555', '男', '5555126.com', '湖北省', '武汉市', '1991-02-16');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'jack', 'man', '111@126.com', 1);
INSERT INTO `users` VALUES (2, 'tom', 'man', '222@126.com', 1);
INSERT INTO `users` VALUES (3, 'jean', 'woman', '333@126.com', 1);
INSERT INTO `users` VALUES (4, 'blus', 'man', '444@126.com', 1);

-- ----------------------------
-- Table structure for warrior_info
-- ----------------------------
DROP TABLE IF EXISTS `warrior_info`;
CREATE TABLE `warrior_info`  (
  `svalue` int(0) NULL DEFAULT NULL,
  `power` int(0) NULL DEFAULT NULL,
  `gpid` int(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warrior_info
-- ----------------------------
INSERT INTO `warrior_info` VALUES (330, 420, 1);

SET FOREIGN_KEY_CHECKS = 1;
