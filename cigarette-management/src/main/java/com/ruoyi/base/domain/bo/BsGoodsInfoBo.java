package com.ruoyi.system.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import java.math.BigDecimal;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品信息业务对象 bs_goods_info
 *
 * @author ruoyi
 * @date 2022-12-27
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BsGoodsInfoBo extends BaseEntity {

    /**
     * 主键
     */
    private Long id;

    /**
     * 商品编码
     */
    @NotNull(message = "商品编码不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long goodsCoded;

    /**
     * 商品名称
     */
    @NotBlank(message = "商品名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String goodsName;

    /**
     * 所属品牌名称
     */
    @NotBlank(message = "所属品牌名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String brandName;

    /**
     * 所属品牌编号
     */
    @NotNull(message = "所属品牌编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long brandCoded;

    /**
     * 小盒条码
     */
    @NotBlank(message = "小盒条码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String smallBoxBarcode;

    /**
     * 条盒条码
     */
    @NotBlank(message = "条盒条码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String barboxBarcode;

    /**
     * 商品类型（1-烤烟，2-混合，3-外香，4-雪茄）数据字典
     */
    @NotBlank(message = "商品类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private String goodsType;

    /**
     * 商品规格（1-70mm,2-75mm...）数据字典
     */
    @NotBlank(message = "商品规格不能为空", groups = { AddGroup.class, EditGroup.class })
    private String goodsSpecification;

    /**
     * 计量单位（1-条，2-盒，3-包，4-听）数据字典
     */
    @NotBlank(message = "计量单位不能为空", groups = { AddGroup.class, EditGroup.class })
    private String measureUnit;

    /**
     * 单条盒数（1-10,2-5,3-6,4-1）数据字典
     */
    @NotBlank(message = "单条盒数不能为空", groups = { AddGroup.class, EditGroup.class })
    private String singleBarboxNumber;

    /**
     * 小盒支数（1-20,2-16,3-1）数据字典
     */
    @NotBlank(message = "小盒支数不能为空", groups = { AddGroup.class, EditGroup.class })
    private String smallBoxNumber;

    /**
     * 单盒售价
     */
    @NotNull(message = "单盒售价不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal singleBoxPrice;

    /**
     * 条盒售价
     */
    @NotNull(message = "条盒售价不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal barboxPrice;

    /**
     * 条盒批发价
     */
    @NotNull(message = "条盒批发价不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal barboxWholesalePrices;

    /**
     * 包装形式(1-条盒硬盒，2-条盒软盒，3-木盒，4-听盒)数据字典
     */
    @NotBlank(message = "包装形式不能为空", groups = { AddGroup.class, EditGroup.class })
    private String packagingForms;

    /**
     * 上市状态（0-已上市，1-未上市，2-已退市）数据字典
     */
    @NotBlank(message = "上市状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private String listingStatus;

    /**
     * 焦油量
     */
/*    @NotBlank(message = "焦油量不能为空", groups = { AddGroup.class, EditGroup.class })*/
    private String tarContent;

    /**
     * 烟气烟碱量
     */
/*    @NotBlank(message = "烟气烟碱量不能为空", groups = { AddGroup.class, EditGroup.class })*/
    private String smokeNicotine;

    /**
     * 一氧化碳量
     */
/*    @NotBlank(message = "一氧化碳量不能为空", groups = { AddGroup.class, EditGroup.class })*/
    private String monoxideCarbon;

    /**
     * 备注
     */
/*    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })*/
    private String remark;
    private Date startTime;

    private Date endTime;


}
