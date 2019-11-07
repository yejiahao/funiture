package com.app.mvc.acl.service;

import com.app.mvc.acl.config.LogTypeServiceConfig;
import com.app.mvc.acl.dao.*;
import com.app.mvc.acl.domain.SysAcl;
import com.app.mvc.acl.domain.SysDept;
import com.app.mvc.acl.domain.SysLog;
import com.app.mvc.acl.domain.SysUser;
import com.app.mvc.acl.enums.CacheKeyConstants;
import com.app.mvc.acl.enums.LogType;
import com.app.mvc.acl.enums.Status;
import com.app.mvc.acl.util.RequestHolder;
import com.app.mvc.beans.JsonMapper;
import com.app.mvc.config.GlobalConfig;
import com.app.mvc.config.GlobalConfigKey;
import com.google.common.base.Preconditions;
import com.google.common.collect.Sets;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class SysCoreService {

    // 权限是否使用cache的标识
    private final static String ACL_USE_CACHE_SWITCH = "acl.use.cache";
    // 权限缓存时间（单位：秒）的标识
    private final static String ACL_CACHE_TIME = "acl.cache.time.seconds";

    private final static String HAS_ACL = "true";
    private final static String NO_ACL = "false";

    @Resource
    private SysLogService sysLogService;
    @Resource
    private SysCacheService sysCacheService;
    @Resource
    private SysAclDao sysAclDao;
    @Resource
    private SysRoleAclDao sysRoleAclDao;
    @Resource
    private SysRoleUserDao sysRoleUserDao;
    @Resource
    private SysDeptDao sysDeptDao;
    @Resource
    private SysUserDao sysUserDao;

    /**
     * 判断当前用户是否为Root用户
     */
    public boolean isRootUser() {
        SysUser user = RequestHolder.getCurrentUser();
        return GlobalConfig.getSetValue(GlobalConfigKey.ROOT_USER_NAME).contains(user.getUsername());
    }

    /**
     * 通过log记录,还原到某操作之前的记录
     */
    public void recover(int logId) {
        SysLog sysLog = sysLogService.findById(logId);
        Preconditions.checkNotNull(sysLog, "待还原的记录不存在");

        LogType logType = LogType.codeOf(sysLog.getType());

        SysService sysService = LogTypeServiceConfig.getByLogTypeCode(logType.getCode());
        sysService.recover(sysLog.getTargetId(), JsonMapper.string2Obj(sysLog.getOldValue(), logType.getClazz()));
    }

    /**
     * 获取当前用户的权限列表
     */
    public List<SysAcl> getCurrentUserAclList() {
        int userId = RequestHolder.getCurrentUser().getId();
        return getUserAclList(userId);
    }

    public List<Integer> getCurrentUserAclIdListFromCache() {
        if (!isAclUseCache()) {
            return getCurrentUserAclIdList();
        }
        int userId = RequestHolder.getCurrentUser().getId();
        String cacheValue = sysCacheService.getFromCache(CacheKeyConstants.USERID_ACLLIST, String.valueOf(userId));
        if (StringUtils.isBlank(cacheValue)) {
            List<Integer> userAclIdList = getCurrentUserAclIdList();
            sysCacheService.saveCache(JsonMapper.obj2String(userAclIdList), aclCacheTime(), CacheKeyConstants.USERID_ACLCODE, String.valueOf(userId));
            return userAclIdList;
        }
        return getCurrentUserAclIdList();
    }

    public List<Integer> getCurrentUserAclIdList() {
        int userId = RequestHolder.getCurrentUser().getId();
        return getUserAclIdList(userId);
    }

    /**
     * 获取指定用户的权限列表
     */
    public List<SysAcl> getUserAclList(int userId) {
        if (isRootUser()) {
            // root用户拥有所有权限点
            return sysAclDao.getAll();
        }
        // 获取用户角色id列表
        List<Integer> userRoleIdList = sysRoleUserDao.getRoleIdListByUserId(userId);
        if (CollectionUtils.isEmpty(userRoleIdList)) {
            return new ArrayList<>();
        }
        // 获取角色列表对应的权限点列表
        List<Integer> userAclIdList = sysRoleAclDao.getAclIdListByRoleIdList(userRoleIdList);
        if (CollectionUtils.isEmpty(userAclIdList)) {
            return new ArrayList<>();
        }
        return sysAclDao.getByIdList(userAclIdList);
    }

    public List<Integer> getUserAclIdList(int userId) {
        // 获取用户角色id列表
        List<Integer> userRoleIdList = sysRoleUserDao.getRoleIdListByUserId(userId);
        if (CollectionUtils.isEmpty(userRoleIdList)) {
            return new ArrayList<>();
        }
        // 获取角色列表对应的权限点列表
        return sysRoleAclDao.getAclIdListByRoleIdList(userRoleIdList);
    }

    /**
     * 获取指定角色已选权限列表
     */
    public List<SysAcl> getRoleAclList(int roleId) {
        List<Integer> roleAclIdList = sysRoleAclDao.getAclIdListByRoleId(roleId);
        if (CollectionUtils.isEmpty(roleAclIdList)) {
            return new ArrayList<>();
        }
        return sysAclDao.getByIdList(roleAclIdList);
    }

    /**
     * 获取指定角色已选用户列表
     */
    public List<SysUser> getRoleUserList(int roleId) {
        List<Integer> roleUserIdList = sysRoleUserDao.getUserIdListByRoleId(roleId);
        if (CollectionUtils.isEmpty(roleUserIdList)) {
            return new ArrayList<>();
        }
        return sysUserDao.getByIdList(roleUserIdList);
    }

    /**
     * 获取当前用户所在供应商的部门列表
     */
    public List<SysDept> getCurrentUserDeptList() {
        int supplierId = RequestHolder.getCurrentUser().getSupplierId();
        return sysDeptDao.getBySupplierId(supplierId);
    }

    /**
     * 获取当前用户所在供应商的所有用户
     */
    public List<SysUser> getCurrentSupplierUserList() {
        int supplierId = RequestHolder.getCurrentUser().getSupplierId();
        return sysUserDao.getBySupplierId(supplierId);
    }

    /**
     * 是否有某个url的权限
     */
    public boolean hasUrlAclFromCache(String url) {
        Preconditions.checkNotNull(url, "url不可以为空");
        if (!isAclUseCache()) {
            return hasUrlAcl(url);
        }
        int userId = RequestHolder.getCurrentUser().getId();
        String cacheValue = sysCacheService.getFromCache(CacheKeyConstants.USERID_ACLCODE, String.valueOf(userId), url);
        if (StringUtils.isBlank(cacheValue)) {
            boolean flag = hasUrlAcl(url);
            sysCacheService.saveCache(flag ? HAS_ACL : NO_ACL, aclCacheTime(), CacheKeyConstants.USERID_ACLCODE, String.valueOf(userId), url);
            return flag;
        }
        return cacheValue.equals(HAS_ACL);
    }

    public boolean hasUrlAcl(String url) {
        Preconditions.checkNotNull(url, "url不可以为空");
        if (isRootUser()) {
            return true;
        }
        List<SysAcl> aclList = sysAclDao.getByUrlRegexp(url);
        return hasAclList(aclList, false);
    }

    /**
     * 是否有某个权限点的权限
     *
     * @param code 权限点的code, 唯一
     * @return
     */
    public boolean hasCodeAclFromCache(String code) {
        Preconditions.checkNotNull(code, "code不可以为空");
        if (!isAclUseCache()) {
            return hasCodeAcl(code);
        }
        int userId = RequestHolder.getCurrentUser().getId();
        String cacheValue = sysCacheService.getFromCache(CacheKeyConstants.USERID_ACLCODE, String.valueOf(userId), code);
        if (StringUtils.isBlank(cacheValue)) {
            boolean flag = hasCodeAcl(code);
            sysCacheService.saveCache(flag ? HAS_ACL : NO_ACL, aclCacheTime(), CacheKeyConstants.USERID_ACLCODE, String.valueOf(userId), code);
            return flag;
        }
        return cacheValue.equals(HAS_ACL);
    }

    public boolean hasCodeAcl(String code) {
        Preconditions.checkNotNull(code, "code不可以为空");
        if (isRootUser()) {// 可能会避免不必要的对sys_acl表的查询
            return true;
        }
        SysAcl acl = sysAclDao.findByCode(code);
        return hasAcl(acl, false);
    }

    /**
     * 是否有某个权限点的权限
     *
     * @param id 权限点的id
     * @return
     */
    public boolean hasAcl(int id) {
        if (isRootUser()) {// 可能会避免不必要的对sys_acl表的查询
            return true;
        }
        SysAcl acl = sysAclDao.findById(id);
        return hasAcl(acl, false);
    }

    /**
     * 是否有某个权限点的权限
     *
     * @param acl           权限点
     * @param checkRootUser 是否需要考虑root user
     * @return
     */
    public boolean hasAcl(SysAcl acl, boolean checkRootUser) {
        if (checkRootUser && isRootUser()) {
            return true;
        }
        if (acl == null || acl.getStatus() != Status.AVAILABLE.getCode()) {// 不存在或未生效的,按照有权限处理
            return true;
        }
        List<Integer> aclIdList = getCurrentUserAclIdListFromCache();
        if (CollectionUtils.isEmpty(aclIdList)) {
            return false;
        }
        return Sets.newHashSet(aclIdList).contains(acl.getId());
    }

    /**
     * 是否有权限点列表的权限,只要有一个有权限即可
     * 目前只用于根据url校验的情况,因为一个url可能对应多个权限点
     *
     * @param aclList       权限点列表
     * @param checkRootUser 是否需要考虑root user
     * @return
     */
    public boolean hasAclList(List<SysAcl> aclList, boolean checkRootUser) {
        if (checkRootUser && isRootUser()) {
            return true;
        }
        if (CollectionUtils.isEmpty(aclList)) {// 代表没配置相应的权限
            return true;
        }
        for (SysAcl acl : aclList) {// 遍历列表,挨个判断每个权限点是否有权限
            if (hasAcl(acl, false)) {
                return true;
            }
        }
        return false;
    }

    private boolean isAclUseCache() {
        return GlobalConfig.getStringValue(ACL_USE_CACHE_SWITCH, "false").equals("true");
    }

    private int aclCacheTime() {
        return GlobalConfig.getIntValue(ACL_CACHE_TIME, 600);
    }
}
