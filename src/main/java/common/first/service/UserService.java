package common.first.service;

import java.util.List;
import java.util.Map;

public interface UserService {
    List<Map<String, Object>> selectUserWithSerial(Map<String, Object> map) throws Exception;
    List<Map<String, Object>> selectUserExist(Map<String, Object> map) throws Exception;
    List<Map<String, Object>> selectLogin(Map<String, Object> map) throws Exception;
    Object insertUser(Map<String, Object> map) throws Exception;
    Object updateUser(Map<String, Object> map) throws Exception;
}
