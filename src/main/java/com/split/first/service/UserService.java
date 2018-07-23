package com.split.first.service;

import com.split.first.repository.UserRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Resource(name="UserRepository")
    private UserRepository userRepository;

    public Object updateUser(Map<String, Object> map) throws Exception {
        return userRepository.updateUser(map);
    }

    public List<Map<String, Object>> selectUserWithSerial(Map<String, Object> map) throws Exception {
        return userRepository.selectUserWithSerial(map);
    }

    public List<Map<String, Object>> selectUserExist(Map<String, Object> map) throws Exception {
        return userRepository.selectUserExist(map);
    }

    public Object insertUser(Map<String, Object> map) throws Exception {
        return userRepository.insertUser(map);
    }

    public List<Map<String, Object>> selectLogin(Map<String, Object> map) throws Exception {
        return userRepository.selectLogin(map);
    }
}
