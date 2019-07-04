package com.app.mvc.beans;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
@Builder
public class PageResult<T> {

    private List<T> data = new ArrayList<>();

    private int total = 0;
}
