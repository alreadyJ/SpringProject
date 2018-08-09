package com.split.first.repository;

import com.split.first.dto.Request;
import com.split.first.dto.Sale;
import com.split.first.dto.Trip;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ListRepository {
    @Autowired
    private SqlSession sqlSession;
    
    public List<Sale> selectSale() {
        return sqlSession.selectList("selectSalesAndUser");
    }

    public List<Map<String, Object>> selectSaleCategory() {
        return sqlSession.selectList("selectSaleCategory");
    }

    public List<Trip> selectTrip() {
        return sqlSession.selectList("selectTripAndUser");
    }

    public List<Map<String, Object>> selectTripCategory() {
        return sqlSession.selectList("selectTripCategory");
    }

    public List<Request> selectRequest() {
        return sqlSession.selectList("selectRequestsAndUser");
    }

    public List<Map<String, Object>> selectRequestCategory() {
        return sqlSession.selectList("selectRequestCategory");
    }

    public List<Map<String, Object>> selectRequestImage(Map<String, Object> map) {
        return sqlSession.selectList("selectRequestImage", map);
    }

    public Map<String, Object> selectOneSale(Map<String, Object> map) {
        return sqlSession.selectOne("selectOneSale", map);
    }

    public Map<String, Object> selectOneRequest(Map<String, Object> map) {
        return sqlSession.selectOne("selectOneRequest", map);
    }

    public Map<String, Object> selectOneTrip(Map<String, Object> map) {
        return sqlSession.selectOne("selectOneTrip", map);
    }

    public Object insertComment(Map<String, Object> map) {
        return sqlSession.insert("insertComment", map);
    }

    public Object deleteComment(Map<String, Object> map) {
        return sqlSession.delete("deleteComment", map);
    }

    public List<Map<String, Object>> selectComment(Map<String, Object> map) {
        return sqlSession.selectList("selectComment" ,map);
    }

    public Object insertSale(Map<String, Object> map) {
        return sqlSession.insert("insertSale", map);
    }

    public Object insertSaleImage(Map<String, Object> map) {
        return sqlSession.insert("insertSaleImage", map);
    }

    public Object insertRequest(Map<String, Object> map) {
        return sqlSession.insert("insertRequest", map);
    }

    public Object insertRequestImage(Map<String, Object> map) {
        return sqlSession.insert("insertRequestImage", map);
    }

    public Object insertTrip(Map<String, Object> map) {
        return sqlSession.insert("insertTrip", map);
    }
}
