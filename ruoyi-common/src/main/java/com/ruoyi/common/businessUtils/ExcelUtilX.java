package com.ruoyi.common.businessUtils;

import io.netty.util.internal.StringUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.xssf.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

public class ExcelUtilX {

    private static final Logger logger = LoggerFactory.getLogger(ExcelUtilX.class);
    public static final short EXCEL_COLUMN_WIDTH_FACTOR = 256;
    public static final int UNIT_OFFSET_LENGTH = 7;
    public static final int[] UNIT_OFFSET_MAP = new int[] { 0, 36, 73, 109, 146, 182, 219 };

    /**
     * 导出Excel文件
     *
     * @param filename
     * @param workbook
     * @param response
     * @throws Exception
     */
    public static void exportExcel(String filename, XSSFWorkbook workbook, HttpServletResponse response) throws Exception {
        response.setContentType("application/x-excel");//针对火狐
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-disposition", "attachment;filename=" + filename + ".xlsx");
        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }

    /**
     * 自定义字段名
     */
    @Retention(RetentionPolicy.RUNTIME)
    @Target({ElementType.METHOD, ElementType.FIELD, ElementType.PARAMETER})
    public @interface FieldName {
        /**
         * 字段名
         *
         * @return
         */
        String value() default "";

        /**
         * 是否忽略
         */
        boolean Ignore() default false;
    }

    /**
     * 根据实体类字段生成Excel：生成导出数据
     * @param titleList 表头
     * @param hasReason 是否存在多余列：导入失败原因
     * @param data      导入失败数据
     * @param fields    实体类字段
     * @return
     */
    public static XSSFWorkbook createXSSFWorkbook(List<String> titleList, boolean hasReason, List<Map<String,
            String>> data, List<String> fields) {
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet0 = workbook.createSheet("sheet");
        // 冻结表头
        sheet0.createFreezePane(0, 1, 0, 1);
        //设置列宽度
        int cellNum = titleList.size();
        //生成表头
        XSSFRow title = sheet0.createRow(0);
        for (int i = 0; i < cellNum; i++) {
            title.createCell(i).setCellValue(titleList.get(i));
        }
        if(hasReason){
            title.createCell(cellNum).setCellValue("异常原因");
            sheet0.setColumnWidth(cellNum,pixelWidth(200));
        }
        //填充数据
        XSSFRow row;
        for (int i = 0; i < data.size(); i++) {
            //从第二行开始导入数据
            row = sheet0.createRow(i + 1);
            Map<String, String> dataobj = data.get(i);
            for (int j = 0; j < cellNum; j++) {
                row.createCell(j).setCellValue(dataobj.get(fields.get(j)));
            }
            if (hasReason) {
                row.createCell(cellNum).setCellValue(dataobj.get("errMsg"));
            }
        }

        return workbook;
    }
    //设置单元格宽度
    public static short pixelWidth(int pxs) {
        short width = (short) (EXCEL_COLUMN_WIDTH_FACTOR * (pxs / UNIT_OFFSET_LENGTH));
        width += UNIT_OFFSET_MAP[(pxs % UNIT_OFFSET_LENGTH)];
        return width;
    }

