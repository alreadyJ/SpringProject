package common.first.dao;
import common.pro.dao.AbstDAO;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

/**
 * Created by root on 5/12/17.
 */
@Repository("SqlDAO")
public class SqlDAO extends AbstDAO {
    public List<Map<String, Object>> selectMember(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("user.selectMember", map);
    }
    public Object insertUser(Map<String, Object> map) throws Exception{
        return insert("user.insertUser", map);
    }
}

