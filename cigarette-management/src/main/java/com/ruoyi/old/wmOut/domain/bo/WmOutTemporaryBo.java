package com.ruoyi.old.wmOut.domain.bo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 暂存出库信息业务对象 wm_out_temporary
 *
 * @author ruoyi
 * @date 2023-02-14
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class WmOutTemporaryBo extends WmOutInfoBo {

    /**
     * 主键
     */
  //  @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 暂存出库信息id
     */
   // @NotNull(message = "暂存出库信息id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long wmOutId;

    /**
     * 当事人
     */
  //  @NotBlank(message = "当事人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String client;

    /**
     * 案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）
     */
   // @NotBlank(message = "案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String cause;

    /**
     * 关联文书编号(入库且未结案的文书编号，有效数据筛选)
     */
  //  @NotBlank(message = "关联文书编号(入库且未结案的文书编号，有效数据筛选)不能为空", groups = { AddGroup.class, EditGroup.class })
    private String certificateCodedAssaciation;

    /**
     * 出库原因(返还，移送，转罚没)
     */
    //@NotBlank(message = "出库原因(返还，移送，转罚没)不能为空", groups = { AddGroup.class, EditGroup.class })
    private String wmOutReason;

    /**
     * 烟卷质量（1-完好，2-霉变，3-即将霉变）数据字典
     */
   // @NotBlank(message = "烟卷质量（1-完好，2-霉变，3-即将霉变）数据字典不能为空", groups = { AddGroup.class, EditGroup.class })
    private String cigaretteQuality;

    /**
     * 所属单位编号（接收单位）
     */
    //@NotBlank(message = "所属单位编号（接收单位）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String unitCoded;


}
