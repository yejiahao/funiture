package com.app.mvc.test;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

public class TestCallable {

    private static final ExecutorService threadPool = new ThreadPoolExecutor(2, 5, 120, TimeUnit.SECONDS, new ArrayBlockingQueue<>(100));

    private static int flag = 0;

    // test future.get() 的NPE
    public static void main(String[] args) throws Exception {
        Future<Long> future = threadPool.submit(() -> {
            List<Long> list = new ArrayList<>();
            if (flag >= 0) {
                list = null;
            }
            return list.get(0);
        });
        System.out.println(future.get());
    }
}