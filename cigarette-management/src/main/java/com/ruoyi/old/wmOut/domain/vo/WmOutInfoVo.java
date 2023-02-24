package com.ruoyi.old.wmOut.domain.vo;

import java.util.Date;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 商品出库信息视图对象 wm_out_info
 *
 * @author ruoyi
 * @date 2023-02-14
 */
@Data
@ExcelIgnoreUnannotated
public class WmOutInfoVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
  //  @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 出库单号
     */
    @ExcelProperty(value = "出库单号")
    private String wmOutCoded;

    /**
     * 文书编号
     */
    @ExcelProperty(value = "文书编号")
    private String certificateCoded;

    /**
     * 商品名称
     */
    @ExcelProperty(value = "商品名称")
    private String goodsName;

    /**
     * 商品id
     */
  //  @ExcelProperty(value = "商品id")
    private Long goodsId;

    /**
     * 商品规格（1-70mm,2-75mm...）数据字典
     */
    @ExcelProperty(value = "商品规格", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-70mm,2-75mm...")
    private String goodsSpecification;

    /**
     * 出库数量
     */
    @ExcelProperty(value = "出库数量")
    private Long wmOutNumber;

    /**
     * 单据状态（保存未提交、提交已入库、撤销待入库）
     */
    @ExcelProperty(value = "单据状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "保=存未提交、提交已入库、撤销待入库")
    private String invoicesStatus;

    /**
     * 出库日期
     */
    @ExcelProperty(value = "出库日期")
    private Date wmOutDate;

    /**
     * 保管员
     */
    @ExcelProperty(value = "保管员")
    private String storekeeper;

    /**
     * 保管员-用户id
     */
    //@ExcelProperty(value = "保管员-用户id")
    private Long storekeeperId;

    /**
     * 综合管理员
     */
    @ExcelProperty(value = "综合管理员")
    private String synthesisKeeper;

    /**
     * 综合管理员-用户id
     */
    //@ExcelProperty(value = "综合管理员-用户id")
    private Long synthesisKeeperId;

    /**
     * 接收人员
     */
    @ExcelProperty(value = "接收人员")
    private String receiver;

    /**
     * 接收人员-用户id
     */
   // @ExcelProperty(value = "接收人员-用户id")
    private Long receiverId;

    /**
     * 附件
     */
    @ExcelProperty(value = "附件")
    private String enclosure;

    /**
     * 出库类型
     */
    @ExcelProperty(value = "出库类型")
    @ExcelDictFormat(readConverterExp = "保=存未提交、提交已入库、撤销待入库")
    private String outType;

    private Date startTime;
    private Date endTime;

}
