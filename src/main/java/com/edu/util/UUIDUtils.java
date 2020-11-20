package com.edu.util;

import java.util.UUID;

/**
 * 创建一个UUID的工具类
 *
 * @author Administrator
 */
public class UUIDUtils {
    // 这是激活码
    public static String getCode() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    // 这是用户的id
    public static String getId() {
        return getCode();
    }

}
