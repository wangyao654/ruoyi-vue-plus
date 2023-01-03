package com.ruoyi.base.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 库位信息对象 bs_wh_bit_info
 *
 * @author ruoyi
 * @date 2023-01-02
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("bs_wh_bit_info")
public class BsWhBitInfo extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 库位编号
     */
    private Long whBitCoded;
    /**
     * 库位名称
     */
    private String whBitName;
    /**
     * 库位容量（条） 针对案件超出货位容量，会指引存放货位
     */
    private String whBitCapacity;
    /**
     * 是否专属 （专属后，允许存放其他信息）
     */
    private String isExclusive;
    /**
     * 专属类型（1-商品专属、2-单位专属）
     */
    private String exclusiveType;
    /**
     * 所属库区编号
     */
    private Long whAreaCoded;
    /**
     * 所属库区id
     */
    private String whAreaName;
    /**
     * 所属仓库编号
     */
    private Long warehouseCoded;
    /**
     * 所属仓库id
     */
    private String warehouseName;
    /**
     * 库位类型（1-货架型，2-扁平型）
     */
    private String whBitType;
    /**
     * 货架编号
     */
    private String shelfCoded;
    /**
     * 行号
     */
    private String rowNumber;
    /**
     * 列号
     */
    private String columnNumber;
    /**
     * 库位启用状态（0-正常，1-停用）
     */
    private String whBitEnabled;
    /**
     * 对象编号
     */
    private String objectCoded;
    /**
     * 对象名称
     */
    private String objectName;
    /**
     * 备注
     */
    private String remark;

}
