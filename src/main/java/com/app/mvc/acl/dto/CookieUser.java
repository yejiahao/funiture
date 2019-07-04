package com.app.mvc.acl.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CookieUser {

    private int userId;

    private String username;

    private long lastLogin;

    private String ip;

    private String mac;
}