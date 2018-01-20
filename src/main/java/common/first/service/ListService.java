package common.first.service;

import java.util.List;
import java.util.Map;

public interface ListService {
    List<Map<String, Object>> selectSales() throws Exception;
    List<Map<String, Object>> selectSalesImages(Map<String, Object> map) throws Exception;
}
