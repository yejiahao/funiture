package com.app.mvc.common;

public interface SelfAware<T> {

    /**
     * spring上下文bean自感接口
     */
    T self();
}