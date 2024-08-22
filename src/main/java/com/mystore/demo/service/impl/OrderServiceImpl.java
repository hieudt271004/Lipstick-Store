package com.mystore.demo.service.impl;

import com.mystore.demo.entity.Order;
import com.mystore.demo.repository.OrderRepository;
import com.mystore.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {

    private final OrderRepository repository;

    @Autowired
    public OrderServiceImpl(OrderRepository repository) {
        this.repository = repository;
    }

    @Override
    public Order save(Order order) {
        return repository.save(order);
    }
}
