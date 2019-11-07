package com.app.mvc.acl.service;

import com.app.mvc.acl.convert.BaseConvert;
import com.app.mvc.acl.dao.SysRoleUserDao;
import com.app.mvc.acl.dao.SysUserDao;
import com.app.mvc.acl.domain.SysBase;
import com.app.mvc.acl.domain.SysRoleUser;
import com.app.mvc.acl.domain.SysUser;
import com.google.common.collect.Sets;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class SysRoleUserService implements SysService {

    @Resource
    private SysRoleUserDao sysRoleUserDao;
    @Resource
    private SysUserDao sysUserDao;
    @Resource
    private SysLogService sysLogService;

    /**
     * 更新角色-用户关系
     */
    public void changeRoleUsers(int roleId, List<Integer> userIdList) {
        List<Integer> originUserIdList = sysRoleUserDao.getUserIdListByRoleId(roleId);
        if (originUserIdList.size() == userIdList.size()) {// 如果调整后的长度和调整前的长度相同，检查一下是否没有调整直接做更新，这时不做更新
            Set<Integer> originUserIdSet = Sets.newHashSet(originUserIdList);
            Set<Integer> userIdSet = Sets.newHashSet(userIdList);
            originUserIdSet.removeAll(userIdSet);
            if (CollectionUtils.isEmpty(originUserIdSet)) {// 说明修改前后是一样的，那就不进行操作了
                return;
            }
        }
        updateRoleUsers(roleId, userIdList);
        sysLogService.saveRoleUserLog(roleId, originUserIdList, userIdList);
    }

    @Transactional
    private void updateRoleUsers(int roleId, List<Integer> userIdList) {
        // 删除旧的
        sysRoleUserDao.deleteByRoleId(roleId);

        // 组装新的
        if (CollectionUtils.isEmpty(userIdList)) {
            return;
        }
        SysBase base = BaseConvert.of();
        List<SysRoleUser> roleUserList = new ArrayList<>();
        for (Integer userId : userIdList) {
            roleUserList.add(SysRoleUser.builder().roleId(roleId).userId(userId).operator(base.getOperator()).operateIp(base.getOperateIp()).build());
        }

        // 添加新的
        sysRoleUserDao.batchInsert(roleUserList);
    }

    public List<SysUser> getListByRoleId(int roleId) {
        List<Integer> userIdList = sysRoleUserDao.getUserIdListByRoleId(roleId);
        if (CollectionUtils.isEmpty(userIdList)) {
            return new ArrayList<>();
        }
        return sysUserDao.getByIdList(userIdList);
    }

    @Override
    public void recover(int targetId, Object o) {
        List<Integer> userIdList = (List<Integer>) o;
        changeRoleUsers(targetId, userIdList);
    }
}