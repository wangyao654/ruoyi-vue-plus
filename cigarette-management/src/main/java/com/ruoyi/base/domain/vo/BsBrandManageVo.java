package com.ruoyi.base.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ContentStyle;
import com.alibaba.excel.annotation.write.style.HeadStyle;
import com.alibaba.excel.enums.poi.HorizontalAlignmentEnum;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

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
   // @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 品牌编号
     */
    @ExcelProperty(value = "品牌编号")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String brandCoded;

    /**
     * 品牌名称
     */
    @ExcelProperty(value = "品牌名称")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String brandName;

    /**
     * 品牌所在地
     */
    @ExcelProperty(value = "品牌所在地")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String brandLocality;

    /**
     * 启用状态 0-正常 ，1-停用 （系统开关）
     */
    @ExcelProperty(value = "启用状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_common_status")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String brandEnabled;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String remark;


}
