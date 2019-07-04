package com.app.mvc.acl.dto;

import com.app.mvc.acl.domain.SysDept;
import com.app.mvc.acl.domain.SysUser;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
public class DeptLevelDto extends SysDept {
    /**
     * 组装部门层级使用
     */
    private List<DeptLevelDto> deptList = new ArrayList<>();
    /**
     * 组装部门层级下用户列表
     */
    private List<SysUser> userList = new ArrayList<>();

    public static DeptLevelDto adapt(SysDept dept) {
        DeptLevelDto dto = new DeptLevelDto();
        BeanUtils.copyProperties(dept, dto);
        return dto;
    }
}