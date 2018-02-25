package common.first.service;

import common.first.dao.UserDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("UserService")
public class UserServiceImpl implements UserService {
    @Resource(name="UserDAO")
    private UserDAO userDAO;

    @Override
    public Object updateUser(Map<String, Object> map) throws Exception {
        return userDAO.updateUser(map);
    }

    @Override
    public List<Map<String, Object>> selectUserWithSerial(Map<String, Object> map) throws Exception {
        return userDAO.selectUserWithSerial(map);
    }

    @Override
    public List<Map<String, Object>> selectUserExist(Map<String, Object> map) throws Exception {
        return userDAO.selectUserExist(map);
    }

    @Override
    public Object insertUser(Map<String, Object> map) throws Exception {
        return userDAO.insertUser(map);
    }

    @Override
    public List<Map<String, Object>> selectLogin(Map<String, Object> map) throws Exception {
        return userDAO.selectLogin(map);
    }
}
