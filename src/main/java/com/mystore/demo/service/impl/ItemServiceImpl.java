package com.mystore.demo.service.impl;

import com.mystore.demo.entity.Item;
import com.mystore.demo.service.ItemService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Override
    public int countTotalProductQuantity(List<Item> items) {
        return items.stream()
                .mapToInt(Item::getQuantity)
                .sum();
    }

    @Override
    public double countTotalProductAmount(List<Item> items) {
        return items.stream()
                .mapToDouble(Item::getAmount)
                .sum();
    }
}
