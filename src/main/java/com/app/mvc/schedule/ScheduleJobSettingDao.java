package com.app.mvc.schedule;

import com.app.mvc.common.DBRepository;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@DBRepository
public interface ScheduleJobSettingDao {

    void save(ScheduledJobSetting setting);

    void update(ScheduledJobSetting setting);

    List<ScheduledJobSetting> getAll();

    ScheduledJobSetting findById(@Param("id") int id);

    int countByClassPath(@Param("classPath") String classPath);

    List<ScheduledJobSetting> getListByGroupId(@Param("groupId") String groupId);
}