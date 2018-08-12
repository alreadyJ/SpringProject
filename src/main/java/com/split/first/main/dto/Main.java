package com.split.first.main.dto;

import com.split.first.Item.dto.Request;
import com.split.first.Item.dto.Sale;
import com.split.first.Item.dto.Trip;
import lombok.Data;

import java.util.List;

@Data
public class Main {
    List<Sale> saleList;
    List<Trip> tripList;
    List<Request> requestList;

    public Main(){}
    public Main(List<Sale> saleList, List<Trip> tripList, List<Request> requestList) {
        this.saleList = saleList;
        this.tripList = tripList;
        this.requestList = requestList;
    }
}
