package com.ruoyi.base.utils;

import cn.hutool.core.util.ObjectUtil;
import com.ruoyi.base.domain.BsBrandManage;
import com.ruoyi.base.domain.bo.BsBrandManageBo;
import com.ruoyi.base.mapper.BsGoodsInfoMapper;
import com.ruoyi.base.service.impl.BsBrandManageServiceImpl;
import com.ruoyi.common.businessUtils.ExcelConst;
import com.ruoyi.common.businessUtils.ExcelUtilX;
import com.ruoyi.common.businessUtils.ValiImportExcel;
import com.ruoyi.common.businessUtils.businessUtils;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.helper.LoginHelper;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysDictTypeService;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;
import java.util.stream.Collectors;

public class goodsImportUtil {
    public static String successDataKey = "upload:successData.";
    public static String errDataKey = "upload:errData.";

    public static Map<String, Object> importTemp(MultipartFile file, List<String> fields, List<String> fieldsTitle, ISysDictTypeService dictTypeService, Boolean updateSupport, BsGoodsInfoMapper baseMapper, BsBrandManageServiceImpl bsBrandManageService) throws Exception {
        //校验文件后缀
        String originalFileName = file.getOriginalFilename();
       // String substring = originalFileName.substring(originalFileName.lastIndexOf("."));//文件后缀
        //校验文件标题
        Boolean aBoolean = ExcelUtilX.excelColumnVali(fieldsTitle, file);
        if (!aBoolean) {
            throw new ServiceException("文件中的字段不对应");
        }
        List<Map<String, String>> maps = ExcelUtilX.readExcel(file, fields);
        //校验具体字段
        List<Map<String, String>> successData = new ArrayList<>();
        List<Map<String, String>> errData = new ArrayList<>();
        //非空校验
        String[] notEmptyGoodsType={"goodsName","brandName","goodsType","packagingForms","listingStatus"};
        String[] notEmptyGoodsTypeName= {"*商品名称","*品牌名称","*商品类型","*包装形式","*上市状态"};
        //字典
        String[] dictType={"goods_type","goods_specification","measure_unit","single_barbox_number","small_box_number","packaging_forms","listing_status"};
        String[] dictTypeFiled={"goodsType","goodsSpecification","measureUnit","singleBarboxNumber","smallBoxNumber","packagingForms","listingStatus"};
        String[] dictTypeName={"商品类型","商品规格","计量单位","单条盒数","小盒支数","包装形式","上市状态"};
/*        //时间
        String[] dateType={"builtDate"};
        String[] dateTypeTitle={"建成时间"};
        //检验年月日时分秒
        String[] createTime={"createTime"};
        String[] createTimeTitle={"采集时间"};*/
        int num=0;
        int size=0;
        StringBuffer msg=new StringBuffer();
        for (Map<String, String> map : maps) {
            List<String> errList = new ArrayList<>();
            boolean b1 = ValiImportExcel.fieldsVali(map, notEmptyGoodsType, notEmptyGoodsTypeName, errList, ExcelConst.fieldTypeNotEmpty);//批量校验非空
/*            boolean b2 = ValiImportExcel.fieldsVali(map, dateType, dateTypeTitle, errList, ExcelConst.fieldTypeDateYMd);//校验字符串
            boolean b3 = ValiImportExcel.fieldsVali(map, createTime, createTimeTitle, errList, ExcelConst.fieldTypeDateYMd);//校验字符串*/
            //字段处理
            boolean b4 = verifyDict(map, dictType,dictTypeName,dictTypeFiled, dictTypeService, errList);
            //处理品牌名称
            boolean b5=false;
            BsBrandManageBo bsBrandManageBo = new BsBrandManageBo();
            bsBrandManageBo.setBrandName(map.get("brandName"));
            bsBrandManageBo.setBrandEnabled("0");
            List<BsBrandManage> bsBrandManages = bsBrandManageService.selectListByBrandName(bsBrandManageBo);
            if(!CollectionUtils.isEmpty(bsBrandManages)){
                map.put("brandCoded",bsBrandManages.get(0).getBrandCoded());
            }else{
                errList.add("品牌名称请输入:系统中品牌信息中的数据");
                b5=true;
            }
            if(updateSupport){
                if(!StringUtils.isEmpty(map.get("goodsCoded"))){
                    int i=  baseMapper.deleteByCoded(map.get("goodsCoded"));
                }
            }
            if (b1||b4||b5) {
                num++;
                msg.append("<br/>数据"+num+":<br/>");
                String errMsg = StringUtils.join(errList.toArray(), "<br/>");
                msg.append(errMsg);
            } else {
                size++;
                successData.add(map);
            }
        }
        if(num>0){
            msg = msg.insert(0,"共校验数据" + maps.size() + "条，其中" + num + "条数据错误<br/>");
        }else{
            msg = msg.insert(0, "恭喜您，数据已全部导入成功！共 " + size + " 条<br/>");
        }
        StringBuffer finalMsg = msg;
        Map<String, Object> map = new HashMap<String, Object>() {
            {
                put("createTime",new Date());
                put("createBy", LoginHelper.getUsername());
                put("updateBy", LoginHelper.getUsername());
                put("updateTime", new Date());
                put("goodsCode",createGoodsCoded(baseMapper));
                put("msg", finalMsg);
                put("errDataSum", errData.size());
                put("errData",errData);
                put("successData",successData);
            }
        };
        return map;
    }

    private static String createGoodsCoded(BsGoodsInfoMapper baseMapper) {
        Long  i = baseMapper.selectCoded();
        if(i==null){
            i=0L;
        }
        Long coded=i+1;
        int count = businessUtils.getCount(coded);
        String goodsCoded;
        switch (count){
            case 1: goodsCoded= "000000"+coded;
                break;
            case 2:  goodsCoded="00000"+coded;
                break;
            case 3:goodsCoded="0000"+coded;
                break;
            case 4:goodsCoded="000"+coded;
                break;
            case 5:goodsCoded="00"+coded;
                break;
            case 6:goodsCoded="0"+coded;
                break;
            default:goodsCoded=coded.toString();
        }
        return goodsCoded;
    }

    //字典校验
    private static boolean verifyDict(Map<String, String> map, String[] dictType, String[] dictTypeName,String[] dictTypeFiled,  ISysDictTypeService dictTypeService, List<String> errList) {
        Boolean b=false;
        for (int i=0;i<dictType.length;i++) {
            List<SysDictData> sysDictTypes = dictTypeService.selectDictDataByType(dictType[i]);
            Map<String, SysDictData> map1 = sysDictTypes.stream().collect(Collectors.toMap(SysDictData::getDictLabel, f -> f));
            if(ObjectUtil.isNull(map1.get(map.get(dictTypeFiled[i])))){
/*                String s1 = sysDictTypes.stream().map(f -> f.getDictLabel()).collect(Collectors.joining(" 或 "));
                errList.add(dictTypeName[i]+"请输入:下拉框中的数据"+s1+";");*/
                errList.add(dictTypeName[i]+"请输入:下拉框中的数据");
                b= true;
            }else{
                map.put(dictTypeFiled[i],map1.get(map.get(dictTypeFiled[i])).getDictValue());
            }
        }
        return b;
    }
}
