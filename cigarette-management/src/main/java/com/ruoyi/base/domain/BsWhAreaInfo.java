package com.ruoyi.base.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 库区信息对象 bs_wh_area_info
 *
 * @author ruoyi
 * @date 2023-01-02
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("bs_wh_area_info")
public class BsWhAreaInfo extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 库区编号
     */
    private Long whAreaCoded;
    /**
     * 库区名称
     */
    private String whAreaName;
    /**
     * 库区类型(1-暂存、2-代管、3-罚没、4-罚没5-代管)数据字典
     */
    private String whAreaType;
    /**
     * 所属仓库编号
     */
    private Long warehouseCoded;
    /**
     * 所属仓库
     */
    private String warehouseName;
    /**
     * 归属仓库id
     */
    private Long warehouseId;
    /**
     * 库区启用状态（0-正常，1-停用）
     */
    private String whAreaEnabled;
    /**
     * 备注
     */
    private String remark;

}
