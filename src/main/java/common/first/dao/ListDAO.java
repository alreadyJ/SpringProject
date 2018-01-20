package common.first.dao;

import common.pro.dao.AbstDAO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("ListDAO")
public class ListDAO extends AbstDAO {
    public List<Map<String, Object>> selectSales() throws Exception{
        return (List<Map<String, Object>>)selectList("selectSales");
    }
    public List<Map<String, Object>> selectSalesImages(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("selectSalesImages", map);
    }
}
