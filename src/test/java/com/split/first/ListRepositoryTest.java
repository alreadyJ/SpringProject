package com.split.first;

import com.split.first.dto.Request;
import com.split.first.dto.Sale;
import com.split.first.dto.Trip;
import com.split.first.repository.ListRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-test-bean.xml",
                                    "classpath:spring/applicationContext-database.xml"})
public class ListRepositoryTest {

    @Autowired
    private ApplicationContext context;

    @Autowired
    private ListRepository listRepository;

    @Test
    public void listTest() {
        List<Sale> saleList = listRepository.selectSale();
        List<Request> requestList = listRepository.selectRequest();
        List<Trip> tripList = listRepository.selectTrip();
        System.out.println();
    }

}
