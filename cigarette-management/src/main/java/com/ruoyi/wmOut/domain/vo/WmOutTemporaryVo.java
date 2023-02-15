package com.ruoyi.wmOut.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.wmOut.domain.WmOutTemporary;
import com.ruoyi.wmPut.domain.vo.WmPutTemporaryVo;
import lombok.Data;
import java.util.Date;



/**
 * 暂存出库信息视图对象 wm_out_temporary
 *
 * @author ruoyi
 * @date 2023-02-14
 */
@Data
@ExcelIgnoreUnannotated
public class WmOutTemporaryVo extends WmOutInfoVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
  //  @ExcelProperty(value = "主键")
   // private Long id;

    /**
     * 暂存出库信息id
     */
    @ExcelProperty(value = "暂存出库信息id")
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
     * 关联文书编号(入库且未结案的文书编号，有效数据筛选)
     */
    @ExcelProperty(value = "关联文书编号(入库且未结案的文书编号，有效数据筛选)")
    private String certificateCodedAssaciation;

    /**
     * 出库原因(返还，移送，转罚没)
     */
    @ExcelProperty(value = "出库原因(返还，移送，转罚没)")
    private String wmOutReason;

    /**
     * 烟卷质量（1-完好，2-霉变，3-即将霉变）数据字典
     */
    @ExcelProperty(value = "烟卷质量", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-完好，2-霉变，3-即将霉变")
    private String cigaretteQuality;

    /**
     * 所属单位编号（接收单位）
     */
    @ExcelProperty(value = "所属单位编号", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "接=收单位")
    private String unitCoded;


}
