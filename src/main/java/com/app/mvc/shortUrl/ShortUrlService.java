package com.app.mvc.shortUrl;

import com.app.mvc.acl.enums.Status;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Objects;

@Service
public class ShortUrlService {

    @Resource
    private ShortUrlDao shortUrlDao;

    public String generate(String url) {
        String newUrl = ShortUrlUtil.generate(url);
        ShortUrl shortUrl = shortUrlDao.findByNewUrl(url);
        if (Objects.nonNull(shortUrl)) {
            return shortUrl.getCurrent();
        }
        shortUrl = ShortUrl.builder().origin(url).current(newUrl).status(Status.AVAILABLE.getCode()).build();
        shortUrlDao.save(shortUrl);
        return newUrl;
    }

    public String getOriginUrl(String url) {
        ShortUrl shortUrl = shortUrlDao.findByNewUrl(url);
        if (Objects.isNull(shortUrl)) {
            throw new RuntimeException("未查到该短链接");
        }
        if (shortUrl.getStatus() != Status.AVAILABLE.getCode()) {
            throw new RuntimeException("该短链接已失效");
        }
        if (Objects.nonNull(shortUrl.getInvalidTime()) && shortUrl.getInvalidTime().getTime() < System.currentTimeMillis()) {
            throw new RuntimeException("该短链接已过期");
        }
        return shortUrl.getOrigin();
    }

    public String getOriginUrlWithoutException(String url) {
        try {
            return getOriginUrl(url);
        } catch (Throwable t) {
            return "/index.jsp";
        }
    }
}