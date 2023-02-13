package com.ruoyi.wmPut.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ContentStyle;
import com.alibaba.excel.annotation.write.style.HeadStyle;
import com.alibaba.excel.enums.poi.HorizontalAlignmentEnum;
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
   // @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 入库信息id-罚没
     */
    //@ExcelProperty(value = "入库信息id-罚没")
    private Long wmPutId;

    /**
     * 卷烟类型（1-真烟，2-假烟）
     */
    @ExcelProperty(value = "卷烟类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "cigarette_type")
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String cigaretteType;


    /**
     * 商品名称
     */
    @ExcelProperty(value = "商品名称", converter = ExcelDictConvert.class)
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
    private String goodsName;

    /**
     * 商品编码
     */
   // @ExcelProperty(value = "商品编码", converter = ExcelDictConvert.class)
    private String goodsCoded;
    /*
    * 存放库位编码
    * */
  private String whBitCoded;
    @ExcelProperty(value = "存放库位名称", converter = ExcelDictConvert.class)
    @HeadStyle(horizontalAlignment= HorizontalAlignmentEnum.CENTER)
    @ContentStyle( horizontalAlignment = HorizontalAlignmentEnum.CENTER )
  private String whBitName;
    private String remark;
}
