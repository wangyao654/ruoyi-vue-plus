package com.ruoyi.common.businessUtils;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

public class ExcelConst {

    public static String fieldTypeNotEmpty = "notEmpty";//非空
    public static String fieldTypeIdCard = "idCard";//身份证格式 18位
    public static String fieldTypeDecimal = "decimal";//数字
    public static String fieldTypeDateYM = "dateYM";//日期
    public static String fieldTypeDateYMd = "dateYMd";//日期
    public static String fieldTypeDateYMdHms = "dateMdHms";//数字
    public static String fieldTypeId = "idType";//数字

    //品牌信息
    public static List<String> brandField= Arrays.asList("brandCoded","brandName","brandLocality",
        "brandEnabled","remark");
    public static List<String> dictBrandType= Arrays.asList("sys_normal_disable");//字典
    public static List<String> dictBrandTypeName=Arrays.asList("启用状态");
    public static Map<String,String> BrandMap= IntStream.range(0,dictBrandType.size()).collect(HashMap::new,(m,i)->m.put(dictBrandType.get(i),dictBrandTypeName.get(i)),(m,i)->{});
    public static List<String> BrandTitle= Arrays.asList("*品牌编号","*品牌名称","*品牌所在地","*启用状态","*备注");
   //商品信息
   public static List<String> goodsField= Arrays.asList("goodsName","brandName","goodsType","goodsSpecification","smallBoxBarcode","barboxBarcode","measureUnit","singleBarboxNumber",
       "smallBoxNumber","singleBoxPrice","barboxPrice","barboxWholesalePrices","packagingForms","listingStatus","tarContent","smokeNicotine","monoxideCarbon","remark");
    public static List<String> dictGoodsType= Arrays.asList("goods_type","goods_specification","measure_unit","single_barbox_number","small_box_number","packaging_forms","listing_status");//字典
    public static List<String> dictGoodsTypeName=Arrays.asList("商品类型","商品规格","计量单位","单条盒数","小盒支数","包装形式","上市状态");
    public static Map<String,String> goodsMap= IntStream.range(0,dictBrandType.size()).collect(HashMap::new,(m, i)->m.put(dictBrandType.get(i),dictBrandTypeName.get(i)),(m, i)->{});
    public static List<String> goodsTitle= Arrays.asList("*商品名称","*品牌名称","*商品类型","商品规格","小盒条码","条盒条码","计量单位","单条盒数","小盒支数",
        "单盒售价","条盒售价","条盒批发价","*包装形式","*上市状态","焦油量/mg","烟气烟碱量/mg","一氧化碳量/mg","备注");

}
