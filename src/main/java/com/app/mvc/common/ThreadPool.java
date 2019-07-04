package com.app.mvc.common;

import com.app.mvc.config.GlobalConfig;
import com.app.mvc.config.GlobalConfigKey;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ThreadPool {

    private static ExecutorService defaultExecutor;// 线程池

    /****** 初始化线程池 ******/
    static {
        defaultExecutor = new ThreadPoolExecutor(GlobalConfig.getIntValue(GlobalConfigKey.DEFAULT_EXECUTOR_CORESIZE, 40),
                GlobalConfig.getIntValue(GlobalConfigKey.DEFAULT_EXECUTOR_MAXSIZE, 100),
                GlobalConfig.getIntValue(GlobalConfigKey.DEFAULT_EXECUTOR_KEEPALIVE_SECONDS, 120),
                TimeUnit.SECONDS,
                new ArrayBlockingQueue<>(GlobalConfig.getIntValue(GlobalConfigKey.DEFAULT_EXECUTOR_QUEUESIZE, 1000)),
                new ThreadPoolExecutor.DiscardOldestPolicy());
    }

    /**
     * 在未来某个时间执行给定的命令
     */
    public static void execute(Runnable runnable) throws RejectedExecutionException {
        defaultExecutor.execute(runnable);
    }

    /**
     * 提交一个 Runnable 任务用于执行,并返回一个表示该任务的 Future
     */
    public static Future<?> submit(Runnable runnable) throws RejectedExecutionException {
        return defaultExecutor.submit(runnable);
    }
}