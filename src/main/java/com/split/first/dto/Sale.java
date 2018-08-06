package com.split.first.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Getter @Setter
public class Sale {
    int serial;
    User user;
    String title;
    String category;
    String detail;
    String location;
    LocalDateTime registeredDate;
    LocalDateTime expiration;
    int quantity;
    int remainQuantity;
    int maxPurchase;
    int price;
    int status;
    List<Image> saleImage;
}
