package com.split.first.dto;

import lombok.Data;

@Data
public class Comment {

    int serial;
    User user;
    String registeredDate;
    String text;

}
