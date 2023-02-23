package com.ruoyi.base.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * 【请填写功能名称】视图对象 brand_template_info
 *
 * @author ruoyi
 * @date 2023-02-23
 */
@Data
@ExcelIgnoreUnannotated
public class BrandTemplateInfoVo {

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
    private Long brandId;

    /**
     * 模板编号
     */
    @ExcelProperty(value = "模板编号")
    private String templateCoded;

    /**
     * 模板名称
     */
    @ExcelProperty(value = "模板名称")
    private String templateName;

    /**
     * 文件
     */
    @ExcelProperty(value = "文件")
    private String templateFileName;

    /**
     * 预览图片
     */
    @ExcelProperty(value = "预览图片")
    private String templatePicture;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
