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

 Date: 25/12/2022 14:15:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bs_brand_manage
-- ----------------------------
DROP TABLE IF EXISTS `bs_brand_manage`;
CREATE TABLE `bs_brand_manage`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_coded` bigint NOT NULL COMMENT '品牌编号',
  `brand_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌名称',
  `brand_locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌所在地',
  `brand_enabled` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '启用状态 0-正常 ，1-停用 （系统开关）',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后操作人',
  `update_time` datetime(3) NOT NULL COMMENT '最后操作时间YYYY-MM-DD HH:MM:SS.000',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '品牌管理/品牌详细信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_brand_manage
-- ----------------------------

-- ----------------------------
-- Table structure for bs_dealingsunit_info
-- ----------------------------
DROP TABLE IF EXISTS `bs_dealingsunit_info`;
CREATE TABLE `bs_dealingsunit_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `unit_coded` int NOT NULL COMMENT '单位编号',
  `unit_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位名称',
  `unit_type` int NOT NULL COMMENT '单位类型(1-行政机关、2-代管仓库、3-零售户、4-执法科、5-检验机构)',
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `landline_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '座机号码',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `unit_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位地址',
  `unit_enabled` int NOT NULL COMMENT '启用状态（0-正常，1-停用）',
  `create_time` datetime(3) NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作者',
  `update_time` datetime(3) NOT NULL COMMENT '操作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '来往单位信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_dealingsunit_info
-- ----------------------------

-- ----------------------------
-- Table structure for bs_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `bs_goods_info`;
CREATE TABLE `bs_goods_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_coded` bigint NOT NULL COMMENT '商品编码',
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `brand_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属品牌名称',
  `brand_coded` bigint NOT NULL COMMENT '所属品牌编号',
  `small_box_barcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '小盒条码',
  `barbox_barcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '条盒条码',
  `goods_type` int NULL DEFAULT 1 COMMENT '商品类型（1-烤烟，2-混合，3-外香，4-雪茄）数据字典',
  `goods_specification` int NOT NULL DEFAULT 3 COMMENT '商品规格（1-70mm,2-75mm...）数据字典',
  `measure_unit` int NOT NULL DEFAULT 1 COMMENT '计量单位（1-条，2-盒，3-包，4-听）数据字典',
  `single_barbox_number` int NOT NULL DEFAULT 1 COMMENT '单条盒数（1-10,2-5,3-6,4-1）数据字典',
  `small_box_number` int NOT NULL DEFAULT 1 COMMENT '小盒支数（1-20,2-16,3-1）数据字典',
  `single_box_price` decimal(10, 2) NOT NULL COMMENT '单盒售价',
  `barbox_price` decimal(10, 2) NOT NULL COMMENT '条盒售价',
  `barbox_wholesale_prices` decimal(10, 2) NOT NULL COMMENT '条盒批发价',
  `packaging_forms` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '包装形式(1-条盒硬盒，2-条盒软盒，3-木盒，4-听盒)数据字典',
  `listing_status` int NOT NULL DEFAULT 0 COMMENT '上市状态（0-已上市，1-未上市，2-已退市）数据字典',
  `tar_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '焦油量',
  `smoke_nicotine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '烟气烟碱量',
  `monoxide_carbon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '一氧化碳量',
  `create_time` datetime(3) NOT NULL COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作者',
  `update_time` datetime(3) NOT NULL COMMENT '操作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_goods_info
-- ----------------------------

-- ----------------------------
-- Table structure for bs_warehouse_info
-- ----------------------------
DROP TABLE IF EXISTS `bs_warehouse_info`;
CREATE TABLE `bs_warehouse_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `warehouse_coded` int NOT NULL COMMENT '仓库编号',
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仓库名称',
  `warehouse_type` int NOT NULL COMMENT '仓库类型(1-暂存、2-代管、3-罚没、4-罚没，5-代管等)数据字典',
  `warehouse_organization` int NOT NULL COMMENT '仓库归属组织(部门id)',
  `warehouse_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仓库地址',
  `warehouse_principal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仓库负责人',
  `warehouse_enabled` int NOT NULL DEFAULT 0 COMMENT '启用状态（0-正常，1-停用）数据字典',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人',
  `update_time` datetime(3) NOT NULL COMMENT '更改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '仓库管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_warehouse_info
-- ----------------------------

