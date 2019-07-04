package com.app.mvc.shortUrl;

import lombok.extern.slf4j.Slf4j;

import java.security.MessageDigest;
import java.util.Random;

@Slf4j
public class ShortUrlUtil {

    public static String generate(String url) {
        String key = "1q2w3e4r";

        String[] chars = new String[]{"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
                "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q",
                "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

        String hex = md5ByHex(key + url);

        String[] resUrl = new String[4];
        for (int i = 0; i < 4; i++) {// 将产生4组6位字符串
            // 把加密字符按照 8 位一组 16 进制与 0x3FFFFFFF 进行位与运算
            String sTempSubString = hex.substring(i * 8, i * 8 + 8);

            // 这里需要使用 long 型来转换，因为 Integer.parseInt() 只能处理 31 位 , 首位为符号位 , 如果不用long ，则会越界
            long lHexLong = 0x3FFFFFFF & Long.parseLong(sTempSubString, 16);
            String outChars = "";
            for (int j = 0; j < 6; j++) {
                // 把得到的值与 0x0000003D 进行位与运算，取得字符数组 chars 索引
                long index = 0x0000003D & lHexLong;
                // 把取得的字符相加
                outChars += chars[(int) index];
                // 每次循环按位右移 5 位
                lHexLong = lHexLong >> 5;
            }
            // 把字符串存入对应索引的输出数组
            resUrl[i] = outChars;
        }
        return resUrl[new Random().nextInt(4)];
    }

    /**
     * MD5加密(32位大写)
     *
     * @param src
     * @return
     */
    public static String md5ByHex(String src) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] b = src.getBytes();
            md.reset();
            md.update(b);
            byte[] hash = md.digest();
            String hs = "";
            for (int i = 0; i < hash.length; i++) {
                String tmp = Integer.toHexString(hash[i] & 0xFF);
                if (tmp.length() == 1)
                    hs = hs + "0" + tmp;
                else {
                    hs = hs + tmp;
                }
            }
            return hs.toUpperCase();
        } catch (Exception e) {
            return "";
        }
    }

}