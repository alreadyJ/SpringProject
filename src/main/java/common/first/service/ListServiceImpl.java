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
    public List<Map<String, Object>> selectSaleCategory() throws Exception {
        return listDAO.selectSaleCategory();
    }

    @Override
    public List<Map<String, Object>> selectComment(Map<String, Object> map) throws Exception {
        return listDAO.selectComment(map);
    }

    @Override
    public List<Map<String, Object>> selectTripCategory() throws Exception {
        return listDAO.selectTripCategory();
    }

    @Override
    public Object insertRequest(Map<String, Object> map) throws Exception {
        return listDAO.insertRequest(map);
    }

    @Override
    public Object insertRequestImage(Map<String, Object> map) throws Exception {
        return listDAO.insertRequestImage(map);
    }

    @Override
    public Object insertTrip(Map<String, Object> map) throws Exception {
        return listDAO.insertTrip(map);
    }

    @Override
    public Object deleteComment(Map<String, Object> map) throws Exception {
        return listDAO.deleteComment(map);
    }

    @Override
    public Object insertSale(Map<String, Object> map) throws Exception {
        return listDAO.insertSale(map);
    }

    @Override
    public Object insertSaleImage(Map<String, Object> map) throws Exception {
        return listDAO.insertSaleImage(map);
    }

    @Override
    public Object insertComment(Map<String, Object> map) throws Exception {
        return listDAO.insertComment(map);
    }

    @Override
    public List<Map<String, Object>> selectRequestCategory() throws Exception {
        return listDAO.selectRequestCategory();
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
