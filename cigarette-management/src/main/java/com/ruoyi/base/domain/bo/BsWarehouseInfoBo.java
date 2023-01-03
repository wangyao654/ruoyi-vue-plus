package com.ruoyi.base.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 仓库管理业务对象 bs_warehouse_info
 *
 * @author ruoyi
 * @date 2022-12-30
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BsWarehouseInfoBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 仓库编号
     */
    @NotBlank(message = "仓库编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehouseCoded;

    /**
     * 仓库名称
     */
    @NotBlank(message = "仓库名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehouseName;

    /**
     * 仓库类型(1-暂存、2-代管、3-罚没、4-罚没，5-代管等)数据字典
     */
    @NotBlank(message = "仓库类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehouseType;

    /**
     * 仓库归属组织(部门id)
     */
    //@NotNull(message = "仓库归属组织(不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long warehouseOrganization;

    /**
     * 仓库地址
     */
    @NotBlank(message = "仓库地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehouseAddress;

    /**
     * 仓库负责人
     */
    @NotBlank(message = "仓库负责人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehousePrincipal;

    /**
     * 启用状态（0-正常，1-停用）数据字典
     */
    @NotBlank(message = "启用状态（0-正常，1-停用）数据字典不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehouseEnabled;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;

    private Date startTime;

    private Date endTime;



}
