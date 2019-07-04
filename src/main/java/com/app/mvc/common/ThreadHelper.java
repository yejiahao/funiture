package com.app.mvc.common;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ThreadHelper {

    public static void safeSleep(long milliseconds) {
        try {
            Thread.currentThread().sleep(milliseconds);
        } catch (Throwable t) {
            log.error("thread sleep exception", t);
        }
    }
}