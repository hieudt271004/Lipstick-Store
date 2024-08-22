package com.mystore.demo.service;

import com.mystore.demo.entity.Product;

import java.util.List;
import java.util.Optional;

public interface ProductService {

    List<Product> findAll();

    Optional<Product> findById(Long id);

    List<Product> findByCategoryId(Long id);

    List<Product> findByBrandId(Long id);

    List<Product> findByProductNameContaining(String productName);

    List<Product> getAllSorted(String sortType);
}
