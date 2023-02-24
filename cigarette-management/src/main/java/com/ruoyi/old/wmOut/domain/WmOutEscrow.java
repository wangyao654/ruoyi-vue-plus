package com.ruoyi.old.wmOut.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 代管出库信息对象 wm_out_escrow
 *
 * @author ruoyi
 * @date 2023-02-16
 */
@Data
@TableName("wm_out_escrow")
public class WmOutEscrow {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 代管出库信息id
     */
    private Long wmOutId;
    /**
     * 关联文书编号(入库且未结案的文书编号，有效数据筛选)
     */
    private String certificateCodedAssaciation;
    /**
     * 所属单位编号（接收单位）
     */
    private Long unitCoded;
    /**
     * 入库日期(代管出库)
     */
    private Date whPutDate;
    /**
     * 入库品种数(代管出库)
     */
    private Long varietyNumber;
    /**
     * 入库数（条）(代管出库)
     */
    private Long whPutNumber;
    /**
     * 入库单位（1-条，2-盒，3-包，4-听）数据字典（代管出库）
     */
    private String measureUnit;

}
