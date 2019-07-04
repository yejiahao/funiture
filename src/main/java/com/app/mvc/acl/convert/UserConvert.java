package com.app.mvc.acl.convert;

import com.app.mvc.acl.domain.SysBase;
import com.app.mvc.acl.domain.SysUser;
import com.app.mvc.acl.vo.UserPara;

public class UserConvert {

    public static SysUser of(UserPara para) {

        BaseConvert.checkPara(para);

        SysBase base = BaseConvert.of();

        return SysUser.builder().id(para.getId()).username(para.getUsername()).telephone(para.getTelephone()).mail(para.getMail()).remark(para.getRemark())
                .deptId(para.getDeptId()).status(para.getStatus()).supplierId(para.getSupplierId()).managedSupplierIds(para.getManagedSupplierIds())
                .operator(base.getOperator()).operateIp(base.getOperateIp()).build();
    }
}
