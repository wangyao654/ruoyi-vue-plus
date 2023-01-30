package com.ruoyi.wmPut.domain;

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
 * 暂存入库信息对象 wm_put_temporary
 *
 * @author ruoyi
 * @date 2023-01-09
 */
@Data
@TableName("wm_put_temporary")
public class WmPutTemporary  {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 入库信息id-暂存
     */
    private Long wmPutId;
    /**
     * 当事人
     */
    private String client;
    /**
     * 案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）
     */
    private String cause;
    /**
     * 查扣日期
     */
    private Date detainDate;
    /**
     * 扣查部门
     */
    private String detainDeptName;
    /**
     * 扣查部门id
     */
    private Long detainDept;
    /**
     * 商品编码
     */
    private String goodsCoded;
    /**
     * 入库条数
     */
    private Long putNumber;
    /**
     * 案件二维码
     */
    private String causeQr;
    /**
     * 存放库区
     */
    private String whAreaCoded;
    /**
     * 存放库位
     */
    private String whBitCoded;
    /**
     * 归属单位
     */
    private String unitCoded;
    /**
     * 备注
     */
    private String remark;

}
