package com.ruoyi.old.wmPut.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

/**
 * 代管入库信息业务对象 wm_put_escrow
 *
 * @author ruoyi
 * @date 2023-02-09
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class WmPutEscrowBo  extends WmPutInfoBo {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 入库信息id-代管
     */
    @NotNull(message = "入库信息id-代管不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long wmPutId;

    /**
     * 委托单位
     */
    @NotBlank(message = "委托单位不能为空", groups = { AddGroup.class, EditGroup.class })
    private String entrustUnit;

    /**
     * 单位id
     */
    @NotNull(message = "单位id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long entrustUnitId;

    /**
     * 委托日期
     */
    @NotNull(message = "委托日期不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date entrustDate;

    /**
     * 存放库位编码
     */
    @NotBlank(message = "存放库位编码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whBitCoded;

    private String goodsCoded;
    private String goodsName;
    private String remark;
}
