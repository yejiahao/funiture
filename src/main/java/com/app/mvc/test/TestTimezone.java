package com.app.mvc.test;

import java.util.TimeZone;

public class TestTimezone {

    public static void main(String[] args) {
        String[] s = TimeZone.getAvailableIDs();
        for (String timezoneId : s) {
            TimeZone timeZone = TimeZone.getTimeZone(timezoneId);
            System.out.println(timezoneId + "\t" + timeZone.getDisplayName());
        }
    }
}