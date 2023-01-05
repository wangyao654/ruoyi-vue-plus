package com.ruoyi.base.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品入库信息业务对象 wm_put_info
 *
 * @author ruoyi
 * @date 2023-01-05
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class WmPutInfoBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 入库单号
     */
    @NotBlank(message = "入库单号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String wmPutCoded;

    /**
     * 文书编号
     */
    @NotBlank(message = "文书编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String certificateCoded;

    /**
     * 案件类型（1-简易程序、2-普通程序、3-行政处罚案件移送、4-涉烟刑事案件移送）
     */
    @NotBlank(message = "案件类型（1-简易程序、2-普通程序、3-行政处罚案件移送、4-涉烟刑事案件移送）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String causeType;

    /**
     * 入库日期
     */
    @NotNull(message = "入库日期不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date whPutDate;

    /**
     * 入库品种数
     */
    @NotNull(message = "入库品种数不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long varietyNumber;

    /**
     * 入库数（条）
     */
    @NotNull(message = "入库数（条）不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long whPutNumber;

    /**
     * 存放库位编码
     */
    @NotBlank(message = "存放库位编码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whBitCoded;

    /**
     * 单据状态（保存未提交、提交已入库、撤销待入库）
     */
    @NotBlank(message = "单据状态（保存未提交、提交已入库、撤销待入库）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String invoicesStatus;

    /**
     * 保管员
     */
    @NotBlank(message = "保管员不能为空", groups = { AddGroup.class, EditGroup.class })
    private String storekeeper;

    /**
     * 综合管理员
     */
    @NotBlank(message = "综合管理员不能为空", groups = { AddGroup.class, EditGroup.class })
    private String synthesisKeeper;

    /**
     * 附件
     */
    @NotBlank(message = "附件不能为空", groups = { AddGroup.class, EditGroup.class })
    private String enclosure;


}