-- ----------------------------
-- Table structure for bs_wh_area_info
-- ----------------------------
DROP TABLE IF EXISTS `bs_wh_area_info`;
CREATE TABLE `bs_wh_area_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wh_area_coded` int NOT NULL COMMENT '库区编号',
  `wh_area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '库区名称',
  `wh_area_type` int NOT NULL COMMENT '库区类型(1-暂存、2-代管、3-罚没、4-罚没5-代管)数据字典',
  `warehous_coded` int NOT NULL COMMENT '归属仓库编号',
  `warehouse_id` int NULL DEFAULT NULL COMMENT '归属仓库id',
  `wh_area_enabled` int NOT NULL COMMENT '库区启用状态（0-正常，1-停用）',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人',
  `update_time` datetime(3) NOT NULL COMMENT '更改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '库区信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_wh_area_info
-- ----------------------------

-- ----------------------------
-- Table structure for bs_wh_bit_info
-- ----------------------------
DROP TABLE IF EXISTS `bs_wh_bit_info`;
CREATE TABLE `bs_wh_bit_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wh_bit_coded` int NOT NULL COMMENT '库位编号',
  `wh_bit_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '库位名称',
  `wh_bit_capacity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '库位容量（条） 针对案件超出货位容量，会指引存放货位',
  `is_exclusive` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '否' COMMENT '是否专属 （专属后，允许存放其他信息）',
  `exclusive_type` int NOT NULL DEFAULT 1 COMMENT '专属类型（1-商品专属、2-单位专属）',
  `wh_area_coded` int NOT NULL COMMENT '所属库区编号',
  `wh_area_id` int NULL DEFAULT NULL COMMENT '所属库区id',
  `warehouse_coded` int NOT NULL COMMENT '所属仓库编号',
  `warehouse_id` int NULL DEFAULT NULL COMMENT '所属仓库id',
  `wh_bit_type` int NOT NULL DEFAULT 1 COMMENT '库位类型（1-货架型，2-扁平型）',
  `shelf_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '货架编号',
  `row_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行号',
  `column_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '列号',
  `wh_bit_enabled` int NOT NULL DEFAULT 0 COMMENT '库位启用状态（0-正常，1-停用）',
  `object_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '对象编号',
  `object_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '对象名称',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人',
  `update_time` datetime(3) NOT NULL COMMENT '更改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '库位信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_wh_bit_info
-- ----------------------------

