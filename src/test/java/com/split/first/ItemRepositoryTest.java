package com.split.first;

import com.split.first.Item.dto.Request;
import com.split.first.Item.dto.Sale;
import com.split.first.Item.dto.Trip;
import com.split.first.Item.repository.ItemRepository;
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
public class ItemRepositoryTest {

    @Autowired
    private ApplicationContext context;

    @Autowired
    private ItemRepository itemRepository;

    @Test
    public void listTest() {
        List<Sale> saleList = itemRepository.selectSale();
        List<Request> requestList = itemRepository.selectRequest();
        List<Trip> tripList = itemRepository.selectTrip();
        System.out.println();
    }

}