    /**
     * 根据实体类字段生成Excel：导出Excel模板
     * @param sheetName 页名
     * @param titleList 表头
     * @return
     */
    public static XSSFWorkbook dynamicTemplate(String sheetName, List<String> titleList, Map<String, List<String>>
            dicSelectList,Map<String,String> comments) {
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet(sheetName);
        // 冻结表头
        sheet.createFreezePane(0, 1, 0, 1);
        int cellNum = titleList.size();
        XSSFDataFormat format = workbook.createDataFormat();
        // 设置列宽和设置单元格格式为纯文本
        CellStyle textStyle = workbook.createCellStyle();
        textStyle.setDataFormat(format.getFormat("@"));
        for (int i = 0; i < cellNum; i++) {
            sheet.setColumnWidth(i, 4000);
            sheet.setDefaultColumnStyle(i,textStyle);
        }
        //生成表头
        XSSFRow title = sheet.createRow(0);
        for (int i = 0; i < cellNum; i++) {
            title.createCell(i).setCellValue(titleList.get(i));
        }
        // 字典项下拉
        if (dicSelectList != null && !dicSelectList.isEmpty()) {
            Row title1 = sheet.getRow(0);
            int sheetIndex = 1;
            for (Cell cell : title1) {
                String stringCellValue = cell.getStringCellValue().replace("*", "");
                List<String> values = dicSelectList.get(stringCellValue);
                if (values != null&&values.size()>0) {
                    int col = cell.getColumnIndex();
                    setLongHSSFValidation(workbook,values.toArray(new String[0]),sheet,col,sheetIndex);
                    sheetIndex++;
                }
            }
            //插入批注
            if(comments!=null){
                for (Cell cell : title1) {
                    String stringCellValue = cell.getStringCellValue().replace("*", "");
                    String values = comments.get(stringCellValue);
                    if (StringUtils.isNotBlank(values)) {
                        insertComment(sheet,cell,values);
                    }
                }
            }
        }
        return workbook;
    }
    /**
     * 根据实体类字段生成Excel：导出Excel模板
     * @param sheetName 页名
     * @param titleList 表头
     * @param dicSelectList 字典
     * @param comments 批注
     * @return
     */
    public static XSSFWorkbook dynamicTemplate2(String sheetName, List<String> titleList, Map<String, List<String>>
            dicSelectList,Map<String,String> comments) {
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet(sheetName);
        // 冻结表头
        sheet.createFreezePane(0, 1, 0, 1);
        int cellNum = titleList.size();
        XSSFDataFormat format = workbook.createDataFormat();
        // 设置列宽和设置单元格格式为纯文本
        CellStyle textStyle = workbook.createCellStyle();
        textStyle.setDataFormat(format.getFormat("@"));
        for (int i = 0; i < cellNum; i++) {
            sheet.setColumnWidth(i, 4000);
            sheet.setDefaultColumnStyle(i,textStyle);
        }
        //生成表头
        XSSFRow title = sheet.createRow(0);
        for (int i = 0; i < cellNum; i++) {
            title.createCell(i).setCellValue(titleList.get(i));
        }
//        // 字典项下拉
//        if (dicSelectList != null && !dicSelectList.isEmpty()) {
//            ThreeCasecadeExport.Cascade(workbook,dicSelectList,sheet);
//        }
        //插入批注
        Row title1 = sheet.getRow(0);
        if(comments!=null){
            for (Cell cell : title1) {
                String stringCellValue = cell.getStringCellValue().replace("*", "");
                String values = comments.get(stringCellValue);
                if (StringUtils.isNotBlank(values)) {
                    insertComment(sheet,cell,values);
                }
            }
        }
        return workbook;
    }
    /**
     * 设置批注
     * @param sheet
     * @param cell
     * @param message
     */
    public static void insertComment(Sheet sheet , Cell cell, String message) {
        Drawing draw = sheet.createDrawingPatriarch();
        int col2 = 3;
        if (message.length()>20){
            col2 = 4;
        }
        Comment comment = draw.createCellComment(new XSSFClientAnchor(0, 0, 0, 0, 0, 0, col2, 1));
        comment.setString(new XSSFRichTextString(message));//设置批注内容
        cell.setCellComment(comment);
    }

