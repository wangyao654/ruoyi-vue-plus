package test01;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("-MM-dd");
        String s = sdf.format(new Date());
        System.out.println(s);
    }
}
