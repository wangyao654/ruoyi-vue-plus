package com.ruoyi.base.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 来往单位信息业务对象 bs_dealingsunit_info
 *
 * @author ruoyi
 * @date 2023-01-04
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BsDealingsunitInfoBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 单位编号
     */
    @NotBlank(message = "单位编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String unitCoded;

    /**
     * 单位名称
     */
    @NotBlank(message = "单位名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String unitName;

    /**
     * 单位类型(1-行政机关、2-代管仓库、3-零售户、4-执法科、5-检验机构)
     */
    @NotBlank(message = "单位类型(1-行政机关、2-代管仓库、3-零售户、4-执法科、5-检验机构)不能为空", groups = { AddGroup.class, EditGroup.class })
    private String unitType;

    /**
     * 联系人
     */
    private String contactPerson;

    /**
     * 座机号码
     */
    @NotBlank(message = "座机号码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String landlineNumber;

    /**
     * 手机号
     */
    @NotBlank(message = "手机号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String phone;

    /**
     * 邮箱
     */
    @NotBlank(message = "邮箱不能为空", groups = { AddGroup.class, EditGroup.class })
    private String email;

    /**
     * 单位地址
     */
    private String unitAddress;

    /**
     * 启用状态（0-正常，1-停用）
     */
    @NotBlank(message = "启用状态（0-正常，1-停用）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String unitEnabled;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;
    private Date startTime;

    private Date endTime;


}
