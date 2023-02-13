/*
 Navicat Premium Data Transfer

 Source Server         : wangyao
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : cigarette_management

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 13/02/2023 08:59:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bs_brand_manage
-- ----------------------------
DROP TABLE IF EXISTS `bs_brand_manage`;
CREATE TABLE `bs_brand_manage`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌编号',
  `brand_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌名称',
  `brand_locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌所在地',
  `brand_enabled` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '启用状态 0-正常 ，1-停用 （系统开关）',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后操作人',
  `update_time` datetime(3) NOT NULL COMMENT '最后操作时间YYYY-MM-DD HH:MM:SS.000',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1608727825458667525 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '品牌管理/品牌详细信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_brand_manage
-- ----------------------------
INSERT INTO `bs_brand_manage` VALUES (1608727825458667523, '001', '测试', '青岛', '0', 'admin', '2023-01-30 14:49:07.299', '测试', 'admin', '2023-01-30 11:04:32.855');
INSERT INTO `bs_brand_manage` VALUES (1608727825458667524, '002', '青-测试', '青岛', '0', 'admin', '2023-01-30 14:49:10.335', '测试', 'admin', '2023-01-30 14:31:44.843');

-- ----------------------------
-- Table structure for bs_dealingsunit_info
-- ----------------------------
DROP TABLE IF EXISTS `bs_dealingsunit_info`;
CREATE TABLE `bs_dealingsunit_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `unit_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位编号',
  `unit_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位名称',
  `unit_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位类型(1-行政机关、2-代管仓库、3-零售户、4-执法科、5-检验机构)',
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `landline_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '座机号码',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `unit_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位地址',
  `unit_enabled` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '启用状态（0-正常，1-停用）',
  `create_time` datetime(3) NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作者',
  `update_time` datetime(3) NOT NULL COMMENT '操作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1610523759968530436 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '来往单位信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_dealingsunit_info
-- ----------------------------
INSERT INTO `bs_dealingsunit_info` VALUES (1, '123', '测试01', '1', '测试01', '132456-测试', '15993128938', '测试01', NULL, '0', '2023-01-04 14:29:21.119', 'admin', '2023-01-04 14:29:21.119', '正常', 'admin');
INSERT INTO `bs_dealingsunit_info` VALUES (1610523759968530435, '1234', '测试', '3', '测试', NULL, NULL, NULL, '青岛', '0', '2023-01-30 12:30:27.627', 'admin', '2023-01-30 12:30:27.627', '测试', 'admin');

-- ----------------------------
-- Table structure for bs_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `bs_goods_info`;
CREATE TABLE `bs_goods_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `brand_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属品牌名称',
  `brand_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属品牌编号',
  `small_box_barcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小盒条码',
  `barbox_barcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '条盒条码',
  `goods_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '商品类型（1-烤烟，2-混合，3-外香，4-雪茄）数据字典',
  `goods_specification` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '商品规格（1-70mm,2-75mm...）数据字典',
  `measure_unit` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '计量单位（1-条，2-盒，3-包，4-听）数据字典',
  `single_barbox_number` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '单条盒数（1-10,2-5,3-6,4-1）数据字典',
  `small_box_number` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '小盒支数（1-20,2-16,3-1）数据字典',
  `single_box_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单盒售价',
  `barbox_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '条盒售价',
  `barbox_wholesale_prices` decimal(10, 2) NULL DEFAULT NULL COMMENT '条盒批发价',
  `packaging_forms` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '包装形式(1-条盒硬盒，2-条盒软盒，3-木盒，4-听盒)数据字典',
  `listing_status` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '上市状态（0-已上市，1-未上市，2-已退市）数据字典',
  `tar_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '焦油量',
  `smoke_nicotine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '烟气烟碱量',
  `monoxide_carbon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '一氧化碳量',
  `create_time` datetime(3) NOT NULL COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作者',
  `update_time` datetime(3) NOT NULL COMMENT '操作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_goods_info
-- ----------------------------
INSERT INTO `bs_goods_info` VALUES (1, '0010000001', '1', '青-测试', '002', '1', '1', '2', '1', '1', '1', '1', 1.00, 1.00, 1.00, '1', '0', '1', '1', '1', '2022-12-30 15:28:51.487', 'admin', '2023-01-30 14:49:29.743', '1', 'admin');
INSERT INTO `bs_goods_info` VALUES (2, '0010000002', 'ce', '测试', '001', 'ce', 'ce', '1', '2', '1', '1', '1', 10.00, 10.00, 10.00, '1', '0', '10', '10', '10', '2022-12-30 15:51:16.606', 'admin', '2023-01-05 15:24:10.628', 'ce', 'admin');

-- ----------------------------
-- Table structure for bs_warehouse_info
-- ----------------------------
DROP TABLE IF EXISTS `bs_warehouse_info`;
CREATE TABLE `bs_warehouse_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `warehouse_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '仓库编号',
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `warehouse_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '仓库类型(1-暂存、2-代管、3-罚没、4-罚没，5-代管等)数据字典',
  `warehouse_organization` int NULL DEFAULT NULL COMMENT '仓库归属组织(部门id)',
  `warehouse_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `warehouse_principal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '仓库负责人',
  `warehouse_enabled` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '启用状态（0-正常，1-停用）数据字典',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '仓库管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_warehouse_info
-- ----------------------------
INSERT INTO `bs_warehouse_info` VALUES (1, '132', '测试01', '1', 123, '青岛大学', '测试', '0', '2023-01-02 15:52:32.442', 'admin', '2023-01-31 11:26:16.226', '正常', 'admin');
INSERT INTO `bs_warehouse_info` VALUES (2, '123', '测试02', '1', 1234, '测试02', '测试', '0', '2023-01-03 14:32:38.150', 'admin', '2023-01-31 11:26:21.247', '正常', 'admin');
INSERT INTO `bs_warehouse_info` VALUES (3, '1234', '测试03', '2', NULL, '测试03', '测试03', '0', '2023-01-04 14:48:22.562', 'admin', '2023-01-04 14:48:22.562', '正常', 'admin');
INSERT INTO `bs_warehouse_info` VALUES (4, '1235', '测试04', '1', NULL, '测试04', '测试04', '0', '2023-01-04 15:18:16.750', 'admin', '2023-01-04 15:18:16.750', '测试主键', 'admin');

-- ----------------------------
-- Table structure for bs_wh_area_info
-- ----------------------------
DROP TABLE IF EXISTS `bs_wh_area_info`;
CREATE TABLE `bs_wh_area_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wh_area_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库区编号',
  `wh_area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库区名称',
  `wh_area_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库区类型(1-暂存、2-代管、3-罚没、4-罚没5-代管)数据字典',
  `warehouse_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属仓库编号',
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `warehouse_id` bigint NULL DEFAULT NULL COMMENT '归属仓库id',
  `wh_area_enabled` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库区启用状态（0-正常，1-停用）',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '库区信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_wh_area_info
-- ----------------------------
INSERT INTO `bs_wh_area_info` VALUES (1, '123', '测试01', '2', '132', '测试01', 1, '0', '2023-01-02 19:09:07.246', 'admin', '2023-01-03 15:18:04.714', '正常', 'admin');
INSERT INTO `bs_wh_area_info` VALUES (2, '321', '测试02', '1', '123', '测试02', 2, '0', '2023-01-03 15:17:40.608', 'admin', '2023-01-03 15:17:40.608', '正常', 'admin');

-- ----------------------------
-- Table structure for bs_wh_bit_info
-- ----------------------------
DROP TABLE IF EXISTS `bs_wh_bit_info`;
CREATE TABLE `bs_wh_bit_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wh_bit_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库位编号',
  `wh_bit_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库位名称',
  `wh_bit_capacity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库位容量（条） 针对案件超出货位容量，会指引存放货位',
  `is_exclusive` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '否' COMMENT '是否专属 （专属后，允许存放其他信息）',
  `exclusive_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '专属类型（1-商品专属、2-单位专属）',
  `wh_area_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属库区编号',
  `wh_area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属库区name',
  `warehouse_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属仓库编号',
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属仓库name',
  `wh_bit_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '库位类型（1-货架型，2-扁平型）',
  `shelf_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '货架编号',
  `rows_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '行号',
  `column_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列号',
  `wh_bit_enabled` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '库位启用状态（0-正常，1-停用）',
  `object_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对象编号',
  `object_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对象名称',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
  `update_time` datetime(3) NOT NULL COMMENT '更改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '库位信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_wh_bit_info
-- ----------------------------
INSERT INTO `bs_wh_bit_info` VALUES (1, '123', '测试01', '120', '1', '2', '123', '测试01', '132', '测试01', '1', NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2023-01-04 10:48:14.162', '正常', '2023-01-04 10:48:14.162', 'admin');
INSERT INTO `bs_wh_bit_info` VALUES (2, '1235', '测试02', '120', '1', '1', '321', '测试02', '123', '测试02', '1', NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2023-01-04 15:21:33.690', '测试主键', '2023-01-04 15:21:33.690', 'admin');

-- ----------------------------
-- Table structure for check_perfomance_info
-- ----------------------------
DROP TABLE IF EXISTS `check_perfomance_info`;
CREATE TABLE `check_perfomance_info`  (
  `0` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `check_task_id` int NULL DEFAULT NULL COMMENT '所属任务id',
  `task_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属任务编号',
  `check_date` date NOT NULL COMMENT '盘点日期 --实际操作日期',
  `goods_bit_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '货位编号',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品id',
  `goods_specification` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '3' COMMENT '商品规格（1-70mm,2-75mm...）数据字典',
  `first_check_number` int NOT NULL COMMENT '初盘数量',
  `again_check_number` int NULL DEFAULT NULL COMMENT '复盘数量',
  `checker` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘点人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`0`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '盘点实绩维护' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of check_perfomance_info
-- ----------------------------

-- ----------------------------
-- Table structure for check_task_info
-- ----------------------------
DROP TABLE IF EXISTS `check_task_info`;
CREATE TABLE `check_task_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务编号',
  `task_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务类型（1-库位盘、2-商品盘、3-仓库全盘、4-盲盘、明盘）',
  `task_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务内容',
  `executer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行人',
  `executer_id` int NULL DEFAULT NULL COMMENT '执行人id',
  `check_plan_date` date NOT NULL COMMENT '盘点计划日期',
  `reality_plan_date` date NULL DEFAULT NULL COMMENT '实际计划盘点日期',
  `task_status` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务状态（1-未下达，2-已下达，3-已完成、4-手工关闭）',
  `create_time` datetime(3) NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作者',
  `update_time` datetime(3) NOT NULL COMMENT '操作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '盘点任务信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of check_task_info
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1610892236218793986, 'wm_put_info', '商品入库信息', NULL, NULL, 'WmPutInfo', 'crud', 'com.ruoyi.system', 'system', 'putInfo', '商品入库信息', 'ruoyi', '0', '/', NULL, 'admin', '2022-12-27 16:49:47', 'admin', '2022-12-27 16:49:47', NULL);
INSERT INTO `gen_table` VALUES (1611166186005962753, 'wm_put_temporary', '暂存入库信息', NULL, NULL, 'WmPutTemporary', 'crud', 'com.ruoyi.system', 'wmPut', 'putTemporary', '暂存入库信息', 'ruoyi', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1610826272882053121\"}', 'admin', '2023-01-06 09:01:29', 'admin', '2023-01-09 13:15:59', NULL);
INSERT INTO `gen_table` VALUES (1619599148342915073, 'wm_put_punish_confiscate', '罚没入库信息', NULL, NULL, 'WmPutPunishConfiscate', 'crud', 'com.ruoyi.wmPut', 'wmPut', 'putPunishConfiscate', '罚没入库信息', 'ruoyi', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null}', 'admin', '2022-12-27 16:49:59', 'admin', '2023-01-29 15:32:31', NULL);
INSERT INTO `gen_table` VALUES (1623492965953470466, 'wm_put_escrow', '代管入库信息', NULL, NULL, 'WmPutEscrow', 'crud', 'com.ruoyi.wmPut', 'putEscrow', 'putEscrow', '代管入库信息', 'ruoyi', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1610826272882053121\"}', 'admin', '2023-02-02 09:08:06', 'admin', '2023-02-09 09:30:27', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1610892236277514241, 1610892236218793986, 'id', '主键', 'int', 'Long', 'id', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236277514242, 1610892236218793986, 'wm_put_coded', '入库单号', 'varchar(50)', 'String', 'wmPutCoded', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236277514243, 1610892236218793986, 'certificate_coded', '文书编号', 'varchar(50)', 'String', 'certificateCoded', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236277514244, 1610892236218793986, 'cause_type', '案件类型（1-简易程序、2-普通程序、3-行政处罚案件移送、4-涉烟刑事案件移送）', 'char(4)', 'String', 'causeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236277514245, 1610892236218793986, 'wh_put_date', '入库日期', 'date', 'Date', 'whPutDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236348817410, 1610892236218793986, 'variety_number', '入库品种数', 'int', 'Long', 'varietyNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236348817411, 1610892236218793986, 'wh_put_number', '入库数（条）', 'int', 'Long', 'whPutNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236348817412, 1610892236218793986, 'wh_bit_coded', '存放库位编码', 'varchar(50)', 'String', 'whBitCoded', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236348817413, 1610892236218793986, 'invoices_status', '单据状态（保存未提交、提交已入库、撤销待入库）', 'varchar(50)', 'String', 'invoicesStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236348817414, 1610892236218793986, 'storekeeper', '保管员', 'varchar(50)', 'String', 'storekeeper', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236348817415, 1610892236218793986, 'synthesis_keeper', '综合管理员', 'varchar(50)', 'String', 'synthesisKeeper', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236348817416, 1610892236218793986, 'create_time', '创建时间', 'datetime(3)', 'Date', 'createTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236348817417, 1610892236218793986, 'update_by', '操作者', 'varchar(50)', 'String', 'updateBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236348817418, 1610892236218793986, 'update_time', '操作时间', 'datetime(3)', 'Date', 'updateTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1610892236348817419, 1610892236218793986, 'enclosure', '附件', 'mediumblob', 'String', 'enclosure', '0', '0', '1', '1', '1', '1', '1', 'EQ', NULL, '', 15, 'admin', '2023-01-05 14:53:33', 'admin', '2023-01-05 14:53:38');
INSERT INTO `gen_table_column` VALUES (1611166186005962754, 1611166186005962753, 'id', '主键', 'int', 'Long', 'id', '1', '1', '1', NULL, '0', '0', NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-06 09:02:07', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1611166186005962755, 1611166186005962753, 'wm_put_id', '入库信息id-暂存', 'int', 'Long', 'wmPutId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2023-01-06 09:02:07', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1611166186005962756, 1611166186005962753, 'client', '当事人', 'varchar(50)', 'String', 'client', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-06 09:02:07', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1611166186005962757, 1611166186005962753, 'cause', '案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）', 'char(4)', 'String', 'cause', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-01-06 09:02:07', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1611166186005962758, 1611166186005962753, 'detain_date', '查扣日期', 'date', 'Date', 'detainDate', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'datetime', '', 5, 'admin', '2023-01-06 09:02:07', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1611166186068877314, 1611166186005962753, 'detain_dept_name', '扣查部门', 'varchar(255)', 'String', 'detainDeptName', '0', '0', '1', '1', '1', '1', '0', 'LIKE', 'input', '', 6, 'admin', '2023-01-06 09:02:07', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1611166186068877315, 1611166186005962753, 'detain_dept', '扣查部门id', 'int', 'Long', 'detainDept', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2023-01-06 09:02:07', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1612316794343686145, 1611166186005962753, 'goods_coded', '商品编码', 'varchar(64)', 'String', 'goodsCoded', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-01-09 13:14:14', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1612316794343686146, 1611166186005962753, 'put_number', '入库条数', 'int', 'Long', 'putNumber', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-01-09 13:14:14', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1612316794343686147, 1611166186005962753, 'cause_qr', '案件二维码', 'mediumblob', 'String', 'causeQr', '0', '0', '1', '1', '1', '1', '0', 'EQ', NULL, '', 10, 'admin', '2023-01-09 13:14:14', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1612316794343686148, 1611166186005962753, 'wh_area_coded', '存放库区', 'varchar(50)', 'String', 'whAreaCoded', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2023-01-09 13:14:14', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1612316794343686149, 1611166186005962753, 'wh_bit_coded', '存放库位', 'varchar(50)', 'String', 'whBitCoded', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 12, 'admin', '2023-01-09 13:14:14', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1612316794406600706, 1611166186005962753, 'unit_coded', '归属单位', 'varchar(50)', 'String', 'unitCoded', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 13, 'admin', '2023-01-09 13:14:14', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1612316794406600707, 1611166186005962753, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 14, 'admin', '2023-01-09 13:14:14', 'admin', '2023-01-09 13:15:59');
INSERT INTO `gen_table_column` VALUES (1619599148460355586, 1619599148342915073, 'id', '主键', 'int', 'Long', 'id', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-29 15:31:42', 'admin', '2023-01-29 15:32:31');
INSERT INTO `gen_table_column` VALUES (1619599148527464449, 1619599148342915073, 'wm_put_id', '入库信息id-罚没', 'int', 'Long', 'wmPutId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2023-01-29 15:31:42', 'admin', '2023-01-29 15:32:31');
INSERT INTO `gen_table_column` VALUES (1619599148527464450, 1619599148342915073, 'cigarette_type', '卷烟类型（1-真烟，2-假烟）', 'char(4)', 'String', 'cigaretteType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2023-01-29 15:31:42', 'admin', '2023-01-29 15:32:31');
INSERT INTO `gen_table_column` VALUES (1623492966091882497, 1623492965953470466, 'id', '主键', 'int', 'Long', 'id', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-09 09:24:21', 'admin', '2023-02-09 09:30:27');
INSERT INTO `gen_table_column` VALUES (1623492966091882498, 1623492965953470466, 'wm_put_id', '入库信息id-代管', 'int', 'Long', 'wmPutId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2023-02-09 09:24:21', 'admin', '2023-02-09 09:30:27');
INSERT INTO `gen_table_column` VALUES (1623492966091882499, 1623492965953470466, 'entrust_unit', '委托单位', 'varchar(50)', 'String', 'entrustUnit', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-09 09:24:21', 'admin', '2023-02-09 09:30:27');
INSERT INTO `gen_table_column` VALUES (1623492966091882500, 1623492965953470466, 'entrust_unit_id', '单位id', 'int', 'Long', 'entrustUnitId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-02-09 09:24:21', 'admin', '2023-02-09 09:30:27');
INSERT INTO `gen_table_column` VALUES (1623492966091882501, 1623492965953470466, 'entrust_date', '委托日期', 'date', 'Date', 'entrustDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2023-02-09 09:24:21', 'admin', '2023-02-09 09:30:27');
INSERT INTO `gen_table_column` VALUES (1623492966091882502, 1623492965953470466, 'wh_bit_coded', '存放库位编码', 'varchar(50)', 'String', 'whBitCoded', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-02-09 09:24:21', 'admin', '2023-02-09 09:30:27');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-12-13 16:13:34', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-12-13 16:13:34', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-12-13 16:13:34', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-25 15:08:11', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-12-13 16:13:34', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2022-12-13 16:13:34', '', NULL, 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-13 17:07:05');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-13 17:13:16', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (30, 0, '行政机关', '1', 'unit_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 16:49:37', 'admin', '2022-12-14 16:49:37', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 1, '代管仓库', '2', 'unit_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 16:50:25', 'admin', '2022-12-14 16:50:25', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 2, '零售户', '3', 'unit_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 16:52:13', 'admin', '2022-12-14 16:52:13', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 3, '执法科', '4', 'unit_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 16:52:30', 'admin', '2022-12-14 16:52:30', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 4, '检验机构', '5', 'unit_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 16:52:50', 'admin', '2022-12-14 16:52:50', NULL);
INSERT INTO `sys_dict_data` VALUES (35, 0, '商品专属', '1', 'exclusive_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:02:13', 'admin', '2022-12-14 17:02:13', NULL);
INSERT INTO `sys_dict_data` VALUES (36, 1, '单位专属', '2', 'exclusive_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:02:24', 'admin', '2022-12-14 17:02:24', NULL);
INSERT INTO `sys_dict_data` VALUES (37, 0, '货架型', '1', 'librarybit_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:02:48', 'admin', '2022-12-14 17:02:48', NULL);
INSERT INTO `sys_dict_data` VALUES (38, 1, '扁平型', '2', 'librarybit_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:03:00', 'admin', '2022-12-14 17:03:00', NULL);
INSERT INTO `sys_dict_data` VALUES (39, 0, '烤烟型', '1', 'goods_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:15:10', 'admin', '2022-12-14 17:15:10', NULL);
INSERT INTO `sys_dict_data` VALUES (40, 1, '混合型', '2', 'goods_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:15:20', 'admin', '2022-12-14 17:15:20', NULL);
INSERT INTO `sys_dict_data` VALUES (41, 2, '外香型', '3', 'goods_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:15:42', 'admin', '2022-12-14 17:15:42', NULL);
INSERT INTO `sys_dict_data` VALUES (42, 3, '雪茄型', '4', 'goods_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:16:00', 'admin', '2022-12-14 17:16:00', NULL);
INSERT INTO `sys_dict_data` VALUES (43, 0, '70mm', '1', 'goods_specification', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:17:04', 'admin', '2022-12-14 17:17:04', NULL);
INSERT INTO `sys_dict_data` VALUES (44, 0, '75mm', '2', 'goods_specification', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:17:22', 'admin', '2022-12-14 17:17:22', NULL);
INSERT INTO `sys_dict_data` VALUES (45, 0, '84mm', '3', 'goods_specification', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:17:40', 'admin', '2022-12-14 17:17:40', NULL);
INSERT INTO `sys_dict_data` VALUES (46, 3, '85mm', '4', 'goods_specification', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:26:04', 'admin', '2022-12-14 17:26:04', NULL);
INSERT INTO `sys_dict_data` VALUES (47, 4, '90mm', '5', 'goods_specification', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:26:23', 'admin', '2022-12-14 17:26:23', NULL);
INSERT INTO `sys_dict_data` VALUES (48, 5, '95mm', '6', 'goods_specification', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:26:37', 'admin', '2022-12-14 17:26:37', NULL);
INSERT INTO `sys_dict_data` VALUES (49, 6, '97mm', '7', 'goods_specification', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:26:49', 'admin', '2022-12-14 17:26:49', NULL);
INSERT INTO `sys_dict_data` VALUES (50, 0, '条', '1', 'measure_unit', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:28:02', 'admin', '2022-12-14 17:28:02', NULL);
INSERT INTO `sys_dict_data` VALUES (51, 1, '盒', '2', 'measure_unit', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:28:09', 'admin', '2022-12-14 17:28:09', NULL);
INSERT INTO `sys_dict_data` VALUES (52, 2, '包', '3', 'measure_unit', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:28:24', 'admin', '2022-12-14 17:28:24', NULL);
INSERT INTO `sys_dict_data` VALUES (53, 3, '听', '4', 'measure_unit', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:28:35', 'admin', '2022-12-14 17:28:35', NULL);
INSERT INTO `sys_dict_data` VALUES (54, 0, '10', '1', 'single_barbox_number', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:29:26', 'admin', '2022-12-14 17:29:26', NULL);
INSERT INTO `sys_dict_data` VALUES (55, 1, '5', '2', 'single_barbox_number', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:29:40', 'admin', '2022-12-14 17:29:40', NULL);
INSERT INTO `sys_dict_data` VALUES (56, 2, '6', '3', 'single_barbox_number', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:29:49', 'admin', '2022-12-14 17:29:49', NULL);
INSERT INTO `sys_dict_data` VALUES (57, 3, '1', '4', 'single_barbox_number', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:29:57', 'admin', '2022-12-14 17:29:57', NULL);
INSERT INTO `sys_dict_data` VALUES (58, 0, '20', '1', 'small_box_number', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:31:30', 'admin', '2022-12-14 17:33:01', NULL);
INSERT INTO `sys_dict_data` VALUES (59, 1, '16', '2', 'small_box_number', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:31:37', 'admin', '2022-12-14 17:33:10', NULL);
INSERT INTO `sys_dict_data` VALUES (61, 3, '1', '4', 'small_box_number', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:31:52', 'admin', '2022-12-14 17:31:52', NULL);
INSERT INTO `sys_dict_data` VALUES (62, 0, '条盒硬盒', '1', 'packaging_forms', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:34:23', 'admin', '2022-12-14 17:34:23', NULL);
INSERT INTO `sys_dict_data` VALUES (63, 1, '条盒软盒', '2', 'packaging_forms', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:34:33', 'admin', '2022-12-14 17:34:33', NULL);
INSERT INTO `sys_dict_data` VALUES (64, 2, '木盒', '3', 'packaging_forms', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:34:42', 'admin', '2022-12-14 17:34:42', NULL);
INSERT INTO `sys_dict_data` VALUES (65, 3, '听盒', '4', 'packaging_forms', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:34:57', 'admin', '2022-12-14 17:34:57', NULL);
INSERT INTO `sys_dict_data` VALUES (66, 0, '已上市', '0', 'listing_status', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:36:38', 'admin', '2022-12-14 17:37:27', NULL);
INSERT INTO `sys_dict_data` VALUES (67, 1, '未上市', '1', 'listing_status', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:36:53', 'admin', '2022-12-14 17:36:53', NULL);
INSERT INTO `sys_dict_data` VALUES (68, 2, '已退市', '2', 'listing_status', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:37:15', 'admin', '2022-12-14 17:37:15', NULL);
INSERT INTO `sys_dict_data` VALUES (69, 0, '暂存', '1', 'libraryarea_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:42:22', 'admin', '2022-12-14 17:42:22', NULL);
INSERT INTO `sys_dict_data` VALUES (70, 1, '代管', '2', 'libraryarea_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:42:33', 'admin', '2022-12-14 17:42:33', NULL);
INSERT INTO `sys_dict_data` VALUES (71, 2, '罚没', '3', 'libraryarea_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:42:58', 'admin', '2022-12-14 17:42:58', NULL);
INSERT INTO `sys_dict_data` VALUES (72, 3, '罚没代管', '4', 'libraryarea_type', NULL, 'default', 'N', '0', 'admin', '2022-12-14 17:43:24', 'admin', '2022-12-14 17:43:24', NULL);
INSERT INTO `sys_dict_data` VALUES (73, 0, '暂存', '1', 'warehouse_type', NULL, 'default', 'N', '0', 'admin', '2023-01-02 13:13:31', 'admin', '2023-01-02 13:13:31', NULL);
INSERT INTO `sys_dict_data` VALUES (74, 1, '代管', '2', 'warehouse_type', NULL, 'default', 'N', '0', 'admin', '2023-01-02 13:13:39', 'admin', '2023-01-02 13:13:39', NULL);
INSERT INTO `sys_dict_data` VALUES (75, 2, '罚没', '3', 'warehouse_type', NULL, 'default', 'N', '0', 'admin', '2023-01-02 13:13:54', 'admin', '2023-01-02 13:25:18', NULL);
INSERT INTO `sys_dict_data` VALUES (76, 3, '罚没代管', '4', 'warehouse_type', NULL, 'default', 'N', '0', 'admin', '2023-01-02 13:14:12', 'admin', '2023-01-02 13:25:26', NULL);
INSERT INTO `sys_dict_data` VALUES (77, 0, '是', '1', 'is_exclusive', NULL, 'default', 'N', '0', 'admin', '2023-01-03 13:15:28', 'admin', '2023-01-03 13:15:28', NULL);
INSERT INTO `sys_dict_data` VALUES (78, 1, '否', '2', 'is_exclusive', NULL, 'default', 'N', '0', 'admin', '2023-01-03 13:15:35', 'admin', '2023-01-03 13:15:35', NULL);
INSERT INTO `sys_dict_data` VALUES (79, 0, '货架型', '1', 'wh_bit_type', NULL, 'default', 'N', '0', 'admin', '2023-01-04 10:47:19', 'admin', '2023-01-04 10:47:19', NULL);
INSERT INTO `sys_dict_data` VALUES (80, 1, '扁平型', '2', 'wh_bit_type', NULL, 'default', 'N', '0', 'admin', '2023-01-04 10:47:29', 'admin', '2023-01-04 10:47:29', NULL);
INSERT INTO `sys_dict_data` VALUES (81, 0, '保存未提交', '1', 'invoices_status', NULL, 'default', 'N', '0', 'admin', '2023-01-10 13:45:33', 'admin', '2023-01-10 13:45:33', NULL);
INSERT INTO `sys_dict_data` VALUES (82, 1, '提交已入库', '2', 'invoices_status', NULL, 'default', 'N', '0', 'admin', '2023-01-10 13:45:45', 'admin', '2023-01-10 13:45:45', NULL);
INSERT INTO `sys_dict_data` VALUES (83, 2, '撤销待入库', '3', 'invoices_status', NULL, 'default', 'N', '0', 'admin', '2023-01-10 13:45:57', 'admin', '2023-01-10 13:45:57', NULL);
INSERT INTO `sys_dict_data` VALUES (84, 0, '简易程序', '1', 'cause_type', NULL, 'default', 'N', '0', 'admin', '2023-01-10 13:46:50', 'admin', '2023-01-10 13:46:50', NULL);
INSERT INTO `sys_dict_data` VALUES (85, 1, '普通程序', '2', 'cause_type', NULL, 'default', 'N', '0', 'admin', '2023-01-10 13:47:01', 'admin', '2023-01-10 13:47:01', NULL);
INSERT INTO `sys_dict_data` VALUES (86, 2, '行政处罚案件移送', '3', 'cause_type', NULL, 'default', 'N', '0', 'admin', '2023-01-10 13:47:17', 'admin', '2023-01-10 13:47:17', NULL);
INSERT INTO `sys_dict_data` VALUES (87, 3, '涉烟刑事案件移送', '4', 'cause_type', NULL, 'default', 'N', '0', 'admin', '2023-01-10 13:47:35', 'admin', '2023-01-10 13:47:35', NULL);
INSERT INTO `sys_dict_data` VALUES (88, 0, '无烟草专卖品准运证运输烟草专卖品', '1', 'cause', NULL, 'default', 'N', '0', 'admin', '2023-01-10 13:48:24', 'admin', '2023-01-10 13:48:24', NULL);
INSERT INTO `sys_dict_data` VALUES (89, 1, '生产、销售假冒伪劣烟草专卖品', '2', 'cause', NULL, 'default', 'N', '0', 'admin', '2023-01-10 13:48:41', 'admin', '2023-02-02 10:43:09', NULL);
INSERT INTO `sys_dict_data` VALUES (90, 0, '综合保管员', '1', 'position', NULL, 'default', 'N', '0', 'admin', '2023-02-01 18:33:51', 'admin', '2023-02-01 18:33:51', NULL);
INSERT INTO `sys_dict_data` VALUES (91, 0, '保管员', '2', 'position', NULL, 'default', 'N', '0', 'admin', '2023-02-01 18:34:08', 'admin', '2023-02-01 18:34:08', NULL);
INSERT INTO `sys_dict_data` VALUES (92, 0, '暂存入库', '1', 'put_type', NULL, 'default', 'N', '0', 'admin', '2023-02-06 15:52:44', 'admin', '2023-02-06 15:52:44', NULL);
INSERT INTO `sys_dict_data` VALUES (93, 1, '代管入库', '2', 'put_type', NULL, 'default', 'N', '0', 'admin', '2023-02-06 15:53:01', 'admin', '2023-02-06 15:53:11', NULL);
INSERT INTO `sys_dict_data` VALUES (94, 2, '罚没入库', '3', 'put_type', NULL, 'default', 'N', '0', 'admin', '2023-02-06 15:53:39', 'admin', '2023-02-06 15:53:39', NULL);
INSERT INTO `sys_dict_data` VALUES (95, 3, '抽检返还入库', '4', 'put_type', NULL, 'default', 'N', '0', 'admin', '2023-02-06 15:54:04', 'admin', '2023-02-06 15:54:04', NULL);
INSERT INTO `sys_dict_data` VALUES (96, 0, '代管出库', '1', 'out_type', NULL, 'default', 'N', '0', 'admin', '2023-02-06 16:12:57', 'admin', '2023-02-06 16:12:57', NULL);
INSERT INTO `sys_dict_data` VALUES (97, 0, '暂存出库', '2', 'out_type', NULL, 'default', 'N', '0', 'admin', '2023-02-06 16:15:09', 'admin', '2023-02-06 16:15:09', NULL);
INSERT INTO `sys_dict_data` VALUES (98, 0, '抽检出库', '3', 'out_type', NULL, 'default', 'N', '0', 'admin', '2023-02-06 16:15:23', 'admin', '2023-02-06 16:15:23', NULL);
INSERT INTO `sys_dict_data` VALUES (99, 0, '罚没出库', '4', 'out_type', NULL, 'default', 'N', '0', 'admin', '2023-02-06 16:15:43', 'admin', '2023-02-06 16:15:43', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '单位类型', 'unit_type', '0', 'admin', '2022-12-14 16:33:35', 'admin', '2022-12-14 16:39:51', '单位类型列表');
INSERT INTO `sys_dict_type` VALUES (12, '库位专属类型', 'exclusive_type', '0', 'admin', '2022-12-14 16:55:15', 'admin', '2022-12-14 16:55:15', '库位专属类型 列表');
INSERT INTO `sys_dict_type` VALUES (13, '库位类型', 'librarybit_type', '0', 'admin', '2022-12-14 17:00:48', 'admin', '2022-12-14 17:00:48', NULL);
INSERT INTO `sys_dict_type` VALUES (14, '商品类型', 'goods_type', '0', 'admin', '2022-12-14 17:14:51', 'admin', '2022-12-14 17:14:51', NULL);
INSERT INTO `sys_dict_type` VALUES (15, '烟草商品规格', 'goods_specification', '0', 'admin', '2022-12-14 17:16:35', 'admin', '2022-12-14 17:16:35', NULL);
INSERT INTO `sys_dict_type` VALUES (16, '烟草商品计量单位', 'measure_unit', '0', 'admin', '2022-12-14 17:27:37', 'admin', '2022-12-14 17:27:37', NULL);
INSERT INTO `sys_dict_type` VALUES (17, '单条盒数', 'single_barbox_number', '0', 'admin', '2022-12-14 17:29:16', 'admin', '2022-12-14 17:29:16', NULL);
INSERT INTO `sys_dict_type` VALUES (18, '小盒支数', 'small_box_number', '0', 'admin', '2022-12-14 17:31:12', 'admin', '2022-12-14 17:31:12', NULL);
INSERT INTO `sys_dict_type` VALUES (19, '包装形式', 'packaging_forms', '0', 'admin', '2022-12-14 17:33:51', 'admin', '2022-12-14 17:33:51', NULL);
INSERT INTO `sys_dict_type` VALUES (20, '商品上市状态', 'listing_status', '0', 'admin', '2022-12-14 17:36:04', 'admin', '2022-12-14 17:36:04', NULL);
INSERT INTO `sys_dict_type` VALUES (21, '库区类型', 'libraryarea_type', '0', 'admin', '2022-12-14 17:38:40', 'admin', '2022-12-14 17:38:40', NULL);
INSERT INTO `sys_dict_type` VALUES (22, '仓库类型', 'warehouse_type', '0', 'admin', '2023-01-02 13:13:05', 'admin', '2023-01-02 13:13:05', '仓库类型');
INSERT INTO `sys_dict_type` VALUES (23, '库位是否专属', 'is_exclusive', '0', 'admin', '2023-01-03 13:15:15', 'admin', '2023-01-03 13:15:15', NULL);
INSERT INTO `sys_dict_type` VALUES (24, '库位类型', 'wh_bit_type', '0', 'admin', '2023-01-04 10:46:55', 'admin', '2023-01-04 10:46:55', NULL);
INSERT INTO `sys_dict_type` VALUES (25, '单据状态', 'invoices_status', '0', 'admin', '2023-01-10 13:45:10', 'admin', '2023-01-10 13:45:10', NULL);
INSERT INTO `sys_dict_type` VALUES (26, '案件类型', 'cause_type', '0', 'admin', '2023-01-10 13:46:32', 'admin', '2023-01-10 13:46:32', NULL);
INSERT INTO `sys_dict_type` VALUES (27, '案由', 'cause', '0', 'admin', '2023-01-10 13:48:17', 'admin', '2023-01-10 13:48:17', NULL);
INSERT INTO `sys_dict_type` VALUES (28, '职位', 'position', '0', 'admin', '2023-02-01 18:33:19', 'admin', '2023-02-01 18:33:19', NULL);
INSERT INTO `sys_dict_type` VALUES (31, '入库类型', 'put_type', '0', 'admin', '2023-02-06 15:52:22', 'admin', '2023-02-06 15:52:22', NULL);
INSERT INTO `sys_dict_type` VALUES (32, '出库类型', 'out_type', '0', 'admin', '2023-02-06 16:12:34', 'admin', '2023-02-06 16:12:34', NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1610499029374959666 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1602583279356211201, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-13 16:36:43');
INSERT INTO `sys_logininfor` VALUES (1602844765689344002, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2022-12-14 09:55:46');
INSERT INTO `sys_logininfor` VALUES (1602845959891578881, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2022-12-14 10:00:31');
INSERT INTO `sys_logininfor` VALUES (1602845994083545089, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2022-12-14 10:00:39');
INSERT INTO `sys_logininfor` VALUES (1602852761710469122, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2022-12-14 10:27:33');
INSERT INTO `sys_logininfor` VALUES (1602854296792178690, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-14 10:33:39');
INSERT INTO `sys_logininfor` VALUES (1602854934477287425, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '密码输入错误6次', '2022-12-14 10:36:11');
INSERT INTO `sys_logininfor` VALUES (1602855017318985729, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2022-12-14 10:36:30');
INSERT INTO `sys_logininfor` VALUES (1602855063724765185, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '密码输入错误7次', '2022-12-14 10:36:41');
INSERT INTO `sys_logininfor` VALUES (1602855088777342978, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '密码输入错误8次', '2022-12-14 10:36:47');
INSERT INTO `sys_logininfor` VALUES (1602855137167028226, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '密码输入错误9次', '2022-12-14 10:36:59');
INSERT INTO `sys_logininfor` VALUES (1602855451731439618, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-14 10:38:14');
INSERT INTO `sys_logininfor` VALUES (1602871187677917186, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-14 11:40:46');
INSERT INTO `sys_logininfor` VALUES (1602942061051404289, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-14 16:22:23');
INSERT INTO `sys_logininfor` VALUES (1606902440525852673, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-25 14:39:31');
INSERT INTO `sys_logininfor` VALUES (1606902556242505730, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2022-12-25 14:39:59');
INSERT INTO `sys_logininfor` VALUES (1606902598214905857, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-25 14:40:09');
INSERT INTO `sys_logininfor` VALUES (1606902957893251073, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2022-12-25 14:41:35');
INSERT INTO `sys_logininfor` VALUES (1606902993628721153, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-25 14:41:43');
INSERT INTO `sys_logininfor` VALUES (1606903168376008706, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2022-12-25 14:42:25');
INSERT INTO `sys_logininfor` VALUES (1606909573657063425, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-25 15:07:52');
INSERT INTO `sys_logininfor` VALUES (1606909671111716865, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2022-12-25 15:08:15');
INSERT INTO `sys_logininfor` VALUES (1606909689646346241, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-25 15:08:20');
INSERT INTO `sys_logininfor` VALUES (1607209092743438337, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-26 10:58:03');
INSERT INTO `sys_logininfor` VALUES (1607252597557792770, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-26 13:50:55');
INSERT INTO `sys_logininfor` VALUES (1607302197924712449, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-26 17:08:01');
INSERT INTO `sys_logininfor` VALUES (1607551018520862721, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-27 09:36:44');
INSERT INTO `sys_logininfor` VALUES (1607573670673379329, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-27 11:06:45');
INSERT INTO `sys_logininfor` VALUES (1607641752695599106, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-27 15:37:17');
INSERT INTO `sys_logininfor` VALUES (1607654766530387970, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-27 16:29:00');
INSERT INTO `sys_logininfor` VALUES (1607911789687767041, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-28 09:30:19');
INSERT INTO `sys_logininfor` VALUES (1608643857417797633, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-30 09:59:17');
INSERT INTO `sys_logininfor` VALUES (1608700230528737281, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-30 13:43:18');
INSERT INTO `sys_logininfor` VALUES (1608716826835943426, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2022-12-30 14:49:15');
INSERT INTO `sys_logininfor` VALUES (1609777979980804098, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-02 13:05:53');
INSERT INTO `sys_logininfor` VALUES (1609833028077539329, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-02 16:44:38');
INSERT INTO `sys_logininfor` VALUES (1609864023640166402, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-02 18:47:48');
INSERT INTO `sys_logininfor` VALUES (1610121489598763009, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-03 11:50:52');
INSERT INTO `sys_logininfor` VALUES (1610138392912318465, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-03 12:58:02');
INSERT INTO `sys_logininfor` VALUES (1610155582399041538, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-03 14:06:21');
INSERT INTO `sys_logininfor` VALUES (1610173091365908481, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-03 15:15:55');
INSERT INTO `sys_logininfor` VALUES (1610190598059343873, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-03 16:25:29');
INSERT INTO `sys_logininfor` VALUES (1610218224094298113, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-03 18:15:16');
INSERT INTO `sys_logininfor` VALUES (1610230792502411266, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-03 19:05:12');
INSERT INTO `sys_logininfor` VALUES (1610450692361691138, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-04 09:39:00');
INSERT INTO `sys_logininfor` VALUES (1610499029374959617, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-04 12:51:05');
INSERT INTO `sys_logininfor` VALUES (1610499029374959618, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-31 16:00:26');
INSERT INTO `sys_logininfor` VALUES (1610499029374959619, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-31 19:45:07');
INSERT INTO `sys_logininfor` VALUES (1610499029374959620, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-01 09:32:52');
INSERT INTO `sys_logininfor` VALUES (1610499029374959621, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-01 11:34:08');
INSERT INTO `sys_logininfor` VALUES (1610499029374959622, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-01 13:22:18');
INSERT INTO `sys_logininfor` VALUES (1610499029374959623, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-01 14:24:36');
INSERT INTO `sys_logininfor` VALUES (1610499029374959624, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-01 15:32:51');
INSERT INTO `sys_logininfor` VALUES (1610499029374959625, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-01 16:56:35');
INSERT INTO `sys_logininfor` VALUES (1610499029374959626, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-02 08:54:09');
INSERT INTO `sys_logininfor` VALUES (1610499029374959627, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-02 15:15:41');
INSERT INTO `sys_logininfor` VALUES (1610499029374959628, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-02 18:39:25');
INSERT INTO `sys_logininfor` VALUES (1610499029374959629, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-03 11:29:20');
INSERT INTO `sys_logininfor` VALUES (1610499029374959630, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-03 13:54:11');
INSERT INTO `sys_logininfor` VALUES (1610499029374959631, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-03 15:40:19');
INSERT INTO `sys_logininfor` VALUES (1610499029374959632, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-03 18:28:33');
INSERT INTO `sys_logininfor` VALUES (1610499029374959633, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-06 09:40:04');
INSERT INTO `sys_logininfor` VALUES (1610499029374959634, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-06 12:06:56');
INSERT INTO `sys_logininfor` VALUES (1610499029374959635, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-06 14:54:20');
INSERT INTO `sys_logininfor` VALUES (1610499029374959636, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-06 15:51:49');
INSERT INTO `sys_logininfor` VALUES (1610499029374959637, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-06 18:09:51');
INSERT INTO `sys_logininfor` VALUES (1610499029374959638, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-07 09:03:10');
INSERT INTO `sys_logininfor` VALUES (1610499029374959639, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-07 09:55:20');
INSERT INTO `sys_logininfor` VALUES (1610499029374959640, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-07 13:23:02');
INSERT INTO `sys_logininfor` VALUES (1610499029374959641, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-07 14:03:23');
INSERT INTO `sys_logininfor` VALUES (1610499029374959642, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-07 15:20:55');
INSERT INTO `sys_logininfor` VALUES (1610499029374959643, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-07 17:52:15');
INSERT INTO `sys_logininfor` VALUES (1610499029374959644, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-07 19:00:10');
INSERT INTO `sys_logininfor` VALUES (1610499029374959645, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-08 09:16:07');
INSERT INTO `sys_logininfor` VALUES (1610499029374959646, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-08 10:20:03');
INSERT INTO `sys_logininfor` VALUES (1610499029374959647, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-08 11:07:49');
INSERT INTO `sys_logininfor` VALUES (1610499029374959648, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-08 11:18:09');
INSERT INTO `sys_logininfor` VALUES (1610499029374959649, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-08 12:03:18');
INSERT INTO `sys_logininfor` VALUES (1610499029374959650, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-08 13:38:08');
INSERT INTO `sys_logininfor` VALUES (1610499029374959651, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-08 16:16:55');
INSERT INTO `sys_logininfor` VALUES (1610499029374959652, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-08 18:09:51');
INSERT INTO `sys_logininfor` VALUES (1610499029374959653, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-09 09:23:34');
INSERT INTO `sys_logininfor` VALUES (1610499029374959654, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-09 10:04:18');
INSERT INTO `sys_logininfor` VALUES (1610499029374959655, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-09 14:49:05');
INSERT INTO `sys_logininfor` VALUES (1610499029374959656, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-09 15:19:20');
INSERT INTO `sys_logininfor` VALUES (1610499029374959657, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-09 17:25:40');
INSERT INTO `sys_logininfor` VALUES (1610499029374959658, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-09 18:03:43');
INSERT INTO `sys_logininfor` VALUES (1610499029374959659, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-10 09:15:49');
INSERT INTO `sys_logininfor` VALUES (1610499029374959660, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-10 10:24:32');
INSERT INTO `sys_logininfor` VALUES (1610499029374959661, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-10 11:33:52');
INSERT INTO `sys_logininfor` VALUES (1610499029374959662, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-10 14:38:36');
INSERT INTO `sys_logininfor` VALUES (1610499029374959663, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-10 15:21:36');
INSERT INTO `sys_logininfor` VALUES (1610499029374959664, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-10 16:28:12');
INSERT INTO `sys_logininfor` VALUES (1610499029374959665, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-10 17:48:13');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 5, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-12-13 16:13:34', 'admin', '2023-01-05 10:31:57', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 6, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-12-13 16:13:34', 'admin', '2023-01-05 10:32:04', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 8, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-12-13 16:13:34', 'admin', '2023-01-05 14:49:53', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'PLUS官网', 0, 8, 'https://gitee.com/JavaLionLi/RuoYi-Vue-Plus', NULL, '', 0, 0, 'M', '1', '1', '', 'guide', 'admin', '2022-12-13 16:13:34', 'admin', '2023-01-05 10:32:19', 'RuoYi-Vue-Plus官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-12-13 16:13:34', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-12-13 16:13:34', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-12-13 16:13:34', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-12-13 16:13:34', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-12-13 16:13:34', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1606, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', '#', 'admin', '2022-12-13 16:13:34', 'admin', '2023-01-05 09:33:35', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-12-13 16:13:34', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-12-13 16:13:34', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-12-13 16:13:34', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-12-13 16:13:34', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (112, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-12-13 16:13:34', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-12-13 16:13:34', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-12-13 16:13:34', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-12-13 16:13:34', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'dashboard', 'admin', '2022-12-13 16:13:34', '', NULL, 'Admin监控菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 'admin', '2022-12-13 16:13:34', '', NULL, '文件管理菜单');
INSERT INTO `sys_menu` VALUES (120, '任务调度中心', 2, 5, 'XxlJob', 'monitor/xxljob/index', '', 1, 0, 'C', '0', '0', 'monitor:xxljob:list', 'job', 'admin', '2022-12-13 16:13:34', '', NULL, 'Xxl-Job控制台菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-12-13 16:13:34', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-12-13 16:13:34', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604, '配置添加', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:add', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:edit', '#', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1606, '基础数据管理', 0, 1, 'base', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'table', 'admin', '2022-12-26 13:53:12', 'admin', '2022-12-26 13:53:12', '');
INSERT INTO `sys_menu` VALUES (1607, '品牌管理', 1606, 1, 'BrandManage', 'base/brandManage/index', NULL, 1, 0, 'C', '0', '0', 'system:brandManage:list', '#', 'admin', '2022-12-26 13:56:15', 'admin', '2023-01-30 13:16:43', '');
INSERT INTO `sys_menu` VALUES (1608, '商品信息', 1606, 2, 'GoodsInfo', 'base/goodsInfo/index', NULL, 1, 1, 'C', '0', '0', 'base:goodsInfo:list', '#', 'admin', '2022-12-26 17:33:55', 'admin', '2023-01-30 13:16:47', '');
INSERT INTO `sys_menu` VALUES (1609, '商品信息查询', 1608, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:goodsInfo:query', '#', 'admin', '2022-12-27 09:42:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1610, '商品信息新增', 1608, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:goodsInfo:add', '#', 'admin', '2022-12-27 09:42:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1611, '商品信息修改', 1608, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:goodsInfo:edit', '#', 'admin', '2022-12-27 09:42:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1612, '商品信息删除', 1608, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:goodsInfo:remove', '#', 'admin', '2022-12-27 09:42:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1613, '商品信息导出', 1608, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:goodsInfo:export', '#', 'admin', '2022-12-27 09:42:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608733927793528832, '仓库管理', 1606, 3, 'warehouseInfo', 'base/warehouseInfo/index', NULL, 1, 0, 'C', '0', '0', 'system:warehouseInfo:list', '#', 'admin', '2022-12-30 16:00:00', 'admin', '2023-01-02 14:46:53', '仓库管理菜单');
INSERT INTO `sys_menu` VALUES (1608733927793528833, '仓库管理查询', 1608733927793528832, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:warehouseInfo:query', '#', 'admin', '2022-12-30 16:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608733927793528834, '仓库管理新增', 1608733927793528832, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:warehouseInfo:add', '#', 'admin', '2022-12-30 16:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608733927793528835, '仓库管理修改', 1608733927793528832, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:warehouseInfo:edit', '#', 'admin', '2022-12-30 16:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608733927793528836, '仓库管理删除', 1608733927793528832, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:warehouseInfo:remove', '#', 'admin', '2022-12-30 16:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608733927793528837, '仓库管理导出', 1608733927793528832, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:warehouseInfo:export', '#', 'admin', '2022-12-30 16:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608748164804845568, '库区信息', 1606, 4, 'whAreaInfo', 'base/whAreaInfo/index', NULL, 1, 0, 'C', '0', '0', 'base:whAreaInfo:list', '#', 'admin', '2022-12-30 16:54:36', 'admin', '2023-01-02 14:47:08', '库区信息菜单');
INSERT INTO `sys_menu` VALUES (1608748164804845569, '库区信息查询', 1608748164804845568, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:whAreaInfo:query', '#', 'admin', '2022-12-30 16:54:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608748164804845570, '库区信息新增', 1608748164804845568, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:whAreaInfo:add', '#', 'admin', '2022-12-30 16:54:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608748164804845571, '库区信息修改', 1608748164804845568, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:whAreaInfo:edit', '#', 'admin', '2022-12-30 16:54:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608748164804845572, '库区信息删除', 1608748164804845568, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:whAreaInfo:remove', '#', 'admin', '2022-12-30 16:54:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608748164804845573, '库区信息导出', 1608748164804845568, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:whAreaInfo:export', '#', 'admin', '2022-12-30 16:54:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608751504154439680, '库位信息', 1606, 5, 'whBitInfo', 'base/whBitInfo/index', NULL, 1, 0, 'C', '0', '0', 'base:whBitInfo:list', '#', 'admin', '2022-12-30 17:18:53', 'admin', '2023-01-02 14:47:14', '库位信息菜单');
INSERT INTO `sys_menu` VALUES (1608751504154439681, '库位信息查询', 1608751504154439680, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:whBitInfo:query', '#', 'admin', '2022-12-30 17:18:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608751504154439682, '库位信息新增', 1608751504154439680, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:whBitInfo:add', '#', 'admin', '2022-12-30 17:18:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608751504154439683, '库位信息修改', 1608751504154439680, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:whBitInfo:edit', '#', 'admin', '2022-12-30 17:18:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608751504154439684, '库位信息删除', 1608751504154439680, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:whBitInfo:remove', '#', 'admin', '2022-12-30 17:18:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1608751504154439685, '库位信息导出', 1608751504154439680, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'base:whBitInfo:export', '#', 'admin', '2022-12-30 17:18:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1610469431488598016, '来往单位', 1606, 6, 'dealingsunitInfo', 'base/dealingsunitInfo/index', NULL, 1, 0, 'C', '0', '0', 'dealingsunitInfo:dealingsunitInfo:list', '#', 'admin', '2023-01-04 12:10:00', 'admin', '2023-01-04 13:23:01', '来往单位信息菜单');
INSERT INTO `sys_menu` VALUES (1610469431488598017, '来往单位信息查询', 1610469431488598016, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'dealingsunitInfo:dealingsunitInfo:query', '#', 'admin', '2023-01-04 12:10:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1610469431488598018, '来往单位信息新增', 1610469431488598016, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'dealingsunitInfo:dealingsunitInfo:add', '#', 'admin', '2023-01-04 12:10:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1610469431488598019, '来往单位信息修改', 1610469431488598016, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'dealingsunitInfo:dealingsunitInfo:edit', '#', 'admin', '2023-01-04 12:10:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1610469431488598020, '来往单位信息删除', 1610469431488598016, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'dealingsunitInfo:dealingsunitInfo:remove', '#', 'admin', '2023-01-04 12:10:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1610469431488598021, '来往单位信息导出', 1610469431488598016, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'dealingsunitInfo:dealingsunitInfo:export', '#', 'admin', '2023-01-04 12:10:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1610826272882053121, '商品入库管理', 0, 2, 'wmPut', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2023-01-05 10:31:26', 'admin', '2023-01-05 10:31:26', '');
INSERT INTO `sys_menu` VALUES (1611166548347691008, '暂存入库信息', 1610826272882053121, 1, 'putTemporary', 'wmPut/putTemporary/index', NULL, 1, 1, 'C', '0', '0', 'wmPut:putTemporary:list', '#', 'admin', '2023-01-06 09:06:22', 'admin', '2023-02-02 10:30:55', '暂存入库信息菜单');
INSERT INTO `sys_menu` VALUES (1611166548347691009, '暂存入库信息查询', 1611166548347691008, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'wmPut:putTemporary:query', '#', 'admin', '2023-01-06 09:06:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1611166548347691010, '暂存入库信息新增', 1611166548347691008, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'wmPut:putTemporary:add', '#', 'admin', '2023-01-06 09:06:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1611166548347691011, '暂存入库信息修改', 1611166548347691008, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'wmPut:putTemporary:edit', '#', 'admin', '2023-01-06 09:06:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1611166548347691012, '暂存入库信息删除', 1611166548347691008, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'wmPut:putTemporary:remove', '#', 'admin', '2023-01-06 09:06:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1611166548347691013, '暂存入库信息导出', 1611166548347691008, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'wmPut:putTemporary:export', '#', 'admin', '2023-01-06 09:06:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1619599367625322496, '罚没入库信息', 1610826272882053121, 1, 'putPunishConfiscate', 'wmPut/putPunishConfiscate/index', NULL, 1, 0, 'C', '0', '0', 'wmPut:putPunishConfiscate:list', '#', 'admin', '2023-01-29 17:01:45', '', NULL, '罚没入库信息菜单');
INSERT INTO `sys_menu` VALUES (1619599367625322497, '罚没入库信息查询', 1619599367625322496, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'wmPut:putPunishConfiscate:query', '#', 'admin', '2023-01-29 17:01:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1619599367625322498, '罚没入库信息新增', 1619599367625322496, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'wmPut:putPunishConfiscate:add', '#', 'admin', '2023-01-29 17:01:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1619599367625322499, '罚没入库信息修改', 1619599367625322496, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'wmPut:putPunishConfiscate:edit', '#', 'admin', '2023-01-29 17:01:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1619599367625322500, '罚没入库信息删除', 1619599367625322496, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'wmPut:putPunishConfiscate:remove', '#', 'admin', '2023-01-29 17:01:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1619599367625322501, '罚没入库信息导出', 1619599367625322496, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'wmPut:putPunishConfiscate:export', '#', 'admin', '2023-01-29 17:01:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1623494585026117632, '代管入库信息', 1610826272882053121, 1, 'putEscrow', 'wmPut/putEscrow/index', NULL, 1, 0, 'C', '0', '0', 'putEscrow:putEscrow:list', '#', 'admin', '2023-02-09 09:57:09', 'admin', '2023-02-09 10:21:04', '代管入库信息菜单');
INSERT INTO `sys_menu` VALUES (1623494585026117633, '代管入库信息查询', 1623494585026117632, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'putEscrow:putEscrow:query', '#', 'admin', '2023-02-09 09:57:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1623494585026117634, '代管入库信息新增', 1623494585026117632, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'putEscrow:putEscrow:add', '#', 'admin', '2023-02-09 09:57:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1623494585026117635, '代管入库信息修改', 1623494585026117632, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'putEscrow:putEscrow:edit', '#', 'admin', '2023-02-09 09:57:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1623494585026117636, '代管入库信息删除', 1623494585026117632, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'putEscrow:putEscrow:remove', '#', 'admin', '2023-02-09 09:57:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1623494585026117637, '代管入库信息导出', 1623494585026117632, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'putEscrow:putEscrow:export', '#', 'admin', '2023-02-09 09:57:09', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-12-13 16:13:34', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-12-13 16:13:34', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1610523760077582462 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1602583530536300546, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"userId\":null,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '', 0, '', '2022-12-13 16:37:43');
INSERT INTO `sys_oper_log` VALUES (1602590921759780866, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '', '/system/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-13 17:07:05\",\"parentName\":\"深圳总公司\",\"parentId\":101,\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"orderNum\":2,\"leader\":\"若依\",\"phone\":\"15888888888\",\"email\":\"ry@qq.com\",\"status\":\"1\",\"delFlag\":\"0\",\"ancestors\":\"0,100,101\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-13 17:07:05');
INSERT INTO `sys_oper_log` VALUES (1602592391125135361, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-13 17:12:55\",\"dictCode\":1,\"dictSort\":1,\"dictLabel\":\"男\",\"dictValue\":\"0\",\"dictType\":\"sys_user_sex\",\"cssClass\":\"\",\"listClass\":\"\",\"isDefault\":\"Y\",\"status\":\"1\",\"remark\":\"性别男\",\"default\":true}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-13 17:12:55');
INSERT INTO `sys_oper_log` VALUES (1602592477980782594, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-13 17:13:16\",\"dictCode\":1,\"dictSort\":1,\"dictLabel\":\"男\",\"dictValue\":\"0\",\"dictType\":\"sys_user_sex\",\"cssClass\":\"\",\"listClass\":\"\",\"isDefault\":\"Y\",\"status\":\"0\",\"remark\":\"性别男\",\"default\":true}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-13 17:13:16');
INSERT INTO `sys_oper_log` VALUES (1602871511847284738, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 11:42:02\",\"postId\":2,\"postCode\":\"se\",\"postName\":\"项目经理\",\"postSort\":2,\"status\":\"1\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 11:42:03');
INSERT INTO `sys_oper_log` VALUES (1602878988810727426, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '', '/system/config', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 12:11:45\",\"configId\":4,\"configName\":\"账号自助-验证码开关\",\"configKey\":\"sys.account.captchaEnabled\",\"configValue\":\"true\",\"configType\":\"N\",\"remark\":\"是否开启验证码功能（true开启，false关闭）\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 12:11:46');
INSERT INTO `sys_oper_log` VALUES (1602944878046633986, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:33:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:33:34\",\"dictId\":\"1602944877849501697\",\"dictName\":\"单位类型\",\"dictType\":\"unit_type\",\"status\":\"0\",\"remark\":\"单位类型列表\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:33:35');
INSERT INTO `sys_oper_log` VALUES (1602945364623646722, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:33:35\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:35:30\",\"dictId\":\"1602944877849501697\",\"dictName\":\"单位类型\",\"dictType\":\"unit_type\",\"status\":\"1\",\"remark\":\"单位类型列表\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:35:31');
INSERT INTO `sys_oper_log` VALUES (1602946456556167169, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:33:35\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:39:51\",\"dictId\":11,\"dictName\":\"单位类型\",\"dictType\":\"unit_type\",\"status\":\"0\",\"remark\":\"单位类型列表\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:39:51');
INSERT INTO `sys_oper_log` VALUES (1602946707782393858, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:40:51\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:40:51\",\"dictCode\":\"1602946707715284993\",\"dictSort\":0,\"dictLabel\":\"行政机关\",\"dictValue\":\"1\",\"dictType\":\"unit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:40:51');
INSERT INTO `sys_oper_log` VALUES (1602948656581890050, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', '', '/system/dict/data/1602946707715284993', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:48:36');
INSERT INTO `sys_oper_log` VALUES (1602948691927289858, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:48:43\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:48:43\",\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"行政机关\",\"dictValue\":\"1\",\"dictType\":\"unit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'dict_code\' doesn\'t have a default value\r\n### The error may exist in com/ruoyi/system/mapper/SysDictDataMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.SysDictDataMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_dict_data  ( dict_sort, dict_label, dict_value, dict_type,  list_class,  status,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?,  ?,  ?,  ?, ?, ?, ? )\r\n### Cause: java.sql.SQLException: Field \'dict_code\' doesn\'t have a default value\n; Field \'dict_code\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'dict_code\' doesn\'t have a default value', '2022-12-14 16:48:44');
INSERT INTO `sys_oper_log` VALUES (1602948711078481922, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:48:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:48:48\",\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"行政机关\",\"dictValue\":\"1\",\"dictType\":\"unit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'dict_code\' doesn\'t have a default value\r\n### The error may exist in com/ruoyi/system/mapper/SysDictDataMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.SysDictDataMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_dict_data  ( dict_sort, dict_label, dict_value, dict_type,  list_class,  status,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?,  ?,  ?,  ?, ?, ?, ? )\r\n### Cause: java.sql.SQLException: Field \'dict_code\' doesn\'t have a default value\n; Field \'dict_code\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'dict_code\' doesn\'t have a default value', '2022-12-14 16:48:49');
INSERT INTO `sys_oper_log` VALUES (1602948912451211265, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:49:36\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:49:36\",\"dictCode\":30,\"dictSort\":0,\"dictLabel\":\"行政机关\",\"dictValue\":\"1\",\"dictType\":\"unit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:49:37');
INSERT INTO `sys_oper_log` VALUES (1602949113878466561, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:50:24\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:50:24\",\"dictCode\":31,\"dictSort\":1,\"dictLabel\":\"代管仓库\",\"dictValue\":\"2\",\"dictType\":\"unit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:50:25');
INSERT INTO `sys_oper_log` VALUES (1602949568520048642, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:52:13\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:52:13\",\"dictCode\":32,\"dictSort\":2,\"dictLabel\":\"零售户\",\"dictValue\":\"3\",\"dictType\":\"unit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:52:13');
INSERT INTO `sys_oper_log` VALUES (1602949638636228610, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:52:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:52:29\",\"dictCode\":33,\"dictSort\":3,\"dictLabel\":\"执法科\",\"dictValue\":\"4\",\"dictType\":\"unit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:52:30');
INSERT INTO `sys_oper_log` VALUES (1602949724644626433, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:52:50\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:52:50\",\"dictCode\":34,\"dictSort\":4,\"dictLabel\":\"检验机构\",\"dictValue\":\"5\",\"dictType\":\"unit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:52:50');
INSERT INTO `sys_oper_log` VALUES (1602950331912736770, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:55:15\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:55:15\",\"dictId\":\"1602944877849501698\",\"dictName\":\"库位专属类型\",\"dictType\":\"exclusive_type\",\"status\":\"0\",\"remark\":\"库位专属类型 列表\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:55:15');
INSERT INTO `sys_oper_log` VALUES (1602951272154030081, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 16:58:59\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 16:58:59\",\"dictId\":\"1602944877849501699\",\"dictName\":\"库位类型\",\"dictType\":\"librarybit_type\",\"status\":\"0\",\"remark\":\"库位类型列表\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:58:59');
INSERT INTO `sys_oper_log` VALUES (1602951386562060289, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '', '/system/dict/type/1602944877849501699', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 16:59:27');
INSERT INTO `sys_oper_log` VALUES (1602951728997621762, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:00:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:00:48\",\"dictId\":\"1602944877849501700\",\"dictName\":\"库位类型\",\"dictType\":\"librarybit_type\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:00:48');
INSERT INTO `sys_oper_log` VALUES (1602952083814768642, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:02:12\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:02:12\",\"dictCode\":35,\"dictSort\":0,\"dictLabel\":\"商品专属\",\"dictValue\":\"1\",\"dictType\":\"exclusive_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:02:13');
INSERT INTO `sys_oper_log` VALUES (1602952130069553154, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:02:23\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:02:23\",\"dictCode\":36,\"dictSort\":1,\"dictLabel\":\"单位专属\",\"dictValue\":\"2\",\"dictType\":\"exclusive_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:02:24');
INSERT INTO `sys_oper_log` VALUES (1602952232813223937, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:02:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:02:48\",\"dictCode\":37,\"dictSort\":0,\"dictLabel\":\"货架型\",\"dictValue\":\"1\",\"dictType\":\"librarybit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:02:48');
INSERT INTO `sys_oper_log` VALUES (1602952283497193474, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:03:00\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:03:00\",\"dictCode\":38,\"dictSort\":1,\"dictLabel\":\"扁平型\",\"dictValue\":\"2\",\"dictType\":\"librarybit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:03:00');
INSERT INTO `sys_oper_log` VALUES (1602955263717957634, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:14:50\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:14:50\",\"dictId\":14,\"dictName\":\"商品类型\",\"dictType\":\"goods_type\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:14:51');
INSERT INTO `sys_oper_log` VALUES (1602955344131153921, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:15:10\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:15:10\",\"dictCode\":39,\"dictSort\":0,\"dictLabel\":\"烤烟型\",\"dictValue\":\"1\",\"dictType\":\"goods_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:15:10');
INSERT INTO `sys_oper_log` VALUES (1602955383951876098, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:15:19\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:15:19\",\"dictCode\":40,\"dictSort\":1,\"dictLabel\":\"混合型\",\"dictValue\":\"2\",\"dictType\":\"goods_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:15:20');
INSERT INTO `sys_oper_log` VALUES (1602955476713103362, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:15:41\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:15:41\",\"dictCode\":41,\"dictSort\":2,\"dictLabel\":\"外香型\",\"dictValue\":\"3\",\"dictType\":\"goods_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:15:42');
INSERT INTO `sys_oper_log` VALUES (1602955552915218434, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:15:59\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:15:59\",\"dictCode\":42,\"dictSort\":3,\"dictLabel\":\"雪茄型\",\"dictValue\":\"4\",\"dictType\":\"goods_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:16:00');
INSERT INTO `sys_oper_log` VALUES (1602955699359342593, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:16:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:16:34\",\"dictId\":15,\"dictName\":\"烟草商品规格\",\"dictType\":\"goods_specification\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:16:35');
INSERT INTO `sys_oper_log` VALUES (1602955823514935297, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:17:04\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:17:04\",\"dictCode\":43,\"dictSort\":0,\"dictLabel\":\"70mm\",\"dictValue\":\"1\",\"dictType\":\"goods_specification\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:17:04');
INSERT INTO `sys_oper_log` VALUES (1602955898299375618, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:17:22\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:17:22\",\"dictCode\":44,\"dictSort\":0,\"dictLabel\":\"75mm\",\"dictValue\":\"2\",\"dictType\":\"goods_specification\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:17:22');
INSERT INTO `sys_oper_log` VALUES (1602955972274315265, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:17:39\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:17:39\",\"dictCode\":45,\"dictSort\":0,\"dictLabel\":\"84mm\",\"dictValue\":\"3\",\"dictType\":\"goods_specification\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:17:40');
INSERT INTO `sys_oper_log` VALUES (1602958087658954754, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:26:04\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:26:04\",\"dictCode\":46,\"dictSort\":3,\"dictLabel\":\"85mm\",\"dictValue\":\"4\",\"dictType\":\"goods_specification\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:26:04');
INSERT INTO `sys_oper_log` VALUES (1602958164553129985, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:26:22\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:26:22\",\"dictCode\":47,\"dictSort\":4,\"dictLabel\":\"90mm\",\"dictValue\":\"5\",\"dictType\":\"goods_specification\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:26:23');
INSERT INTO `sys_oper_log` VALUES (1602958224368099329, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:26:36\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:26:36\",\"dictCode\":48,\"dictSort\":5,\"dictLabel\":\"95mm\",\"dictValue\":\"6\",\"dictType\":\"goods_specification\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:26:37');
INSERT INTO `sys_oper_log` VALUES (1602958274028658690, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:26:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:26:48\",\"dictCode\":49,\"dictSort\":6,\"dictLabel\":\"97mm\",\"dictValue\":\"7\",\"dictType\":\"goods_specification\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:26:49');
INSERT INTO `sys_oper_log` VALUES (1602958477657923586, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:27:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:27:37\",\"dictId\":16,\"dictName\":\"烟草商品计量单位\",\"dictType\":\"measure_unit\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:27:37');
INSERT INTO `sys_oper_log` VALUES (1602958580372234242, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:28:01\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:28:01\",\"dictCode\":50,\"dictSort\":0,\"dictLabel\":\"条\",\"dictValue\":\"1\",\"dictType\":\"measure_unit\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:28:02');
INSERT INTO `sys_oper_log` VALUES (1602958610831269889, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:28:09\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:28:09\",\"dictCode\":51,\"dictSort\":1,\"dictLabel\":\"盒\",\"dictValue\":\"2\",\"dictType\":\"measure_unit\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:28:09');
INSERT INTO `sys_oper_log` VALUES (1602958672978272257, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:28:23\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:28:23\",\"dictCode\":52,\"dictSort\":2,\"dictLabel\":\"包\",\"dictValue\":\"3\",\"dictType\":\"measure_unit\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:28:24');
INSERT INTO `sys_oper_log` VALUES (1602958719350497282, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:28:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:28:34\",\"dictCode\":53,\"dictSort\":3,\"dictLabel\":\"听\",\"dictValue\":\"4\",\"dictType\":\"measure_unit\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:28:35');
INSERT INTO `sys_oper_log` VALUES (1602958892063547393, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:29:16\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:29:16\",\"dictId\":17,\"dictName\":\"单条盒数\",\"dictType\":\"single_barbox_number\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:29:16');
INSERT INTO `sys_oper_log` VALUES (1602958931842326529, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:29:25\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:29:25\",\"dictCode\":54,\"dictSort\":0,\"dictLabel\":\"10\",\"dictValue\":\"1\",\"dictType\":\"single_barbox_number\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:29:26');
INSERT INTO `sys_oper_log` VALUES (1602958993095942145, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:29:40\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:29:40\",\"dictCode\":55,\"dictSort\":1,\"dictLabel\":\"5\",\"dictValue\":\"2\",\"dictType\":\"single_barbox_number\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:29:40');
INSERT INTO `sys_oper_log` VALUES (1602959031838728194, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:29:49\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:29:49\",\"dictCode\":56,\"dictSort\":2,\"dictLabel\":\"6\",\"dictValue\":\"3\",\"dictType\":\"single_barbox_number\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:29:49');
INSERT INTO `sys_oper_log` VALUES (1602959063686078465, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:29:56\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:29:56\",\"dictCode\":57,\"dictSort\":3,\"dictLabel\":\"1\",\"dictValue\":\"4\",\"dictType\":\"single_barbox_number\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:29:57');
INSERT INTO `sys_oper_log` VALUES (1602959377159970818, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:31:11\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:31:11\",\"dictId\":18,\"dictName\":\"小盒支数\",\"dictType\":\"small_box_number\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:31:12');
INSERT INTO `sys_oper_log` VALUES (1602959453773127682, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:31:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:31:29\",\"dictCode\":58,\"dictSort\":0,\"dictLabel\":\"10\",\"dictValue\":\"1\",\"dictType\":\"small_box_number\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:31:30');
INSERT INTO `sys_oper_log` VALUES (1602959482835460097, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:31:36\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:31:36\",\"dictCode\":59,\"dictSort\":1,\"dictLabel\":\"5\",\"dictValue\":\"2\",\"dictType\":\"small_box_number\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:31:37');
INSERT INTO `sys_oper_log` VALUES (1602959516545081346, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:31:44\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:31:44\",\"dictCode\":60,\"dictSort\":2,\"dictLabel\":\"6\",\"dictValue\":\"3\",\"dictType\":\"small_box_number\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:31:45');
INSERT INTO `sys_oper_log` VALUES (1602959547939446785, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:31:52\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:31:52\",\"dictCode\":61,\"dictSort\":3,\"dictLabel\":\"1\",\"dictValue\":\"4\",\"dictType\":\"small_box_number\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:31:52');
INSERT INTO `sys_oper_log` VALUES (1602959836083937282, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:31:30\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:33:01\",\"dictCode\":58,\"dictSort\":0,\"dictLabel\":\"20\",\"dictValue\":\"1\",\"dictType\":\"small_box_number\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:33:01');
INSERT INTO `sys_oper_log` VALUES (1602959874411487233, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:31:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:33:10\",\"dictCode\":59,\"dictSort\":1,\"dictLabel\":\"16\",\"dictValue\":\"2\",\"dictType\":\"small_box_number\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:33:10');
INSERT INTO `sys_oper_log` VALUES (1602959885983571969, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', '', '/system/dict/data/60', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:33:13');
INSERT INTO `sys_oper_log` VALUES (1602960046038212610, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:33:51\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:33:51\",\"dictId\":19,\"dictName\":\"包装形式\",\"dictType\":\"packaging_forms\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:33:51');
INSERT INTO `sys_oper_log` VALUES (1602960177953267713, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:34:22\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:34:22\",\"dictCode\":62,\"dictSort\":0,\"dictLabel\":\"条盒硬盒\",\"dictValue\":\"1\",\"dictType\":\"packaging_forms\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:34:23');
INSERT INTO `sys_oper_log` VALUES (1602960223167864833, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:34:33\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:34:33\",\"dictCode\":63,\"dictSort\":1,\"dictLabel\":\"条盒软盒\",\"dictValue\":\"2\",\"dictType\":\"packaging_forms\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:34:33');
INSERT INTO `sys_oper_log` VALUES (1602960257548574721, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:34:41\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:34:41\",\"dictCode\":64,\"dictSort\":2,\"dictLabel\":\"木盒\",\"dictValue\":\"3\",\"dictType\":\"packaging_forms\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:34:42');
INSERT INTO `sys_oper_log` VALUES (1602960323734691842, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:34:57\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:34:57\",\"dictCode\":65,\"dictSort\":3,\"dictLabel\":\"听盒\",\"dictValue\":\"4\",\"dictType\":\"packaging_forms\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:34:57');
INSERT INTO `sys_oper_log` VALUES (1602960604644007938, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:36:04\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:36:04\",\"dictId\":20,\"dictName\":\"商品上市状态\",\"dictType\":\"listing_status\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:36:04');
INSERT INTO `sys_oper_log` VALUES (1602960743718739970, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:36:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:36:37\",\"dictCode\":66,\"dictSort\":0,\"dictLabel\":\"0\",\"dictValue\":\"已上市\",\"dictType\":\"listing_status\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:36:38');
INSERT INTO `sys_oper_log` VALUES (1602960807719624706, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:36:52\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:36:52\",\"dictCode\":67,\"dictSort\":1,\"dictLabel\":\"未上市\",\"dictValue\":\"1\",\"dictType\":\"listing_status\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:36:53');
INSERT INTO `sys_oper_log` VALUES (1602960900413743105, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:37:14\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:37:14\",\"dictCode\":68,\"dictSort\":2,\"dictLabel\":\"已退市\",\"dictValue\":\"2\",\"dictType\":\"listing_status\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:37:15');
INSERT INTO `sys_oper_log` VALUES (1602960949621317633, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:36:38\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:37:26\",\"dictCode\":66,\"dictSort\":0,\"dictLabel\":\"已上市\",\"dictValue\":\"0\",\"dictType\":\"listing_status\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:37:27');
INSERT INTO `sys_oper_log` VALUES (1602961259278393346, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:38:40\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:38:40\",\"dictId\":21,\"dictName\":\"库区类型\",\"dictType\":\"libraryarea_type\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:38:40');
INSERT INTO `sys_oper_log` VALUES (1602962188698411010, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:42:22\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:42:22\",\"dictCode\":69,\"dictSort\":0,\"dictLabel\":\"暂存\",\"dictValue\":\"1\",\"dictType\":\"libraryarea_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:42:22');
INSERT INTO `sys_oper_log` VALUES (1602962235641061377, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:42:33\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:42:33\",\"dictCode\":70,\"dictSort\":1,\"dictLabel\":\"代管\",\"dictValue\":\"2\",\"dictType\":\"libraryarea_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:42:33');
INSERT INTO `sys_oper_log` VALUES (1602962337835278337, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:42:57\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:42:57\",\"dictCode\":71,\"dictSort\":2,\"dictLabel\":\"罚没\",\"dictValue\":\"3\",\"dictType\":\"libraryarea_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:42:58');
INSERT INTO `sys_oper_log` VALUES (1602962447923175426, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-14 17:43:23\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-14 17:43:23\",\"dictCode\":72,\"dictSort\":3,\"dictLabel\":\"罚没代管\",\"dictValue\":\"4\",\"dictType\":\"libraryarea_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:43:24');
INSERT INTO `sys_oper_log` VALUES (1602963936091594754, '登录日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'DELETE', 1, 'admin', '', '/monitor/logininfor/1602847291847340033,1602847264055881729,1602847234607673345,1602846879660503042,1602846696256172033,1602846677696376833,1602846649703591938,1602846068708601857,1602846047770636289,1602846000186257410', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:49:19');
INSERT INTO `sys_oper_log` VALUES (1602963963161632769, '登录日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'DELETE', 1, 'admin', '', '/monitor/logininfor/1602852494034096129,1602852187183017985,1602852139175014402,1602851456233271298,1602851442958299138,1602850099241709570,1602849784534691842,1602849742474211330,1602849701806239746,1602849671242346498', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-14 17:49:25');
INSERT INTO `sys_oper_log` VALUES (1606902694667120642, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-25 14:40:31\",\"postId\":2,\"postCode\":\"se\",\"postName\":\"项目经理\",\"postSort\":2,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-25 14:40:32');
INSERT INTO `sys_oper_log` VALUES (1606902912171143170, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '', '/system/config', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-25 14:41:23\",\"configId\":4,\"configName\":\"账号自助-验证码开关\",\"configKey\":\"sys.account.captchaEnabled\",\"configValue\":\"true\",\"configType\":\"N\",\"remark\":\"是否开启验证码功能（true开启，false关闭）\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-25 14:41:24');
INSERT INTO `sys_oper_log` VALUES (1606909652031827970, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '', '/system/config', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-25 15:08:10\",\"configId\":4,\"configName\":\"账号自助-验证码开关\",\"configKey\":\"sys.account.captchaEnabled\",\"configValue\":\"false\",\"configType\":\"Y\",\"remark\":\"是否开启验证码功能（true开启，false关闭）\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-25 15:08:11');
INSERT INTO `sys_oper_log` VALUES (1607209260071002114, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"bs_brand_manage\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 10:58:43');
INSERT INTO `sys_oper_log` VALUES (1607209286931324930, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_brand_manage\"}', '', 0, '', '2022-12-26 10:58:49');
INSERT INTO `sys_oper_log` VALUES (1607209796480540673, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 11:00:50\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1607209259739652098\",\"tableName\":\"bs_brand_manage\",\"tableComment\":\"品牌管理/品牌详细信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsBrandManage\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.system\",\"moduleName\":\"system\",\"businessName\":\"brandManage\",\"functionName\":\"品牌管理/品牌详细信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 10:58:43\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 11:00:50\",\"columnId\":\"1607209259869675521\",\"tableId\":\"1607209259739652098\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"usableColumn\":false,\"pk\":true,\"insert\":false,\"edit\":true,\"superColumn\":false,\"required\":true,\"list\":true,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 10:58:43\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 11:00:50\",\"columnId\":\"1607209259869675522\",\"tableId\":\"1607209259739652098\",\"columnName\":\"brand_coded\",\"columnComment\":\"品牌编号\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"brandCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"usableColumn\":false,\"pk\":false,\"insert\":true,\"edit\":true,\"superColumn\":false,\"required\":true,\"list\":true,\"increment\":false,\"query\":true,\"capJavaField\":\"BrandCoded\"},{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 10:58:43\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 11:00:50\",\"columnId\":\"1607209259869675523\",\"tableId\":\"1607209259739652098\",\"columnName\":\"brand_name\",\"columnComment\":\"品牌名称\",\"column', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 11:00:51');
INSERT INTO `sys_oper_log` VALUES (1607209806957912065, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_brand_manage\"}', '', 0, '', '2022-12-26 11:00:53');
INSERT INTO `sys_oper_log` VALUES (1607253171518935041, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 13:53:12\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 13:53:12\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1607253171451826178\",\"menuName\":\"基础数据管理\",\"orderNum\":1,\"path\":\"base\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"table\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 13:53:12');
INSERT INTO `sys_oper_log` VALUES (1607253240318103554, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 13:53:28\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":1,\"menuName\":\"系统管理\",\"orderNum\":2,\"path\":\"system\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"system\",\"remark\":\"系统管理目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 13:53:28');
INSERT INTO `sys_oper_log` VALUES (1607253939877679107, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 13:56:15\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 13:56:15\",\"parentName\":null,\"parentId\":\"1607253171451826178\",\"children\":[],\"menuId\":\"1607253939877679106\",\"menuName\":\"品牌管理\",\"orderNum\":1,\"path\":\"BrandManage\",\"component\":\"base/brandManage/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 13:56:15');
INSERT INTO `sys_oper_log` VALUES (1607254440610467841, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 13:56:15\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 13:58:14\",\"parentName\":null,\"parentId\":\"1607253171451826178\",\"children\":[],\"menuId\":\"1607253939877679106\",\"menuName\":\"品牌管理\",\"orderNum\":1,\"path\":\"BrandManage\",\"component\":\"base/brandManage/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:brandManage:list\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 13:58:15');
INSERT INTO `sys_oper_log` VALUES (1607260591775387649, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"brandCoded\":123,\"brandName\":\"黄金叶\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in com/ruoyi/baseManagement/mapper/BsBrandManageMapper.java (best guess)\r\n### The error may involve com.ruoyi.baseManagement.mapper.BsBrandManageMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bs_brand_manage  ( id, brand_coded, brand_name, brand_locality, brand_enabled, remark, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2022-12-26 14:22:41');
INSERT INTO `sys_oper_log` VALUES (1607261406275670019, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"brandCoded\":123,\"brandName\":\"黄金叶\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\r\n### The error may exist in com/ruoyi/baseManagement/mapper/BsBrandManageMapper.java (best guess)\r\n### The error may involve com.ruoyi.baseManagement.mapper.BsBrandManageMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bs_brand_manage  ( id, brand_coded, brand_name, brand_locality, brand_enabled, remark, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'', '2022-12-26 14:25:55');
INSERT INTO `sys_oper_log` VALUES (1607261577369718787, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"brandCoded\":123,\"brandName\":\"黄金叶\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\r\n### The error may exist in com/ruoyi/baseManagement/mapper/BsBrandManageMapper.java (best guess)\r\n### The error may involve com.ruoyi.baseManagement.mapper.BsBrandManageMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bs_brand_manage  ( id, brand_coded, brand_name, brand_locality, brand_enabled, remark, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'', '2022-12-26 14:26:36');
INSERT INTO `sys_oper_log` VALUES (1607262186151972867, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"brandCoded\":123,\"brandName\":\"黄金叶\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\r\n### The error may exist in com/ruoyi/baseManagement/mapper/BsBrandManageMapper.java (best guess)\r\n### The error may involve com.ruoyi.baseManagement.mapper.BsBrandManageMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bs_brand_manage  ( id, brand_coded, brand_name, brand_locality, brand_enabled, remark, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'', '2022-12-26 14:29:01');
INSERT INTO `sys_oper_log` VALUES (1607263025314775041, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"brandCoded\":123,\"brandName\":\"黄金叶\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\r\n### The error may exist in com/ruoyi/baseManagement/mapper/BsBrandManageMapper.java (best guess)\r\n### The error may involve com.ruoyi.baseManagement.mapper.BsBrandManageMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bs_brand_manage  ( id, brand_coded, brand_name, brand_locality, brand_enabled, remark, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'', '2022-12-26 14:32:21');
INSERT INTO `sys_oper_log` VALUES (1607263522318786561, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1607263522180374529\",\"brandCoded\":123,\"brandName\":\"黄金叶\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 14:34:20');
INSERT INTO `sys_oper_log` VALUES (1607264489323962369, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 14:38:10\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":4,\"menuName\":\"PLUS官网\",\"orderNum\":4,\"path\":\"https://gitee.com/JavaLionLi/RuoYi-Vue-Plus\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"1\",\"perms\":\"\",\"icon\":\"guide\",\"remark\":\"RuoYi-Vue-Plus官网地址\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 14:38:10');
INSERT INTO `sys_oper_log` VALUES (1607266860351430659, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1607266860351430658\",\"brandCoded\":123,\"brandName\":\"黄金叶\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 14:47:36');
INSERT INTO `sys_oper_log` VALUES (1607268546058924033, '品牌管理/品牌详细信息', 3, 'com.ruoyi.base.controller.BsBrandManageController.remove()', 'DELETE', 1, 'admin', '', '/base/brandManage/1607266860351430658', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 14:54:18');
INSERT INTO `sys_oper_log` VALUES (1607268650199298049, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1607266860351430659\",\"brandCoded\":123,\"brandName\":\"黄金叶\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 14:54:42');
INSERT INTO `sys_oper_log` VALUES (1607268981054386178, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":3,\"brandCoded\":132,\"brandName\":\"黄金叶\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 14:56:01');
INSERT INTO `sys_oper_log` VALUES (1607269135157309442, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":4,\"brandCoded\":234,\"brandName\":\"黄鹤楼\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 14:56:38');
INSERT INTO `sys_oper_log` VALUES (1607271472236081153, '品牌管理/品牌详细信息', 3, 'com.ruoyi.base.controller.BsBrandManageController.remove()', 'DELETE', 1, 'admin', '', '/base/brandManage/1,2', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 15:05:55');
INSERT INTO `sys_oper_log` VALUES (1607278749751980034, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":5,\"brandCoded\":123,\"brandName\":\"黄金叶\",\"brandLocality\":\"河南\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 15:34:50');
INSERT INTO `sys_oper_log` VALUES (1607280156848697345, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/1607209259739652098', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 15:40:26');
INSERT INTO `sys_oper_log` VALUES (1607280205485846530, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"bs_brand_manage,bs_dealingsunit_info,bs_goods_info,bs_wh_bit_info,bs_wh_area_info,bs_warehouse_info\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 15:40:37');
INSERT INTO `sys_oper_log` VALUES (1607286910923845634, '品牌管理/品牌详细信息', 5, 'com.ruoyi.base.controller.BsBrandManageController.export()', 'POST', 1, 'admin', '', '/base/brandManage/export', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"brandCoded\":null,\"brandName\":null,\"brandLocality\":null,\"brandEnabled\":null,\"remark\":null}', '', 1, 'Invalid char (/) found at index (4) in sheet name \'品牌管理/品牌详细信息\'', '2022-12-26 16:07:16');
INSERT INTO `sys_oper_log` VALUES (1607287343859986433, '品牌管理/品牌详细信息', 5, 'com.ruoyi.base.controller.BsBrandManageController.export()', 'POST', 1, 'admin', '', '/base/brandManage/export', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"brandCoded\":null,\"brandName\":null,\"brandLocality\":null,\"brandEnabled\":null,\"remark\":null}', '', 1, 'Invalid char (/) found at index (4) in sheet name \'品牌管理/品牌详细信息\'', '2022-12-26 16:08:59');
INSERT INTO `sys_oper_log` VALUES (1607287934896058369, '品牌管理/品牌详细信息', 5, 'com.ruoyi.base.controller.BsBrandManageController.export()', 'POST', 1, 'admin', '', '/base/brandManage/export', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"brandCoded\":null,\"brandName\":null,\"brandLocality\":null,\"brandEnabled\":null,\"remark\":null}', '', 0, '', '2022-12-26 16:11:20');
INSERT INTO `sys_oper_log` VALUES (1607306004200960001, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 17:23:08\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1607280205032861709\",\"tableName\":\"bs_goods_info\",\"tableComment\":\"商品信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsGoodsInfo\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.system\",\"moduleName\":\"system\",\"businessName\":\"goodsInfo\",\"functionName\":\"商品信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 15:40:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 17:23:08\",\"columnId\":\"1607280205091581953\",\"tableId\":\"1607280205032861709\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"superColumn\":false,\"edit\":true,\"usableColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 15:40:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 17:23:08\",\"columnId\":\"1607280205091581954\",\"tableId\":\"1607280205032861709\",\"columnName\":\"goods_coded\",\"columnComment\":\"商品编码\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"goodsCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"capJavaField\":\"GoodsCoded\",\"query\":true,\"increment\":false,\"required\":true,\"list\":true,\"pk\":false,\"insert\":true,\"superColumn\":false,\"edit\":true,\"usableColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 15:40:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 17:23:08\",\"columnId\":\"1607280205091581955\",\"tableId\":\"1607280205032861709\",\"columnName\":\"goods_name\",\"columnComment\":\"商品名称\",\"columnType\":\"varchar(100)\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 17:23:08');
INSERT INTO `sys_oper_log` VALUES (1607306195993899009, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 17:23:54\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1607280205032861709\",\"tableName\":\"bs_goods_info\",\"tableComment\":\"商品信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsGoodsInfo\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.base\",\"moduleName\":\"base\",\"businessName\":\"goodsInfo\",\"functionName\":\"商品信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 15:40:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 17:23:54\",\"columnId\":\"1607280205091581953\",\"tableId\":\"1607280205032861709\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"superColumn\":false,\"edit\":true,\"usableColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 15:40:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 17:23:54\",\"columnId\":\"1607280205091581954\",\"tableId\":\"1607280205032861709\",\"columnName\":\"goods_coded\",\"columnComment\":\"商品编码\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"goodsCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"capJavaField\":\"GoodsCoded\",\"query\":true,\"increment\":false,\"required\":true,\"list\":true,\"pk\":false,\"insert\":true,\"superColumn\":false,\"edit\":true,\"usableColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 15:40:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 17:23:54\",\"columnId\":\"1607280205091581955\",\"tableId\":\"1607280205032861709\",\"columnName\":\"goods_name\",\"columnComment\":\"商品名称\",\"columnType\":\"varchar(100)\",\"ja', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 17:23:54');
INSERT INTO `sys_oper_log` VALUES (1607306216181084161, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_goods_info\"}', '', 0, '', '2022-12-26 17:23:59');
INSERT INTO `sys_oper_log` VALUES (1607308715541671937, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 17:33:54\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 17:33:54\",\"parentName\":null,\"parentId\":\"1607253171451826178\",\"children\":[],\"menuId\":\"1607308715482951682\",\"menuName\":\"商品信息\",\"orderNum\":2,\"path\":\"base/goodsInfo/index\",\"component\":\"GoodsInfo\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"base:goodsInfo:list\",\"icon\":\"shopping\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 17:33:55');
INSERT INTO `sys_oper_log` VALUES (1607308856621281281, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 17:33:55\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 17:34:28\",\"parentName\":null,\"parentId\":\"1607253171451826178\",\"children\":[],\"menuId\":\"1607308715482951682\",\"menuName\":\"商品信息\",\"orderNum\":2,\"path\":\"GoodsInfo\",\"component\":\"base/goodsInfo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"base:goodsInfo:list\",\"icon\":\"shopping\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 17:34:28');
INSERT INTO `sys_oper_log` VALUES (1607316222423085058, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 18:03:44\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1607280205032861709\",\"tableName\":\"bs_goods_info\",\"tableComment\":\"商品信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsGoodsInfo\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.base\",\"moduleName\":\"base\",\"businessName\":\"goodsInfo\",\"functionName\":\"商品信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 15:40:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 18:03:44\",\"columnId\":\"1607280205091581953\",\"tableId\":\"1607280205032861709\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"list\":true,\"required\":true,\"insert\":false,\"pk\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 15:40:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 18:03:44\",\"columnId\":\"1607280205091581954\",\"tableId\":\"1607280205032861709\",\"columnName\":\"goods_coded\",\"columnComment\":\"商品编码\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"goodsCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"list\":true,\"required\":true,\"insert\":true,\"pk\":false,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"GoodsCoded\"},{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 15:40:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-26 18:03:44\",\"columnId\":\"1607280205091581955\",\"tableId\":\"1607280205032861709\",\"columnName\":\"goods_name\",\"columnComment\":\"商品名称\",\"columnType\":\"varchar(100)\",\"ja', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-26 18:03:45');
INSERT INTO `sys_oper_log` VALUES (1607316239783309313, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_goods_info\"}', '', 0, '', '2022-12-26 18:03:49');
INSERT INTO `sys_oper_log` VALUES (1607663365411340290, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/1607280204697317378,1607280204961558529,1607280205032861709,1607280205162885122,1607280205225799688,1607280205292908555', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-27 17:03:10');
INSERT INTO `sys_oper_log` VALUES (1607663443056295937, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"check_task_info,check_perfomance_info,wm_put_sampling,wm_put_punish_confiscate,wm_put_info,wm_put_ temporary,wm_out_type_field,wm_out_temporary,wm_out_sampling,wm_out_punish_confiscate\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-27 17:03:28');
INSERT INTO `sys_oper_log` VALUES (1607663558391267329, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"wm_out_info,wm_out_escrow,bs_wh_bit_info,bs_wh_area_info,bs_warehouse_info,bs_dealingsunit_info,bs_goods_info,bs_brand_manage,wm_put_escrow,wm_put_type_field\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-27 17:03:56');
INSERT INTO `sys_oper_log` VALUES (1607663721247703044, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"wm_put2_info,sys_dict_type,sys_dict_data,sys_config,sys_dept,sys_logininfor,sys_menu,sys_notice,sys_oper_log,sys_oss\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-27 17:04:35');
INSERT INTO `sys_oper_log` VALUES (1607663737475465217, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"sys_oss_config,sys_post,sys_role,sys_role_dept,sys_role_menu,sys_user,sys_user_post,sys_user_role\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-27 17:04:39');
INSERT INTO `sys_oper_log` VALUES (1607663774125293569, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/1607663737144115202,1607663737215418379,1607663737274138625,1607663737274138640,1607663737341247491,1607663737341247494,1607663737408356354,1607663737408356357', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-27 17:04:47');
INSERT INTO `sys_oper_log` VALUES (1607664925973446658, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_brand_manage\"}', '', 0, '', '2022-12-27 17:09:22');
INSERT INTO `sys_oper_log` VALUES (1607665491030081537, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_goods_info\"}', '', 0, '', '2022-12-27 17:11:37');
INSERT INTO `sys_oper_log` VALUES (1608651340492341249, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":6,\"brandCoded\":1234,\"brandName\":\"测试\",\"brandLocality\":\"测试\",\"brandEnabled\":\"0\",\"remark\":\"正常\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-30 10:29:02');
INSERT INTO `sys_oper_log` VALUES (1608726795970945026, '商品信息', 1, 'com.ruoyi.base.controller.BsGoodsInfoController.add()', 'POST', 1, 'admin', '', '/base/goodsInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1608726795849310210\",\"goodsCoded\":1,\"goodsName\":\"1\",\"brandName\":\"测试\",\"brandCoded\":1234,\"smallBoxBarcode\":\"1\",\"barboxBarcode\":\"1\",\"goodsType\":\"2\",\"goodsSpecification\":\"1\",\"measureUnit\":\"1\",\"singleBarboxNumber\":\"1\",\"smallBoxNumber\":\"1\",\"singleBoxPrice\":\"1\",\"barboxPrice\":\"1\",\"barboxWholesalePrices\":\"1\",\"packagingForms\":\"1\",\"listingStatus\":\"0\",\"tarContent\":\"1\",\"smokeNicotine\":\"1\",\"monoxideCarbon\":\"1\",\"remark\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-30 15:28:52');
INSERT INTO `sys_oper_log` VALUES (1608727825529970690, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1608727825458667521\",\"brandCoded\":123456,\"brandName\":\"测试01\",\"brandLocality\":\"测试1\",\"brandEnabled\":\"0\",\"remark\":\"3\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-30 15:32:57');
INSERT INTO `sys_oper_log` VALUES (1608727844752465922, '品牌管理/品牌详细信息', 3, 'com.ruoyi.base.controller.BsBrandManageController.remove()', 'DELETE', 1, 'admin', '', '/base/brandManage/1608727825458667521', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-30 15:33:02');
INSERT INTO `sys_oper_log` VALUES (1608732437691506689, '商品信息', 1, 'com.ruoyi.base.controller.BsGoodsInfoController.add()', 'POST', 1, 'admin', '', '/base/goodsInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1608732437632786434\",\"goodsCoded\":321,\"goodsName\":\"ce\",\"brandName\":\"黄金叶\",\"brandCoded\":123,\"smallBoxBarcode\":\"ce\",\"barboxBarcode\":\"ce\",\"goodsType\":\"1\",\"goodsSpecification\":\"2\",\"measureUnit\":\"1\",\"singleBarboxNumber\":\"1\",\"smallBoxNumber\":\"1\",\"singleBoxPrice\":\"10\",\"barboxPrice\":\"10\",\"barboxWholesalePrices\":\"10\",\"packagingForms\":\"1\",\"listingStatus\":\"0\",\"tarContent\":\"10\",\"smokeNicotine\":\"10\",\"monoxideCarbon\":\"10\",\"remark\":\"ce\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-30 15:51:17');
INSERT INTO `sys_oper_log` VALUES (1608733885099708417, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 15:57:01\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1607663557997002770\",\"tableName\":\"bs_warehouse_info\",\"tableComment\":\"仓库管理\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsWarehouseInfo\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.system\",\"moduleName\":\"system\",\"businessName\":\"warehouseInfo\",\"functionName\":\"仓库管理\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 17:03:56\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 15:57:01\",\"columnId\":\"1607663558059917313\",\"tableId\":\"1607663557997002770\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":false,\"usableColumn\":false,\"insert\":false,\"superColumn\":false,\"edit\":false,\"pk\":true,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 17:03:56\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 15:57:01\",\"columnId\":\"1607663558059917314\",\"tableId\":\"1607663557997002770\",\"columnName\":\"warehouse_coded\",\"columnComment\":\"仓库编号\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"warehouseCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"usableColumn\":false,\"insert\":true,\"superColumn\":false,\"edit\":true,\"pk\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"WarehouseCoded\"},{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 17:03:56\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 15:57:01\",\"columnId\":\"1607663558059917315\",\"tableId\":\"1607663557997002770\",\"columnName\":\"warehouse_name\",\"columnComment\":\"仓库名称\",', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-30 15:57:02');
INSERT INTO `sys_oper_log` VALUES (1608733929802600450, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_warehouse_info\"}', '', 0, '', '2022-12-30 15:57:12');
INSERT INTO `sys_oper_log` VALUES (1608748139882291201, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 16:53:40\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":1606},\"tableId\":\"1607663558059917326\",\"tableName\":\"bs_wh_area_info\",\"tableComment\":\"库区信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsWhAreaInfo\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.base\",\"moduleName\":\"base\",\"businessName\":\"whAreaInfo\",\"functionName\":\"库区信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 17:03:56\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 16:53:40\",\"columnId\":\"1607663558122831874\",\"tableId\":\"1607663558059917326\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":false,\"pk\":true,\"edit\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":false,\"capJavaField\":\"Id\",\"increment\":true,\"query\":false},{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 17:03:56\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 16:53:40\",\"columnId\":\"1607663558122831875\",\"tableId\":\"1607663558059917326\",\"columnName\":\"wh_area_coded\",\"columnComment\":\"库区编号\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"whAreaCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"capJavaField\":\"WhAreaCoded\",\"increment\":false,\"query\":true},{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 17:03:56\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 16:53:40\",\"columnId\":\"1607663558122831876\",\"tableId\":\"1607663558059917326\",\"columnName\":\"wh_area_name\",\"columnComment\":\"库区名称\",\"columnType\":\"varchar(', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-30 16:53:40');
INSERT INTO `sys_oper_log` VALUES (1608748165450768385, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_wh_area_info\"}', '', 0, '', '2022-12-30 16:53:46');
INSERT INTO `sys_oper_log` VALUES (1608751487284948993, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 17:06:58\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":1606},\"tableId\":\"1607663558122831886\",\"tableName\":\"bs_wh_bit_info\",\"tableComment\":\"库位信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsWhBitInfo\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.base\",\"moduleName\":\"base\",\"businessName\":\"whBitInfo\",\"functionName\":\"库位信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 17:03:56\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 17:06:58\",\"columnId\":\"1607663558122831887\",\"tableId\":\"1607663558122831886\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"pk\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 17:03:56\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 17:06:58\",\"columnId\":\"1607663558122831888\",\"tableId\":\"1607663558122831886\",\"columnName\":\"wh_bit_coded\",\"columnComment\":\"库位编号\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"whBitCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"insert\":true,\"pk\":false,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"WhBitCoded\"},{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 17:03:56\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 17:06:58\",\"columnId\":\"1607663558122831889\",\"tableId\":\"1607663558122831886\",\"columnName\":\"wh_bit_name\",\"columnComment\":\"库位名称\",\"columnType\":\"varchar(50)\",\"jav', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-12-30 17:06:58');
INSERT INTO `sys_oper_log` VALUES (1608751505932824577, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_wh_bit_info\"}', '', 0, '', '2022-12-30 17:07:03');
INSERT INTO `sys_oper_log` VALUES (1609779792125652993, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 13:13:05.322\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 13:13:05.322\",\"dictId\":22,\"dictName\":\"仓库类型\",\"dictType\":\"warehouse_type\",\"status\":\"0\",\"remark\":\"仓库类型\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 13:13:05');
INSERT INTO `sys_oper_log` VALUES (1609779899306897409, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 13:13:30.912\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 13:13:30.912\",\"dictCode\":73,\"dictSort\":0,\"dictLabel\":\"暂存\",\"dictValue\":\"1\",\"dictType\":\"warehouse_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 13:13:31');
INSERT INTO `sys_oper_log` VALUES (1609779933058461697, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 13:13:38.964\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 13:13:38.964\",\"dictCode\":74,\"dictSort\":1,\"dictLabel\":\"代管\",\"dictValue\":\"2\",\"dictType\":\"warehouse_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 13:13:39');
INSERT INTO `sys_oper_log` VALUES (1609779996568612865, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 13:13:54.106\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 13:13:54.106\",\"dictCode\":75,\"dictSort\":2,\"dictLabel\":\"罚没\",\"dictValue\":\"2\",\"dictType\":\"warehouse_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 13:13:54');
INSERT INTO `sys_oper_log` VALUES (1609780070145093634, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 13:14:11.646\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 13:14:11.646\",\"dictCode\":76,\"dictSort\":2,\"dictLabel\":\"罚没代管\",\"dictValue\":\"3\",\"dictType\":\"warehouse_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 13:14:12');
INSERT INTO `sys_oper_log` VALUES (1609780091913531394, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 13:14:12.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 13:14:16.826\",\"dictCode\":76,\"dictSort\":3,\"dictLabel\":\"罚没代管\",\"dictValue\":\"3\",\"dictType\":\"warehouse_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 13:14:17');
INSERT INTO `sys_oper_log` VALUES (1609782865506103298, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 13:13:54.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 13:25:18.095\",\"dictCode\":75,\"dictSort\":2,\"dictLabel\":\"罚没\",\"dictValue\":\"3\",\"dictType\":\"warehouse_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 13:25:18');
INSERT INTO `sys_oper_log` VALUES (1609782899056340993, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 13:14:12.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 13:25:26.110\",\"dictCode\":76,\"dictSort\":3,\"dictLabel\":\"罚没代管\",\"dictValue\":\"4\",\"dictType\":\"warehouse_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 13:25:26');
INSERT INTO `sys_oper_log` VALUES (1609803395512717314, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-30 16:00:00.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 14:46:52.782\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":\"1608733927793528832\",\"menuName\":\"仓库管理\",\"orderNum\":3,\"path\":\"warehouseInfo\",\"component\":\"base/warehouseInfo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:warehouseInfo:list\",\"icon\":\"#\",\"remark\":\"仓库管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 14:46:53');
INSERT INTO `sys_oper_log` VALUES (1609803457710051330, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-30 16:54:36.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 14:47:07.666\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":\"1608748164804845568\",\"menuName\":\"库区信息\",\"orderNum\":4,\"path\":\"whAreaInfo\",\"component\":\"base/whAreaInfo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"base:whAreaInfo:list\",\"icon\":\"#\",\"remark\":\"库区信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 14:47:08');
INSERT INTO `sys_oper_log` VALUES (1609803485363097601, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-30 17:18:53.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 14:47:14.262\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":\"1608751504154439680\",\"menuName\":\"库位信息\",\"orderNum\":5,\"path\":\"whBitInfo\",\"component\":\"base/whBitInfo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"base:whBitInfo:list\",\"icon\":\"#\",\"remark\":\"库位信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 14:47:14');
INSERT INTO `sys_oper_log` VALUES (1609819527514738690, '商品信息', 2, 'com.ruoyi.base.controller.BsGoodsInfoController.edit()', 'PUT', 1, 'admin', '', '/base/goodsInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-30 15:51:16.606\",\"updateBy\":\"admin\",\"updateTime\":\"2022-12-30 15:51:16.606\",\"id\":\"1608732437632786434\",\"goodsCoded\":321,\"goodsName\":\"ce\",\"brandName\":\"黄金叶\",\"brandCoded\":123,\"smallBoxBarcode\":\"ce\",\"barboxBarcode\":\"ce\",\"goodsType\":\"1\",\"goodsSpecification\":\"2\",\"measureUnit\":\"1\",\"singleBarboxNumber\":\"1\",\"smallBoxNumber\":\"1\",\"singleBoxPrice\":\"10.00\",\"barboxPrice\":\"10.00\",\"barboxWholesalePrices\":\"10.00\",\"packagingForms\":\"1\",\"listingStatus\":\"0\",\"tarContent\":\"10\",\"smokeNicotine\":\"10\",\"monoxideCarbon\":\"10\",\"remark\":\"ce\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 15:50:59');
INSERT INTO `sys_oper_log` VALUES (1609819730057678849, '仓库管理', 1, 'com.ruoyi.base.controller.BsWarehouseInfoController.add()', 'POST', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"warehouseCoded\":132,\"warehouseName\":\"测试\",\"warehouseType\":\"1\",\"warehouseOrganization\":null,\"warehouseAddress\":\"青岛大学\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'warehouse_organization\' doesn\'t have a default value\r\n### The error may exist in com/ruoyi/base/mapper/BsWarehouseInfoMapper.java (best guess)\r\n### The error may involve com.ruoyi.base.mapper.BsWarehouseInfoMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bs_warehouse_info  ( id, warehouse_coded, warehouse_name, warehouse_type,  warehouse_address, warehouse_principal, warehouse_enabled, remark, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLException: Field \'warehouse_organization\' doesn\'t have a default value\n; Field \'warehouse_organization\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'warehouse_organization\' doesn\'t have a default value', '2023-01-02 15:51:47');
INSERT INTO `sys_oper_log` VALUES (1609819919392755714, '仓库管理', 1, 'com.ruoyi.base.controller.BsWarehouseInfoController.add()', 'POST', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1609819919325646849\",\"warehouseCoded\":132,\"warehouseName\":\"测试\",\"warehouseType\":\"1\",\"warehouseOrganization\":null,\"warehouseAddress\":\"青岛大学\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 15:52:32');
INSERT INTO `sys_oper_log` VALUES (1609819937583452162, '仓库管理', 2, 'com.ruoyi.base.controller.BsWarehouseInfoController.edit()', 'PUT', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 15:52:32.442\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 15:52:32.442\",\"id\":\"1609819919325646849\",\"warehouseCoded\":132,\"warehouseName\":\"测试\",\"warehouseType\":\"1\",\"warehouseOrganization\":null,\"warehouseAddress\":\"青岛大学\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 15:52:37');
INSERT INTO `sys_oper_log` VALUES (1609833143194406914, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/1607663558059917326,1607663558122831886', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 16:45:05');
INSERT INTO `sys_oper_log` VALUES (1609833178363645954, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"bs_wh_bit_info,bs_wh_area_info\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 16:45:14');
INSERT INTO `sys_oper_log` VALUES (1609834776137617410, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:51:34.546\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1609833178040684545\",\"tableName\":\"bs_wh_area_info\",\"tableComment\":\"库区信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsWhAreaInfo\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.base\",\"moduleName\":\"whAreaInfo\",\"businessName\":\"whAreaInfo\",\"functionName\":\"库区信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 16:45:14.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:51:34.549\",\"columnId\":\"1609833178166513665\",\"tableId\":\"1609833178040684545\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"superColumn\":false,\"insert\":false,\"usableColumn\":false,\"edit\":true,\"pk\":true,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 16:45:14.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:51:34.551\",\"columnId\":\"1609833178166513666\",\"tableId\":\"1609833178040684545\",\"columnName\":\"wh_area_coded\",\"columnComment\":\"库区编号\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"whAreaCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"superColumn\":false,\"insert\":true,\"usableColumn\":false,\"edit\":true,\"pk\":false,\"increment\":false,\"query\":false,\"capJavaField\":\"WhAreaCoded\"},{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 16:45:14.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:51:34.551\",\"columnId\":\"1609833178166513667\",\"tableId\":\"1609833178040684545\",\"columnName\":\"wh_area_name\",\"columnComme', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 16:51:35');
INSERT INTO `sys_oper_log` VALUES (1609834806177222658, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_wh_area_info\"}', '', 0, '', '2023-01-02 16:51:42');
INSERT INTO `sys_oper_log` VALUES (1609835755788619777, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:55:28.115\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":1606},\"tableId\":\"1609833178233622538\",\"tableName\":\"bs_wh_bit_info\",\"tableComment\":\"库位信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsWhBitInfo\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.system\",\"moduleName\":\"whBitInfo\",\"businessName\":\"whBitInfo\",\"functionName\":\"库位信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 16:45:14.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:55:28.117\",\"columnId\":\"1609833178300731394\",\"tableId\":\"1609833178233622538\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":false,\"superColumn\":false,\"insert\":false,\"usableColumn\":false,\"edit\":false,\"pk\":true,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 16:45:14.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:55:28.119\",\"columnId\":\"1609833178300731395\",\"tableId\":\"1609833178233622538\",\"columnName\":\"wh_bit_coded\",\"columnComment\":\"库位编号\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"whBitCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"0\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"superColumn\":false,\"insert\":true,\"usableColumn\":false,\"edit\":false,\"pk\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"WhBitCoded\"},{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 16:45:14.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:55:28.120\",\"columnId\":\"1609833178300731396\",\"tableId\":\"1609833178233622538\",\"columnName\":\"wh_bit_name\",\"columnComment\":', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 16:55:28');
INSERT INTO `sys_oper_log` VALUES (1609835802676744194, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:55:39.294\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":1606},\"tableId\":\"1609833178040684545\",\"tableName\":\"bs_wh_area_info\",\"tableComment\":\"库区信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsWhAreaInfo\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.base\",\"moduleName\":\"whAreaInfo\",\"businessName\":\"whAreaInfo\",\"functionName\":\"库区信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 16:45:14.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:55:39.296\",\"columnId\":\"1609833178166513665\",\"tableId\":\"1609833178040684545\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"superColumn\":false,\"insert\":false,\"usableColumn\":false,\"edit\":true,\"pk\":true,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 16:45:14.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:55:39.297\",\"columnId\":\"1609833178166513666\",\"tableId\":\"1609833178040684545\",\"columnName\":\"wh_area_coded\",\"columnComment\":\"库区编号\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"whAreaCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"superColumn\":false,\"insert\":true,\"usableColumn\":false,\"edit\":true,\"pk\":false,\"increment\":false,\"query\":false,\"capJavaField\":\"WhAreaCoded\"},{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 16:45:14.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 16:55:39.299\",\"columnId\":\"1609833178166513667\",\"tableId\":\"1609833178040684545\",\"columnName\":\"wh_area_name\",\"columnComme', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 16:55:39');
INSERT INTO `sys_oper_log` VALUES (1609835856485470210, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_wh_area_info\"}', '', 0, '', '2023-01-02 16:55:52');
INSERT INTO `sys_oper_log` VALUES (1609835876999811073, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_wh_bit_info\"}', '', 0, '', '2023-01-02 16:55:57');
INSERT INTO `sys_oper_log` VALUES (1609869163713572866, '库区信息', 1, 'com.ruoyi.base.controller.BsWhAreaInfoController.add()', 'POST', 1, 'admin', '', '/base/whAreaInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"whAreaCoded\":123,\"whAreaName\":\"测试\",\"whAreaType\":\"2\",\"warehouseCoded\":132,\"warehouseName\":\"测试\",\"warehouseId\":\"1609819919325646849\",\"whAreaEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'warehouse_id\' at row 1\r\n### The error may exist in com/ruoyi/base/mapper/BsWhAreaInfoMapper.java (best guess)\r\n### The error may involve com.ruoyi.base.mapper.BsWhAreaInfoMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bs_wh_area_info  ( id, wh_area_coded, wh_area_name, wh_area_type, warehouse_coded, warehouse_name, warehouse_id, wh_area_enabled, remark, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'warehouse_id\' at row 1\n; Data truncation: Out of range value for column \'warehouse_id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'warehouse_id\' at row 1', '2023-01-02 19:08:13');
INSERT INTO `sys_oper_log` VALUES (1609869390403121154, '库区信息', 1, 'com.ruoyi.base.controller.BsWhAreaInfoController.add()', 'POST', 1, 'admin', '', '/base/whAreaInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1609869390281486338\",\"whAreaCoded\":123,\"whAreaName\":\"测试\",\"whAreaType\":\"2\",\"warehouseCoded\":132,\"warehouseName\":\"测试\",\"warehouseId\":\"1609819919325646849\",\"whAreaEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-02 19:09:07');
INSERT INTO `sys_oper_log` VALUES (1610142722423902209, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-03 13:15:14.648\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-03 13:15:14.648\",\"dictId\":23,\"dictName\":\"库位是否专属\",\"dictType\":\"is_exclusive\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-03 13:15:15');
INSERT INTO `sys_oper_log` VALUES (1610142779390939138, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-03 13:15:28.267\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-03 13:15:28.267\",\"dictCode\":77,\"dictSort\":0,\"dictLabel\":\"是\",\"dictValue\":\"1\",\"dictType\":\"is_exclusive\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-03 13:15:28');
INSERT INTO `sys_oper_log` VALUES (1610142809686396929, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-03 13:15:35.487\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-03 13:15:35.487\",\"dictCode\":78,\"dictSort\":1,\"dictLabel\":\"否\",\"dictValue\":\"2\",\"dictType\":\"is_exclusive\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-03 13:15:36');
INSERT INTO `sys_oper_log` VALUES (1610162198603165698, '仓库管理', 1, 'com.ruoyi.base.controller.BsWarehouseInfoController.add()', 'POST', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1610162198510891010\",\"warehouseCoded\":123,\"warehouseName\":\"测试02\",\"warehouseType\":\"1\",\"warehouseOrganization\":null,\"warehouseAddress\":\"测试02\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-03 14:32:38');
INSERT INTO `sys_oper_log` VALUES (1610162219541131266, '仓库管理', 2, 'com.ruoyi.base.controller.BsWarehouseInfoController.edit()', 'PUT', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 15:52:32.442\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 15:52:36.780\",\"id\":\"1609819919325646849\",\"warehouseCoded\":132,\"warehouseName\":\"测试01\",\"warehouseType\":\"1\",\"warehouseOrganization\":null,\"warehouseAddress\":\"青岛大学\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-03 14:32:43');
INSERT INTO `sys_oper_log` VALUES (1610173137721356289, '仓库管理', 2, 'com.ruoyi.base.controller.BsWarehouseInfoController.edit()', 'PUT', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 15:52:32.442\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-03 14:32:43.157\",\"id\":\"1609819919325646849\",\"warehouseCoded\":132,\"warehouseName\":\"测试01\",\"warehouseType\":\"1\",\"warehouseOrganization\":null,\"warehouseAddress\":\"青岛大学\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'warehouseCoded\' in \'where clause\'\r\n### The error may exist in file [D:\\workspace\\work\\shangongda\\RuoYi-Vue-Plus-dev\\cigarette-management\\target\\classes\\mapper\\baseMapper\\BsWhAreaInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE bs_wh_area_info SET warehouse_name = ? WHERE warehouseCoded = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'warehouseCoded\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'warehouseCoded\' in \'where clause\'', '2023-01-03 15:16:06');
INSERT INTO `sys_oper_log` VALUES (1610173166452338689, '仓库管理', 2, 'com.ruoyi.base.controller.BsWarehouseInfoController.edit()', 'PUT', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 15:52:32.442\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-03 14:32:43.157\",\"id\":\"1609819919325646849\",\"warehouseCoded\":132,\"warehouseName\":\"测试01\",\"warehouseType\":\"1\",\"warehouseOrganization\":null,\"warehouseAddress\":\"青岛大学\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'warehouseCoded\' in \'where clause\'\r\n### The error may exist in file [D:\\workspace\\work\\shangongda\\RuoYi-Vue-Plus-dev\\cigarette-management\\target\\classes\\mapper\\baseMapper\\BsWhAreaInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE bs_wh_area_info SET warehouse_name = ? WHERE warehouseCoded = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'warehouseCoded\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'warehouseCoded\' in \'where clause\'', '2023-01-03 15:16:13');
INSERT INTO `sys_oper_log` VALUES (1610173373545988097, '仓库管理', 2, 'com.ruoyi.base.controller.BsWarehouseInfoController.edit()', 'PUT', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 15:52:32.442\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-03 14:32:43.157\",\"id\":\"1609819919325646849\",\"warehouseCoded\":132,\"warehouseName\":\"测试01\",\"warehouseType\":\"1\",\"warehouseOrganization\":null,\"warehouseAddress\":\"青岛大学\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-03 15:17:02');
INSERT INTO `sys_oper_log` VALUES (1610173533407690755, '库区信息', 1, 'com.ruoyi.base.controller.BsWhAreaInfoController.add()', 'POST', 1, 'admin', '', '/base/whAreaInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1610173533407690754\",\"whAreaCoded\":321,\"whAreaName\":\"测试02\",\"whAreaType\":\"1\",\"warehouseCoded\":123,\"warehouseName\":\"测试02\",\"warehouseId\":\"1610162198510891010\",\"whAreaEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-03 15:17:41');
INSERT INTO `sys_oper_log` VALUES (1610173634561720322, '库区信息', 2, 'com.ruoyi.base.controller.BsWhAreaInfoController.edit()', 'PUT', 1, 'admin', '', '/base/whAreaInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 19:09:07.246\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-02 19:09:07.246\",\"id\":\"1609869390281486338\",\"whAreaCoded\":123,\"whAreaName\":\"测试01\",\"whAreaType\":\"2\",\"warehouseCoded\":132,\"warehouseName\":\"测试01\",\"warehouseId\":\"1609819919325646849\",\"whAreaEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-03 15:18:05');
INSERT INTO `sys_oper_log` VALUES (1610467780853813250, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-04 10:46:54.585\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 10:46:54.585\",\"dictId\":24,\"dictName\":\"库位类型\",\"dictType\":\"wh_bit_type\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 10:46:55');
INSERT INTO `sys_oper_log` VALUES (1610467881106067457, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-04 10:47:18.554\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 10:47:18.554\",\"dictCode\":79,\"dictSort\":0,\"dictLabel\":\"货架型\",\"dictValue\":\"1\",\"dictType\":\"wh_bit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 10:47:19');
INSERT INTO `sys_oper_log` VALUES (1610467923938299905, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-04 10:47:28.769\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 10:47:28.769\",\"dictCode\":80,\"dictSort\":1,\"dictLabel\":\"扁平型\",\"dictValue\":\"2\",\"dictType\":\"wh_bit_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 10:47:29');
INSERT INTO `sys_oper_log` VALUES (1610468114296786947, '库位信息', 1, 'com.ruoyi.base.controller.BsWhBitInfoController.add()', 'POST', 1, 'admin', '', '/whBitInfo/whBitInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1610468114296786946\",\"whBitCoded\":\"123\",\"whBitName\":\"测试01\",\"whBitCapacity\":\"120\",\"isExclusive\":\"1\",\"exclusiveType\":\"2\",\"whAreaCoded\":\"123\",\"whAreaName\":\"测试01\",\"warehouseCoded\":\"132\",\"warehouseName\":\"测试01\",\"whBitType\":\"1\",\"shelfCoded\":null,\"rowsNumber\":null,\"columnNumber\":null,\"whBitEnabled\":\"0\",\"objectCoded\":null,\"objectName\":null,\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 10:48:14');
INSERT INTO `sys_oper_log` VALUES (1610468553591410689, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/1607663442133549058,1607663442326487045,1607663442456510466,1607663442456510475,1607663442527813638,1607663442594922498,1607663442594922514,1607663442662031369,1607663442724945924,1607663442724945928', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 10:49:59');
INSERT INTO `sys_oper_log` VALUES (1610468565243187202, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/1607663557795676161,1607663557862785027,1607663557929893895,1607663557997002770,1607663558189940753,1607663558257049603,1607663558324158466,1607663558324158472,1607663720786329602,1607663720853438476', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 10:50:02');
INSERT INTO `sys_oper_log` VALUES (1610468576844632066, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/1607663720916353025,1607663720983461890,1607663720983461900,1607663721050570753,1607663721117679618,1607663721117679629,1607663721180594182,1607663721180594193,1609833178040684545,1609833178233622538', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 10:50:04');
INSERT INTO `sys_oper_log` VALUES (1610468670847373314, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"bs_dealingsunit_info\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 10:50:27');
INSERT INTO `sys_oper_log` VALUES (1610469418540781569, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 10:53:25.095\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":1606},\"tableId\":\"1610468670717349889\",\"tableName\":\"bs_dealingsunit_info\",\"tableComment\":\"来往单位信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BsDealingsunitInfo\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.base\",\"moduleName\":\"dealingsunitInfo\",\"businessName\":\"dealingsunitInfo\",\"functionName\":\"来往单位信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-01-04 10:50:27.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 10:53:25.098\",\"columnId\":\"1610468670717349890\",\"tableId\":\"1610468670717349889\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":false,\"insert\":false,\"usableColumn\":false,\"superColumn\":false,\"edit\":false,\"pk\":true,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createBy\":\"admin\",\"createTime\":\"2023-01-04 10:50:27.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 10:53:25.100\",\"columnId\":\"1610468670717349891\",\"tableId\":\"1610468670717349889\",\"columnName\":\"unit_coded\",\"columnComment\":\"单位编号\",\"columnType\":\"varchar(64)\",\"javaType\":\"String\",\"javaField\":\"unitCoded\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"insert\":true,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"pk\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"UnitCoded\"},{\"createBy\":\"admin\",\"createTime\":\"2023-01-04 10:50:27.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 10:53:25.101\",\"columnId\":\"1610468670784458754\",\"tableId\":\"1610468670717349889\",\"columnNa', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 10:53:25');
INSERT INTO `sys_oper_log` VALUES (1610469433426366465, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bs_dealingsunit_info\"}', '', 0, '', '2023-01-04 10:53:29');
INSERT INTO `sys_oper_log` VALUES (1610499189916139522, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-04 12:10:00.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 12:51:43.150\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":\"1610469431488598016\",\"menuName\":\"来往单位信息\",\"orderNum\":1,\"path\":\"dealingsunitInfo\",\"component\":\"/dealingsunitInfo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"dealingsunitInfo:dealingsunitInfo:list\",\"icon\":\"#\",\"remark\":\"来往单位信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 12:51:43');
INSERT INTO `sys_oper_log` VALUES (1610499323584413697, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-04 12:10:00.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 12:52:15.026\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":\"1610469431488598016\",\"menuName\":\"来往单位信息\",\"orderNum\":1,\"path\":\"dealingsunitInfo\",\"component\":\"base/dealingsunitInfo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"dealingsunitInfo:dealingsunitInfo:list\",\"icon\":\"#\",\"remark\":\"来往单位信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 12:52:15');
INSERT INTO `sys_oper_log` VALUES (1610506794122113025, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 13:56:15.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 13:21:56.085\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":1607,\"menuName\":\"品牌管理\",\"orderNum\":6,\"path\":\"BrandManage\",\"component\":\"base/brandManage/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:brandManage:list\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 13:21:56');
INSERT INTO `sys_oper_log` VALUES (1610506936615202818, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 13:56:15.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 13:22:30.115\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":1607,\"menuName\":\"品牌管理\",\"orderNum\":1,\"path\":\"BrandManage\",\"component\":\"base/brandManage/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:brandManage:list\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 13:22:30');
INSERT INTO `sys_oper_log` VALUES (1610506963513274369, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-04 12:10:00.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 13:22:36.524\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":\"1610469431488598016\",\"menuName\":\"来往单位信息\",\"orderNum\":6,\"path\":\"dealingsunitInfo\",\"component\":\"base/dealingsunitInfo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"dealingsunitInfo:dealingsunitInfo:list\",\"icon\":\"#\",\"remark\":\"来往单位信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 13:22:37');
INSERT INTO `sys_oper_log` VALUES (1610507068135993346, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-04 12:10:00.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 13:23:01.468\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":\"1610469431488598016\",\"menuName\":\"来往单位\",\"orderNum\":6,\"path\":\"dealingsunitInfo\",\"component\":\"base/dealingsunitInfo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"dealingsunitInfo:dealingsunitInfo:list\",\"icon\":\"#\",\"remark\":\"来往单位信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 13:23:01');
INSERT INTO `sys_oper_log` VALUES (1610523760077582338, '来往单位信息', 1, 'com.ruoyi.base.controller.BsDealingsunitInfoController.add()', 'POST', 1, 'admin', '', '/base/dealingsunitInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1610523759968530434\",\"unitCoded\":\"123\",\"unitName\":\"测试01\",\"unitType\":\"1\",\"contactPerson\":\"测试01\",\"landlineNumber\":\"132456-测试\",\"phone\":\"15993128938\",\"email\":\"测试01\",\"unitAddress\":null,\"unitEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-04 14:29:21');
INSERT INTO `sys_oper_log` VALUES (1610523760077582339, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":6,\"wmPutCoded\":\"101\",\"certificateCoded\":\"测试\",\"causeType\":\"1\",\"whPutDate\":\"2023-01-24\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"1235\",\"invoicesStatus\":\"1\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":6}', 0, '', '2023-01-29 09:50:32');
INSERT INTO `sys_oper_log` VALUES (1610523760077582340, '商品入库信息', 2, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.edit()', 'PUT', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":\"101\",\"certificateCoded\":\"测试\",\"causeType\":\"2\",\"whPutDate\":\"2023-01-24\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"1235\",\"invoicesStatus\":\"1\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null}', 0, '', '2023-01-29 09:50:46');
INSERT INTO `sys_oper_log` VALUES (1610523760077582341, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":7,\"wmPutCoded\":\"101\",\"certificateCoded\":\"测试\",\"causeType\":\"1\",\"whPutDate\":\"2023-01-10\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"123\",\"invoicesStatus\":\"2\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":7}', 0, '', '2023-01-29 09:57:00');
INSERT INTO `sys_oper_log` VALUES (1610523760077582342, '商品入库信息', 2, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.edit()', 'PUT', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":\"101\",\"certificateCoded\":\"测试\",\"causeType\":\"2\",\"whPutDate\":\"2023-01-10\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"123\",\"invoicesStatus\":\"2\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null}', 0, '', '2023-01-29 09:57:15');
INSERT INTO `sys_oper_log` VALUES (1610523760077582343, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":8,\"wmPutCoded\":\"101\",\"certificateCoded\":\"测试\",\"causeType\":\"4\",\"whPutDate\":\"2023-01-03\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"123\",\"invoicesStatus\":\"3\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":8}', 0, '', '2023-01-29 10:03:10');
INSERT INTO `sys_oper_log` VALUES (1610523760077582344, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":9,\"wmPutCoded\":\"100\",\"certificateCoded\":\"测试\",\"causeType\":\"4\",\"whPutDate\":\"2023-01-02\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"123\",\"invoicesStatus\":\"3\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":9}', 0, '', '2023-01-29 10:07:27');
INSERT INTO `sys_oper_log` VALUES (1610523760077582345, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":10,\"wmPutCoded\":\"101\",\"certificateCoded\":\"测试\",\"causeType\":\"4\",\"whPutDate\":\"2023-01-24\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"123\",\"invoicesStatus\":\"2\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":10}', 0, '', '2023-01-29 10:09:20');
INSERT INTO `sys_oper_log` VALUES (1610523760077582346, '商品入库信息', 3, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.remove()', 'DELETE', 1, 'admin', '', '/wmPut/putInfo/10', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-29 10:09:25');
INSERT INTO `sys_oper_log` VALUES (1610523760077582347, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":11,\"wmPutCoded\":\"101\",\"certificateCoded\":\"测试\",\"causeType\":\"3\",\"whPutDate\":\"2023-01-09\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"1235\",\"invoicesStatus\":\"3\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":11}', 0, '', '2023-01-29 10:10:54');
INSERT INTO `sys_oper_log` VALUES (1610523760077582348, '商品入库信息', 3, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.remove()', 'DELETE', 1, 'admin', '', '/wmPut/putInfo/11', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-29 10:10:59');
INSERT INTO `sys_oper_log` VALUES (1610523760077582349, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":12,\"wmPutCoded\":\"100\",\"certificateCoded\":\"测试\",\"causeType\":\"2\",\"whPutDate\":\"2023-01-25\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"123\",\"invoicesStatus\":\"2\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":12}', 0, '', '2023-01-29 10:11:38');
INSERT INTO `sys_oper_log` VALUES (1610523760077582350, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":13,\"wmPutCoded\":\"100\",\"certificateCoded\":\"测试\",\"causeType\":\"1\",\"whPutDate\":\"2023-01-11\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"123\",\"invoicesStatus\":\"1\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":13}', 0, '', '2023-01-29 10:18:28');
INSERT INTO `sys_oper_log` VALUES (1610523760077582351, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":14,\"wmPutCoded\":\"100\",\"certificateCoded\":\"测试\",\"causeType\":\"1\",\"whPutDate\":\"2023-01-04\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"123\",\"invoicesStatus\":\"2\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":14}', 0, '', '2023-01-29 10:21:29');
INSERT INTO `sys_oper_log` VALUES (1610523760077582352, '商品入库信息', 3, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.remove()', 'DELETE', 1, 'admin', '', '/wmPut/putInfo/14', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-29 10:27:22');
INSERT INTO `sys_oper_log` VALUES (1610523760077582353, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":15,\"wmPutCoded\":\"100\",\"certificateCoded\":\"测试\",\"causeType\":\"2\",\"whPutDate\":\"2023-01-10\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"1235\",\"invoicesStatus\":\"2\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":15}', 0, '', '2023-01-29 10:28:55');
INSERT INTO `sys_oper_log` VALUES (1610523760077582354, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":16,\"wmPutCoded\":\"100\",\"certificateCoded\":\"测试\",\"causeType\":\"1\",\"whPutDate\":\"2023-01-04\",\"varietyNumber\":1,\"whPutNumber\":1,\"whBitCoded\":\"123\",\"invoicesStatus\":\"1\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":16}', 0, '', '2023-01-29 10:54:42');
INSERT INTO `sys_oper_log` VALUES (1610523760077582355, '暂存入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutTemporaryController.add()', 'POST', 1, 'admin', '', '/wmPut/putTemporary', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":null,\"certificateCoded\":null,\"causeType\":null,\"whPutDate\":null,\"varietyNumber\":null,\"whPutNumber\":null,\"whBitCoded\":\"123\",\"invoicesStatus\":null,\"storekeeper\":null,\"synthesisKeeper\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"wmPutId\":16,\"client\":\"测试\",\"cause\":\"2\",\"detainDate\":\"2023-01-18\",\"detainDeptName\":null,\"detainDept\":null,\"goodsCoded\":null,\"goodsName\":null,\"putNumber\":5,\"causeQr\":null,\"whAreaCoded\":\"123\",\"unitCoded\":\"测试\",\"remark\":\"测试\",\"printTime\":null}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in com/ruoyi/wmPut/mapper/WmPutTemporaryMapper.java (best guess)\r\n### The error may involve com.ruoyi.wmPut.mapper.WmPutTemporaryMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO wm_put_temporary  ( wm_put_id, client, cause, detain_date,    put_number,  wh_area_coded, wh_bit_coded, unit_coded, remark,           create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?,    ?,  ?, ?, ?, ?,           ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2023-01-29 11:02:37');
INSERT INTO `sys_oper_log` VALUES (1610523760077582356, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":17,\"wmPutCoded\":\"1002\",\"certificateCoded\":\"测试\",\"causeType\":\"2\",\"whPutDate\":\"2023-01-10\",\"varietyNumber\":2,\"whPutNumber\":1,\"whBitCoded\":\"123\",\"invoicesStatus\":\"1\",\"storekeeper\":\"测试\",\"synthesisKeeper\":\"测试\",\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":17}', 0, '', '2023-01-29 11:38:20');
INSERT INTO `sys_oper_log` VALUES (1610523760077582357, '暂存入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutTemporaryController.add()', 'POST', 1, 'admin', '', '/wmPut/putTemporary', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":null,\"certificateCoded\":null,\"causeType\":null,\"whPutDate\":null,\"varietyNumber\":null,\"whPutNumber\":null,\"whBitCoded\":\"123\",\"invoicesStatus\":null,\"storekeeper\":null,\"synthesisKeeper\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"wmPutId\":17,\"client\":\"测试\",\"cause\":\"1\",\"detainDate\":\"2023-01-04\",\"detainDeptName\":null,\"detainDept\":null,\"goodsCoded\":null,\"goodsName\":null,\"putNumber\":5,\"causeQr\":null,\"whAreaCoded\":\"123\",\"unitCoded\":\"测试\",\"remark\":\"测试\",\"printTime\":null}', '', 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'wmPutId\' not found. Available parameters are [bo, param1]', '2023-01-29 11:38:35');
INSERT INTO `sys_oper_log` VALUES (1610523760077582358, '暂存入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutTemporaryController.add()', 'POST', 1, 'admin', '', '/wmPut/putTemporary', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":null,\"certificateCoded\":null,\"causeType\":null,\"whPutDate\":null,\"varietyNumber\":null,\"whPutNumber\":null,\"whBitCoded\":\"123\",\"invoicesStatus\":null,\"storekeeper\":null,\"synthesisKeeper\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"wmPutId\":17,\"client\":\"测试\",\"cause\":\"1\",\"detainDate\":\"2023-01-04\",\"detainDeptName\":null,\"detainDept\":null,\"goodsCoded\":null,\"goodsName\":null,\"putNumber\":5,\"causeQr\":null,\"whAreaCoded\":\"123\",\"unitCoded\":\"测试\",\"remark\":\"测试\",\"printTime\":null}', '', 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'wmPutId\' not found. Available parameters are [bo, param1]', '2023-01-29 11:44:22');
INSERT INTO `sys_oper_log` VALUES (1610523760077582359, '暂存入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutTemporaryController.add()', 'POST', 1, 'admin', '', '/wmPut/putTemporary', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":null,\"certificateCoded\":null,\"causeType\":null,\"whPutDate\":null,\"varietyNumber\":null,\"whPutNumber\":null,\"whBitCoded\":\"123\",\"invoicesStatus\":null,\"storekeeper\":null,\"synthesisKeeper\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"wmPutId\":17,\"client\":\"测试\",\"cause\":\"1\",\"detainDate\":\"2023-01-04\",\"detainDeptName\":null,\"detainDept\":null,\"goodsCoded\":null,\"goodsName\":null,\"putNumber\":5,\"causeQr\":null,\"whAreaCoded\":\"123\",\"unitCoded\":\"测试\",\"remark\":\"测试\",\"printTime\":null}', '', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'printTime\' in \'class com.ruoyi.wmPut.domain.WmPutTemporary\'', '2023-01-29 11:45:50');
INSERT INTO `sys_oper_log` VALUES (1610523760077582360, '暂存入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutTemporaryController.add()', 'POST', 1, 'admin', '', '/wmPut/putTemporary', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":null,\"certificateCoded\":null,\"causeType\":null,\"whPutDate\":null,\"varietyNumber\":null,\"whPutNumber\":null,\"whBitCoded\":\"123\",\"invoicesStatus\":null,\"storekeeper\":null,\"synthesisKeeper\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"wmPutId\":17,\"client\":\"测试\",\"cause\":\"1\",\"detainDate\":\"2023-01-04\",\"detainDeptName\":null,\"detainDept\":null,\"goodsCoded\":null,\"goodsName\":null,\"putNumber\":5,\"causeQr\":null,\"whAreaCoded\":\"123\",\"unitCoded\":\"测试\",\"remark\":\"测试\",\"printTime\":null}', '', 1, '', '2023-01-29 11:47:21');
INSERT INTO `sys_oper_log` VALUES (1610523760077582361, '暂存入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutTemporaryController.add()', 'POST', 1, 'admin', '', '/wmPut/putTemporary', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":null,\"certificateCoded\":null,\"causeType\":null,\"whPutDate\":null,\"varietyNumber\":null,\"whPutNumber\":null,\"whBitCoded\":\"123\",\"invoicesStatus\":null,\"storekeeper\":null,\"synthesisKeeper\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"wmPutId\":17,\"client\":\"测试\",\"cause\":\"1\",\"detainDate\":\"2023-01-04\",\"detainDeptName\":null,\"detainDept\":null,\"goodsCoded\":null,\"goodsName\":null,\"putNumber\":5,\"causeQr\":null,\"whAreaCoded\":\"123\",\"unitCoded\":\"测试\",\"remark\":\"测试\",\"printTime\":null}', '', 1, '', '2023-01-29 11:49:19');
INSERT INTO `sys_oper_log` VALUES (1610523760077582362, '暂存入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutTemporaryController.add()', 'POST', 1, 'admin', '', '/wmPut/putTemporary', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":null,\"certificateCoded\":null,\"causeType\":null,\"whPutDate\":null,\"varietyNumber\":null,\"whPutNumber\":null,\"whBitCoded\":\"123\",\"invoicesStatus\":null,\"storekeeper\":null,\"synthesisKeeper\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"wmPutId\":17,\"client\":\"测试\",\"cause\":\"1\",\"detainDate\":\"2023-01-04\",\"detainDeptName\":null,\"detainDept\":null,\"goodsCoded\":null,\"goodsName\":null,\"putNumber\":5,\"causeQr\":null,\"whAreaCoded\":\"123\",\"unitCoded\":\"测试\",\"remark\":\"测试\",\"printTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":3}', 0, '', '2023-01-29 11:53:19');
INSERT INTO `sys_oper_log` VALUES (1610523760077582363, '暂存入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutTemporaryController.add()', 'POST', 1, 'admin', '', '/wmPut/putTemporary', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":null,\"certificateCoded\":null,\"causeType\":null,\"whPutDate\":null,\"varietyNumber\":null,\"whPutNumber\":null,\"whBitCoded\":\"123\",\"invoicesStatus\":null,\"storekeeper\":null,\"synthesisKeeper\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"wmPutId\":17,\"client\":\"测试\",\"cause\":\"1\",\"detainDate\":\"2023-01-04\",\"detainDeptName\":null,\"detainDept\":null,\"goodsCoded\":null,\"goodsName\":null,\"putNumber\":5,\"causeQr\":null,\"whAreaCoded\":\"123\",\"unitCoded\":\"测试\",\"remark\":\"测试\",\"printTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":4}', 0, '', '2023-01-29 11:54:03');
INSERT INTO `sys_oper_log` VALUES (1610523760077582364, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"wm_put_punish_confiscate\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-29 15:31:42');
INSERT INTO `sys_oper_log` VALUES (1610523760077582365, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-01-29 15:32:30.550\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1619599148342915073\",\"tableName\":\"wm_put_punish_confiscate\",\"tableComment\":\"罚没入库信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"WmPutPunishConfiscate\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.wmPut\",\"moduleName\":\"wmPut\",\"businessName\":\"putPunishConfiscate\",\"functionName\":\"罚没入库信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-01-29 15:31:42.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-29 15:32:30.564\",\"columnId\":\"1619599148460355586\",\"tableId\":\"1619599148342915073\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"list\":true,\"required\":true,\"insert\":false,\"pk\":true,\"usableColumn\":false,\"edit\":true,\"superColumn\":false,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createBy\":\"admin\",\"createTime\":\"2023-01-29 15:31:42.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-29 15:32:30.571\",\"columnId\":\"1619599148527464449\",\"tableId\":\"1619599148342915073\",\"columnName\":\"wm_put_id\",\"columnComment\":\"入库信息id-罚没\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"wmPutId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"list\":true,\"required\":true,\"insert\":true,\"pk\":false,\"usableColumn\":false,\"edit\":true,\"superColumn\":false,\"increment\":false,\"query\":false,\"capJavaField\":\"WmPutId\"},{\"createBy\":\"admin\",\"createTime\":\"2023-01-29 15:31:42.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-29 15:32:30.575\",\"columnId\":\"1619599148527464450\",\"tableId\":\"1619599148342915073\",\"columnName\":\"cigarette', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-29 15:32:31');
INSERT INTO `sys_oper_log` VALUES (1610523760077582366, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wm_put_punish_confiscate\"}', '', 0, '', '2023-01-29 15:32:35');
INSERT INTO `sys_oper_log` VALUES (1610523760077582367, '品牌管理/品牌详细信息', 3, 'com.ruoyi.base.controller.base.BsBrandManageController.remove()', 'DELETE', 1, 'admin', '', '/base/brandManage/6', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-29 17:48:27');
INSERT INTO `sys_oper_log` VALUES (1610523760077582368, '品牌管理/品牌详细信息', 3, 'com.ruoyi.base.controller.base.BsBrandManageController.remove()', 'DELETE', 1, 'admin', '', '/base/brandManage/1608727825458667522', '127.0.0.1', '内网IP', '{}', '', 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: A query was run and no Result Maps were found for the Mapped Statement \'com.ruoyi.base.mapper.BsBrandManageMapper.selectListByIds\'.  It\'s likely that neither a Result Type nor a Result Map was specified.', '2023-01-30 10:47:54');
INSERT INTO `sys_oper_log` VALUES (1610523760077582369, '品牌管理/品牌详细信息', 3, 'com.ruoyi.base.controller.base.BsBrandManageController.remove()', 'DELETE', 1, 'admin', '', '/base/brandManage/1608727825458667522', '127.0.0.1', '内网IP', '{}', '', 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: A query was run and no Result Maps were found for the Mapped Statement \'com.ruoyi.base.mapper.BsBrandManageMapper.selectListByIds\'.  It\'s likely that neither a Result Type nor a Result Map was specified.', '2023-01-30 10:52:59');
INSERT INTO `sys_oper_log` VALUES (1610523760077582370, '品牌管理/品牌详细信息', 3, 'com.ruoyi.base.controller.base.BsBrandManageController.remove()', 'DELETE', 1, 'admin', '', '/base/brandManage/1608727825458667522', '127.0.0.1', '内网IP', '{}', '', 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: A query was run and no Result Maps were found for the Mapped Statement \'com.ruoyi.base.mapper.BsBrandManageMapper.selectListByIds\'.  It\'s likely that neither a Result Type nor a Result Map was specified.', '2023-01-30 10:55:32');
INSERT INTO `sys_oper_log` VALUES (1610523760077582371, '品牌管理/品牌详细信息', 3, 'com.ruoyi.base.controller.base.BsBrandManageController.remove()', 'DELETE', 1, 'admin', '', '/base/brandManage/1608727825458667522', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 10:57:09');
INSERT INTO `sys_oper_log` VALUES (1610523760077582372, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.base.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1608727825458667523\",\"brandCoded\":\"001\",\"brandName\":\"测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 11:04:33');
INSERT INTO `sys_oper_log` VALUES (1610523760077582373, '品牌管理/品牌详细信息', 3, 'com.ruoyi.base.controller.base.BsBrandManageController.remove()', 'DELETE', 1, 'admin', '', '/base/brandManage/1608727825458667523', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"已启用的数据不能删除！\",\"data\":null}', 0, '', '2023-01-30 11:05:10');
INSERT INTO `sys_oper_log` VALUES (1610523760077582374, '商品信息', 3, 'com.ruoyi.base.controller.base.BsGoodsInfoController.remove()', 'DELETE', 1, 'admin', '', '/base/goodsInfo/1', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"已上市或已启用的数据不能删除！\",\"data\":null}', 0, '', '2023-01-30 11:22:18');
INSERT INTO `sys_oper_log` VALUES (1610523760077582375, '商品信息', 3, 'com.ruoyi.base.controller.base.BsGoodsInfoController.remove()', 'DELETE', 1, 'admin', '', '/base/goodsInfo/1', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"已上市或已启用的数据不能删除！\",\"data\":null}', 0, '', '2023-01-30 11:22:51');
INSERT INTO `sys_oper_log` VALUES (1610523760077582376, '仓库管理', 3, 'com.ruoyi.base.controller.base.BsWarehouseInfoController.remove()', 'DELETE', 1, 'admin', '', '/base/warehouseInfo/1', '127.0.0.1', '内网IP', '{}', '', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: select * from bs_warehouse_info\n         WHERE id in\n                (\n                    ?\n                ,\n            \n            and warehouse_enabled = \'0\'\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: select * from bs_warehouse_info\n         WHERE id in\n                (\n                    ?\n                ,\n            \n            and warehouse_enabled = \'0\'', '2023-01-30 12:05:19');
INSERT INTO `sys_oper_log` VALUES (1610523760077582377, '仓库管理', 3, 'com.ruoyi.base.controller.base.BsWarehouseInfoController.remove()', 'DELETE', 1, 'admin', '', '/base/warehouseInfo/1', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"已启用的仓库不能删除！\",\"data\":null}', 0, '', '2023-01-30 12:07:28');
INSERT INTO `sys_oper_log` VALUES (1610523760077582378, '库区信息', 3, 'com.ruoyi.base.controller.base.BsWhAreaInfoController.remove()', 'DELETE', 1, 'admin', '', '/base/whAreaInfo/1', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"已启用的库区不能删除！\",\"data\":null}', 0, '', '2023-01-30 12:07:36');
INSERT INTO `sys_oper_log` VALUES (1610523760077582379, '库位信息', 3, 'com.ruoyi.base.controller.base.BsWhBitInfoController.remove()', 'DELETE', 1, 'admin', '', '/whBitInfo/whBitInfo/1', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"已启用的库位不能删除！\",\"data\":null}', 0, '', '2023-01-30 12:07:48');
INSERT INTO `sys_oper_log` VALUES (1610523760077582380, '来往单位信息', 3, 'com.ruoyi.base.controller.base.BsDealingsunitInfoController.remove()', 'DELETE', 1, 'admin', '', '/base/dealingsunitInfo/1', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"已启用的单位不能删除！\",\"data\":null}', 0, '', '2023-01-30 12:07:54');
INSERT INTO `sys_oper_log` VALUES (1610523760077582381, '来往单位信息', 1, 'com.ruoyi.base.controller.base.BsDealingsunitInfoController.add()', 'POST', 1, 'admin', '', '/base/dealingsunitInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1610523759968530435\",\"unitCoded\":\"1234\",\"unitName\":\"测试\",\"unitType\":\"3\",\"contactPerson\":\"测试\",\"landlineNumber\":null,\"phone\":null,\"email\":null,\"unitAddress\":\"青岛\",\"unitEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 12:30:28');
INSERT INTO `sys_oper_log` VALUES (1610523760077582382, '来往单位信息', 3, 'com.ruoyi.base.controller.base.BsDealingsunitInfoController.remove()', 'DELETE', 1, 'admin', '', '/base/dealingsunitInfo/1610523759968530435', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"已启用的单位不能删除！\",\"data\":null}', 0, '', '2023-01-30 12:30:35');
INSERT INTO `sys_oper_log` VALUES (1610523760077582383, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 11:04:32.855\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 11:04:32.855\",\"id\":\"1608727825458667523\",\"brandCoded\":\"001\",\"brandName\":\"测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"1\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 13:10:23');
INSERT INTO `sys_oper_log` VALUES (1610523760077582384, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 11:04:32.855\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 13:10:22.923\",\"id\":\"1608727825458667523\",\"brandCoded\":\"001\",\"brandName\":\"测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 13:11:05');
INSERT INTO `sys_oper_log` VALUES (1610523760077582385, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 11:04:32.855\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 13:11:04.597\",\"id\":\"1608727825458667523\",\"brandCoded\":\"001\",\"brandName\":\"测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"1\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 13:12:10');
INSERT INTO `sys_oper_log` VALUES (1610523760077582386, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 11:04:32.855\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 13:12:09.708\",\"id\":\"1608727825458667523\",\"brandCoded\":\"001\",\"brandName\":\"测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 13:14:28');
INSERT INTO `sys_oper_log` VALUES (1610523760077582387, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 13:56:15.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 13:16:42.764\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":1607,\"menuName\":\"品牌管理\",\"orderNum\":1,\"path\":\"BrandManage\",\"component\":\"base/brandManage/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:brandManage:list\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 13:16:43');
INSERT INTO `sys_oper_log` VALUES (1610523760077582388, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-26 17:33:55.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 13:16:46.937\",\"parentName\":null,\"parentId\":1606,\"children\":[],\"menuId\":1608,\"menuName\":\"商品信息\",\"orderNum\":2,\"path\":\"GoodsInfo\",\"component\":\"base/goodsInfo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"base:goodsInfo:list\",\"icon\":\"shopping\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 13:16:47');
INSERT INTO `sys_oper_log` VALUES (1610523760077582389, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 11:04:32.855\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 13:14:27.769\",\"id\":\"1608727825458667523\",\"brandCoded\":\"001\",\"brandName\":\"测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"1\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 13:16:58');
INSERT INTO `sys_oper_log` VALUES (1610523760077582390, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 11:04:32.855\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 13:16:58.364\",\"id\":\"1608727825458667523\",\"brandCoded\":\"001\",\"brandName\":\"测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 13:17:12');
INSERT INTO `sys_oper_log` VALUES (1610523760077582391, '商品信息', 2, 'com.ruoyi.base.controller.base.BsGoodsInfoController.edit()', 'PUT', 1, 'admin', '', '/base/goodsInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-30 15:28:51.487\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-05 15:15:38.545\",\"id\":1,\"goodsCoded\":\"0020000001\",\"goodsName\":\"1\",\"brandName\":\"测试\",\"brandCoded\":\"001\",\"smallBoxBarcode\":\"1\",\"barboxBarcode\":\"1\",\"goodsType\":\"2\",\"goodsSpecification\":\"1\",\"measureUnit\":\"1\",\"singleBarboxNumber\":\"1\",\"smallBoxNumber\":\"1\",\"singleBoxPrice\":\"1.00\",\"barboxPrice\":\"1.00\",\"barboxWholesalePrices\":\"1.00\",\"packagingForms\":\"1\",\"listingStatus\":\"0\",\"tarContent\":\"1\",\"smokeNicotine\":\"1\",\"monoxideCarbon\":\"1\",\"remark\":\"1\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 14:30:52');
INSERT INTO `sys_oper_log` VALUES (1610523760077582392, '品牌管理/品牌详细信息', 1, 'com.ruoyi.base.controller.base.BsBrandManageController.add()', 'POST', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1608727825458667524\",\"brandCoded\":\"002\",\"brandName\":\"青-测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 14:31:45');
INSERT INTO `sys_oper_log` VALUES (1610523760077582393, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 11:04:32.855\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 13:17:12.008\",\"id\":\"1608727825458667523\",\"brandCoded\":\"001\",\"brandName\":\"测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 14:43:56');
INSERT INTO `sys_oper_log` VALUES (1610523760077582394, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 14:31:44.843\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 14:31:44.843\",\"id\":\"1608727825458667524\",\"brandCoded\":\"002\",\"brandName\":\"青-测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 14:43:59');
INSERT INTO `sys_oper_log` VALUES (1610523760077582395, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 11:04:32.855\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 14:43:56.468\",\"id\":\"1608727825458667523\",\"brandCoded\":\"001\",\"brandName\":\"测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: update from bs_goods_info set brand_name= ?\n        where brand_coded=?\r\n### The error may exist in file [D:\\workspace\\work\\shangongda\\RuoYi-Vue-Plus-dev\\cigarette-management\\target\\classes\\mapper\\baseMapper\\BsBrandManageMapper.xml]\r\n### The error may involve com.ruoyi.base.mapper.BsBrandManageMapper.updateBrandName\r\n### The error occurred while executing an update\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: update from bs_goods_info set brand_name= ?\n        where brand_coded=?', '2023-01-30 14:45:30');
INSERT INTO `sys_oper_log` VALUES (1610523760077582396, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 11:04:32.855\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 14:43:56.468\",\"id\":\"1608727825458667523\",\"brandCoded\":\"001\",\"brandName\":\"测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 14:49:07');
INSERT INTO `sys_oper_log` VALUES (1610523760077582397, '品牌管理/品牌详细信息', 2, 'com.ruoyi.base.controller.base.BsBrandManageController.edit()', 'PUT', 1, 'admin', '', '/base/brandManage', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-30 14:31:44.843\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 14:43:59.148\",\"id\":\"1608727825458667524\",\"brandCoded\":\"002\",\"brandName\":\"青-测试\",\"brandLocality\":\"青岛\",\"brandEnabled\":\"0\",\"remark\":\"测试\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 14:49:10');
INSERT INTO `sys_oper_log` VALUES (1610523760077582398, '商品信息', 2, 'com.ruoyi.base.controller.base.BsGoodsInfoController.edit()', 'PUT', 1, 'admin', '', '/base/goodsInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-30 15:28:51.487\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-30 14:30:52.347\",\"id\":1,\"goodsCoded\":\"0010000001\",\"goodsName\":\"1\",\"brandName\":\"青-测试\",\"brandCoded\":\"002\",\"smallBoxBarcode\":\"1\",\"barboxBarcode\":\"1\",\"goodsType\":\"2\",\"goodsSpecification\":\"1\",\"measureUnit\":\"1\",\"singleBarboxNumber\":\"1\",\"smallBoxNumber\":\"1\",\"singleBoxPrice\":\"1.00\",\"barboxPrice\":\"1.00\",\"barboxWholesalePrices\":\"1.00\",\"packagingForms\":\"1\",\"listingStatus\":\"0\",\"tarContent\":\"1\",\"smokeNicotine\":\"1\",\"monoxideCarbon\":\"1\",\"remark\":\"1\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-30 14:49:30');
INSERT INTO `sys_oper_log` VALUES (1610523760077582399, '库区信息', 3, 'com.ruoyi.base.controller.base.BsWhAreaInfoController.remove()', 'DELETE', 1, 'admin', '', '/base/whAreaInfo/2', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"已启用的库区不能删除！\",\"data\":null}', 0, '', '2023-01-30 16:21:56');
INSERT INTO `sys_oper_log` VALUES (1610523760077582400, '品牌管理/品牌详细信息', 5, 'com.ruoyi.base.controller.base.BsBrandManageController.export()', 'POST', 1, 'admin', '', '/base/brandManage/export', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"brandCoded\":null,\"brandName\":null,\"brandLocality\":null,\"brandEnabled\":null,\"remark\":null,\"startTime\":null,\"endTime\":null}', '', 0, '', '2023-01-30 18:19:04');
INSERT INTO `sys_oper_log` VALUES (1610523760077582401, '仓库管理', 5, 'com.ruoyi.base.controller.base.BsWarehouseInfoController.export()', 'POST', 1, 'admin', '', '/base/warehouseInfo/export', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"warehouseCoded\":null,\"warehouseName\":null,\"warehouseType\":null,\"warehouseOrganization\":null,\"warehouseAddress\":null,\"warehousePrincipal\":null,\"warehouseEnabled\":null,\"remark\":null,\"startTime\":null,\"endTime\":null}', '', 0, '', '2023-01-31 11:15:32');
INSERT INTO `sys_oper_log` VALUES (1610523760077582402, '仓库管理', 2, 'com.ruoyi.base.controller.base.BsWarehouseInfoController.edit()', 'PUT', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 15:52:32.442\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-03 15:17:02.453\",\"id\":1,\"warehouseCoded\":\"132\",\"warehouseName\":\"测试01\",\"warehouseType\":\"1\",\"warehouseOrganization\":null,\"warehouseAddress\":\"青岛大学\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-31 11:15:54');
INSERT INTO `sys_oper_log` VALUES (1610523760077582403, '仓库管理', 2, 'com.ruoyi.base.controller.base.BsWarehouseInfoController.edit()', 'PUT', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-02 15:52:32.442\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-31 11:15:54.176\",\"id\":1,\"warehouseCoded\":\"132\",\"warehouseName\":\"测试01\",\"warehouseType\":\"1\",\"warehouseOrganization\":123,\"warehouseAddress\":\"青岛大学\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-31 11:26:16');
INSERT INTO `sys_oper_log` VALUES (1610523760077582404, '仓库管理', 2, 'com.ruoyi.base.controller.base.BsWarehouseInfoController.edit()', 'PUT', 1, 'admin', '', '/base/warehouseInfo', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-03 14:32:38.150\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-03 14:32:38.150\",\"id\":2,\"warehouseCoded\":\"123\",\"warehouseName\":\"测试02\",\"warehouseType\":\"1\",\"warehouseOrganization\":1234,\"warehouseAddress\":\"测试02\",\"warehousePrincipal\":\"测试\",\"warehouseEnabled\":\"0\",\"remark\":\"正常\",\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-31 11:26:21');
INSERT INTO `sys_oper_log` VALUES (1610523760077582405, '仓库管理', 5, 'com.ruoyi.base.controller.base.BsWarehouseInfoController.export()', 'POST', 1, 'admin', '', '/base/warehouseInfo/export', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"warehouseCoded\":null,\"warehouseName\":null,\"warehouseType\":null,\"warehouseOrganization\":null,\"warehouseAddress\":null,\"warehousePrincipal\":null,\"warehouseEnabled\":null,\"remark\":null,\"startTime\":null,\"endTime\":null}', '', 0, '', '2023-01-31 11:26:23');
INSERT INTO `sys_oper_log` VALUES (1610523760077582406, '品牌管理/品牌详细信息', 5, 'com.ruoyi.base.controller.base.BsBrandManageController.export()', 'POST', 1, 'admin', '', '/base/brandManage/export', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"brandCoded\":null,\"brandName\":null,\"brandLocality\":null,\"brandEnabled\":null,\"remark\":null,\"startTime\":null,\"endTime\":null}', '', 0, '', '2023-02-01 09:33:37');
INSERT INTO `sys_oper_log` VALUES (1610523760077582407, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-01 18:33:19.202\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 18:33:19.202\",\"dictId\":28,\"dictName\":\"职位\",\"dictType\":\"position\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-01 18:33:19');
INSERT INTO `sys_oper_log` VALUES (1610523760077582408, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-01 18:33:50.935\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 18:33:50.935\",\"dictCode\":90,\"dictSort\":0,\"dictLabel\":\"综合保管员\",\"dictValue\":\"1\",\"dictType\":\"position\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-01 18:33:51');
INSERT INTO `sys_oper_log` VALUES (1610523760077582409, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-01 18:34:07.582\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 18:34:07.582\",\"dictCode\":91,\"dictSort\":0,\"dictLabel\":\"保管员\",\"dictValue\":\"2\",\"dictType\":\"position\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-01 18:34:08');
INSERT INTO `sys_oper_log` VALUES (1610523760077582410, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-01 18:42:20.645\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 18:42:20.645\",\"dictId\":29,\"dictName\":\"保管员\",\"dictType\":\"storekeeper\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-01 18:42:21');
INSERT INTO `sys_oper_log` VALUES (1610523760077582411, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-01 18:42:40.555\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 18:42:40.555\",\"dictId\":30,\"dictName\":\"综合保管员\",\"dictType\":\"synthesis_keeper\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-01 18:42:41');
INSERT INTO `sys_oper_log` VALUES (1610523760077582412, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '', '/system/dict/type/30', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-01 18:47:07');
INSERT INTO `sys_oper_log` VALUES (1610523760077582413, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '', '/system/dict/type/29', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-01 18:47:10');
INSERT INTO `sys_oper_log` VALUES (1610523760077582414, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 19:05:22.988\",\"userId\":2,\"deptId\":105,\"userName\":\"lionli\",\"nickName\":\"疯狂的狮子Li\",\"userType\":\"sys_user\",\"email\":\"crazyLionLi@qq.com\",\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"loginDate\":\"2022-12-13 16:13:34.000\",\"remark\":\"测试员\",\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":101,\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"orderNum\":3,\"leader\":\"若依\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100,101\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false}],\"roleIds\":[2],\"postIds\":[2],\"roleId\":null,\"position\":\"1\",\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-01 19:05:23');
INSERT INTO `sys_oper_log` VALUES (1610523760077582415, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-13 16:13:34.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 19:07:18.699\",\"userId\":2,\"deptId\":105,\"userName\":\"lionli\",\"nickName\":\"疯狂的狮子Li\",\"userType\":\"sys_user\",\"email\":\"crazyLionLi@qq.com\",\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"loginDate\":\"2022-12-13 16:13:34.000\",\"remark\":\"测试员\",\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":101,\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"orderNum\":3,\"leader\":\"若依\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100,101\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false}],\"roleIds\":[2],\"postIds\":[2],\"roleId\":null,\"position\":\"1\",\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-01 19:07:19');
INSERT INTO `sys_oper_log` VALUES (1610523760077582416, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-02 10:12:38.394\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-02 10:12:38.394\",\"userId\":3,\"deptId\":100,\"userName\":\"wang\",\"nickName\":\"wang\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":\"0\",\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[2],\"postIds\":[2],\"roleId\":null,\"position\":\"1\",\"positions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-02 10:12:38');
INSERT INTO `sys_oper_log` VALUES (1610523760077582417, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-02 10:12:38.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-02 10:14:01.549\",\"userId\":3,\"deptId\":100,\"userName\":\"wang\",\"nickName\":\"wang\",\"userType\":\"sys_user\",\"email\":\"\",\"phonenumber\":\"\",\"sex\":\"0\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"\",\"loginDate\":null,\"remark\":null,\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"orderNum\":0,\"leader\":\"若依\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false}],\"roleIds\":[2],\"postIds\":[2],\"roleId\":null,\"position\":\"2\",\"positions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-02 10:14:02');
INSERT INTO `sys_oper_log` VALUES (1610523760077582418, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-02 10:12:38.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-02 10:15:47.508\",\"userId\":3,\"deptId\":100,\"userName\":\"wang\",\"nickName\":\"wang\",\"userType\":\"sys_user\",\"email\":\"\",\"phonenumber\":\"\",\"sex\":\"0\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"\",\"loginDate\":null,\"remark\":null,\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"orderNum\":0,\"leader\":\"若依\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false}],\"roleIds\":[2],\"postIds\":[2],\"roleId\":null,\"position\":\"2\",\"positions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-02 10:15:48');
INSERT INTO `sys_oper_log` VALUES (1610523760077582419, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-02 10:12:38.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-02 10:17:38.821\",\"userId\":3,\"deptId\":100,\"userName\":\"wang\",\"nickName\":\"wang\",\"userType\":\"sys_user\",\"email\":\"\",\"phonenumber\":\"\",\"sex\":\"0\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"\",\"loginDate\":null,\"remark\":null,\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"orderNum\":0,\"leader\":\"若依\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false}],\"roleIds\":[2],\"postIds\":[2],\"roleId\":null,\"position\":\"2\",\"positions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-02 10:20:21');
INSERT INTO `sys_oper_log` VALUES (1610523760077582420, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-02 10:12:38.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-02 10:25:21.838\",\"userId\":3,\"deptId\":100,\"userName\":\"wang\",\"nickName\":\"wang\",\"userType\":\"sys_user\",\"email\":\"\",\"phonenumber\":\"\",\"sex\":\"0\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"\",\"loginDate\":null,\"remark\":null,\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"orderNum\":0,\"leader\":\"若依\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false}],\"roleIds\":[2],\"postIds\":[2],\"roleId\":null,\"position\":\"2\",\"positions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-02 10:25:22');
INSERT INTO `sys_oper_log` VALUES (1610523760077582421, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-02 10:12:38.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-02 10:28:05.909\",\"userId\":3,\"deptId\":100,\"userName\":\"wang\",\"nickName\":\"wang\",\"userType\":\"sys_user\",\"email\":\"\",\"phonenumber\":\"\",\"sex\":\"0\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"\",\"loginDate\":null,\"remark\":null,\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"orderNum\":0,\"leader\":\"若依\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false}],\"roleIds\":[2],\"postIds\":[2],\"roleId\":null,\"position\":\"2\",\"positions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-02 10:28:06');
INSERT INTO `sys_oper_log` VALUES (1610523760077582422, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-02 10:30:37.119\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-02 10:30:37.119\",\"userId\":4,\"deptId\":null,\"userName\":\"zhao\",\"nickName\":\"zhao\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[2],\"postIds\":[1,2],\"roleId\":null,\"position\":\"2\",\"positions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-02 10:30:37');
INSERT INTO `sys_oper_log` VALUES (1610523760077582423, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-06 09:06:22.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-02 10:30:54.657\",\"parentName\":null,\"parentId\":\"1610826272882053121\",\"children\":[],\"menuId\":\"1611166548347691008\",\"menuName\":\"暂存入库信息\",\"orderNum\":1,\"path\":\"putTemporary\",\"component\":\"wmPut/putTemporary/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"wmPut:putTemporary:list\",\"icon\":\"#\",\"remark\":\"暂存入库信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-02 10:30:55');
INSERT INTO `sys_oper_log` VALUES (1610523760077582424, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-10 13:48:41.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-02 10:43:09.108\",\"dictCode\":89,\"dictSort\":1,\"dictLabel\":\"生产、销售假冒伪劣烟草专卖品\",\"dictValue\":\"2\",\"dictType\":\"cause\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-02 10:43:09');
INSERT INTO `sys_oper_log` VALUES (1610523760077582425, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":18,\"wmPutCoded\":\"zr230203-00001\",\"certificateCoded\":\"测试01\",\"causeType\":\"4\",\"whPutDate\":\"2023-02-14\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"2\",\"storekeeper\":\"3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":18}', 0, '', '2023-02-03 18:44:07');
INSERT INTO `sys_oper_log` VALUES (1610523760077582426, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":19,\"wmPutCoded\":\"zr230203-00001\",\"certificateCoded\":\"测试02\",\"causeType\":\"2\",\"whPutDate\":\"2023-02-14\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"2\",\"storekeeper\":\"4\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":19}', 0, '', '2023-02-03 18:49:42');
INSERT INTO `sys_oper_log` VALUES (1610523760077582427, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":20,\"wmPutCoded\":\"zr230203-00001\",\"certificateCoded\":\"ceshi\",\"causeType\":\"3\",\"whPutDate\":\"2023-02-21\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"2\",\"storekeeper\":\"3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":20}', 0, '', '2023-02-03 18:54:48');
INSERT INTO `sys_oper_log` VALUES (1610523760077582428, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":21,\"wmPutCoded\":\"zr230203-00001\",\"certificateCoded\":\"ceshi01\",\"causeType\":\"1\",\"whPutDate\":\"2023-02-13\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"1\",\"storekeeper\":\"4\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":21}', 0, '', '2023-02-03 19:10:26');
INSERT INTO `sys_oper_log` VALUES (1610523760077582429, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":22,\"wmPutCoded\":\"zr230203-00002\",\"certificateCoded\":\"ceshi1\",\"causeType\":\"3\",\"whPutDate\":\"2023-02-20\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"3\",\"storekeeper\":\"3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":22}', 0, '', '2023-02-03 19:13:20');
INSERT INTO `sys_oper_log` VALUES (1610523760077582430, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":23,\"wmPutCoded\":\"ZR230206-00001\",\"certificateCoded\":\"测试0001\",\"causeType\":\"2\",\"whPutDate\":\"2023-02-14\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"1\",\"storekeeper\":\"3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":23}', 0, '', '2023-02-06 10:20:32');
INSERT INTO `sys_oper_log` VALUES (1610523760077582431, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":24,\"wmPutCoded\":\"ZR230206-00001\",\"certificateCoded\":\"测试001\",\"causeType\":\"2\",\"whPutDate\":\"2023-02-15\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"2\",\"storekeeper\":\"3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":24}', 0, '', '2023-02-06 10:22:50');
INSERT INTO `sys_oper_log` VALUES (1610523760077582432, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":25,\"wmPutCoded\":\"ZR230206-00002\",\"certificateCoded\":\"测试001\",\"causeType\":\"2\",\"whPutDate\":\"2023-01-31\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"2\",\"storekeeper\":\"4,3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":25}', 0, '', '2023-02-06 10:27:02');
INSERT INTO `sys_oper_log` VALUES (1610523760077582433, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":26,\"wmPutCoded\":\"ZR230206-00003\",\"certificateCoded\":\"测试001\",\"causeType\":\"4\",\"whPutDate\":\"2023-02-14\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"2\",\"storekeeper\":\"3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":26}', 0, '', '2023-02-06 10:29:43');
INSERT INTO `sys_oper_log` VALUES (1610523760077582434, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":27,\"wmPutCoded\":\"ZR230206-00004\",\"certificateCoded\":\"cehsi 001\",\"causeType\":\"3\",\"whPutDate\":\"2023-02-20\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"2\",\"storekeeper\":\"4\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":27}', 0, '', '2023-02-06 10:35:56');
INSERT INTO `sys_oper_log` VALUES (1610523760077582435, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":28,\"wmPutCoded\":\"ZR230206-00005\",\"certificateCoded\":\"cehi001\",\"causeType\":\"4\",\"whPutDate\":\"2023-02-21\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"3\",\"storekeeper\":\"4\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":28}', 0, '', '2023-02-06 10:39:01');
INSERT INTO `sys_oper_log` VALUES (1610523760077582436, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":29,\"wmPutCoded\":\"ZR230206-00006\",\"certificateCoded\":\"ceehsi001\",\"causeType\":\"4\",\"whPutDate\":\"2023-02-15\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"3\",\"storekeeper\":\"4\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":29}', 0, '', '2023-02-06 10:39:37');
INSERT INTO `sys_oper_log` VALUES (1610523760077582437, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":30,\"wmPutCoded\":\"ZR230206-00007\",\"certificateCoded\":\"cehis001\",\"causeType\":\"3\",\"whPutDate\":\"2023-02-21\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"3\",\"storekeeper\":\"3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":30}', 0, '', '2023-02-06 10:40:41');
INSERT INTO `sys_oper_log` VALUES (1610523760077582438, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":31,\"wmPutCoded\":\"ZR230206-00008\",\"certificateCoded\":\"ceshi001\",\"causeType\":\"3\",\"whPutDate\":\"2023-02-21\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"3\",\"storekeeper\":\"4\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":31}', 0, '', '2023-02-06 10:41:24');
INSERT INTO `sys_oper_log` VALUES (1610523760077582439, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":32,\"wmPutCoded\":\"ZR230206-00009\",\"certificateCoded\":\"cehis001\",\"causeType\":\"4\",\"whPutDate\":\"2023-02-20\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"3\",\"storekeeper\":\"4\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":32}', 0, '', '2023-02-06 10:42:01');
INSERT INTO `sys_oper_log` VALUES (1610523760077582440, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 15:52:21.516\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 15:52:21.516\",\"dictId\":31,\"dictName\":\"入库类型\",\"dictType\":\"put_type\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 15:52:22');
INSERT INTO `sys_oper_log` VALUES (1610523760077582441, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 15:52:43.985\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 15:52:43.985\",\"dictCode\":92,\"dictSort\":0,\"dictLabel\":\"暂存入库\",\"dictValue\":\"1\",\"dictType\":\"put_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 15:52:44');
INSERT INTO `sys_oper_log` VALUES (1610523760077582442, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 15:53:00.501\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 15:53:00.501\",\"dictCode\":93,\"dictSort\":1,\"dictLabel\":\"2\",\"dictValue\":\"代管入库\",\"dictType\":\"put_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 15:53:01');
INSERT INTO `sys_oper_log` VALUES (1610523760077582443, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 15:53:01.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 15:53:11.076\",\"dictCode\":93,\"dictSort\":1,\"dictLabel\":\"代管入库\",\"dictValue\":\"2\",\"dictType\":\"put_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 15:53:11');
INSERT INTO `sys_oper_log` VALUES (1610523760077582444, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 15:53:38.524\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 15:53:38.524\",\"dictCode\":94,\"dictSort\":2,\"dictLabel\":\"罚没入库\",\"dictValue\":\"3\",\"dictType\":\"put_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 15:53:39');
INSERT INTO `sys_oper_log` VALUES (1610523760077582445, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 15:54:03.877\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 15:54:03.877\",\"dictCode\":95,\"dictSort\":3,\"dictLabel\":\"抽检返还入库\",\"dictValue\":\"4\",\"dictType\":\"put_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 15:54:04');
INSERT INTO `sys_oper_log` VALUES (1610523760077582446, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 16:12:33.696\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 16:12:33.696\",\"dictId\":32,\"dictName\":\"出库类型\",\"dictType\":\"out_type\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 16:12:34');
INSERT INTO `sys_oper_log` VALUES (1610523760077582447, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 16:12:57.324\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 16:12:57.324\",\"dictCode\":96,\"dictSort\":0,\"dictLabel\":\"代管出库\",\"dictValue\":\"1\",\"dictType\":\"out_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 16:12:57');
INSERT INTO `sys_oper_log` VALUES (1610523760077582448, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 16:15:08.765\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 16:15:08.765\",\"dictCode\":97,\"dictSort\":0,\"dictLabel\":\"暂存出库\",\"dictValue\":\"2\",\"dictType\":\"out_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 16:15:09');
INSERT INTO `sys_oper_log` VALUES (1610523760077582449, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 16:15:23.436\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 16:15:23.436\",\"dictCode\":98,\"dictSort\":0,\"dictLabel\":\"抽检出库\",\"dictValue\":\"3\",\"dictType\":\"out_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 16:15:23');
INSERT INTO `sys_oper_log` VALUES (1610523760077582450, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-06 16:15:43.300\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-06 16:15:43.300\",\"dictCode\":99,\"dictSort\":0,\"dictLabel\":\"罚没出库\",\"dictValue\":\"4\",\"dictType\":\"out_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-06 16:15:43');
INSERT INTO `sys_oper_log` VALUES (1610523760077582451, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":33,\"wmPutCoded\":\"ZR230206-00001\",\"certificateCoded\":\"测试001\",\"causeType\":\"2\",\"whPutDate\":\"2023-02-08\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"2\",\"storekeeper\":\"3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"putType\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":33}', 0, '', '2023-02-06 16:35:47');
INSERT INTO `sys_oper_log` VALUES (1610523760077582452, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":34,\"wmPutCoded\":\"ZR230206-00002\",\"certificateCoded\":\"测试01\",\"causeType\":\"2\",\"whPutDate\":\"2023-01-30\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"1\",\"storekeeper\":\"3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"putType\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":34}', 0, '', '2023-02-06 16:41:00');
INSERT INTO `sys_oper_log` VALUES (1610523760077582453, '暂存入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutTemporaryController.add()', 'POST', 1, 'admin', '', '/wmPut/putTemporary', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":null,\"certificateCoded\":null,\"causeType\":null,\"whPutDate\":null,\"varietyNumber\":null,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":null,\"storekeeper\":null,\"synthesisKeeper\":null,\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"putType\":null,\"wmPutId\":34,\"client\":null,\"cause\":null,\"detainDate\":null,\"detainDeptName\":null,\"detainDept\":null,\"goodsCoded\":null,\"goodsName\":null,\"putNumber\":null,\"causeQr\":null,\"whAreaCoded\":null,\"unitCoded\":null,\"remark\":null,\"printTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":5}', 0, '', '2023-02-06 16:42:41');
INSERT INTO `sys_oper_log` VALUES (1610523760077582454, '商品入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutInfoController.add()', 'POST', 1, 'admin', '', '/wmPut/putInfo', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":35,\"wmPutCoded\":\"ZR230206-00003\",\"certificateCoded\":\"测试001\",\"causeType\":\"2\",\"whPutDate\":\"2023-02-07\",\"varietyNumber\":0,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":\"2\",\"storekeeper\":\"3\",\"synthesisKeeper\":\"2\",\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"putType\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":35}', 0, '', '2023-02-06 16:47:38');
INSERT INTO `sys_oper_log` VALUES (1610523760077582455, '暂存入库信息', 1, 'com.ruoyi.base.controller.wmPut.WmPutTemporaryController.add()', 'POST', 1, 'admin', '', '/wmPut/putTemporary', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"wmPutCoded\":null,\"certificateCoded\":null,\"causeType\":null,\"whPutDate\":null,\"varietyNumber\":null,\"whPutNumber\":null,\"whBitCoded\":null,\"invoicesStatus\":null,\"storekeeper\":null,\"synthesisKeeper\":null,\"file\":null,\"enclosure\":null,\"startTime\":null,\"endTime\":null,\"putType\":null,\"wmPutId\":35,\"client\":null,\"cause\":null,\"detainDate\":null,\"detainDeptName\":null,\"detainDept\":null,\"goodsCoded\":null,\"goodsName\":null,\"putNumber\":null,\"causeQr\":null,\"whAreaCoded\":null,\"unitCoded\":null,\"remark\":null,\"printTime\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":6}', 0, '', '2023-02-06 16:47:49');
INSERT INTO `sys_oper_log` VALUES (1610523760077582456, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wm_put_info\"}', '', 0, '', '2023-02-07 17:52:26');
INSERT INTO `sys_oper_log` VALUES (1610523760077582457, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"wm_put_escrow\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-09 09:24:21');
INSERT INTO `sys_oper_log` VALUES (1610523760077582458, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-09 09:30:26.576\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1610826272882053121\"},\"tableId\":\"1623492965953470466\",\"tableName\":\"wm_put_escrow\",\"tableComment\":\"代管入库信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"WmPutEscrow\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.wmPut\",\"moduleName\":\"putEscrow\",\"businessName\":\"putEscrow\",\"functionName\":\"代管入库信息\",\"functionAuthor\":\"ruoyi\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-02-09 09:24:21.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-09 09:30:26.582\",\"columnId\":\"1623492966091882497\",\"tableId\":\"1623492965953470466\",\"columnName\":\"id\",\"columnComment\":\"主键\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"usableColumn\":false,\"insert\":false,\"pk\":true,\"superColumn\":false,\"edit\":true,\"increment\":false,\"query\":false,\"capJavaField\":\"Id\"},{\"createBy\":\"admin\",\"createTime\":\"2023-02-09 09:24:21.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-09 09:30:26.585\",\"columnId\":\"1623492966091882498\",\"tableId\":\"1623492965953470466\",\"columnName\":\"wm_put_id\",\"columnComment\":\"入库信息id-代管\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"wmPutId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"usableColumn\":false,\"insert\":true,\"pk\":false,\"superColumn\":false,\"edit\":true,\"increment\":false,\"query\":false,\"capJavaField\":\"WmPutId\"},{\"createBy\":\"admin\",\"createTime\":\"2023-02-09 09:24:21.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-09 09:30:26.586\",\"columnId\":\"1623492966091882499\",\"tableId\":\"1623492965953470466\",\"columnName\":\"entrust_unit\",\"col', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-09 09:30:27');
INSERT INTO `sys_oper_log` VALUES (1610523760077582459, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wm_put_escrow\"}', '', 0, '', '2023-02-09 09:30:48');
INSERT INTO `sys_oper_log` VALUES (1610523760077582460, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-09 09:57:09.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-09 10:20:37.289\",\"parentName\":null,\"parentId\":\"1610826272882053121\",\"children\":[],\"menuId\":\"1623494585026117632\",\"menuName\":\"代管入库信息\",\"orderNum\":1,\"path\":\"putEscrow\",\"component\":\"putEscrow//index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"putEscrow:putEscrow:list\",\"icon\":\"#\",\"remark\":\"代管入库信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-09 10:20:37');
INSERT INTO `sys_oper_log` VALUES (1610523760077582461, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-09 09:57:09.000\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-09 10:21:03.550\",\"parentName\":null,\"parentId\":\"1610826272882053121\",\"children\":[],\"menuId\":\"1623494585026117632\",\"menuName\":\"代管入库信息\",\"orderNum\":1,\"path\":\"putEscrow\",\"component\":\"wmPut/putEscrow/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"putEscrow:putEscrow:list\",\"icon\":\"#\",\"remark\":\"代管入库信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-02-09 10:21:04');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'URL地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '上传人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `service` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主建',
  `config_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（0=正常,1=停用）',
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '对象存储配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, 'minio', 'ruoyi', 'ruoyi123', 'ruoyi', '', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-13 16:13:34', NULL);
INSERT INTO `sys_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-13 16:13:34', NULL);
INSERT INTO `sys_oss_config` VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-13 16:13:34', NULL);
INSERT INTO `sys_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-13 16:13:34', NULL);
INSERT INTO `sys_oss_config` VALUES (5, 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-13 16:13:34', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-25 14:40:32', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-12-13 16:13:34', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-12-13 16:13:34', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-12-13 16:13:34', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `position` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-02-10 17:48:13', 'admin', '2022-12-13 16:13:34', 'admin', '2023-02-10 17:48:13', '管理员', NULL);
INSERT INTO `sys_user` VALUES (2, 105, 'lionli', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-12-13 16:13:34', 'admin', '2022-12-13 16:13:34', 'admin', '2023-02-01 19:07:19', '测试员', '1');
INSERT INTO `sys_user` VALUES (3, 100, 'wang', 'wang', 'sys_user', '', '', '0', '', '$2a$10$ysW09flAlx.MQrPHabZrwe6NdP9BTkJPMdUIHG2W/Io20iGya/bP2', '0', '0', '', NULL, 'admin', '2023-02-02 10:12:38', 'admin', '2023-02-02 10:28:06', NULL, '2');
INSERT INTO `sys_user` VALUES (4, NULL, 'zhao', 'zhao', 'sys_user', '', '', '0', '', '$2a$10$G1L/aDDCzVI5wPQmyW17LuW17WOfIW1OzESFqHgAogO6wcQk1DWKa', '0', '0', '', NULL, 'admin', '2023-02-02 10:30:37', 'admin', '2023-02-02 10:30:37', NULL, '2');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (3, 2);
INSERT INTO `sys_user_post` VALUES (4, 1);
INSERT INTO `sys_user_post` VALUES (4, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 2);

-- ----------------------------
-- Table structure for wm_out_escrow
-- ----------------------------
DROP TABLE IF EXISTS `wm_out_escrow`;
CREATE TABLE `wm_out_escrow`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_out_id` int NOT NULL COMMENT '代管出库信息id',
  `certificate_coded_assaciation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联文书编号(入库且未结案的文书编号，有效数据筛选)',
  `unit_coded` int NULL DEFAULT NULL COMMENT '所属单位编号（接收单位）',
  `wh_put_date` date NULL DEFAULT NULL COMMENT '入库日期(代管出库)',
  `variety_number` int NULL DEFAULT NULL COMMENT '入库品种数(代管出库)',
  `wh_put_number` int NULL DEFAULT NULL COMMENT '入库数（条）(代管出库)',
  `measure_unit` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '入库单位（1-条，2-盒，3-包，4-听）数据字典（代管出库）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代管出库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_out_escrow
-- ----------------------------

-- ----------------------------
-- Table structure for wm_out_info
-- ----------------------------
DROP TABLE IF EXISTS `wm_out_info`;
CREATE TABLE `wm_out_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_out_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出库单号',
  `certificate_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文书编号',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品id',
  `goods_specification` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '商品规格（1-70mm,2-75mm...）数据字典',
  `wm_out_number` int NULL DEFAULT NULL COMMENT '出库数量',
  `invoices_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单据状态（保存未提交、提交已入库、撤销待入库）',
  `wm_out_date` date NULL DEFAULT NULL COMMENT '出库日期',
  `storekeeper` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '保管员',
  `storekeeper_id` int NULL DEFAULT NULL COMMENT '保管员-用户id',
  `synthesis_keeper` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '综合管理员',
  `synthesis_keeper_id` int NULL DEFAULT NULL COMMENT '综合管理员-用户id',
  `receiver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接收人员',
  `receiver_id` int NULL DEFAULT NULL COMMENT '接收人员-用户id',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '操作时间',
  `enclosure` mediumblob NULL COMMENT '附件',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `out_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出库类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品出库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_out_info
-- ----------------------------

-- ----------------------------
-- Table structure for wm_out_punish_confiscate
-- ----------------------------
DROP TABLE IF EXISTS `wm_out_punish_confiscate`;
CREATE TABLE `wm_out_punish_confiscate`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_out_id` int NOT NULL COMMENT '出库信息id-罚没',
  `client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当事人',
  `cause` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）',
  `wm_out_reason` int NULL DEFAULT NULL COMMENT '出库原因(返还，移送，转罚没)',
  `cigarette_quality` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '烟卷/商品 质量（1-完好，2-霉变，3-即将霉变）数据字典',
  `unit_coded` int NULL DEFAULT NULL COMMENT '所属单位编号（接收单位）',
  `unit_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属单位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '罚没出库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_out_punish_confiscate
-- ----------------------------

-- ----------------------------
-- Table structure for wm_out_sampling
-- ----------------------------
DROP TABLE IF EXISTS `wm_out_sampling`;
CREATE TABLE `wm_out_sampling`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_out_id` int NOT NULL COMMENT '出库信息id-抽检',
  `certificate_coded_assaciation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联文书编号(入库且未结案的文书编号，有效数据筛选)',
  `wm_out_reason` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出库原因(返还，移送，转罚没)',
  `unit_coded` int NULL DEFAULT NULL COMMENT '抽检单位编号',
  `unit_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '抽检单位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽检出库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_out_sampling
-- ----------------------------

-- ----------------------------
-- Table structure for wm_out_temporary
-- ----------------------------
DROP TABLE IF EXISTS `wm_out_temporary`;
CREATE TABLE `wm_out_temporary`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_out_id` int NOT NULL COMMENT '暂存出库信息id',
  `client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当事人',
  `cause` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）',
  `certificate_coded_assaciation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联文书编号(入库且未结案的文书编号，有效数据筛选)',
  `wm_out_reason` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出库原因(返还，移送，转罚没)',
  `cigarette_quality` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '烟卷质量（1-完好，2-霉变，3-即将霉变）数据字典',
  `unit_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属单位编号（接收单位）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂存出库信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_out_temporary
-- ----------------------------

-- ----------------------------
-- Table structure for wm_out_type_field
-- ----------------------------
DROP TABLE IF EXISTS `wm_out_type_field`;
CREATE TABLE `wm_out_type_field`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_out_id` int NOT NULL COMMENT '商品出库id',
  `wm_out_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品出库类型',
  `certificate_coded_assaciation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联文书编号(入库且未结案的文书编号，有效数据筛选)',
  `client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当事人',
  `cause` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）',
  `spot_check_unit` int NULL DEFAULT NULL COMMENT '抽检单位',
  `cigarette_quality` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '烟卷质量（1-完好，2-霉变，3-即将霉变）数据字典',
  `detain_transactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '案件办理人员',
  `unit_coded` int NULL DEFAULT NULL COMMENT '所属单位编号（接收单位）',
  `wm_out_reason` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出库原因(返还，移送，转罚没)',
  `wh_put_date` date NULL DEFAULT NULL COMMENT '入库日期(代管出库)',
  `variety_number` int NULL DEFAULT NULL COMMENT '入库品种数(代管出库)',
  `wh_put_number` int NULL DEFAULT NULL COMMENT '入库数（条）(代管出库)',
  `measure_unit` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '入库单位（1-条，2-盒，3-包，4-听）数据字典（代管出库）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_out_type_field
-- ----------------------------

-- ----------------------------
-- Table structure for wm_put2_info
-- ----------------------------
DROP TABLE IF EXISTS `wm_put2_info`;
CREATE TABLE `wm_put2_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_put_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入库单号',
  `certificate_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文书编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_put2_info
-- ----------------------------

-- ----------------------------
-- Table structure for wm_put_escrow
-- ----------------------------
DROP TABLE IF EXISTS `wm_put_escrow`;
CREATE TABLE `wm_put_escrow`  (
  `id` int NOT NULL COMMENT '主键',
  `wm_put_id` int NULL DEFAULT NULL COMMENT '入库信息id-代管',
  `entrust_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '委托单位',
  `entrust_unit_id` int NULL DEFAULT NULL COMMENT '单位id',
  `entrust_date` date NULL DEFAULT NULL COMMENT '委托日期',
  `wh_bit_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存放库位编码',
  `goods_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代管入库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_put_escrow
-- ----------------------------

-- ----------------------------
-- Table structure for wm_put_info
-- ----------------------------
DROP TABLE IF EXISTS `wm_put_info`;
CREATE TABLE `wm_put_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_put_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入库单号',
  `certificate_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文书编号',
  `cause_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '案件类型（1-简易程序、2-普通程序、3-行政处罚案件移送、4-涉烟刑事案件移送）',
  `wh_put_date` date NULL DEFAULT NULL COMMENT '入库日期',
  `variety_number` int NULL DEFAULT NULL COMMENT '入库品种数',
  `wh_put_number` double NULL DEFAULT NULL COMMENT '入库数（条）',
  `wh_bit_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存放库位编码',
  `invoices_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单据状态（保存未提交、提交已入库、撤销待入库）',
  `storekeeper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '保管员',
  `synthesis_keeper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '综合管理员',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '操作时间',
  `enclosure` mediumblob NULL COMMENT '附件',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `put_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入库类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品入库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_put_info
-- ----------------------------
INSERT INTO `wm_put_info` VALUES (34, 'ZR230206-00002', '测试01', '2', '2023-01-30', 0, NULL, NULL, '1', '3', '2', '2023-02-06 16:41:00.464', 'admin', '2023-02-06 16:41:00.464', NULL, 'admin', '1');
INSERT INTO `wm_put_info` VALUES (35, 'ZR230206-00003', '测试001', '2', '2023-02-07', 0, NULL, NULL, '2', '3', '2', '2023-02-06 16:47:38.192', 'admin', '2023-02-06 16:47:38.192', NULL, 'admin', '1');

-- ----------------------------
-- Table structure for wm_put_punish_confiscate
-- ----------------------------
DROP TABLE IF EXISTS `wm_put_punish_confiscate`;
CREATE TABLE `wm_put_punish_confiscate`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_put_id` int NOT NULL COMMENT '入库信息id-罚没',
  `cigarette_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '卷烟类型（1-真烟，2-假烟）',
  `goods_coded` int NULL DEFAULT NULL COMMENT '商品编码',
  `wh_bit_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存放库位编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '罚没入库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_put_punish_confiscate
-- ----------------------------

-- ----------------------------
-- Table structure for wm_put_sampling
-- ----------------------------
DROP TABLE IF EXISTS `wm_put_sampling`;
CREATE TABLE `wm_put_sampling`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_put_id` int NOT NULL COMMENT '入库信息id-抽检返还',
  `wm_out_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联出库单',
  `cause_coded` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联案件号(源自出库单涉及的案件编号)',
  `cigarette_type` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '卷烟类型（1-真烟，2-假烟）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽检返还入库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_put_sampling
-- ----------------------------

-- ----------------------------
-- Table structure for wm_put_temporary
-- ----------------------------
DROP TABLE IF EXISTS `wm_put_temporary`;
CREATE TABLE `wm_put_temporary`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_put_id` int NOT NULL COMMENT '入库信息id-暂存',
  `client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当事人',
  `cause` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）',
  `detain_date` date NULL DEFAULT NULL COMMENT '查扣日期',
  `detain_dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扣查部门',
  `detain_dept` int NULL DEFAULT NULL COMMENT '扣查部门id',
  `goods_coded` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品编码',
  `put_number` int NULL DEFAULT NULL COMMENT '入库条数',
  `cause_qr` mediumblob NULL COMMENT '案件二维码',
  `wh_area_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存放库区',
  `wh_bit_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存放库位',
  `unit_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属单位',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `print_time` datetime NULL DEFAULT NULL COMMENT '条码打印时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂存入库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_put_temporary
-- ----------------------------
INSERT INTO `wm_put_temporary` VALUES (4, 17, '测试', '1', '2023-01-04', NULL, NULL, NULL, 5, NULL, '123', '123', '测试', '测试', NULL);
INSERT INTO `wm_put_temporary` VALUES (5, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wm_put_temporary` VALUES (6, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for wm_put_type_field
-- ----------------------------
DROP TABLE IF EXISTS `wm_put_type_field`;
CREATE TABLE `wm_put_type_field`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_put_id` int NOT NULL COMMENT '商品入库id',
  `wm_type` int NULL DEFAULT NULL COMMENT '入库类型',
  `entrust_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '委托单位',
  `entrust_unit_id` int NULL DEFAULT NULL COMMENT '单位id',
  `entrust_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '委托人',
  `entrust_person_id` int NULL DEFAULT NULL COMMENT '委托人-用户id',
  `cause` int NULL DEFAULT NULL COMMENT '案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）',
  `detain_dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扣查部门',
  `detain_dept` int NULL DEFAULT NULL COMMENT '扣查部门id',
  `client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当事人',
  `cigarette_type` int NULL DEFAULT NULL COMMENT '卷烟类型（1-真烟，2-假烟）',
  `wm_out_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联出库单',
  `cause_coded` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联案件号(源自出库单涉及的案件编号)',
  `detain_date` date NULL DEFAULT NULL COMMENT '查扣日期',
  `detain_transactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '案件办理人员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_put_type_field
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `xxl_job_group` VALUES (1, 'xxl-job-executor', '示例执行器', 0, NULL, '2018-11-03 22:21:31');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime NULL DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT 0 COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT 0 COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO `xxl_job_info` VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 0, 0, 0);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock`  (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `trigger_time` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '调度-日志',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `I_trigger_time`(`trigger_time`) USING BTREE,
  INDEX `I_handle_code`(`handle_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT 0 COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_trigger_day`(`trigger_day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_g_k_v`(`registry_group`, `registry_key`, `registry_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
