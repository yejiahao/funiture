package com.app.mvc.business.dao;

import com.app.mvc.business.domain.Test;
import com.app.mvc.common.DBRepository;

@DBRepository
public interface TestDao {

    void save(Test test);
}