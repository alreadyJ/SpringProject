package com.split.first.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.joda.time.DateTime;

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
    DateTime registeredDate;
    DateTime expiration;
    int remain_quantity;
    int quantity;
    int price;
    int status;
    List<SaleImage> saleImage;
}
