package com.app.mvc.business.enums;

import lombok.Getter;

@Getter
public enum Sex {

    Male("M"),
    Female("F");

    private String flag;

    Sex(String flag) {
        this.flag = flag;
    }
}
