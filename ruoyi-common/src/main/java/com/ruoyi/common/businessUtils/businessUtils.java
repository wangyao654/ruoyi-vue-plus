package com.ruoyi.common.businessUtils;

public class businessUtils {
    public static int getCount(Long id){
        int count=1;
        while (id/10>0){
            count++;
            id=id/10;
        }
        return count;
    }
}
