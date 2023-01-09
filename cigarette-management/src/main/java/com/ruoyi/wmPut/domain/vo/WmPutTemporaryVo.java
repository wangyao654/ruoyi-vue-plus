package com.ruoyi.wmPut.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * 暂存入库信息视图对象 wm_put_temporary
 *
 * @author ruoyi
 * @date 2023-01-09
 */
@Data
@ExcelIgnoreUnannotated
public class WmPutTemporaryVo extends WmPutInfoVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 入库信息id-暂存
     */
    @ExcelProperty(value = "入库信息id-暂存")
    private Long wmPutId;

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
     * 查扣日期
     */
    @ExcelProperty(value = "查扣日期")
    private Date detainDate;

    /**
     * 扣查部门
     */
    @ExcelProperty(value = "扣查部门")
    private String detainDeptName;

    /**
     * 扣查部门id
     */
    @ExcelProperty(value = "扣查部门id")
    private Long detainDept;

    /**
     * 商品编码
     */
    @ExcelProperty(value = "商品编码")
    private String goodsCoded;
    private String goodsName;

    /**
     * 入库条数
     */
    @ExcelProperty(value = "入库条数")
    private Long putNumber;

    /**
     * 案件二维码
     */
    @ExcelProperty(value = "案件二维码")
    private String causeQr;

    /**
     * 存放库区
     */
    @ExcelProperty(value = "存放库区")
    private String whAreaCoded;

    /**
     * 存放库位
     */
    @ExcelProperty(value = "存放库位")
    private String whBitCoded;

    /**
     * 归属单位
     */
    @ExcelProperty(value = "归属单位")
    private String unitCoded;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
