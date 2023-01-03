package com.ruoyi.base.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import java.util.Date;



/**
 * 品牌管理/品牌详细信息视图对象 bs_brand_manage
 *
 * @author ruoyi
 * @date 2022-12-27
 */
@Data
@ExcelIgnoreUnannotated
public class BsBrandManageVo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 品牌编号
     */
    @ExcelProperty(value = "品牌编号")
    private String brandCoded;

    /**
     * 品牌名称
     */
    @ExcelProperty(value = "品牌名称")
    private String brandName;

    /**
     * 品牌所在地
     */
    @ExcelProperty(value = "品牌所在地")
    private String brandLocality;

    /**
     * 启用状态 0-正常 ，1-停用 （系统开关）
     */
    @ExcelProperty(value = "启用状态 0-正常 ，1-停用 ", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "系=统开关")
    private String brandEnabled;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
