package com.split.first.session.service;

import com.split.first.session.dto.User;
import com.split.first.session.repository.UserRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class UserService {
    @Resource(name="UserRepository")
    private UserRepository userRepository;

    public Object updateUser(Map<String, Object> map)  {
        return userRepository.updateUser(map);
    }

    public boolean isDuplicatedEmail(String email)  {
        return (userRepository.isDuplicatedEmail(email) > 0);
    }

    public int insertUser(User user)  {
        return userRepository.insertUser(user);
    }

    public User login(User user)  {
        return userRepository.login(user);
    }
}
