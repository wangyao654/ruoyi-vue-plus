package com.ruoyi.common.businessUtils;

import org.apache.commons.lang3.StringUtils;
import org.ehcache.shadow.org.terracotta.context.query.Matchers;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StringUtilX {
    //obj to str
    public static String objToStr(Object obj){
        if (obj==null){
            return null;
        }
        return obj.toString();
    }
    //判断两个Object的值是否相等
    public static boolean objCompareToObj(Object obj1,Object obj2){
        if (obj1==null && obj2==null)
            return true;
        if (obj1==null || obj2==null)
            return false;
        return (obj1.toString()).equals(obj2.toString());
    }
    //list to str
    public static String listToStr(List<String> list){
        if (list==null || list.isEmpty()){
            return "";
        }
        return String.join(",",list);
    }

    //str to list
    public static List<String> strToList(String str){
        return Arrays.asList(str.split(","));
    }
    //list to str,then str to list
    public static List<String> listToList(List<String> list){
        return Arrays.asList(String.join(",", list).split(","));
    }
}
