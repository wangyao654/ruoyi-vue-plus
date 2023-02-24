package com.ruoyi.old.wmPut.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 抽检返还入库信息对象 wm_put_sampling
 *
 * @author ruoyi
 * @date 2023-02-13
 */
@Data
@TableName("wm_put_sampling")
public class WmPutSampling {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 入库信息id-抽检返还
     */
    private Long wmPutId;
    /**
     * 关联出库单
     */
    private String wmOutCoded;
    /**
     * 关联案件号(源自出库单涉及的案件编号)
     */
    private String causeCoded;
    /**
     * 卷烟类型（1-真烟，2-假烟）
     */
    private String cigaretteType;
    /**
     * 商品编号
     */
    private String goodsCoded;

    private String whBitCoded;
    private String remark;

}
