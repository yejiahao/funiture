package com.app.mvc.proxy.checker;

import com.app.mvc.proxy.UrlConnectionChecker;
import com.app.mvc.util.HttpUtil;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;

import java.util.Objects;

public class DefaultUrlConnectionChecker implements UrlConnectionChecker {

    private String url;

    private HttpClient httpClient = null;

    public DefaultUrlConnectionChecker(String url) {
        this.url = url;
    }

    public DefaultUrlConnectionChecker(String url, HttpClient httpClient) {
        this.url = url;
        this.httpClient = httpClient;
    }

    @Override
    public String url() {
        return url;
    }

    @Override
    public HttpPost httpPost() {
        return new HttpPost(url);
    }

    @Override
    public HttpGet httpGet() {
        return new HttpGet(url);
    }

    @Override
    public HttpClient httpClient() {
        if (Objects.isNull(httpClient)) {
            return HttpUtil.defaultClient();
        }
        return httpClient;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}