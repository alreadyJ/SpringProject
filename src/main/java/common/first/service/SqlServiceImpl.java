package common.first.service;

import common.first.dao.SqlDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("SqlService")
public class SqlServiceImpl implements SqlService {
    @Resource(name="SqlDAO")
    private SqlDAO sqlDAO;

    @Override
    public List<Map<String, Object>> selectMember(Map<String, Object> map) throws Exception {
        return sqlDAO.selectMember(map);
    }

    @Override
    public Object insertUser(Map<String, Object> map) throws Exception {
        return sqlDAO.insertUser(map);
    }
}
