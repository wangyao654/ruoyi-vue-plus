package com.ruoyi.base.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import java.util.Date;



/**
 * 库位信息视图对象 bs_wh_bit_info
 *
 * @author ruoyi
 * @date 2023-01-02
 */
@Data
@ExcelIgnoreUnannotated
public class BsWhBitInfoVo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 库位编号
     */
    @ExcelProperty(value = "库位编号")
    private String whBitCoded;

    /**
     * 库位名称
     */
    @ExcelProperty(value = "库位名称")
    private String whBitName;

    /**
     * 库位容量（条） 针对案件超出货位容量，会指引存放货位
     */
    @ExcelProperty(value = "库位容量", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "条=")
    private String whBitCapacity;

    /**
     * 是否专属 （专属后，允许存放其他信息）
     */
    @ExcelProperty(value = "是否专属 ", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "专=属后，允许存放其他信息")
    private String isExclusive;

    /**
     * 专属类型（1-商品专属、2-单位专属）
     */
    @ExcelProperty(value = "专属类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-商品专属、2-单位专属")
    private String exclusiveType;

    /**
     * 所属库区编号
     */
    @ExcelProperty(value = "所属库区编号")
    private String whAreaCoded;

    /**
     * 所属库区id
     */
    @ExcelProperty(value = "所属库区id")
    private String whAreaName;

    /**
     * 所属仓库编号
     */
    @ExcelProperty(value = "所属仓库编号")
    private String warehouseCoded;

    /**
     * 所属仓库id
     */
    @ExcelProperty(value = "所属仓库id")
    private String warehouseName;

    /**
     * 库位类型（1-货架型，2-扁平型）
     */
    @ExcelProperty(value = "库位类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-货架型，2-扁平型")
    private String whBitType;

    /**
     * 货架编号
     */
    @ExcelProperty(value = "货架编号")
    private String shelfCoded;

    /**
     * 行号
     */
    @ExcelProperty(value = "行号")
    private String rowsNumber;

    /**
     * 列号
     */
    @ExcelProperty(value = "列号")
    private String columnNumber;

    /**
     * 库位启用状态（0-正常，1-停用）
     */
    @ExcelProperty(value = "库位启用状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=-正常，1-停用")
    private String whBitEnabled;

    /**
     * 对象编号
     */
    @ExcelProperty(value = "对象编号")
    private String objectCoded;

    /**
     * 对象名称
     */
    @ExcelProperty(value = "对象名称")
    private String objectName;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
