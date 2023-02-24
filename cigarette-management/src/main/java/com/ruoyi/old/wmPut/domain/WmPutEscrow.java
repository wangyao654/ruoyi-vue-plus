package com.ruoyi.old.wmPut.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import java.util.Date;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 代管入库信息对象 wm_put_escrow
 *
 * @author ruoyi
 * @date 2023-02-09
 */
@Data
@TableName("wm_put_escrow")
public class WmPutEscrow {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 入库信息id-代管
     */
    private Long wmPutId;
    /**
     * 委托单位
     */
    private String entrustUnit;
    /**
     * 单位id
     */
    private Long entrustUnitId;
    /**
     * 委托日期
     */
    private Date entrustDate;
    /**
     * 存放库位编码
     */
    private String whBitCoded;

    /*
    * 备注
    * */
    private String remark;

}
