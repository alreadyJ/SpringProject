package com.split.first.service;

import com.split.first.dto.Request;
import com.split.first.dto.Sale;
import com.split.first.dto.Trip;
import com.split.first.repository.ListRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ListService {
    @Resource
    private ListRepository listRepository;
    public List<Sale> selectSale() throws Exception {
        return listRepository.selectSale();
    }

    public List<Trip> selectTrip() throws Exception {
        return listRepository.selectTrip();
    }

    public List<Request> selectRequest() throws Exception {
        return listRepository.selectRequest();
    }

    public List<Map<String, Object>> selectSaleCategory() throws Exception {
        return listRepository.selectSaleCategory();
    }

    public List<Map<String, Object>> selectComment(Map<String, Object> map) throws Exception {
        return listRepository.selectComment(map);
    }

    public List<Map<String, Object>> selectTripCategory() throws Exception {
        return listRepository.selectTripCategory();
    }

    public Object insertRequest(Map<String, Object> map) throws Exception {
        return listRepository.insertRequest(map);
    }

    public Object insertRequestImage(Map<String, Object> map) throws Exception {
        return listRepository.insertRequestImage(map);
    }

    public Object insertTrip(Map<String, Object> map) throws Exception {
        return listRepository.insertTrip(map);
    }

    public Object deleteComment(Map<String, Object> map) throws Exception {
        return listRepository.deleteComment(map);
    }

    public Object insertSale(Map<String, Object> map) throws Exception {
        return listRepository.insertSale(map);
    }

    public Object insertSaleImage(Map<String, Object> map) throws Exception {
        return listRepository.insertSaleImage(map);
    }

    public Object insertComment(Map<String, Object> map) throws Exception {
        return listRepository.insertComment(map);
    }

    public List<Map<String, Object>> selectRequestCategory() throws Exception {
        return listRepository.selectRequestCategory();
    }

    public List<Map<String, Object>> selectRequestImage(Map<String, Object> map) throws Exception {
        return listRepository.selectRequestImage(map);
    }

    public Map<String, Object> selectOneRequest(Map<String, Object> map) throws Exception {
        return listRepository.selectOneRequest(map);
    }

    public Map<String, Object> selectOneTrip(Map<String, Object> map) throws Exception {
        return listRepository.selectOneTrip(map);
    }

    public Map<String, Object> selectOneSale(Map<String, Object> map) throws Exception {
        return listRepository.selectOneSale(map);
    }
}
