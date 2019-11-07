package com.app.mvc.shortUrl;

import com.app.mvc.common.DBRepository;
import org.apache.ibatis.annotations.Param;

@DBRepository
public interface ShortUrlDao {

    void save(ShortUrl shortUrl);

    ShortUrl findByNewUrl(@Param("url") String url);
}