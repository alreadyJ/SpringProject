package com.split.first.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Comment {
    int serial;
    User user;
    String registeredDate;
    String text;
}
