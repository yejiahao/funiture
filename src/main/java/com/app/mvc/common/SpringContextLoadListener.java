package com.app.mvc.common;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContextEvent;

@Slf4j
public class SpringContextLoadListener extends ContextLoaderListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        super.contextInitialized(event);
        log.info("context loader initialized");
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        super.contextDestroyed(event);
    }
}