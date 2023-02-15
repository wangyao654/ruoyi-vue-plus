package com.ruoyi.wmOut.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 暂存出库信息对象 wm_out_temporary
 *
 * @author ruoyi
 * @date 2023-02-14
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wm_out_temporary")
public class WmOutTemporary extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 暂存出库信息id
     */
    private Long wmOutId;
    /**
     * 当事人
     */
    private String client;
    /**
     * 案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）
     */
    private String cause;
    /**
     * 关联文书编号(入库且未结案的文书编号，有效数据筛选)
     */
    private String certificateCodedAssaciation;
    /**
     * 出库原因(返还，移送，转罚没)
     */
    private String wmOutReason;
    /**
     * 烟卷质量（1-完好，2-霉变，3-即将霉变）数据字典
     */
    private String cigaretteQuality;
    /**
     * 所属单位编号（接收单位）
     */
    private String unitCoded;

}
