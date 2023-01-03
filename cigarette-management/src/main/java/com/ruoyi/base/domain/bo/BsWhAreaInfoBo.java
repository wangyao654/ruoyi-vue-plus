package com.ruoyi.base.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 库区信息业务对象 bs_wh_area_info
 *
 * @author ruoyi
 * @date 2023-01-02
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BsWhAreaInfoBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 库区编号
     */
    @NotBlank(message = "库区编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whAreaCoded;

    /**
     * 库区名称
     */
    @NotBlank(message = "库区名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whAreaName;

    /**
     * 库区类型(1-暂存、2-代管、3-罚没、4-罚没5-代管)数据字典
     */
    @NotBlank(message = "库区类型(1-暂存、2-代管、3-罚没、4-罚没5-代管)数据字典不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whAreaType;

    /**
     * 所属仓库编号
     */
    @NotBlank(message = "所属仓库编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehouseCoded;

    /**
     * 所属仓库
     */
    @NotBlank(message = "所属仓库不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehouseName;

    /**
     * 归属仓库id
     */
    @NotNull(message = "归属仓库id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long warehouseId;

    /**
     * 库区启用状态（0-正常，1-停用）
     */
    @NotBlank(message = "库区启用状态（0-正常，1-停用）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whAreaEnabled;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;
    private Date startTime;

    private Date endTime;



}
