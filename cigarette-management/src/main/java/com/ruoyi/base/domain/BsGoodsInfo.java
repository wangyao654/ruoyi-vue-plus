package com.ruoyi.base.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import java.math.BigDecimal;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品信息对象 bs_goods_info
 *
 * @author ruoyi
 * @date 2022-12-27
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("bs_goods_info")
public class BsGoodsInfo extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 商品编码
     */
    private Long goodsCoded;
    /**
     * 商品名称
     */
    private String goodsName;
    /**
     * 所属品牌名称
     */
    private String brandName;
    /**
     * 所属品牌编号
     */
    private String brandCoded;
    /**
     * 小盒条码
     */
    private String smallBoxBarcode;
    /**
     * 条盒条码
     */
    private String barboxBarcode;
    /**
     * 商品类型（1-烤烟，2-混合，3-外香，4-雪茄）数据字典
     */
    private String goodsType;
    /**
     * 商品规格（1-70mm,2-75mm...）数据字典
     */
    private String goodsSpecification;
    /**
     * 计量单位（1-条，2-盒，3-包，4-听）数据字典
     */
    private String measureUnit;
    /**
     * 单条盒数（1-10,2-5,3-6,4-1）数据字典
     */
    private String singleBarboxNumber;
    /**
     * 小盒支数（1-20,2-16,3-1）数据字典
     */
    private String smallBoxNumber;
    /**
     * 单盒售价
     */
    private BigDecimal singleBoxPrice;
    /**
     * 条盒售价
     */
    private BigDecimal barboxPrice;
    /**
     * 条盒批发价
     */
    private BigDecimal barboxWholesalePrices;
    /**
     * 包装形式(1-条盒硬盒，2-条盒软盒，3-木盒，4-听盒)数据字典
     */
    private String packagingForms;
    /**
     * 上市状态（0-已上市，1-未上市，2-已退市）数据字典
     */
    private String listingStatus;
    /**
     * 焦油量
     */
    private String tarContent;
    /**
     * 烟气烟碱量
     */
    private String smokeNicotine;
    /**
     * 一氧化碳量
     */
    private String monoxideCarbon;
    /**
     * 备注
     */
    private String remark;

}
