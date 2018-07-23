package com.split.first.dto;

import lombok.Data;
import org.joda.time.DateTime;

@Data
public class Trip {
    int serial;
    int userNo;
    String source;
    String category;
    String destination;
    int isRound;
    String purpose;
    DateTime departureDate;
    DateTime arrivalDate;
    DateTime registeredDate;
    String schedule;
    String location;
    int status;
    User user;
}
