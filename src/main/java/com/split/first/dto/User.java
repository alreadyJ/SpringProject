package com.split.first.dto;

import lombok.Data;
import org.joda.time.DateTime;

@Data
public class User {
    int serial;
    String email;
    String password;
    String nickName;
    String phone;
    String profileImage;
    DateTime signUpDate;
    String address;
    String country;
    String description;
}
