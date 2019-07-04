package com.app.mvc.acl.servlet;

import com.app.mvc.acl.util.LoginUtil;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
public class LogoutServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // log.info("{} logout", RequestHolder.getCurrentUser().getUsername());
        LoginUtil.logout(req, resp);
        resp.sendRedirect("index.jsp");
        return;
    }
}