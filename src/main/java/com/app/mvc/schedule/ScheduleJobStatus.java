package com.app.mvc.schedule;

import lombok.Getter;

@Getter
public enum ScheduleJobStatus {

    INIT(-1, "未开始过"),
    STARTED(1, "运行中"),
    STOPPED(0, "暂停");

    private int code;
    private String desc;

    ScheduleJobStatus(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }
}