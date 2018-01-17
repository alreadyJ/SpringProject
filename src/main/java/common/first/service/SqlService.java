package common.first.service;

import java.util.List;
import java.util.Map;

public interface SqlService {
    List<Map<String, Object>> selectMember(Map<String, Object> map) throws Exception;
    Object insertUser(Map<String, Object> map) throws Exception;
}
