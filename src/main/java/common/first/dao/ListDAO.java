package common.first.dao;

import common.pro.dao.AbstDAO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("ListDAO")
public class ListDAO extends AbstDAO {
    public List<Map<String, Object>> selectSale() throws Exception{
        return (List<Map<String, Object>>)selectList("selectSale");
    }
    public List<Map<String, Object>> selectSaleImage(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("selectSaleImage", map);
    }
    public List<Map<String, Object>> selectTrip() throws Exception{
        return (List<Map<String, Object>>)selectList("selectTrip");
    }
    public List<Map<String, Object>> selectRequest() throws Exception{
        return (List<Map<String, Object>>)selectList("selectRequest");
    }
    public List<Map<String, Object>> selectRequestImage(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("selectRequestImage", map);
    }
}
