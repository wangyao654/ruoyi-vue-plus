package com.ruoyi.base.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】业务对象 brand_template_info
 *
 * @author ruoyi
 * @date 2023-02-23
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BrandTemplateInfoBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 品牌编号
     */
    @NotNull(message = "品牌编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long brandId;

    /**
     * 模板编号
     */
    @NotBlank(message = "模板编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String templateCoded;

    /**
     * 模板名称
     */
    @NotBlank(message = "模板名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String templateName;

    /**
     * 文件
     */
    @NotBlank(message = "文件不能为空", groups = { AddGroup.class, EditGroup.class })
    private String templateFileName;

    /**
     * 预览图片
     */
    @NotBlank(message = "预览图片不能为空", groups = { AddGroup.class, EditGroup.class })
    private String templatePicture;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;


}
