package com.ruoyi.base.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import java.util.Date;



/**
 * 库区信息视图对象 bs_wh_area_info
 *
 * @author ruoyi
 * @date 2023-01-02
 */
@Data
@ExcelIgnoreUnannotated
public class BsWhAreaInfoVo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    //@ExcelProperty(value = "主键")
    private Long id;

    /**
     * 库区编号
     */
    @ExcelProperty(value = "库区编号")
    private String whAreaCoded;

    /**
     * 库区名称
     */
    @ExcelProperty(value = "库区名称")
    private String whAreaName;

    /**
     * 库区类型(1-暂存、2-代管、3-罚没、4-罚没5-代管)数据字典
     */
    @ExcelProperty(value = "库区类型")
    private String whAreaType;

    /**
     * 所属仓库编号
     */
    @ExcelProperty(value = "所属仓库编号")
    private String warehouseCoded;

    /**
     * 所属仓库
     */
    @ExcelProperty(value = "所属仓库")
    private String warehouseName;

    /**
     * 归属仓库id
     */
    @ExcelProperty(value = "归属仓库id")
    private Long warehouseId;

    /**
     * 库区启用状态（0-正常，1-停用）
     */
    @ExcelProperty(value = "库区启用状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=-正常，1-停用")
    private String whAreaEnabled;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
