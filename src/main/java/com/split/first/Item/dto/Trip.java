package com.split.first.Item.dto;

import com.split.first.session.dto.User;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Trip {

    int serial;
    User user;
    String source;
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
