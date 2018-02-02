package common.first.service;

import common.first.dao.ListDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("ListService")
public class ListServiceImpl implements ListService {
    @Resource(name="ListDAO")
    private ListDAO listDAO;
    @Override
    public List<Map<String, Object>> selectSale() throws Exception{
        return listDAO.selectSale();
    }
    @Override
    public List<Map<String, Object>> selectSaleImage(Map<String, Object> map) throws Exception {
        return listDAO.selectSaleImage(map);
    }

    @Override
    public List<Map<String, Object>> selectTrip() throws Exception {
        return listDAO.selectTrip();
    }

    @Override
    public List<Map<String, Object>> selectRequest() throws Exception {
        return listDAO.selectRequest();
    }

    @Override
    public List<Map<String, Object>> selectRequestImage(Map<String, Object> map) throws Exception {
        return listDAO.selectRequestImage(map);
    }

    @Override
    public Map<String, Object> selectOneRequest(Map<String, Object> map) throws Exception {
        return listDAO.selectOneRequest(map);
    }

    @Override
    public Map<String, Object> selectOneTrip(Map<String, Object> map) throws Exception {
        return listDAO.selectOneTrip(map);
    }

    @Override
    public Map<String, Object> selectOneSale(Map<String, Object> map) throws Exception {
        return listDAO.selectOneSale(map);
    }
}
