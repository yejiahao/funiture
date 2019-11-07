package com.app.mvc.acl.controller;

import com.app.mvc.acl.domain.SysUser;
import com.app.mvc.acl.enums.Status;
import com.app.mvc.acl.service.*;
import com.app.mvc.acl.vo.RolePara;
import com.app.mvc.beans.JsonData;
import com.app.mvc.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/sys/role")
public class SysRoleController {

    @Resource
    private SysRoleService sysRoleService;
    @Resource
    private SysRoleAclService sysRoleAclService;
    @Resource
    private SysRoleUserService sysRoleUserService;
    @Resource
    private SysTreeService sysTreeService;
    @Resource
    private SysUserService sysUserService;

    @RequestMapping(value = "/page.do")
    public ModelAndView rolePage() {
        return new ModelAndView("role");
    }

    @RequestMapping(value = "/page2.do")
    public ModelAndView rolePage2() {
        return new ModelAndView("role2");
    }

    @ResponseBody
    @RequestMapping(value = "/save.json")
    public JsonData saveRole(RolePara para) {
        sysRoleService.save(para);
        return JsonData.success();
    }

    @ResponseBody
    @RequestMapping(value = "/update.json")
    public JsonData updateRole(RolePara para) {
        sysRoleService.update(para);
        return JsonData.success();
    }

    @ResponseBody
    @RequestMapping(value = "/list.json")
    public JsonData list() {
        return JsonData.success(sysRoleService.list());
    }

    @ResponseBody
    @RequestMapping(value = "/query.json")
    public JsonData getRole(@RequestParam("id") int id) {
        return JsonData.success(sysRoleService.findById(id));
    }

    @ResponseBody
    @RequestMapping(value = "/changeAcls.json")
    public JsonData roleAcls(@RequestParam("roleId") int roleId, @RequestParam("aclIds") String aclIds) {
        List<Integer> aclIdList = StringUtil.splierToListInt(aclIds);
        sysRoleAclService.changeRoleAcls(roleId, aclIdList);
        return JsonData.success();
    }

    @ResponseBody
    @RequestMapping(value = "/changeUsers.json")
    public JsonData roleUsers(@RequestParam("roleId") int roleId, @RequestParam("userIds") String userIds) {
        List<Integer> userIdList = StringUtil.splierToListInt(userIds);
        sysRoleUserService.changeRoleUsers(roleId, userIdList);
        return JsonData.success();
    }

    @ResponseBody
    @RequestMapping(value = "/acls.json")
    public JsonData acls(@RequestParam("roleId") int roleId) {
        return JsonData.success(sysRoleAclService.getListByRoleId(roleId));
    }

    @ResponseBody
    @RequestMapping(value = "/users.json")
    public JsonData users(@RequestParam("roleId") int roleId) {

        List<SysUser> selectedUsers = sysRoleUserService.getListByRoleId(roleId);
        List<SysUser> allUsers = sysUserService.getUserList();

        List<SysUser> unselectedUsers = new ArrayList<>();
        for (SysUser sysUser : allUsers) {
            if (sysUser.getStatus() == Status.AVAILABLE.getCode() && !selectedUsers.contains(sysUser)) {
                unselectedUsers.add(sysUser);
            }
        }
        Map<String, List<SysUser>> map = new HashMap<>();
        map.put("selected", selectedUsers);// 已选择中可能有无效的用户
        map.put("unselected", unselectedUsers);// 未选择中都是有效的用户
        return JsonData.success(map);
    }

    @ResponseBody
    @RequestMapping(value = "/aclTree.json")
    public JsonData aclTree(@RequestParam("roleId") int roleId) {
        return JsonData.success(sysTreeService.roleTree(roleId));
    }

    @ResponseBody
    @RequestMapping(value = "/unselectUserTree.json")
    public JsonData userTree(@RequestParam("roleId") int roleId) {
        return JsonData.success(sysTreeService.unselectUserRoleTree(roleId));
    }

    @ResponseBody
    @RequestMapping(value = "/delete.json")
    public JsonData delete(@RequestParam("id") int id) {
        sysRoleService.deleteById(id);
        return JsonData.success();
    }
}