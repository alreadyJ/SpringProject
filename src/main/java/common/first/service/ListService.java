package common.first.service;

import java.util.List;
import java.util.Map;

public interface ListService {
    List<Map<String, Object>> selectSale() throws Exception;
    List<Map<String, Object>> selectSaleImage(Map<String, Object> map) throws Exception;
    List<Map<String, Object>> selectTrip() throws Exception;
    List<Map<String, Object>> selectRequest() throws Exception;
    List<Map<String, Object>> selectRequestImage(Map<String, Object> map) throws Exception;
}
