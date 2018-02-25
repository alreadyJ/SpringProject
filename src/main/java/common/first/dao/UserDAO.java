package common.first.dao;
import common.pro.dao.AbstDAO;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

/**
 * Created by root on 5/12/17.
 */
@Repository("UserDAO")
public class UserDAO extends AbstDAO {
    public List<Map<String, Object>> selectUserWithSerial(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("selectUserWithSerial", map);
    }
    public List<Map<String, Object>> selectLogin(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("selectLogin", map);
    }
    public List<Map<String, Object>> selectUserExist(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("selectUserExist", map);
    }
    public Object insertUser(Map<String, Object> map) throws Exception{
        return insert("insertUser", map);
    }
    public Object updateUser(Map<String, Object> map) throws Exception {
        return update("updateUser", map);
    }
}

