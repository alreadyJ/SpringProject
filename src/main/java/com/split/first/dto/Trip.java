package com.split.first.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Trip {

    int serial;
    User user;
    String source;
    String category;
    String destination;
    int isRound;
    String purpose;
    LocalDateTime departureDate;
    LocalDateTime arrivalDate;
    LocalDateTime registeredDate;
    String schedule;
    String location;
    int status;

}
