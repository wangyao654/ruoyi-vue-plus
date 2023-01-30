package com.ruoyi.wmPut.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 罚没入库信息业务对象 wm_put_punish_confiscate
 *
 * @author ruoyi
 * @date 2023-01-29
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class WmPutPunishConfiscateBo extends WmPutInfoBo {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 入库信息id-罚没
     */
    @NotNull(message = "入库信息id-罚没不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long wmPutId;

    /**
     * 卷烟类型（1-真烟，2-假烟）
     */
    @NotBlank(message = "卷烟类型（1-真烟，2-假烟）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String cigaretteType;
    private String goodsCoded;
    private String goodsName;

}
