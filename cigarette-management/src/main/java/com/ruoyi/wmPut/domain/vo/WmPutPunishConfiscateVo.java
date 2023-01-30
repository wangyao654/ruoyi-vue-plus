package com.ruoyi.wmPut.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * 罚没入库信息视图对象 wm_put_punish_confiscate
 *
 * @author ruoyi
 * @date 2023-01-29
 */
@Data
@ExcelIgnoreUnannotated
public class WmPutPunishConfiscateVo extends WmPutInfoVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 入库信息id-罚没
     */
    @ExcelProperty(value = "入库信息id-罚没")
    private Long wmPutId;

    /**
     * 卷烟类型（1-真烟，2-假烟）
     */
    @ExcelProperty(value = "卷烟类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-真烟，2-假烟")
    private String cigaretteType;

    private String goodsCoded;
    private String goodsName;
    private String goodsSpecification;


}
