package com.app.mvc.test;

import com.app.mvc.http.HttpClients;
import lombok.extern.slf4j.Slf4j;

import java.util.concurrent.*;

@Slf4j
public class TestAsyncTimeout {
    public static void main(String[] args) {
        ExecutorService poll = Executors.newFixedThreadPool(100);
        Future<Boolean> future = poll.submit(() -> {
            Thread.sleep(1000 * 10);
            System.out.println("任务执行完成");
            return true;
        });
        try {
            future.get(3, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            log.error("InterruptedException", e);// get为一个等待过程，异常中止get会抛出异常
        } catch (ExecutionException e) {
            log.error("ExecutionException", e);// submit计算出现异常
        } catch (TimeoutException e) {
            log.error("TimeoutException", e);// 超时异常
            future.cancel(true);// 超时后取消任务
        } finally {
            poll.shutdown();
        }
        try {
            HttpClients.asyncClient(1, 1).asyncGet("https://www.baidu.com");
        } catch (Exception e) {
            log.error("xxx", e);
        }

    }
}