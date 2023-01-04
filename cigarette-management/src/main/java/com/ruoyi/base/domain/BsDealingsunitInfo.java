package com.ruoyi.base.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 来往单位信息对象 bs_dealingsunit_info
 *
 * @author ruoyi
 * @date 2023-01-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("bs_dealingsunit_info")
public class BsDealingsunitInfo extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 单位编号
     */
    private String unitCoded;
    /**
     * 单位名称
     */
    private String unitName;
    /**
     * 单位类型(1-行政机关、2-代管仓库、3-零售户、4-执法科、5-检验机构)
     */
    private String unitType;
    /**
     * 联系人
     */
    private String contactPerson;
    /**
     * 座机号码
     */
    private String landlineNumber;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 单位地址
     */
    private String unitAddress;
    /**
     * 启用状态（0-正常，1-停用）
     */
    private String unitEnabled;
    /**
     * 备注
     */
    private String remark;

}
