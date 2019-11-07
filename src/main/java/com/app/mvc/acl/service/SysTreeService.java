package com.app.mvc.acl.service;

import com.app.mvc.acl.dao.SysAclDao;
import com.app.mvc.acl.dao.SysAclModuleDao;
import com.app.mvc.acl.domain.SysAcl;
import com.app.mvc.acl.domain.SysAclModule;
import com.app.mvc.acl.domain.SysDept;
import com.app.mvc.acl.domain.SysUser;
import com.app.mvc.acl.dto.AclDto;
import com.app.mvc.acl.dto.AclModuleLevelDto;
import com.app.mvc.acl.dto.DeptLevelDto;
import com.app.mvc.acl.enums.Status;
import com.app.mvc.acl.util.LevelUtil;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import com.google.common.collect.Sets;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class SysTreeService {

    @Resource
    private SysAclModuleDao sysAclModuleDao;
    @Resource
    private SysAclDao sysAclDao;
    @Resource
    private SysCoreService sysCoreService;

    /**
     * 全部权限点及权限模块组成的权限树
     */
    public List<AclModuleLevelDto> aclTree() {
        List<SysAcl> list = sysAclDao.getAll();
        List<AclDto> aclDtoList = new ArrayList<>();
        for (SysAcl acl : list) {
            aclDtoList.add(AclDto.adapt(acl));
        }
        return aclListToTree(aclDtoList);
    }

    /**
     * 权限模块组成的权限树
     */
    public List<AclModuleLevelDto> aclModuleTree() {
        List<SysAclModule> list = sysAclModuleDao.getAll();
        List<AclModuleLevelDto> dtoList = new ArrayList<>();
        for (SysAclModule aclModule : list) {
            dtoList.add(AclModuleLevelDto.adapt(aclModule));
        }
        return aclModuleListToTree(dtoList);
    }

    /**
     * 角色相关的权限树
     */
    public List<AclModuleLevelDto> roleTree(int roleId) {
        List<SysAcl> userAclList = sysCoreService.getCurrentUserAclList();
        List<SysAcl> roleAclList = sysCoreService.getRoleAclList(roleId);

        Set<Integer> userAclIdSet = Sets.newHashSet(userAclList.size());
        Set<Integer> roleAclIdSet = Sets.newHashSet(roleAclList.size());
        for (SysAcl acl : userAclList) {
            userAclIdSet.add(acl.getId());
        }
        for (SysAcl acl : roleAclList) {
            roleAclIdSet.add(acl.getId());
        }

        // 求二者并集
        Set<SysAcl> aclSet = new HashSet<>(roleAclList);
        aclSet.addAll(userAclList);

        List<AclDto> aclDtoList = new ArrayList<>();
        for (SysAcl acl : aclSet) {
            AclDto dto = AclDto.adapt(acl);
            // 标记用户可操作的权限
            if (userAclIdSet.contains(acl.getId())) {
                dto.setHasAcl(true);
            }
            // 标记该角色已选中的权限
            if (roleAclIdSet.contains(acl.getId())) {
                dto.setChecked(true);
            }
            aclDtoList.add(dto);
        }

        return aclListToTree(aclDtoList);
    }

    /**
     * 当前用户所在供应商的部门树
     */
    public List<DeptLevelDto> deptTree() {
        List<SysDept> deptList = sysCoreService.getCurrentUserDeptList();
        if (CollectionUtils.isEmpty(deptList)) {
            return new ArrayList<>();
        }
        List<DeptLevelDto> dtoList = new ArrayList<>();
        for (SysDept dept : deptList) {
            dtoList.add(DeptLevelDto.adapt(dept));
        }
        return deptListToTree(dtoList);
    }

    /**
     * 当前用户所在供应商的部门和用户组成的部门树
     */
    public List<DeptLevelDto> userTree() {
        // 获取用户列表
        List<SysUser> userList = sysCoreService.getCurrentSupplierUserList();
        if (CollectionUtils.isEmpty(userList)) {
            return new ArrayList<>();
        }
        // 做成部门树
        return userListToTree(userList);
    }

    /**
     * 指定角色未选中的用户列表
     */
    public List<DeptLevelDto> unselectUserRoleTree(int roleId) {
        // 获取用户列表
        List<SysUser> supplierUserList = sysCoreService.getCurrentSupplierUserList();
        List<SysUser> roleUserList = sysCoreService.getRoleUserList(roleId);
        supplierUserList.removeAll(roleUserList);
        // 做成部门树
        return userListToTree(supplierUserList);
    }

    /**
     * 根据权限点列表计算出对应的整个权限树
     */
    public List<AclModuleLevelDto> aclListToTree(List<AclDto> aclList) {
        if (CollectionUtils.isEmpty(aclList)) {
            return new ArrayList<>();
        }
        // 做成权限树
        List<AclModuleLevelDto> aclModuleLevelList = aclModuleTree();

        // aclModuleId -> [acl1, acl2, ...]
        Multimap<Integer, AclDto> moduleIdAclMap = ArrayListMultimap.create();
        for (SysAcl acl : aclList) {
            if (acl.getStatus() == Status.AVAILABLE.getCode()) {
                moduleIdAclMap.put(acl.getAclModuleId(), AclDto.adapt(acl));
            }
        }
        // 将权限点绑定到权树上
        bindAclsWithOrder(aclModuleLevelList, moduleIdAclMap);

        return aclModuleLevelList;
    }

    /**
     * 将权限模块列表转换为权限树
     */
    public List<AclModuleLevelDto> aclModuleListToTree(List<AclModuleLevelDto> aclModuleList) {
        if (CollectionUtils.isEmpty(aclModuleList)) {
            return new ArrayList<>();
        }
        // level -> [aclModule1, aclModule2, ...]
        Multimap<String, AclModuleLevelDto> levelModuleMap = ArrayListMultimap.create();
        List<AclModuleLevelDto> rootList = new ArrayList<>();

        for (AclModuleLevelDto dto : aclModuleList) {
            levelModuleMap.put(dto.getLevel(), dto);
            if (LevelUtil.ROOT.equals(dto.getLevel())) {
                rootList.add(dto);
            }
        }
        // 按seq从小到大排序
        Collections.sort(rootList, aclModuleSeqComparator);
        // 转换成树形结构
        transformAclTree(rootList, LevelUtil.ROOT, levelModuleMap);

        return rootList;
    }

    /**
     * 将部门列表转换为部门树
     */
    public List<DeptLevelDto> deptListToTree(List<DeptLevelDto> deptLevelList) {
        if (CollectionUtils.isEmpty(deptLevelList)) {
            return new ArrayList<>();
        }
        // level -> [dept1, dept2, ...]
        Multimap<String, DeptLevelDto> levelDeptMap = ArrayListMultimap.create();
        List<DeptLevelDto> rootList = new ArrayList<>();

        for (DeptLevelDto dto : deptLevelList) {
            levelDeptMap.put(dto.getLevel(), dto);
            if (LevelUtil.ROOT.equals(dto.getLevel())) {
                rootList.add(dto);
            }
        }
        // 按seq从小到大排序
        Collections.sort(rootList, new Comparator<DeptLevelDto>() {
            @Override
            public int compare(DeptLevelDto o1, DeptLevelDto o2) {
                return o1.getSeq() - o2.getSeq();
            }
        });
        // 转换成树形结构
        transformDeptTree(deptLevelList, LevelUtil.ROOT, levelDeptMap);

        return rootList;
    }

    public List<DeptLevelDto> userListToTree(List<SysUser> userList) {
        if (CollectionUtils.isEmpty(userList)) {
            return new ArrayList<>();
        }
        // 做成部门树
        List<DeptLevelDto> deptLevelList = deptTree();
        // deptId -> [user1, user2, ...]
        Multimap<Integer, SysUser> deptIdUserMap = ArrayListMultimap.create();
        for (SysUser user : userList) {
            deptIdUserMap.put(user.getDeptId(), user);
        }
        // 将用户绑定到部门上
        bindUserWithOrder(deptLevelList, deptIdUserMap);

        return deptLevelList;
    }

    /**
     * 递归处理权限树的每一层
     */
    private void transformAclTree(List<AclModuleLevelDto> dtoList, String level, Multimap<String, AclModuleLevelDto> levelModuleMap) {
        for (int i = 0; i < dtoList.size(); i++) {
            // 遍历该层的每个元素
            AclModuleLevelDto aclModuleLevel = dtoList.get(i);
            // 当前处理的层级值
            String nextLevel = LevelUtil.calculateLevel(level, aclModuleLevel.getId());
            // 取出下一层的列表
            List<AclModuleLevelDto> tempModuleList = (List<AclModuleLevelDto>) levelModuleMap.get(nextLevel);
            if (CollectionUtils.isNotEmpty(tempModuleList)) {
                // 排序
                Collections.sort(tempModuleList, aclModuleSeqComparator);
                // 设置
                aclModuleLevel.setAclModuleList(tempModuleList);
                // 进入下一层进行处理
                transformAclTree(tempModuleList, nextLevel, levelModuleMap);
            }
        }
    }

    /**
     * 递归处理部门树的每一层
     */
    private void transformDeptTree(List<DeptLevelDto> dtoList, String level, Multimap<String, DeptLevelDto> levelDeptMap) {
        for (int i = 0; i < dtoList.size(); i++) {
            // 遍历该层的每个元素
            DeptLevelDto deptLevelDto = dtoList.get(i);
            // 当前处理的层级值
            String nextLevel = LevelUtil.calculateLevel(level, deptLevelDto.getId());
            // 取出下一层的列表
            List<DeptLevelDto> tempDeptList = (List<DeptLevelDto>) levelDeptMap.get(nextLevel);
            if (CollectionUtils.isNotEmpty(tempDeptList)) {
                // 排序
                Collections.sort(tempDeptList, deptSeqComparator);
                // 设置
                deptLevelDto.setDeptList(tempDeptList);
                // 进入下一层进行处理
                transformDeptTree(tempDeptList, nextLevel, levelDeptMap);
            }
        }
    }

    /**
     * 递归将权限点放到对应的权限模块下面,同时保证权限点有序
     */
    private void bindAclsWithOrder(List<AclModuleLevelDto> aclModuleLevelList, Multimap<Integer, AclDto> moduleIdAclMap) {
        if (CollectionUtils.isEmpty(aclModuleLevelList)) {
            return;
        }
        for (AclModuleLevelDto dto : aclModuleLevelList) {
            // 取出权限点列表
            List<AclDto> aclDtoList = (List<AclDto>) moduleIdAclMap.get(dto.getId());
            if (CollectionUtils.isNotEmpty(aclDtoList)) {
                // 按seq升序排序
                Collections.sort(aclDtoList, aclTypeComparator);
                // 把排序后的权限点列表绑定到权限模块上
                dto.setAclList(aclDtoList);
            }
            // 进入下层模块绑定权限点
            bindAclsWithOrder(dto.getAclModuleList(), moduleIdAclMap);
        }
    }

    /**
     * 递归将用户放到对应的部门下面,同时保证用户有序
     */
    private void bindUserWithOrder(List<DeptLevelDto> deptList, Multimap<Integer, SysUser> deptIdUserMap) {
        if (CollectionUtils.isEmpty(deptList)) {
            return;
        }
        for (DeptLevelDto dto : deptList) {
            // 取出用户列表
            List<SysUser> userList = (List<SysUser>) deptIdUserMap.get(dto.getId());
            if (CollectionUtils.isNotEmpty(userList)) {
                // 按seq升序排序
                Collections.sort(userList, usernameComparator);
                // 把排序后的用户列表绑定到部门上
                dto.setUserList(userList);
            }
            // 进入下层模块绑定用户
            bindUserWithOrder(dto.getDeptList(), deptIdUserMap);
        }
    }

    public Comparator<AclDto> aclSeqComparator = new Comparator<AclDto>() {
        @Override
        public int compare(AclDto o1, AclDto o2) {
            return o1.getSeq() - o2.getSeq();
        }
    };
    public Comparator<AclDto> aclTypeComparator = new Comparator<AclDto>() {
        @Override
        public int compare(AclDto o1, AclDto o2) {
            return o1.getType() - o2.getType();
        }
    };

    public Comparator<AclModuleLevelDto> aclModuleSeqComparator = new Comparator<AclModuleLevelDto>() {
        @Override
        public int compare(AclModuleLevelDto o1, AclModuleLevelDto o2) {
            return o1.getSeq() - o2.getSeq();
        }
    };

    public Comparator<DeptLevelDto> deptSeqComparator = new Comparator<DeptLevelDto>() {
        @Override
        public int compare(DeptLevelDto o1, DeptLevelDto o2) {
            return o1.getSeq() - o2.getSeq();
        }
    };

    public Comparator<SysUser> usernameComparator = new Comparator<SysUser>() {
        @Override
        public int compare(SysUser o1, SysUser o2) {
            return o1.getUsername().compareTo(o2.getUsername());
        }
    };
}
