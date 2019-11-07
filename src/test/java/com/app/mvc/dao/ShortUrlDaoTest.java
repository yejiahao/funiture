package com.app.mvc.dao;

import com.app.mvc.shortUrl.ShortUrl;
import com.app.mvc.shortUrl.ShortUrlDao;
import org.junit.Test;

import javax.annotation.Resource;

public class ShortUrlDaoTest extends BaseJunitTest {

    @Resource
    private ShortUrlDao shortUrlDao;

    @Test
    public void testSave() {
        ShortUrl shortUrl = ShortUrl.builder().origin("test").current("test").status(1).build();
        shortUrlDao.save(shortUrl);
    }
}