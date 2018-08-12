package com.split.first.Item.service;

import com.split.first.Item.dto.Request;
import com.split.first.Item.dto.Sale;
import com.split.first.Item.dto.Trip;
import com.split.first.Item.repository.ItemRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ItemService {
    @Resource
    private ItemRepository itemRepository;
    public List<Sale> selectSale()  {
        return itemRepository.selectSale();
    }

    public List<Trip> selectTrip()  {
        return itemRepository.selectTrip();
    }

    public List<Request> selectRequest()  {
        return itemRepository.selectRequest();
    }

    public List<Map<String, Object>> selectSaleCategory()  {
        return itemRepository.selectSaleCategory();
    }

    public List<Map<String, Object>> selectComment(Map<String, Object> map)  {
        return itemRepository.selectComment(map);
    }

    public List<Map<String, Object>> selectTripCategory()  {
        return itemRepository.selectTripCategory();
    }

    public Object insertRequest(Map<String, Object> map)  {
        return itemRepository.insertRequest(map);
    }

    public Object insertRequestImage(Map<String, Object> map)  {
        return itemRepository.insertRequestImage(map);
    }

    public Object insertTrip(Map<String, Object> map)  {
        return itemRepository.insertTrip(map);
    }

    public Object deleteComment(Map<String, Object> map)  {
        return itemRepository.deleteComment(map);
    }

    public Object insertSale(Map<String, Object> map)  {
        return itemRepository.insertSale(map);
    }

    public Object insertSaleImage(Map<String, Object> map)  {
        return itemRepository.insertSaleImage(map);
    }

    public Object insertComment(Map<String, Object> map)  {
        return itemRepository.insertComment(map);
    }

    public List<Map<String, Object>> selectRequestCategory()  {
        return itemRepository.selectRequestCategory();
    }

    public List<Map<String, Object>> selectRequestImage(Map<String, Object> map)  {
        return itemRepository.selectRequestImage(map);
    }

    public Sale selectOneSale(Integer serial)  {
        return itemRepository.selectOneSale(serial);
    }

    public Request selectOneRequest(Integer serial) {
        return itemRepository.selectOneRequest(serial);
    }

    public Trip selectOneTrip(Integer serial)  {
        return itemRepository.selectOneTrip(serial);
    }


}
