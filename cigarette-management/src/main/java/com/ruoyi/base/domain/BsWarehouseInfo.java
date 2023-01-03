package com.ruoyi.base.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 仓库管理对象 bs_warehouse_info
 *
 * @author ruoyi
 * @date 2022-12-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("bs_warehouse_info")
public class BsWarehouseInfo extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 仓库编号
     */
    private String warehouseCoded;
    /**
     * 仓库名称
     */
    private String warehouseName;
    /**
     * 仓库类型(1-暂存、2-代管、3-罚没、4-罚没，5-代管等)数据字典
     */
    private String warehouseType;
    /**
     * 仓库归属组织(部门id)
     */
    private Long warehouseOrganization;
    /**
     * 仓库地址
     */
    private String warehouseAddress;
    /**
     * 仓库负责人
     */
    private String warehousePrincipal;
    /**
     * 启用状态（0-正常，1-停用）数据字典
     */
    private String warehouseEnabled;
    /**
     * 备注
     */
    private String remark;

}
