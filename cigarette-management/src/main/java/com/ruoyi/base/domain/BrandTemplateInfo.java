package com.ruoyi.base.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 brand_template_info
 *
 * @author ruoyi
 * @date 2023-02-23
 */
@Data
@TableName("brand_template_info")
public class BrandTemplateInfo {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 品牌编号
     */
    private Long brandId;
    /**
     * 模板编号
     */
    private String templateCoded;
    /**
     * 模板名称
     */
    private String templateName;
    /**
     * 文件
     */
    private String templateFileName;
    /**
     * 预览图片
     */
    private String templatePicture;
    /**
     * 备注
     */
    private String remark;

}
