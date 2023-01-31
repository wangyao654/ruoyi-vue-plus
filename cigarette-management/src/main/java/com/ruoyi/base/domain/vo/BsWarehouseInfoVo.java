package com.ruoyi.base.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ContentStyle;
import com.alibaba.excel.annotation.write.style.HeadStyle;
import com.alibaba.excel.enums.poi.HorizontalAlignmentEnum;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import java.util.Date;



/**
 * 仓库管理视图对象 bs_warehouse_info
 *
 * @author ruoyi
 * @date 2022-12-30
 */
@Data
@ExcelIgnoreUnannotated
public class BsWarehouseInfoVo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    //@ExcelProperty(value = "主键")
    private Long id;

    /**
     * 仓库编号
     */
    @ExcelProperty(value = "仓库编号")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String  warehouseCoded;

    /**
     * 仓库名称
     */
    @ExcelProperty(value = "仓库名称")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String warehouseName;

    /**
     * 仓库类型(1-暂存、2-代管、3-罚没、4-罚没，5-代管等)数据字典
     */
    @ExcelProperty(value = "仓库类型")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String warehouseType;

    /**
     * 仓库归属组织
     */
/*    @ExcelProperty(value = "仓库归属组织")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )*/
    private Long warehouseOrganization;
    @ExcelProperty(value = "仓库归属组织")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String  warehouseOrganizationName;

    /**
     * 仓库地址
     */
    @ExcelProperty(value = "仓库地址")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String warehouseAddress;

    /**
     * 仓库负责人
     */
    @ExcelProperty(value = "仓库负责人")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String warehousePrincipal;

    /**
     * 启用状态（0-正常，1-停用）数据字典
     */
    @ExcelProperty(value = "启用状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_common_status")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String warehouseEnabled;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private Date createTime;

    /**
     * 操作人
     */
    @ExcelProperty(value = "操作人")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String updateBy;

    /**
     * 更改时间
     */
    @ExcelProperty(value = "更改时间")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private Date updateTime;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String remark;

    /**
     * 创建者
     */
    @ExcelProperty(value = "创建者")
    private String createBy;


}
