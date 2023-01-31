package com.ruoyi.base.utils;

import cn.hutool.core.util.ObjectUtil;
import com.ruoyi.base.mapper.BsGoodsInfoMapper;
import com.ruoyi.common.businessUtils.ExcelConst;
import com.ruoyi.common.businessUtils.ExcelUtilX;
import com.ruoyi.common.businessUtils.ValiImportExcel;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysDictTypeService;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class goodsImportUtil {
    public static String successDataKey = "upload:successData.";
    public static String errDataKey = "upload:errData.";

    public static Map<String, Object> importTemp(MultipartFile file, List<String> fields, List<String> fieldsTitle, ISysDictTypeService dictTypeService, Boolean updateSupport, BsGoodsInfoMapper baseMapper) throws Exception {
        //校验文件后缀
        String originalFileName = file.getOriginalFilename();
        String substring = originalFileName.substring(originalFileName.lastIndexOf("."));//文件后缀
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
        String[] notEmptyType = {"communityNo", "deviceCode","deviceName", "deviceLocation", "deviceType", "deviceLat", "deviceLng", "deviceDirection"};
        String[] notEmptyTypeTitle ={"*小区名称","*设备编码","*设备名称","*设备安装位置","*设备类型","*设备纬度","*设备经度","*安装方向"};
        //字典
        String[] dictType={"device_type","device_direction"};
        String[] dictTypeFiled={"deviceType","deviceDirection"};
        String[] dictTypeName={"设备类型","安装方向"};
        //时间
        String[] dateType={"builtDate"};
        String[] dateTypeTitle={"建成时间"};
        //检验年月日时分秒
        String[] createTime={"createTime"};
        String[] createTimeTitle={"采集时间"};
        int num=0;
        int size=0;
        StringBuffer msg=new StringBuffer();
        for (Map<String, String> map : maps) {
            List<String> errList = new ArrayList<>();
            boolean b1 = ValiImportExcel.fieldsVali(map, notEmptyType, notEmptyTypeTitle, errList, ExcelConst.fieldTypeNotEmpty);//批量校验非空
            boolean b2 = ValiImportExcel.fieldsVali(map, dateType, dateTypeTitle, errList, ExcelConst.fieldTypeDateYMd);//校验字符串
            boolean b3 = ValiImportExcel.fieldsVali(map, createTime, createTimeTitle, errList, ExcelConst.fieldTypeDateYMd);//校验字符串
            //字段处理
            boolean b4 = verifyDict(map, dictType,dictTypeName,dictTypeFiled, dictTypeService, errList);
            //处理小区编号
         //   List<GrdCommunity> list = grdCommunityService.selectByCommunityName(map.get("communityNo"));
/*            boolean b5=false;
            if(CollectionUtils.isEmpty(list)){
                errList.add("小区名称请输入:小区信息中的数据");
                b5=true;
            }else{
                map.put("communityNo",list.get(0).getCommunityNo().toString());
            }*/
            if(updateSupport){
                if(!StringUtils.isEmpty(map.get("goodsCoded"))){
                    int i=  baseMapper.deleteByCoded(map.get("goodsCoded"));
                }
            }
            if (b1||b2||b3||b4) {
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
                put("msg", finalMsg);
                put("errDataSum", errData.size());
                put("errData",errData);
                put("successData",successData);
            }
        };
        return map;
    }

    private static boolean verifyDict(Map<String, String> map, String[] dictType, String[] dictTypeName,String[] dictTypeFiled,  ISysDictTypeService dictTypeService, List<String> errList) {
        Boolean b=false;
        for (int i=0;i<dictType.length;i++) {
            List<SysDictData> sysDictTypes = dictTypeService.selectDictDataByType(dictType[i]);
            Map<String, SysDictData> map1 = sysDictTypes.stream().collect(Collectors.toMap(SysDictData::getDictLabel, f -> f));
            if(ObjectUtil.isNull(map1.get(map.get(dictTypeFiled[i])))){
                String s1 = sysDictTypes.stream().map(f -> f.getDictLabel()).collect(Collectors.joining(" 或 "));
                errList.add(dictTypeName[i]+"请输入:"+s1+";");
                b= true;
            }else{
                map.put(dictTypeFiled[i],map1.get(map.get(dictTypeFiled[i])).getDictValue());
            }
        }
        return b;
    }
}
