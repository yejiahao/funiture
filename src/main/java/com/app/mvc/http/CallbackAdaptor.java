package com.app.mvc.http;

import com.app.mvc.http.ext.AuthSSLInitializationError;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CallbackAdaptor implements HttpCallback {

    @Override
    public void onSuccess(ResponseWrapper wrapper) {
    }

    @Override
    public void onFailure(Throwable t) {
        throw new RuntimeException(t.getMessage(), t);
    }

    @Override
    public void onAuthority(AuthSSLInitializationError t) {
        log.warn("认证失败", t);
    }

}