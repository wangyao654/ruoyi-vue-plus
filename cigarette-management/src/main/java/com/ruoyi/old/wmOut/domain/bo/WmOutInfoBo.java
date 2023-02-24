package com.ruoyi.old.wmOut.domain.bo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 商品出库信息业务对象 wm_out_info
 *
 * @author ruoyi
 * @date 2023-02-14
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class WmOutInfoBo extends BaseEntity {

    /**
     * 主键
     */
   // @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 出库单号
     */
  //  @NotBlank(message = "出库单号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String wmOutCoded;

    /**
     * 文书编号
     */
  //  @NotBlank(message = "文书编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String certificateCoded;

    /**
     * 商品名称
     */
   // @NotBlank(message = "商品名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String goodsName;

    /**
     * 商品id
     */
  //  @NotNull(message = "商品id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long goodsId;

    /**
     * 商品规格（1-70mm,2-75mm...）数据字典
     */
  //  @NotBlank(message = "商品规格（1-70mm,2-75mm...）数据字典不能为空", groups = { AddGroup.class, EditGroup.class })
    private String goodsSpecification;

    /**
     * 出库数量
     */
  //  @NotNull(message = "出库数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long wmOutNumber;

    /**
     * 单据状态（保存未提交、提交已入库、撤销待入库）
     */
  //  @NotBlank(message = "单据状态（保存未提交、提交已入库、撤销待入库）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String invoicesStatus;

    /**
     * 出库日期
     */
  //  @NotNull(message = "出库日期不能为空", groups = { AddGroup.class, EditGroup.class })
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date wmOutDate;

    /**
     * 保管员
     */
   // @NotBlank(message = "保管员不能为空", groups = { AddGroup.class, EditGroup.class })
    private String storekeeper;

    /**
     * 保管员-用户id
     */
   // @NotNull(message = "保管员-用户id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long storekeeperId;

    /**
     * 综合管理员
     */
   // @NotBlank(message = "综合管理员不能为空", groups = { AddGroup.class, EditGroup.class })
    private String synthesisKeeper;

    /**
     * 综合管理员-用户id
     */
  //  @NotNull(message = "综合管理员-用户id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long synthesisKeeperId;

    /**
     * 接收人员
     */
  //  @NotBlank(message = "接收人员不能为空", groups = { AddGroup.class, EditGroup.class })
    private String receiver;

    /**
     * 接收人员-用户id
     */
 //   @NotNull(message = "接收人员-用户id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long receiverId;

    /**
     * 附件
     */
   // @NotBlank(message = "附件不能为空", groups = { AddGroup.class, EditGroup.class })
    private String enclosure;

    /**
     * 出库类型
     */
  //  @NotBlank(message = "出库类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private String outType;

    private Date startTime;

    private Date endTime;
}
