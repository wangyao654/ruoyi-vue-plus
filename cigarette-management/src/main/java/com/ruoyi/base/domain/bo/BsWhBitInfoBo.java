package com.ruoyi.base.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 库位信息业务对象 bs_wh_bit_info
 *
 * @author ruoyi
 * @date 2023-01-02
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BsWhBitInfoBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 库位编号
     */
    @NotBlank(message = "库位编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whBitCoded;

    /**
     * 库位名称
     */
    @NotBlank(message = "库位名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whBitName;

    /**
     * 库位容量（条） 针对案件超出货位容量，会指引存放货位
     */
    @NotBlank(message = "库位容量（条） 针对案件超出货位容量，会指引存放货位不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whBitCapacity;

    /**
     * 是否专属 （专属后，允许存放其他信息）
     */
    @NotBlank(message = "是否专属 （专属后，允许存放其他信息）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String isExclusive;

    /**
     * 专属类型（1-商品专属、2-单位专属）
     */
    private String exclusiveType;

    /**
     * 所属库区编号
     */
    @NotBlank(message = "所属库区编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whAreaCoded;

    /**
     * 所属库区id
     */
    @NotBlank(message = "所属库区id不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whAreaName;

    /**
     * 所属仓库编号
     */
    @NotBlank(message = "所属仓库编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehouseCoded;

    /**
     * 所属仓库id
     */
    @NotBlank(message = "所属仓库id不能为空", groups = { AddGroup.class, EditGroup.class })
    private String warehouseName;

    /**
     * 库位类型（1-货架型，2-扁平型）
     */
    @NotBlank(message = "库位类型（1-货架型，2-扁平型）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whBitType;

    /**
     * 货架编号
     */
    private String shelfCoded;

    /**
     * 行号
     */
    private String rowNumber;

    /**
     * 列号
     */
    private String columnNumber;

    /**
     * 库位启用状态（0-正常，1-停用）
     */
    @NotBlank(message = "库位启用状态（0-正常，1-停用）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whBitEnabled;

    /**
     * 对象编号
     */
    private String objectCoded;

    /**
     * 对象名称
     */
    private String objectName;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;
    private Date startTime;

    private Date endTime;


}
