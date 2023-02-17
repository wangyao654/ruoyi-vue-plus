package com.ruoyi.wmOut.domain.bo;

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
 * 代管出库信息业务对象 wm_out_escrow
 *
 * @author ruoyi
 * @date 2023-02-16
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class WmOutEscrowBo extends WmOutInfoBo {

    /**
     * 主键
     */
    private Long id;

    /**
     * 代管出库信息id
     */
    //@NotNull(message = "代管出库信息id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long wmOutId;

    /**
     * 关联文书编号(入库且未结案的文书编号，有效数据筛选)
     */
   // @NotBlank(message = "关联文书编号(入库且未结案的文书编号，有效数据筛选)不能为空", groups = { AddGroup.class, EditGroup.class })
    private String certificateCodedAssaciation;

    /**
     * 所属单位编号（接收单位）
     */
    //@NotNull(message = "所属单位编号（接收单位）不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long unitCoded;

    /**
     * 入库日期(代管出库)
     */
   // @NotNull(message = "入库日期(代管出库)不能为空", groups = { AddGroup.class, EditGroup.class })
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date whPutDate;

    /**
     * 入库品种数(代管出库)
     */
    //@NotNull(message = "入库品种数(代管出库)不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long varietyNumber;

    /**
     * 入库数（条）(代管出库)
     */
    //@NotNull(message = "入库数（条）(代管出库)不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long whPutNumber;

    /**
     * 入库单位（1-条，2-盒，3-包，4-听）数据字典（代管出库）
     */
    //@NotBlank(message = "入库单位（1-条，2-盒，3-包，4-听）数据字典（代管出库）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String measureUnit;


}
