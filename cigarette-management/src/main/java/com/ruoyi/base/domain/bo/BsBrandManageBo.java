package com.ruoyi.base.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 品牌管理/品牌详细信息业务对象 bs_brand_manage
 *
 * @author ruoyi
 * @date 2022-12-27
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BsBrandManageBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 品牌编号
     */
    @NotNull(message = "品牌编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long brandCoded;

    /**
     * 品牌名称
     */
    @NotBlank(message = "品牌名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String brandName;

    /**
     * 品牌所在地
     */
    @NotBlank(message = "品牌所在地不能为空", groups = { AddGroup.class, EditGroup.class })
    private String brandLocality;

    /**
     * 启用状态 0-正常 ，1-停用 （系统开关）
     */
    @NotBlank(message = "启用状态 0-正常 ，1-停用 （系统开关）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String brandEnabled;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;

    private Date startTime;

    private Date endTime;

}
