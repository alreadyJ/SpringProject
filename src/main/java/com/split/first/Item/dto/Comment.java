package com.split.first.Item.dto;

import com.split.first.session.dto.User;
import lombok.Data;

@Data
public class Comment {

    int serial;
    User user;
    String registeredDate;
    String text;

}
