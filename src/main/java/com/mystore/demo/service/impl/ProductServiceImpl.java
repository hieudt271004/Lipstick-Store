package com.mystore.demo.service.impl;

import com.mystore.demo.entity.Product;
import com.mystore.demo.enums.SortTypeEnum;
import com.mystore.demo.repository.ProductRepository;
import com.mystore.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;

    @Autowired
    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Optional<Product> findById(Long id) {
        return productRepository.findById(id);
    }

    @Override
    public List<Product> findByCategoryId(Long id) {
        return productRepository.findByCategoryId(id);
    }

    @Override
    public List<Product> findByBrandId(Long id) {
        return productRepository.findByBrandId(id);
    }

    @Override
    public List<Product> findByProductNameContaining(String productName) {
        return productRepository.findByProductNameContaining(productName);
    }

    @Override
    public List<Product> getAllSorted(String sortType) {
        return SortTypeEnum.ASC.getValue().equalsIgnoreCase(sortType)
            ? productRepository.findAllByOrderByProductPriceAsc()
            : productRepository.findAllByOrderByProductPriceDesc();
    }
}
