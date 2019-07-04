package com.app.mvc.http.ext;

public class AuthSSLInitializationError extends Error {

    public AuthSSLInitializationError() {
    }

    public AuthSSLInitializationError(String message) {
        super(message);
    }

    public AuthSSLInitializationError(String message, Throwable cause) {
        super(message, cause);
    }

    public AuthSSLInitializationError(Throwable cause) {
        super(cause);
    }
}