package com.ruoyi.wmPut.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.wmPut.domain.WmPutInfo;
import lombok.Data;
import java.util.Date;



/**
 * 抽检返还入库信息视图对象 wm_put_sampling
 *
 * @author ruoyi
 * @date 2023-02-13
 */
@Data
@ExcelIgnoreUnannotated
public class WmPutSamplingVo extends WmPutInfoVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 入库信息id-抽检返还
     */
    @ExcelProperty(value = "入库信息id-抽检返还")
    private Long wmPutId;

    /**
     * 关联出库单
     */
    @ExcelProperty(value = "关联出库单")
    private String wmOutCoded;

    /**
     * 关联案件号(源自出库单涉及的案件编号)
     */
    @ExcelProperty(value = "关联案件号(源自出库单涉及的案件编号)")
    private String causeCoded;

    /**
     * 卷烟类型（1-真烟，2-假烟）
     */
    @ExcelProperty(value = "卷烟类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-真烟，2-假烟")
    private String cigaretteType;

    /**
     * 商品编号
     */
    @ExcelProperty(value = "商品编号")
    private String goodsCoded;
    @ExcelProperty(value = "备注")
    private String remark;

}
