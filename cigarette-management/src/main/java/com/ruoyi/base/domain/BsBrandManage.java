package com.ruoyi.base.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 品牌管理/品牌详细信息对象 bs_brand_manage
 *
 * @author ruoyi
 * @date 2022-12-27
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("bs_brand_manage")
public class BsBrandManage extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 品牌编号
     */
    private String brandCoded;
    /**
     * 品牌名称
     */
    private String brandName;
    /**
     * 品牌所在地
     */
    private String brandLocality;
    /**
     * 启用状态 0-正常 ，1-停用 （系统开关）
     */
    private String brandEnabled;
    /**
     * 备注
     */
    private String remark;

}
