package com.mystore.demo.service.impl;

import com.mystore.demo.entity.Brand;
import com.mystore.demo.repository.BrandRepository;
import com.mystore.demo.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BrandServiceImpl implements BrandService {

    private final BrandRepository brandRepository;

    @Autowired
    public BrandServiceImpl(BrandRepository brandRepository) {
        this.brandRepository = brandRepository;
    }

    @Override
    public List<Brand> findAll() {
        return brandRepository.findAll();
    }

    @Override
    public Optional<Brand> findById(Long brandId) {
        return brandRepository.findById(brandId);
    }
}
