package com.ruoyi.base.domain.vo;

import java.math.BigDecimal;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ContentStyle;
import com.alibaba.excel.annotation.write.style.HeadStyle;
import com.alibaba.excel.enums.poi.HorizontalAlignmentEnum;
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
    //@ExcelProperty(value = "主键")
    private Long id;

    /**
     * 商品编码
     */
    @ExcelProperty(value = "商品编码")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String goodsCoded;

    /**
     * 商品名称
     */
    @ExcelProperty(value = "商品名称")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String goodsName;

    /**
     * 所属品牌名称
     */
    @ExcelProperty(value = "所属品牌名称")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String brandName;

    /**
     * 所属品牌编号
     */
    @ExcelProperty(value = "所属品牌编号")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String brandCoded;

    /**
     * 小盒条码
     */
    @ExcelProperty(value = "小盒条码")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String smallBoxBarcode;

    /**
     * 条盒条码
     */
    @ExcelProperty(value = "条盒条码")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String barboxBarcode;

    /**
     * 商品类型（1-烤烟，2-混合，3-外香，4-雪茄）数据字典
     */
    @ExcelProperty(value = "商品类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "goods_type")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String goodsType;

    /**
     * 商品规格（1-70mm,2-75mm...）数据字典
     */
    @ExcelProperty(value = "商品规格", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "goods_specification")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String goodsSpecification;

    /**
     * 计量单位（1-条，2-盒，3-包，4-听）数据字典
     */
    @ExcelProperty(value = "计量单位", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "measure_unit")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String measureUnit;

    /**
     * 单条盒数（1-10,2-5,3-6,4-1）数据字典
     */
    @ExcelProperty(value = "单条盒数", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "single_barbox_number")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String singleBarboxNumber;

    /**
     * 小盒支数（1-20,2-16,3-1）数据字典
     */
    @ExcelProperty(value = "小盒支数", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "small_box_number")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String smallBoxNumber;

    /**
     * 单盒售价
     */
    @ExcelProperty(value = "单盒售价")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private BigDecimal singleBoxPrice;

    /**
     * 条盒售价
     */
    @ExcelProperty(value = "条盒售价")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private BigDecimal barboxPrice;

    /**
     * 条盒批发价
     */
    @ExcelProperty(value = "条盒批发价")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private BigDecimal barboxWholesalePrices;

    /**
     * 包装形式(1-条盒硬盒，2-条盒软盒，3-木盒，4-听盒)数据字典
     */
    @ExcelProperty(value = "包装形式")
    @ExcelDictFormat(dictType = "packaging_forms")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String packagingForms;

    /**
     * 上市状态（0-已上市，1-未上市，2-已退市）数据字典
     */
    @ExcelProperty(value = "上市状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "listing_status")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String listingStatus;

    /**
     * 焦油量
     */
    @ExcelProperty(value = "焦油量/mg")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String tarContent;

    /**
     * 烟气烟碱量
     */
    @ExcelProperty(value = "烟气烟碱量/mg")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String smokeNicotine;

    /**
     * 一氧化碳量
     */
    @ExcelProperty(value = "一氧化碳量/mg")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String monoxideCarbon;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String remark;


}