    /**
     *  字典项添加下拉
     * @param workbook
     * @param deptList 下拉数据数组
     * @param sheet
     * @param sheetIndex 隐藏sheet名称
     */
    public static void setLongHSSFValidation(Workbook workbook, String[] deptList , Sheet sheet , int col, int sheetIndex) {
        String hiddenName = "hidden"+col;
        //1.创建隐藏的sheet页。        起个名字吧！叫"hidden"！
        Sheet hidden = workbook.createSheet(hiddenName);
        //2.循环赋值（为了防止下拉框的行数与隐藏域的行数相对应，将隐藏域加到结束行之后）
        for (int i = 0, length = deptList.length; i < length; i++) {
            hidden.createRow(65535 + i).createCell(col).setCellValue(deptList[i]);
        }
        Name category1Name = workbook.createName();
        category1Name.setNameName(hiddenName);
        //3 A1:A代表隐藏域创建第N列createCell(N)时。以A1列开始A行数据获取下拉数组
        category1Name.setRefersToFormula(hiddenName + "!A1:A" + (deptList.length + 65535));
        //
        DataValidationHelper helper = sheet.getDataValidationHelper();
        DataValidationConstraint constraint = helper.createFormulaListConstraint(hiddenName);
        CellRangeAddressList addressList = new CellRangeAddressList(1, 65535, col, col);
        DataValidation dataValidation = helper.createValidation(constraint, addressList);
        if (dataValidation instanceof XSSFDataValidation) {
            // 数据校验
            dataValidation.setSuppressDropDownArrow(true);
            dataValidation.setShowErrorBox(true);
        } else {
            dataValidation.setSuppressDropDownArrow(false);
        }
        // 作用在目标sheet上
        sheet.addValidationData(dataValidation);
        // 设置hiddenSheet隐藏
        workbook.setSheetHidden(sheetIndex, true);
    }
    /**
     * 获取单元格的值
     * @param cell
     * @return
     */
    public static String doGetCellValue(XSSFCell cell) {
        String value = null;
        if (null != cell) {
            CellType cellType = cell.getCellType();
            switch (cellType) {
                case NUMERIC:
                    //数字格式包括日期，需要特别处理
                    if (DateUtil.isCellDateFormatted(cell)) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        Date date = cell.getDateCellValue();
                        value = sdf.format(date);
                    } else {
                        //将导入的数字类型转换为字符串类型
                        cell.setCellType(CellType.STRING);
                        value = String.valueOf(cell.getStringCellValue());
                        if(value.contains("E")){
                            value = new BigDecimal(value).toPlainString();//科学计数法转普通数字
                        }
                    }
                    break;
                case BOOLEAN:
                    value = String.valueOf(cell.getBooleanCellValue());
                    break;
                case FORMULA:
                    value = cell.getCellFormula();
                    break;
                case ERROR:
                    value = "ERROR";
                    break;
                case BLANK:
                    value = null;
                    break;
                default:
                    value = cell.getStringCellValue();
                    break;
            }
        }
        return value;
    }
    //---------------------------导入部分---------------------------
    /**
     * 读取Excel返回指定类的map
     * @param file   excel文件
     * @param fields 指定类的字段名数组
     * @return
     * @throws Exception
     */
    public static List<Map<String, String>> readExcel(MultipartFile file, List<String> fields){
        //读取Excel结果
        List<Map<String, String>> resultList = new ArrayList<>();
        //Excel组件
        XSSFWorkbook workbook = null;
        try {
            workbook = new XSSFWorkbook(file.getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        XSSFSheet sheet0 = workbook.getSheetAt(0);
        XSSFRow row;
        //跳过表头，从第二行开始读取数据
        for (int i = 1; i <= sheet0.getLastRowNum(); i++) {
            row = sheet0.getRow(i);
            if (null != row && row.getLastCellNum()!=-1) {
                Map<String, String> rowMap = new HashMap<>(row.getLastCellNum());
                int sign = 0;
                for (int j = 0; j < fields.size(); j++) {
                    if (ExcelUtilX.doGetCellValue(row.getCell(j))==null){
                        sign++;
                    }
                    rowMap.put(fields.get(j), ExcelUtilX.doGetCellValue(row.getCell(j)));
                }
                if (sign==fields.size()){
                    break;
                }
                resultList.add(rowMap);
            }
        }
        return resultList;
    }
    /**
     * 读取Excel返回指定类的map
     * @param fields 指定类的字段名数组
     * @return   解决横向分割、纵向合并问题
     * @throws Exception
     */
    public static List<Map<String, String>> readExcel(InputStream inputStream, List<String> fields) throws Exception {
        //读取Excel结果
        List<Map<String, String>> resultList = new ArrayList<>();
        //Excel组件
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
        XSSFSheet sheet0 = workbook.getSheetAt(0);
        XSSFRow row;
        //获取标题最大行号 TODO
        int maxLastRowTemp = 0;
        int maxLastRowTitle = getMaxLastRow(sheet0,maxLastRowTemp);
        //跳过表头，从第二行开始读取数据
        first:for (int i = 1; i <= sheet0.getLastRowNum(); i++) {
            row = sheet0.getRow(i);
            if (null != row && row.getLastCellNum()!=-1) {
                Map<String, String> rowMap = new LinkedHashMap<>(row.getLastCellNum());
                int sign = 0;
                for (int j = 0; j < fields.size(); j++) {
                    XSSFCell cell = row.getCell(j);
                    String cellVal = doGetCellValue(cell);
                    if (cell!=null){
                        //处理合并单元格 合并行、合并列
                        Map<String, Object> stringObjectMap = mergedRegionOpera(sheet0, row, cell,maxLastRowTitle);
                        boolean isMergedRegionTitle = (boolean)stringObjectMap.get("isMergedRegionTitle");//判断是否为标题行
                        boolean isMergedRegion = (boolean)stringObjectMap.get("isMergedRegion");//判断是否为合并单元格
                        String firstRowFirstColVal = StringUtilX.objToStr(stringObjectMap.get("firstRowFirstColVal"));//合并单元格中第一行第一列中的值
                        if (isMergedRegion)
                            if (isMergedRegionTitle)
                                continue first;
                            else
                                cellVal = firstRowFirstColVal;
                    }
                    //判断某一行是否所有的单元格都为空
                    if (cellVal==null){
                        sign++;
                    }
                    rowMap.put(fields.get(j),cellVal);
                }
                if (sign==fields.size()){
                    break;
                }
                resultList.add(rowMap);
            }
        }
        return resultList;
    }
    //合并单元格操作
    public static Map<String,Object> mergedRegionOpera(XSSFSheet sheet, XSSFRow row, XSSFCell cell, int maxLastRowTitle){
        int rowNum = row.getRowNum();
        int columnIndex = cell.getColumnIndex();
        String cellVal = doGetCellValue(cell);//当前单元格值
        //结果
        Map<String,Object> map = new HashMap<>();
        boolean isMergedRegionTitle = false;//是否为标题行
        String firstRowFirstColVal = null;//合并单元格第一行第一列的值
        boolean isMergedRegion = false;
        // 得到一个sheet中有多少个合并单元格
        int sheetMergeCount = sheet.getNumMergedRegions();
        //解决合并行问题
        for (int i = 0; i < sheetMergeCount; i++) {
            // 获取合并后的单元格
            CellRangeAddress range = sheet.getMergedRegion(i);
            int firstColumn = range.getFirstColumn();
            int lastColumn = range.getLastColumn();
            int firstRow = range.getFirstRow();
            int lastRow = range.getLastRow();
            if (cellVal==null && rowNum >= firstRow && rowNum <= lastRow && columnIndex >= firstColumn && columnIndex <= lastColumn) {
                isMergedRegion = true;
                //判断是否为标题行
                if (firstRow==0 && lastRow<=maxLastRowTitle){
                    isMergedRegionTitle = true;
                    break;
                }else{
                    //获取合并后的单元格第一行第一列的值
                    XSSFRow row1 = sheet.getRow(firstRow);
                    XSSFCell cell1 = row1.getCell(firstColumn);
                    firstRowFirstColVal = doGetCellValue(cell1);
                }
            }
        }
        map.put("isMergedRegion",isMergedRegion);
        map.put("isMergedRegionTitle",isMergedRegionTitle);
        map.put("firstRowFirstColVal",firstRowFirstColVal);
        return map;
    }
    //获取标题最大行号
    public static int getMaxLastRow(XSSFSheet sheet, int maxLastRowTemp){
        int sheetMergeCount = sheet.getNumMergedRegions();
        for (int i=0;i<sheetMergeCount;i++){
            //标题对应最大行范围
            CellRangeAddress range = sheet.getMergedRegion(i);
            int firstRow = range.getFirstRow();
            int lastRow = range.getLastRow();
            if (firstRow==0 && lastRow>maxLastRowTemp){
                maxLastRowTemp = lastRow;
            }
        }
        return maxLastRowTemp;
    }
    /*
      判断导入的excel中的标题是否与约定的一致
   */
    public static Boolean excelColumnVali(List<String> fileColumnsName, MultipartFile file) {
        XSSFWorkbook workbook = null;//文件对象
        Boolean sign = false;//false代表校验通过
        try {
            workbook = new XSSFWorkbook(file.getInputStream());
            XSSFSheet sheetAt = workbook.getSheetAt(0);//获取第一个sheet页对象
            XSSFRow row = sheetAt.getRow(0);
            int lastCellNum = row.getLastCellNum();//得到最后一列下标
            if (lastCellNum >= fileColumnsName.size()) {
                for (int i = 0; i < fileColumnsName.size(); i++) {
                    String cellStr = row.getCell(i).toString();
                    if (cellStr.equals(fileColumnsName.get(i))) {
                        sign = true;
                        continue;
                    } else {
                        sign = false;
                        break;
                    }
                }
            } else {
                sign = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            sign = false;
        }
        return sign;
    }
    public static Boolean excelColumnVali(List<String> fileColumnsName, InputStream inputStream) {
        XSSFWorkbook workbook = null;//文件对象
        try {
            long l = System.currentTimeMillis();
            workbook = new XSSFWorkbook(inputStream);
            XSSFSheet sheetAt = workbook.getSheetAt(0);//获取第一个sheet页对象
            XSSFRow row = sheetAt.getRow(0);
            int lastCellNum = row.getLastCellNum();//得到最后一列下标
            Boolean sign = false;//false代表校验通过
            int addBase = 0;//递增基数
            if (lastCellNum >= fileColumnsName.size()) {
                for (int i = 0; i < fileColumnsName.size(); i++) {
                    //解决合并单元格导致的空格问题
                    Map<String,Object> map = mergedRegionTitleRemoveEmpty(row, i, addBase);
                    String cellStr = StringUtilX.objToStr(map.get("cellStr"));
                    addBase = (int)map.get("addBase");
                    if (cellStr.equals(fileColumnsName.get(i))) {
                        sign = true;
                        continue;
                    } else {
                        System.out.println("不匹配列---"+cellStr+",--"+fileColumnsName.get(i));
                        sign = false;
                        break;
                    }
                }
            } else {
                sign = false;
            }
            return sign;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("《！！！导入模板有误，请检查》");
        }
    }
    //去除横向合并单元格导致的空格
    private static Map<String,Object> mergedRegionTitleRemoveEmpty(XSSFRow row, int i, int addBase) {
        Map<String,Object> map = new HashMap<>();
        XSSFCell cell = row.getCell(i+addBase);
        String cellStr = cell.toString();
        if (StringUtils.isNotEmpty(cellStr)){
            map.put("cellStr",cellStr);
            map.put("addBase",addBase);
            return map;
        }else{
            addBase++;
            return mergedRegionTitleRemoveEmpty(row, i, addBase);
        }
    }


}