-- ----------------------------
-- Table structure for check_perfomance_info
-- ----------------------------
DROP TABLE IF EXISTS `check_perfomance_info`;
CREATE TABLE `check_perfomance_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `check_task_id` int NULL DEFAULT NULL COMMENT '所属任务id',
  `task_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属任务编号',
  `check_date` date NOT NULL COMMENT '盘点日期 --实际操作日期',
  `goods_bit_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '货位编号',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品id',
  `goods_specification` int NOT NULL DEFAULT 3 COMMENT '商品规格（1-70mm,2-75mm...）数据字典',
  `first_check_number` int NOT NULL COMMENT '初盘数量',
  `again_check_number` int NULL DEFAULT NULL COMMENT '复盘数量',
  `checker` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘点人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
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
  `task_type` int NOT NULL COMMENT '任务类型（1-库位盘、2-商品盘、3-仓库全盘、4-盲盘、明盘）',
  `task_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务内容',
  `executer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行人',
  `executer_id` int NULL DEFAULT NULL COMMENT '执行人id',
  `check_plan_date` date NOT NULL COMMENT '盘点计划日期',
  `reality_plan_date` date NULL DEFAULT NULL COMMENT '实际计划盘点日期',
  `task_status` int NOT NULL COMMENT '任务状态（1-未下达，2-已下达，3-已完成、4-手工关闭）',
  `create_time` datetime(3) NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作者',
  `update_time` datetime(3) NOT NULL COMMENT '操作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
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
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'N', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-14 12:11:46', '是否开启验证码功能（true开启，false关闭）');
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
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

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

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-12-13 16:13:34', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-12-13 16:13:34', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-12-13 16:13:34', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'PLUS官网', 0, 4, 'https://gitee.com/JavaLionLi/RuoYi-Vue-Plus', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2022-12-13 16:13:34', '', NULL, 'RuoYi-Vue-Plus官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-12-13 16:13:34', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-12-13 16:13:34', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-12-13 16:13:34', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-12-13 16:13:34', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-12-13 16:13:34', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-12-13 16:13:34', '', NULL, '字典管理菜单');
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
  `oper_id` bigint NOT NULL COMMENT '日志主键',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
  `oss_config_id` bigint NOT NULL COMMENT '主建',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '对象存储配置表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '1', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-14 11:42:03', '');
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
  `user_id` bigint NOT NULL COMMENT '用户ID',
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
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-12-14 16:22:23', 'admin', '2022-12-13 16:13:34', 'admin', '2022-12-14 16:22:23', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'lionli', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-12-13 16:13:34', 'admin', '2022-12-13 16:13:34', '', NULL, '测试员');

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

-- ----------------------------
-- Table structure for wm_out_info
-- ----------------------------
DROP TABLE IF EXISTS `wm_out_info`;
CREATE TABLE `wm_out_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_out_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '出库单号',
  `certificate_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文书编号',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品id',
  `goods_specification` int NOT NULL DEFAULT 3 COMMENT '商品规格（1-70mm,2-75mm...）数据字典',
  `wm_out_number` int NOT NULL COMMENT '出库数量',
  `invoices_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单据状态（保存未提交、提交已入库、撤销待入库）',
  `wm_out_date` date NOT NULL COMMENT '出库日期',
  `storekeeper` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '保管员',
  `storekeeper_id` int NULL DEFAULT NULL COMMENT '保管员-用户id',
  `synthesis_keeper` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '综合管理员',
  `synthesis_keeper_id` int NULL DEFAULT NULL COMMENT '综合管理员-用户id',
  `receiver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接收人员',
  `receiver_id` int NULL DEFAULT NULL COMMENT '接收人员-用户id',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作者',
  `update_time` datetime(3) NOT NULL COMMENT '操作时间',
  `enclosure` mediumblob NOT NULL COMMENT '附件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品出库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_out_info
-- ----------------------------

-- ----------------------------
-- Table structure for wm_out_type_field
-- ----------------------------
DROP TABLE IF EXISTS `wm_out_type_field`;
CREATE TABLE `wm_out_type_field`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_out_id` int NOT NULL COMMENT '商品出库id',
  `wm_out_type` int NULL DEFAULT NULL COMMENT '商品出库类型',
  `certificate_coded_assaciation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联文书编号(入库且未结案的文书编号，有效数据筛选)',
  `client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当事人',
  `cause` int NULL DEFAULT NULL COMMENT '案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）',
  `spot_check_unit` int NULL DEFAULT NULL COMMENT '抽检单位',
  `cigarette_quality` int NULL DEFAULT 1 COMMENT '烟卷质量（1-完好，2-霉变，3-即将霉变）数据字典',
  `detain_transactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '案件办理人员',
  `unit_coded` int NULL DEFAULT NULL COMMENT '所属单位编号（接收单位）',
  `wm_out_reason` int NULL DEFAULT NULL COMMENT '出库原因(返还，移送，转罚没)',
  `wh_put_date` date NULL DEFAULT NULL COMMENT '入库日期(代管出库)',
  `variety_number` int NULL DEFAULT NULL COMMENT '入库品种数(代管出库)',
  `wh_put_number` int NULL DEFAULT NULL COMMENT '入库数（条）(代管出库)',
  `measure_unit` int NULL DEFAULT 1 COMMENT '入库单位（1-条，2-盒，3-包，4-听）数据字典（代管出库）',
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
-- Table structure for wm_put_info
-- ----------------------------
DROP TABLE IF EXISTS `wm_put_info`;
CREATE TABLE `wm_put_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wm_put_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '入库单号',
  `certificate_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文书编号',
  `cause_type` int NOT NULL DEFAULT 1 COMMENT '案件类型（1-简易程序、2-普通程序、3-行政处罚案件移送、4-涉烟刑事案件移送）',
  `wh_put_date` date NOT NULL COMMENT '入库日期',
  `variety_number` int NOT NULL COMMENT '入库品种数',
  `wh_put_number` int NOT NULL COMMENT '入库数（条）',
  `wh_bit_coded` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存放库位编码',
  `invoices_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单据状态（保存未提交、提交已入库、撤销待入库）',
  `storekeeper` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '保管员',
  `synthesis_keeper` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '综合管理员',
  `create_time` datetime(3) NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作者',
  `update_time` datetime(3) NOT NULL COMMENT '操作时间',
  `enclosure` mediumblob NOT NULL COMMENT '附件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品入库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wm_put_info
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
