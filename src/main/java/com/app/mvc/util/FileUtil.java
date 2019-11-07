package com.app.mvc.util;

import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.net.URL;
import java.util.Objects;

@Slf4j
public class FileUtil {

    // 读取
    public static String readFile(URL url) throws Exception {
        log.info("try to read file, {}", url.toString());
        BufferedReader br = null;
        try {
            File file = new File(url.toURI());
            br = new BufferedReader(new FileReader(file));
            StringBuffer sb = new StringBuffer();
            String line;
            while (Objects.nonNull(line = br.readLine())) {
                sb.append(line);
            }
            log.info("read file succeed, {}", url.toString());
            return sb.toString();
        } catch (Exception e) {
            log.info("read file error, {}", url.toString(), e);
            throw e;
        } finally {
            if (Objects.nonNull(br)) {
                br.close();
            }
        }
    }
}