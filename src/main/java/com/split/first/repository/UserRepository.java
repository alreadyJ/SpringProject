package com.split.first.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by root on 5/12/17.
 */
@Repository("UserRepository")
public class UserRepository {
    @Autowired
    private SqlSession sqlSession;
    public List<Map<String, Object>> selectUserWithSerial(Map<String, Object> map) throws Exception{
        return sqlSession.selectList("selectUserWithSerial", map);
    }
    public List<Map<String, Object>> selectLogin(Map<String, Object> map) throws Exception{
        return sqlSession.selectList("selectLogin", map);
    }
    public List<Map<String, Object>> selectUserExist(Map<String, Object> map) throws Exception{
        return sqlSession.selectList("selectUserExist", map);
    }
    public Object insertUser(Map<String, Object> map) throws Exception{
        return sqlSession.insert("insertUser", map);
    }
    public Object updateUser(Map<String, Object> map) throws Exception {
        return sqlSession.update("updateUser", map);
    }
}

