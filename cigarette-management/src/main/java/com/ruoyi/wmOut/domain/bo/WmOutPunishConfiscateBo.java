package com.ruoyi.wmOut.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 罚没出库信息业务对象 wm_out_punish_confiscate
 *
 * @author ruoyi
 * @date 2023-02-17
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class WmOutPunishConfiscateBo extends WmOutInfoBo {

    /**
     * 主键
     */
    private Long id;

    /**
     * 出库信息id-罚没
     */
    private Long wmOutId;

    /**
     * 当事人
     */
   // @NotBlank(message = "当事人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String client;

    /**
     * 案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）
     */
   // @NotBlank(message = "案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String cause;

    /**
     * 出库原因(返还，移送，转罚没)
     */
    //@NotNull(message = "出库原因(返还，移送，转罚没)不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long wmOutReason;

    /**
     * 烟卷/商品 质量（1-完好，2-霉变，3-即将霉变）数据字典
     */
   // @NotBlank(message = "烟卷/商品 质量（1-完好，2-霉变，3-即将霉变）数据字典不能为空", groups = { AddGroup.class, EditGroup.class })
    private String cigaretteQuality;

    /**
     * 所属单位编号（接收单位）
     */
   // @NotNull(message = "所属单位编号（接收单位）不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long unitCoded;

    /**
     * 所属单位
     */
   // @NotBlank(message = "所属单位不能为空", groups = { AddGroup.class, EditGroup.class })
    private String unitName;


}
