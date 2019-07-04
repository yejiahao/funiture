package com.app.mvc.util;

import com.app.mvc.beans.JsonMapper;
import lombok.extern.slf4j.Slf4j;

import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
public class ShellUtil {

    /**
     * 运行shell脚本
     *
     * @param shell 需要运行的shell脚本
     */
    public static List<String> execShell(String shell) {
        List<String> strList = new ArrayList<>();
        try {
            Runtime rt = Runtime.getRuntime();
            Process process = rt.exec(shell);

            InputStreamReader ir = new InputStreamReader(process.getInputStream());
            LineNumberReader input = new LineNumberReader(ir);
            String line;
            process.waitFor();
            while (Objects.nonNull(line = input.readLine())) {
                strList.add(line);
            }
        } catch (Exception e) {
            log.error("exec shell error, shell: " + shell, e);
        }
        return strList;
    }

    /**
     * 运行shell
     *
     * @param shStr 需要执行的shell
     */
    public static List runShell(String shStr) throws Exception {
        List<String> strList = new ArrayList<>();
        Process process;
        process = Runtime.getRuntime().exec(new String[]{"/bin/sh", "-c", shStr}, null, null);
        InputStreamReader ir = new InputStreamReader(process.getInputStream());
        LineNumberReader input = new LineNumberReader(ir);
        String line;
        process.waitFor();
        while (Objects.nonNull(line = input.readLine())) {
            strList.add(line);
        }
        return strList;
    }

    public static void main(String[] args) {
        // 在当前项目首层执行, pom.xml相同路径
        String shell = "ls -al";
        List<String> list = execShell(shell);
        log.info(JsonMapper.obj2String(list));
    }

}