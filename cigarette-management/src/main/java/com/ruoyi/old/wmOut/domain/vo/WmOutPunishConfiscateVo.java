package com.ruoyi.old.wmOut.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.old.wmOut.service.impl.WmOutInfoServiceImpl;
import com.ruoyi.old.wmPut.service.impl.WmPutTemporaryServiceImpl;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * 罚没出库信息视图对象 wm_out_punish_confiscate
 *
 * @author ruoyi
 * @date 2023-02-17
 */
@Data
@ExcelIgnoreUnannotated
public class WmOutPunishConfiscateVo extends WmOutInfoVo {

    private static final long serialVersionUID = 1L;
    @Autowired
    private WmOutInfoServiceImpl wmOutInfoService;
    @Autowired
    private WmPutTemporaryServiceImpl wmPutTemporaryService;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 出库信息id-罚没
     */
    @ExcelProperty(value = "出库信息id-罚没")
    private Long wmOutId;

    /**
     * 当事人
     */
    @ExcelProperty(value = "当事人")
    private String client;

    /**
     * 案由（1-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典）
     */
    @ExcelProperty(value = "案由", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-无烟草专卖品准运证运输烟草专卖品,2-生产、销售假冒伪劣烟草专卖品数据字典")
    private String cause;

    /**
     * 出库原因(返还，移送，转罚没)
     */
    @ExcelProperty(value = "出库原因(返还，移送，转罚没)")
    private Long wmOutReason;

    /**
     * 烟卷/商品 质量（1-完好，2-霉变，3-即将霉变）数据字典
     */
    @ExcelProperty(value = "烟卷/商品 质量", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-完好，2-霉变，3-即将霉变")
    private String cigaretteQuality;

    /**
     * 所属单位编号（接收单位）
     */
    @ExcelProperty(value = "所属单位编号", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "接收单位")
    private Long unitCoded;

    /**
     * 所属单位
     */
    @ExcelProperty(value = "所属单位")
    private String unitName;


}
