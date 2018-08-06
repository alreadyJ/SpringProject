package com.split.first.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class User {
    int serial;
    String email;
    String password;
    String nickName;
    String phone;
    String profileImage;
    LocalDateTime signUpDate;
    String address;
    String country;
    String description;
}
