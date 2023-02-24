package com.ruoyi.old.wmPut.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 罚没入库信息对象 wm_put_punish_confiscate
 *
 * @author ruoyi
 * @date 2023-01-29
 */
@Data
@TableName("wm_put_punish_confiscate")
public class WmPutPunishConfiscate {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 入库信息id-罚没
     */
    private Long wmPutId;
    /**
     * 卷烟类型（1-真烟，2-假烟）
     */
    private String cigaretteType;
    private String goodsCoded;
    private String whBitCoded;
    private String remark;

}
