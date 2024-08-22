package com.mystore.demo.service;

import com.mystore.demo.entity.Item;

import java.util.List;

public interface ItemService {

    int countTotalProductQuantity(List<Item> items);

    double countTotalProductAmount(List<Item> items);
}
