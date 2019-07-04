package com.app.mvc.test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

/**
 * 指定数据计算中位数
 */
public class TestMid {

    // 数字个数
    public static int MAX_LENGTH = 10000;
    // 数值范围
    public static int MAX_VALUE = 100000;
    // 桶的区间
    public static int RANGE_LENGTH = 1000;

    public static void main(String[] args) {
        // 初始化点数据
        List<Integer> list = new ArrayList<>();
        for (int i = 1; i <= MAX_LENGTH; i++) {
            list.add(i);
        }

        System.out.println(getMid(list));
    }

    public static int getMid(List<Integer> list) {
        if (Objects.isNull(list)) {
            throw new RuntimeException("c");
        }
        int size = list.size();
        if (size <= RANGE_LENGTH) {
            return getK(list, list.size() / 2 - 1);
        }
        // 计算桶的个数,并初始化
        int base = (MAX_VALUE + RANGE_LENGTH - 1) / RANGE_LENGTH + 1;
        List<Integer> s[] = new List[base];
        for (int i = 0; i < base; i++) {
            s[i] = new ArrayList<>();
        }

        // 遍历入桶
        for (int i = 0; i < size; i++) {
            int seq = list.get(i) / RANGE_LENGTH;
            s[seq].add(list.get(i));
        }

        // 计算属于哪个桶
        int mid = size / 2;
        int index = 0;
        while (true) {
            if (mid <= s[index].size()) {
                System.out.println("find index : " + index + ", mid :" + mid);
                break;
            }
            mid -= s[index].size();
            index++;
        }

        // 对桶按照小到大的排序,得到指定位置的数字
        return getK(s[index], mid - 1);
    }

    public static int getK(List<Integer> list, int k) {
        if (Objects.isNull(list) || k > list.size()) {
            throw new RuntimeException("cc");
        }
        Collections.sort(list);
        return list.get(k);
    }
}