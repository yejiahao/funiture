package com.app.mvc.shortUrl;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ShortUrl {

    private String origin;

    private String current;

    private int status;

    private Date createTime;

    private Date invalidTime;
}