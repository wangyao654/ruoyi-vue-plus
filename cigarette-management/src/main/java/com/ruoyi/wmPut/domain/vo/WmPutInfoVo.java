package com.ruoyi.wmPut.domain.vo;

import java.util.Date;

import com.alibaba.excel.annotation.write.style.ContentStyle;
import com.alibaba.excel.annotation.write.style.HeadStyle;
import com.alibaba.excel.enums.poi.HorizontalAlignmentEnum;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import java.util.Date;



/**
 * 商品入库信息视图对象 wm_put_info
 *
 * @author ruoyi
 * @date 2023-01-05
 */
@Data
@ExcelIgnoreUnannotated
public class WmPutInfoVo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
  //  @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 入库单号
     */
  //  @ExcelProperty(value = "入库单号")
    private String wmPutCoded;

    /**
     * 文书编号
     */
    @ExcelProperty(value = "文书编号")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String certificateCoded;

    /**
     * 案件类型（1-简易程序、2-普通程序、3-行政处罚案件移送、4-涉烟刑事案件移送）
     */
    @ExcelProperty(value = "案件类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "causeType")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String causeType;

    /**
     * 入库日期
     */
    @ExcelProperty(value = "入库日期")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private Date whPutDate;

    /**
     * 入库品种数
     */
    @ExcelProperty(value = "入库品种数")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private Long varietyNumber;

    /**
     * 入库数（条）
     */
    @ExcelProperty(value = "入库数", converter = ExcelDictConvert.class)
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private Long whPutNumber;

    /**
     * 存放库位编码
     */
 //   @ExcelProperty(value = "存放库位编码")
    private String whBitCoded;


    /**
     * 单据状态（保存未提交、提交已入库、撤销待入库）
     */
    @ExcelProperty(value = "单据状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "invoices_status")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String invoicesStatus;

    /**
     * 保管员
     */
    @ExcelProperty(value = "保管员")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String storekeeper;

    /**
     * 综合管理员
     */
    @ExcelProperty(value = "综合管理员")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String synthesisKeeper;

    /**
     * 附件
     */
   // @ExcelProperty(value = "附件")
    //private String enclosure;
    private byte[] enclosure;
    /*
     * 入库类型
     * */
    private String putType;


    //@ExcelProperty(value = "存放库区编码")
    private String whAreaCoded;
    @ExcelProperty(value = "存放库区名称")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String whAreaName;
    @ExcelProperty(value = "单盒条码")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String singleBarboxNumber;
    @ExcelProperty(value = "小盒条码")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String smallBoxNumber;
    @ExcelProperty(value = "商品规格")
    @ExcelDictFormat(dictType = "goods_specification")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String goodsSpecification;

}
