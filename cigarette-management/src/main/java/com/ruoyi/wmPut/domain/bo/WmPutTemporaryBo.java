package com.ruoyi.wmPut.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 暂存入库信息业务对象 wm_put_temporary
 *
 * @author ruoyi
 * @date 2023-01-09
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class WmPutTemporaryBo extends WmPutInfoBo {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 入库信息id-暂存
     */
    @NotNull(message = "入库信息id-暂存不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long wmPutId;

    /**
     * 当事人
     */
    @NotBlank(message = "当事人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String client;

    /**
     * 案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）
     */
    @NotBlank(message = "案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String cause;

    /**
     * 查扣日期
     */
    @NotNull(message = "查扣日期不能为空", groups = { AddGroup.class, EditGroup.class })
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date detainDate;

    /**
     * 扣查部门
     */

   // @NotBlank(message = "扣查部门不能为空", groups = { AddGroup.class, EditGroup.class })
    private String detainDeptName;

    /**
     * 扣查部门id
     */
   // @NotNull(message = "扣查部门id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long detainDept;

    /**
     * 商品编码
     */
   // @NotBlank(message = "商品编码不能为空", groups = { AddGroup.class, EditGroup.class })
/*    private String goodsCoded;
    private String goodsName;*/

    /**
     * 入库条数
     */
  //  @NotNull(message = "入库条数不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long putNumber;

    /**
     * 案件二维码
     */
  //  @NotBlank(message = "案件二维码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String causeQr;

    /**
     * 存放库区
     */
    @NotBlank(message = "存放库区不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whAreaCoded;

    /**
     * 存放库位
     */
    @NotBlank(message = "存放库位不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whBitCoded;

    /**
     * 归属单位
     */
   // @NotBlank(message = "归属单位不能为空", groups = { AddGroup.class, EditGroup.class })
    private String unitCoded;

    /**
     * 备注
     */
  //  @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;

    //条码打印时间
private Date printTime;

private String wmPutCoded;

}
