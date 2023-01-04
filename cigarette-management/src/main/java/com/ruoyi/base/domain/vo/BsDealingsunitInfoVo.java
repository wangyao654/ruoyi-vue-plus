package com.ruoyi.base.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import java.util.Date;



/**
 * 来往单位信息视图对象 bs_dealingsunit_info
 *
 * @author ruoyi
 * @date 2023-01-04
 */
@Data
@ExcelIgnoreUnannotated
public class BsDealingsunitInfoVo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 单位编号
     */
    @ExcelProperty(value = "单位编号")
    private String unitCoded;

    /**
     * 单位名称
     */
    @ExcelProperty(value = "单位名称")
    private String unitName;

    /**
     * 单位类型(1-行政机关、2-代管仓库、3-零售户、4-执法科、5-检验机构)
     */
    @ExcelProperty(value = "单位类型(1-行政机关、2-代管仓库、3-零售户、4-执法科、5-检验机构)")
    private String unitType;

    /**
     * 联系人
     */
    @ExcelProperty(value = "联系人")
    private String contactPerson;

    /**
     * 座机号码
     */
    @ExcelProperty(value = "座机号码")
    private String landlineNumber;

    /**
     * 手机号
     */
    @ExcelProperty(value = "手机号")
    private String phone;

    /**
     * 邮箱
     */
    @ExcelProperty(value = "邮箱")
    private String email;

    /**
     * 单位地址
     */
    @ExcelProperty(value = "单位地址")
    private String unitAddress;

    /**
     * 启用状态（0-正常，1-停用）
     */
    @ExcelProperty(value = "启用状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=-正常，1-停用")
    private String unitEnabled;

    /**
     * 操作者
     */
    @ExcelProperty(value = "操作者")
    private String updateBy;

    /**
     * 操作时间
     */
    @ExcelProperty(value = "操作时间")
    private Date updateTime;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
