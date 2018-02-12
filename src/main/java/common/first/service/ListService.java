package common.first.service;

import java.util.List;
import java.util.Map;

public interface ListService {
    List<Map<String, Object>> selectSale() throws Exception;
    List<Map<String, Object>> selectSaleCategory() throws Exception;
    List<Map<String, Object>> selectSaleImage(Map<String, Object> map) throws Exception;
    List<Map<String, Object>> selectTrip() throws Exception;
    List<Map<String, Object>> selectTripCategory() throws Exception;
    List<Map<String, Object>> selectRequest() throws Exception;
    List<Map<String, Object>> selectRequestCategory() throws Exception;
    List<Map<String, Object>> selectRequestImage(Map<String, Object> map) throws Exception;
    Map<String, Object> selectOneSale(Map<String, Object> map) throws Exception;
    Map<String, Object> selectOneRequest(Map<String, Object> map) throws Exception;
    Map<String, Object> selectOneTrip(Map<String, Object> map) throws Exception;
    Object insertComment(Map<String, Object> map) throws Exception;
    List<Map<String, Object>> selectComment(Map<String, Object> map) throws Exception;
    Object insertSale(Map<String, Object> map) throws Exception;
    Object insertSaleImage(Map<String, Object> map) throws Exception;
    Object insertRequest(Map<String, Object> map) throws Exception;
    Object insertRequestImage(Map<String, Object> map) throws Exception;
    Object insertTrip(Map<String, Object> map) throws Exception;
}
