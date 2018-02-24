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
    public List<Map<String, Object>> selectSaleCategory() throws Exception{
        return (List<Map<String, Object>>)selectList("selectSaleCategory");
    }
    public List<Map<String, Object>> selectSaleImage(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("selectSaleImage", map);
    }
    public List<Map<String, Object>> selectTrip() throws Exception{
        return (List<Map<String, Object>>)selectList("selectTrip");
    }
    public List<Map<String, Object>> selectTripCategory() throws Exception{
        return (List<Map<String, Object>>)selectList("selectTripCategory");
    }
    public List<Map<String, Object>> selectRequest() throws Exception{
        return (List<Map<String, Object>>)selectList("selectRequest");
    }
    public List<Map<String, Object>> selectRequestCategory() throws Exception{
        return (List<Map<String, Object>>)selectList("selectRequestCategory");
    }
    public List<Map<String, Object>> selectRequestImage(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("selectRequestImage", map);
    }
    public Map<String, Object> selectOneSale(Map<String, Object> map) throws Exception {
        return (Map<String, Object>) selectOne("selectOneSale", map);
    }
    public Map<String, Object> selectOneRequest(Map<String, Object> map) throws Exception {
        return (Map<String, Object>) selectOne("selectOneRequest", map);
    }
    public Map<String, Object> selectOneTrip(Map<String, Object> map) throws Exception {
        return (Map<String, Object>) selectOne("selectOneTrip", map);
    }
    public Object insertComment(Map<String, Object> map) throws Exception{
        return insert("insertComment", map);
    }
    public Object deleteComment(Map<String, Object> map) throws Exception{
        return delete("deleteComment", map);
    }

    public List<Map<String, Object>> selectComment(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("selectComment" ,map);
    }
    public Object insertSale(Map<String, Object> map) throws Exception{
        return insert("insertSale", map);
    }
    public Object insertSaleImage(Map<String, Object> map) throws Exception{
        return insert("insertSaleImage", map);
    }
    public Object insertRequest(Map<String, Object> map) throws Exception{
        return insert("insertRequest", map);
    }
    public Object insertRequestImage(Map<String, Object> map) throws Exception{
        return insert("insertRequestImage", map);
    }
    public Object insertTrip(Map<String, Object> map) throws Exception{
        return insert("insertTrip", map);
    }

}
