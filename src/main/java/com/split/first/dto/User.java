package com.split.first.dto;

import lombok.Data;

@Data
public class User {
    int serial;
    String email;
    String password;
    String nickName;
    String phone;
    String profileImage;
    String signUpDate;
    String address;
    String country;
    String description;
}
