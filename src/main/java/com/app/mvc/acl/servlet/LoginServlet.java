package com.app.mvc.acl.servlet;

import com.app.mvc.acl.domain.SysUser;
import com.app.mvc.acl.service.SysUserService;
import com.app.mvc.acl.util.LoginUtil;
import com.app.mvc.common.SpringHelper;
import com.app.mvc.util.IpUtil;
import com.app.mvc.util.MD5Util;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
public class LoginServlet extends HttpServlet {

    private SysUserService sysUserService = SpringHelper.popBean(SysUserService.class);

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String ip = IpUtil.getUserIP(req);

        SysUser sysUser = sysUserService.findByUsernameOrEmail(username);
        String error = "";
        String ret = req.getParameter("ret");
        if (StringUtils.isBlank(username)) {
            log.info("login error, username is blank, ip:{}", ip);
            error = "login error, username is blank";
        } else if (StringUtils.isBlank(password)) {
            log.info("login error, password is blank, ip:{}", ip);
            error = "login error, password is blank";
        } else if (sysUser == null) {
            log.info("login error, username not exist, ip:{}, username:{}", ip, username);
            error = "login error, username not exist";
        } else if (!sysUser.getPassword().equalsIgnoreCase(MD5Util.encrypt(password))) {
            log.info("login error, password is error, ip:{}, username:{}, password:{}", ip, username, password);
            error = "login error, password is error";
        } else if (sysUser.getStatus() != 1) {
            log.info("login error, user invalid, ip:{}, username:{}", ip, username);
            error = "login error, user invalid";
        } else {
            log.info("login succeed, ip:{}, username:{}", ip, username);
            LoginUtil.saveUserToCookie(req, resp, sysUser);
            if (StringUtils.isBlank(ret)) {
                resp.sendRedirect("/admin/page.do");
            } else {
                resp.sendRedirect(ret);
            }
            return;
        }
        req.setAttribute("error", error);
        req.setAttribute("username", username);
        if (StringUtils.isNotBlank(ret)) {
            req.setAttribute("ret", ret);
        }
        String path = "signin.jsp";
        req.getRequestDispatcher(path).forward(req, resp);
        return;

    }

}
