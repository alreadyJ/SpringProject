package com.split.first.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Getter @Setter
public class Request {
    int serial;
    User user;
    String title;
    String category;
    String detail;
    String location;
    LocalDateTime registeredDate;
    LocalDateTime expiration;
    int quantity;
    int price;
    int serviceFee;
    int status;
    List<Image> requestImage;
}
