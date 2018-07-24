package com.split.first.dto;

import lombok.Data;

@Data
public class Trip {
    int serial;
    int userNo;
    String source;
    String category;
    String destination;
    int isRound;
    String purpose;
    String departureDate;
    String arrivalDate;
    String registeredDate;
    String schedule;
    String location;
    int status;
    User user;
}
