package com.ruoyi.wmPut.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.File;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品入库信息对象 wm_put_info
 *
 * @author ruoyi
 * @date 2023-01-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wm_put_info")
public class WmPutInfo extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 入库单号
     */
    private String wmPutCoded;
    /**
     * 文书编号
     */
    private String certificateCoded;
    /**
     * 案件类型（1-简易程序、2-普通程序、3-行政处罚案件移送、4-涉烟刑事案件移送）
     */
    private String causeType;
    /**
     * 入库日期
     */
    private Date whPutDate;
    /**
     * 入库品种数
     */
    private Long varietyNumber;
    /**
     * 入库数（条）
     */
    private Long whPutNumber;
    /**
     * 存放库位编码
     */
   // private String whBitCoded;
    /**
     * 单据状态（保存未提交、提交已入库、撤销待入库）
     */
    private String invoicesStatus;
    /**
     * 保管员
     */
    private String storekeeper;
    /**
     * 综合管理员
     */
    private String synthesisKeeper;
    /**
     * 附件
     */
    private byte[] enclosure;
    //private File enclosure;
    /*
     * 入库类型
     * */
    private String putType;


}
