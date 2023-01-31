package com.ruoyi.common.businessUtils;

import java.util.regex.Pattern;

/**
 * 正则工具类
 * 提供验证邮箱、手机号、电话号码、身份证号码、数字等方法
 */
public final class RegexUtils {

    public static final String email = "\\w+@\\w+\\.[a-z]+(\\.[a-z]+)?";

    public static final String phoneOrMobile = "((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)";

    public static final String idCard = "[1-9]\\d{13,16}[a-zA-Z0-9]{1}";//身份证

    public static final String mobile = "(\\+\\d+)?1[3456789]\\d{9}$";

    public static final String phone = "(\\+\\d+)?(\\d{3,4}\\-?)?\\d{7,8}$";//手机号

    public static final String digit = "\\-?[1-9]\\d+";//整数
    public static final String noNegativeNumber = "0|[1-9][0-9]*"; //0或非零开头的数字

    public static final String decimals = "\\-?[1-9]\\d+(\\.\\d+)?";//小数
    public static final String number = "\\d+(\\.\\d+)?";//数字 【包含正数和小数】

    public static final String blankSpace = "\\s+";

    public static final String chinese = "^[\u4E00-\u9FA5]+$";//中文

    public static final String birthday = "[1-9]{4}([-./])\\d{1,2}\\1\\d{1,2}";//生日

    public static final String url = "(https?://(w{3}\\.)?)?\\w+\\.\\w+(\\.[a-zA-Z]+)*(:\\d{1,5})?(/\\w*)*(\\??(.+=.*)?(&.+=.*)?)?";

    public static final String postcode = "[1-9]\\d{5}";

    public static final String ipAddress = "[1-9](\\d{1,2})?\\.(0|([1-9](\\d{1,2})?))\\.(0|([1-9](\\d{1,2})?))\\.(0|([1-9](\\d{1,2})?))";
    //yyyy-MM-dd
    public static final String date = "^([1-9]\\d{3}-)(([0]{0,1}[1-9]-)|([1][0-2]-))(([0-3]{0,1}[0-9]))$";//日期-年月日
    //yyyy-MM
    public static final String dateYM = "^([1-9]\\d{3}-)(([0]{0,1}[1-9])|([1][0-2]))$";//日期-年月

    public static final String CarNum = "^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$";
    //yyyy-MM-dd HH:mm:ss
    public static final String dateAll = "^([0]?[1-9]|[1|2][0-9]|[3][0|1])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4}|[0-9]{2})$";//日期-年月日时分秒

    public static boolean check(String regex, String value) {
        return Pattern.matches(regex, value);
    }


    public static void main(String[] args) {
        String aa = "2022-02";
        boolean matches = Pattern.matches(dateYM, aa);
        System.out.println(matches);
    }

}
