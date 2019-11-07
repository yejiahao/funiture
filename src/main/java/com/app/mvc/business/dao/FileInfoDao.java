package com.app.mvc.business.dao;

import com.app.mvc.business.domain.FileInfo;
import com.app.mvc.common.DBRepository;
import org.apache.ibatis.annotations.Param;

@DBRepository
public interface FileInfoDao {

    FileInfo findByMD5(@Param("md5") String md5);

    FileInfo findById(@Param("id") int id);

    void insert(FileInfo fileInfo);
}