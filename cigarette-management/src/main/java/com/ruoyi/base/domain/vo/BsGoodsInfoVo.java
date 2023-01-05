package com.ruoyi.base.domain.vo;

import java.math.BigDecimal;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import java.util.Date;



/**
 * 商品信息视图对象 bs_goods_info
 *
 * @author ruoyi
 * @date 2022-12-27
 */
@Data
@ExcelIgnoreUnannotated
public class BsGoodsInfoVo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 商品编码
     */
    @ExcelProperty(value = "商品编码")
    private String goodsCoded;

    /**
     * 商品名称
     */
    @ExcelProperty(value = "商品名称")
    private String goodsName;

    /**
     * 所属品牌名称
     */
    @ExcelProperty(value = "所属品牌名称")
    private String brandName;

    /**
     * 所属品牌编号
     */
    @ExcelProperty(value = "所属品牌编号")
    private String brandCoded;

    /**
     * 小盒条码
     */
    @ExcelProperty(value = "小盒条码")
    private String smallBoxBarcode;

    /**
     * 条盒条码
     */
    @ExcelProperty(value = "条盒条码")
    private String barboxBarcode;

    /**
     * 商品类型（1-烤烟，2-混合，3-外香，4-雪茄）数据字典
     */
    @ExcelProperty(value = "商品类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-烤烟，2-混合，3-外香，4-雪茄")
    private String goodsType;

    /**
     * 商品规格（1-70mm,2-75mm...）数据字典
     */
    @ExcelProperty(value = "商品规格", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-70mm,2-75mm...")
    private String goodsSpecification;

    /**
     * 计量单位（1-条，2-盒，3-包，4-听）数据字典
     */
    @ExcelProperty(value = "计量单位", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-条，2-盒，3-包，4-听")
    private String measureUnit;

    /**
     * 单条盒数（1-10,2-5,3-6,4-1）数据字典
     */
    @ExcelProperty(value = "单条盒数", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-10,2-5,3-6,4-1")
    private String singleBarboxNumber;

    /**
     * 小盒支数（1-20,2-16,3-1）数据字典
     */
    @ExcelProperty(value = "小盒支数", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-20,2-16,3-1")
    private String smallBoxNumber;

    /**
     * 单盒售价
     */
    @ExcelProperty(value = "单盒售价")
    private BigDecimal singleBoxPrice;

    /**
     * 条盒售价
     */
    @ExcelProperty(value = "条盒售价")
    private BigDecimal barboxPrice;

    /**
     * 条盒批发价
     */
    @ExcelProperty(value = "条盒批发价")
    private BigDecimal barboxWholesalePrices;

    /**
     * 包装形式(1-条盒硬盒，2-条盒软盒，3-木盒，4-听盒)数据字典
     */
    @ExcelProperty(value = "包装形式(1-条盒硬盒，2-条盒软盒，3-木盒，4-听盒)数据字典")
    private String packagingForms;

    /**
     * 上市状态（0-已上市，1-未上市，2-已退市）数据字典
     */
    @ExcelProperty(value = "上市状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=-已上市，1-未上市，2-已退市")
    private String listingStatus;

    /**
     * 焦油量
     */
    @ExcelProperty(value = "焦油量")
    private String tarContent;

    /**
     * 烟气烟碱量
     */
    @ExcelProperty(value = "烟气烟碱量")
    private String smokeNicotine;

    /**
     * 一氧化碳量
     */
    @ExcelProperty(value = "一氧化碳量")
    private String monoxideCarbon;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
