package com.ruoyi.wmPut.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 抽检返还入库信息业务对象 wm_put_sampling
 *
 * @author ruoyi
 * @date 2023-02-13
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class WmPutSamplingBo extends WmPutInfoBo {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 入库信息id-抽检返还
     */
    @NotNull(message = "入库信息id-抽检返还不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long wmPutId;

    /**
     * 关联出库单
     */
    @NotBlank(message = "关联出库单不能为空", groups = { AddGroup.class, EditGroup.class })
    private String wmOutCoded;

    /**
     * 关联案件号(源自出库单涉及的案件编号)
     */
    @NotBlank(message = "关联案件号(源自出库单涉及的案件编号)不能为空", groups = { AddGroup.class, EditGroup.class })
    private String causeCoded;

    /**
     * 卷烟类型（1-真烟，2-假烟）
     */
    @NotBlank(message = "卷烟类型（1-真烟，2-假烟）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String cigaretteType;

    private String remark;

    /**
     * 商品编号
     */
/*    @NotBlank(message = "商品编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String goodsCoded;*/


}
