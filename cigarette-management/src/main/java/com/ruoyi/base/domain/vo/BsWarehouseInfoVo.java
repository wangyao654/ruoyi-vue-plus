package com.ruoyi.base.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
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
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 仓库编号
     */
    @ExcelProperty(value = "仓库编号")
    private Long warehouseCoded;

    /**
     * 仓库名称
     */
    @ExcelProperty(value = "仓库名称")
    private String warehouseName;

    /**
     * 仓库类型(1-暂存、2-代管、3-罚没、4-罚没，5-代管等)数据字典
     */
    @ExcelProperty(value = "仓库类型(1-暂存、2-代管、3-罚没、4-罚没，5-代管等)数据字典")
    private String warehouseType;

    /**
     * 仓库归属组织(部门id)
     */
    @ExcelProperty(value = "仓库归属组织(部门id)")
    private Long warehouseOrganization;

    /**
     * 仓库地址
     */
    @ExcelProperty(value = "仓库地址")
    private String warehouseAddress;

    /**
     * 仓库负责人
     */
    @ExcelProperty(value = "仓库负责人")
    private String warehousePrincipal;

    /**
     * 启用状态（0-正常，1-停用）数据字典
     */
    @ExcelProperty(value = "启用状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=-正常，1-停用")
    private String warehouseEnabled;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Date createTime;

    /**
     * 操作人
     */
    @ExcelProperty(value = "操作人")
    private String updateBy;

    /**
     * 更改时间
     */
    @ExcelProperty(value = "更改时间")
    private Date updateTime;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 创建者
     */
    @ExcelProperty(value = "创建者")
    private String createBy;


}
