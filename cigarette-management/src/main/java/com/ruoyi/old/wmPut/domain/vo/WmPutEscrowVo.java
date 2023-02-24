package com.ruoyi.old.wmPut.domain.vo;

import java.util.Date;

import com.alibaba.excel.annotation.write.style.ContentStyle;
import com.alibaba.excel.annotation.write.style.HeadStyle;
import com.alibaba.excel.enums.poi.HorizontalAlignmentEnum;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;


/**
 * 代管入库信息视图对象 wm_put_escrow
 *
 * @author ruoyi
 * @date 2023-02-09
 */
@Data
@ExcelIgnoreUnannotated
public class WmPutEscrowVo extends WmPutInfoVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    //@ExcelProperty(value = "主键")
    private Long id;

    /**
     * 入库信息id-代管
     */
    //@ExcelProperty(value = "入库信息id-代管")
    private Long wmPutId;

    /**
     * 委托单位
     */
    @ExcelProperty(value = "委托单位")
   // @ExcelDictFormat(dictType = "sys_common_status")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String entrustUnit;

    /**
     * 单位id
     */
    //@ExcelProperty(value = "单位id")
    private Long entrustUnitId;

    /**
     * 委托日期
     */
    @ExcelProperty(value = "委托日期")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private Date entrustDate;

    /**
     * 存放库位编码
     */
    //@ExcelProperty(value = "存放库位编码")
    private String whBitCoded;
    @ExcelProperty(value = "存放库位名称")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String whBitName;

    @ExcelProperty(value = "备注")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String remark;

}
