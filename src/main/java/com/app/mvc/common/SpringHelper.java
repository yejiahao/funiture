package com.app.mvc.common;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;

import java.util.Objects;

@Slf4j
public class SpringHelper {

    private static ApplicationContext applicationContext;

    /**
     * @param applicationContext
     * @see ApplicationContextHelper
     */
    public static void setApplicationContext(ApplicationContext applicationContext) {
        SpringHelper.applicationContext = applicationContext;
    }

    public static <T> T popBean(Class<T> clazz) {
        if (Objects.isNull(applicationContext)) {
            return null;
        }
        return applicationContext.getBean(clazz);
    }

    public static <T> T popBean(String name, Class<T> clazz) {
        if (Objects.isNull(applicationContext)) {
            return null;
        }
        return applicationContext.getBean(name, clazz);
    }
}