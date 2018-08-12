package com.split.first.session.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class User {

    int serial;
    String email;
    String password;
    String nickName;
    String phone;
    String profileImage;
    LocalDate signUpDate;
    String address;
    String country;
    String description;

}
