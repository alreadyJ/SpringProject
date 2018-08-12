package com.split.first.session.repository;

import com.split.first.session.dto.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by root on 5/12/17.
 */
@Repository("UserRepository")
public class UserRepository {
    @Autowired
    private SqlSession sqlSession;

    public User login(User user) {
        return sqlSession.selectOne("selectLogin", user);
    }

    public int isDuplicatedEmail(String email) {
        return sqlSession.selectOne("selectUserExist", email);
    }

    public int insertUser(User user) {
        return sqlSession.insert("insertUser", user);
    }

    public Object updateUser(Map<String, Object> map)  {
        return sqlSession.update("updateUser", map);
    }
}

