package com.ruoyi.old.wmOut.domain.vo;

import java.util.Date;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 代管出库信息视图对象 wm_out_escrow
 *
 * @author ruoyi
 * @date 2023-02-16
 */
@Data
@ExcelIgnoreUnannotated
public class WmOutEscrowVo extends WmOutInfoVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    //@ExcelProperty(value = "主键")
    private Long id;

    /**
     * 代管出库信息id
     */
    @ExcelProperty(value = "代管出库信息id")
    private Long wmOutId;

    /**
     * 关联文书编号(入库且未结案的文书编号，有效数据筛选)
     */
    @ExcelProperty(value = "关联文书编号(入库且未结案的文书编号，有效数据筛选)")
    private String certificateCodedAssaciation;

    /**
     * 所属单位编号（接收单位）
     */
    @ExcelProperty(value = "所属单位编号", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "接收单位")
    private Long unitCoded;

    /**
     * 入库日期(代管出库)
     */
    @ExcelProperty(value = "入库日期(代管出库)")
    private Date whPutDate;

    /**
     * 入库品种数(代管出库)
     */
    @ExcelProperty(value = "入库品种数(代管出库)")
    private Long varietyNumber;

    /**
     * 入库数（条）(代管出库)
     */
    @ExcelProperty(value = "入库数", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "条=")
    private Long whPutNumber;

    /**
     * 入库单位（1-条，2-盒，3-包，4-听）数据字典（代管出库）
     */
    @ExcelProperty(value = "入库单位", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-条，2-盒，3-包，4-听")
    private String measureUnit;


}
