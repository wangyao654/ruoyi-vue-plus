package com.ruoyi.common.businessUtils;

import com.ruoyi.common.utils.StringUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

@Component
public class ValiImportExcel {
    @Resource
    public RedisTemplate<String, Object> redisTemplate;

    //批量校验非空
    public static boolean fieldsVali(Map<String, String> valiObj, String[] arr, String[] idTypeTitle,
                                                 List<String> errmsgList, String type) {
        boolean isVali = true;
        for (int i = 0; i < arr.length; i++) {
            String s = valiObj.get(arr[i]);
            boolean b = false;
            String errorMsg = "";
            if (ExcelConst.fieldTypeNotEmpty.equals(type)) {
                b = StringUtils.isEmpty(s);
                errorMsg = b?"不可为空":"";
            }else if (ExcelConst.fieldTypeIdCard.equals(type)){
                b = isNotIdCard(s);
                errorMsg = b?"输入类型有误，需要18位身份证":"";
            }else if (ExcelConst.fieldTypeDecimal.equals(type)){
                b = isNotDecimal(s);
                errorMsg = b?"输入类型有误，需要数字类型":"";
            }else if (ExcelConst.fieldTypeDateYM.equals(type)){
                b = isNotDateYM(s);
                errorMsg = b?"输入类型有误，需要日期类型，格式yyyy-MM":"";
            }else if (ExcelConst.fieldTypeId.equals(type)){
//                b = isNotExist(s,arr[i],valiObj);
                errorMsg = b?"不存在":"";
            }else if(ExcelConst.fieldTypeDateYMd.equals(type)){
                b=isNotDateYMd(s);
                errorMsg = b?"输入类型有误，需要日期类型，格式yyyy-MM-dd":"";
            }else if(ExcelConst.fieldTypeDateYMdHms.equals(type)){
                b=isNotDateYMdHms(s);
                errorMsg = b?"输入类型有误，需要日期类型，格式yyyy-MM-dd HH:mm:ss":"";
            }
            if (b) {
                errmsgList.add(idTypeTitle[i] + errorMsg);
                isVali = true;
            }else{
                isVali=false;
            }
        }
        return isVali;
    }
//    //判断某ID字段值是否存在
//    private static boolean isNotExist(String idStr, String idField, Map<String, String> valiObj) {
//        if (StringUtils.isEmpty(idStr)) {
//            return false;
//        }
//        String cardNo = valiObj.get("cardNo");
//        if ("teacherId".equals(idField)){
//            IBdTeacherService iBdTeacherService = SpringUtils.getBean(IBdTeacherService.class);
//            BdTeacherBo bdTeacherBo = new BdTeacherBo();
//            bdTeacherBo.setNameAll(idStr);
//            bdTeacherBo.setCardNo(cardNo);
//            List<BdTeacherVo> bdTeacherVos = iBdTeacherService.queryList(bdTeacherBo);
//            if (bdTeacherVos != null && bdTeacherVos.size() != 0){
//                valiObj.put("teacherId", StringUtilX.objToStr(bdTeacherVos.get(0).getId()));
//            }else{
//                return true;
//            }
//        }else if ("orgId".equals(idField) || "deptId".equals(idField)){
//            ISysDeptService iSysDeptService = SpringUtils.getBean(ISysDeptService.class);
//            SysDept sysDept = new SysDept();
//            sysDept.setDeptNameAll(idStr);
//            List<SysDept> sysDepts = iSysDeptService.selectDeptList(sysDept);
//            if (sysDepts != null && sysDepts.size() != 0){
//                if ("orgId".equals(idField)){
//                    valiObj.put("orgId", StringUtilX.objToStr(sysDepts.get(0).getDeptId()));
//                }else {
//                    valiObj.put("deptId", StringUtilX.objToStr(sysDepts.get(0).getDeptId()));
//                }
//            }else{
//                return true;
//            }
//        }
//        return false;
//    }

    //校验是否为decimal
    public static boolean isNotDecimal(String decimalStr) {
        if (StringUtils.isEmpty(decimalStr)) {
            return false;
        }
        return !Pattern.matches(RegexUtils.decimals, decimalStr);
    }
    public static boolean isNotIdCard(String idCardStr) {
        if (StringUtils.isEmpty(idCardStr)) {
            return false;
        }
        return !Pattern.matches(RegexUtils.idCard, idCardStr);
    }
    //校验是否为日期 yyyy-MM
    public static boolean isNotDateYM(String dateStr) {
        if (StringUtils.isEmpty(dateStr)) {
            return false;
        }
        return !Pattern.matches(RegexUtils.dateYM, dateStr);
    }
    //校验是否为日期yyyy-MM-dd HH:mm:ss
    public static boolean isNotDateYMdHms(String dateStr) {
        if (StringUtils.isEmpty(dateStr)) {
            return false;
        }
        return !Pattern.matches(RegexUtils.dateAll, dateStr);
    }
    //校验是否为日期yyyy-MM-dd
    public static boolean isNotDateYMd(String dateStr) {
        if (StringUtils.isEmpty(dateStr)) {
            return false;
        }
        return !Pattern.matches(RegexUtils.date, dateStr);
    }

}
