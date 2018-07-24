package com.split.first.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Data
@Getter @Setter
public class Sale {
    int serial;
    int user;
    String title;
    String category;
    String detail;
    String location;
    String registeredDate;
    String expiration;
    int quantity;
    int remainQuantity;
    int maxPurchase;
    int price;
    int status;
    List<SaleImage> saleImage;
}
