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
 * 商品出库信息对象 wm_out_info
 *
 * @author ruoyi
 * @date 2023-02-14
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wm_out_info")
public class WmOutInfo extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 出库单号
     */
    private String wmOutCoded;
    /**
     * 文书编号
     */
    private String certificateCoded;
    /**
     * 商品id
     */
    private Long goodsId;
    /**
     * 出库数量
     */
    private Long wmOutNumber;
    /**
     * 单据状态（保存未提交、提交已入库、撤销待入库）
     */
    private String invoicesStatus;
    /**
     * 出库日期
     */
    private Date wmOutDate;
    /**
     * 保管员
     */
    private String storekeeper;
    /**
     * 保管员-用户id
     */
    private Long storekeeperId;
    /**
     * 综合管理员
     */
    private String synthesisKeeper;
    /**
     * 综合管理员-用户id
     */
    private Long synthesisKeeperId;
    /**
     * 接收人员
     */
    private String receiver;
    /**
     * 接收人员-用户id
     */
    private Long receiverId;
    /**
     * 附件
     */
    private String enclosure;
    /**
     * 出库类型
     */
    private String outType;

    private String goodsSpecification;
}
