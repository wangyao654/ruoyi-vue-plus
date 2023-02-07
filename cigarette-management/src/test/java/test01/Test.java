package test01;

import com.ruoyi.base.domain.BsGoodsInfo;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.StringUtils;
import org.apache.commons.lang3.ObjectUtils;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

public class Test {
    public static void main(String[] args) {
        SysUser user1 = new SysUser();
        user1.setUserName("李先");
        SysUser user2 = new SysUser();
        user2.setUserName("李元");
        SysUser user3 = new SysUser();
        user3.setUserName("wangyao");
        List<SysUser> list = new ArrayList<>();
        list.add(user1);list.add(user2);list.add(user3);
      /*  Map<String, SysUser> collect = list.stream().collect(Collectors.toMap(SysUser::getUserName, Function.identity(), (k1, k2) -> k2));
        Set<String> strings = collect.keySet();
        for (String string : strings) {
            System.out.println(string);
        }*/
    }
}
