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
    public List<Map<String, Object>> selectSales() throws Exception{
        return listDAO.selectSales();
    }
    @Override
    public List<Map<String, Object>> selectSalesImages(Map<String, Object> map) throws Exception {
        return listDAO.selectSalesImages(map);
    }
}
