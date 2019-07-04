package com.app.mvc.exception;

public class ParaException extends RuntimeException {

    public ParaException() {
        super();
    }

    public ParaException(String message) {
        super(message);
    }

    public ParaException(String message, Throwable cause) {
        super(message, cause);
    }

    public ParaException(Throwable cause) {
        super(cause);
    }

    protected ParaException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}